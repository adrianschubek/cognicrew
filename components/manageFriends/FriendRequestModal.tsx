import { BottomSheetModal, BottomSheetScrollView } from "@gorhom/bottom-sheet";
import { BottomSheetModalMethods } from "@gorhom/bottom-sheet/lib/typescript/types";
import { useCallback, useEffect, useMemo } from "react";
import { View, StyleSheet } from "react-native";
import { Divider, Icon, Text, useTheme } from "react-native-paper";
import FriendItem from "./FriendItem";
import { useAlerts } from "react-native-paper-fastalerts";
import { useDeleteFriendRequest, useInsertFriend } from "../../utils/hooks";
export default function FriendRequestModal(props: {
  bottomSheetModalRef: React.MutableRefObject<BottomSheetModalMethods>;
  friendRequestsSent: any[];
  friendRequestsReceived: any[];
  userId: string;
  onChange: () => void;
}) {
  const theme = useTheme();
  const snapPoints = useMemo(() => ["50%", "87%"], []);
  const {
    bottomSheetModalRef,
    friendRequestsSent,
    friendRequestsReceived,
    userId,
    onChange,
  } = props;
  const { info } = useAlerts();
  const { trigger: deleteFriendRequest } = useDeleteFriendRequest();
  const { trigger: addFriend } = useInsertFriend();
  const sectionTitleVariant = "titleMedium";
  const handleSheetChanges = useCallback((index: number) => {
    console.log("handleSheetChanges", index)
    onChange();
  }, []);
  return (
    <BottomSheetModal
      ref={bottomSheetModalRef}
      index={1}
      snapPoints={snapPoints}
      onChange={handleSheetChanges}
      handleStyle={{ backgroundColor: null }}
      handleIndicatorStyle={{ backgroundColor: theme.colors.primary }}
      backgroundStyle={{
        backgroundColor: theme.colors.background,
        opacity: 0.95,
      }}
    >
      {friendRequestsReceived.length === 0 &&
      friendRequestsSent.length === 0 ? (
        <View
          style={{
            flex: 1,
            justifyContent: "center",
            alignItems: "center",
            gap: 20,
          }}
        >
          <Text variant="titleMedium">
            You currently have no friend requests!
          </Text>
          <Icon source="emoticon-sad-outline" size={70} />
        </View>
      ) : (
        <BottomSheetScrollView contentContainerStyle={{ padding: 10 }}>
          {/* Pending friends list */}
          {friendRequestsReceived.length > 0 && (
            <View style={styles.section}>
              <Text variant={sectionTitleVariant} style={styles.sectionTitle}>
                Received friend requests
              </Text>
              {friendRequestsReceived.map((friend, index) => (
                <FriendItem
                  key={index}
                  icon="check"
                  secondIcon="close-circle"
                  friendId={friend.id}
                  friendName={friend.username}
                  onIconPress={() =>
                    addFriend({
                      //@ts-expect-error
                      user_from_id: userId,
                      user_to_id: friend.id,
                    })
                  }
                  onSecondIconPress={() => {
                    info({
                      //icon: "account-off",
                      title: "",
                      message: "Are you sure you want to delete this friend?",
                      okText: "Delete Friend",
                      okAction: () => {
                        deleteFriendRequest({
                          user_from_id: friend.id,
                          user_to_id: userId,
                        });
                      },
                    });
                  }}
                />
              ))}
              {friendRequestsSent.length > 0 && (
                <Divider style={{ height: 1, marginVertical: 8 }} />
              )}
            </View>
          )}
          {friendRequestsSent.length > 0 && (
            <View style={styles.section}>
              <Text variant={sectionTitleVariant} style={styles.sectionTitle}>
                Sent friend requests
              </Text>
              {friendRequestsSent.map((friend, index) => (
                <FriendItem
                  key={index}
                  icon="close-circle"
                  friendId={friend.id}
                  friendName={friend.username}
                  onIconPress={() => {
                    info({
                      //icon: "information-outline",
                      title: "",
                      message: "Are you sure you want to delete this friend?",
                      okText: "Delete Friend",
                      okAction: () => {
                        deleteFriendRequest({
                          user_from_id: userId,
                          user_to_id: friend.id,
                        });
                      },
                    });
                  }}
                />
              ))}
            </View>
          )}
        </BottomSheetScrollView>
      )}
    </BottomSheetModal>
  );
}
const styles = StyleSheet.create({
  section: {
    gap: 8,
  },
  sectionTitle: {
    paddingBottom: 2,
  },
});
