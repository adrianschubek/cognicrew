import * as React from "react";
import { StatusBar } from "expo-status-bar";
import {
  StyleSheet,
  View,
  ScrollView,
  KeyboardAvoidingView,
  Platform,
} from "react-native";
import { FAB, Text } from "react-native-paper";
import AccordionSection from "../../components/learningProject/flashcardExercise/AccordionSection";
import { useEffect, useState } from "react";
import AddFlashcards from "../../components/dialogues/AddFlashcards";
import { ManagementType, orderByPrinciple } from "../../types/common";
import { useAlerts } from "react-native-paper-fastalerts";
import AddExercises from "../../components/dialogues/AddExercises";
import SearchWithList from "../../components/common/SearchWithList";

export default function FlashcardExerciseManagement({
  navigation,
  route,
}: {
  route: { params: { type: ManagementType } };
  navigation: any;
}) {
  const { confirm } = useAlerts();
  const type = route.params.type;
  const [orderSetsBy, setOrderSetsBy] =
    useState<orderByPrinciple>("created_at");
  const [orderSetItemsBy, setOrderSetItemsBy] =
    useState<orderByPrinciple>("created_at");
  const [showAddItem, setShowAddItem] = useState<boolean>(false);
  const [noSetAvailable, setNoSetAvailable] = useState<boolean>(false);
  const [FABOpen, setFABOpen] = useState({ open: false });
  const onStateChange = ({ open }) => setFABOpen({ open });
  const { open } = FABOpen;
  const typeName = (plural: boolean) =>
    (type === ManagementType.FLASHCARD ? "cognicard" : "cogniquiz") +
    (plural ? (type === ManagementType.FLASHCARD ? "s" : "zes") : "");
  useEffect(() => {
    navigation.setOptions({
      title: type === ManagementType.FLASHCARD ? "Cognicards" : "Cogniquizzes",
    });
  }, []);
  return (
    <>
      <StatusBar style="auto" />
      {type === ManagementType.FLASHCARD ? (
        <AddFlashcards
          showAddingFlashcards={showAddItem}
          close={() => setShowAddItem(false)}
        />
      ) : (
        <AddExercises
          showAddExercises={showAddItem}
          close={() => setShowAddItem(false)}
        />
      )}
      {noSetAvailable && (
        <View
          style={{
            flex: 1,
            justifyContent: "center",
            alignItems: "center",
            marginHorizontal: 16,
          }}
        >
          <Text variant="titleMedium" style={{ textAlign: "center" }}>
            Welcome to your {typeName(false)} management space {"\n"}
            Currently you don't have any {typeName(false)} set {"\n"}
            {"\n"}Click on the plus button to create one!
          </Text>
        </View>
      )}

      <View style={[noSetAvailable ? { flex: 0 } : styles.container]}>
        <KeyboardAvoidingView
          behavior={Platform.OS === "ios" ? "padding" : "height"}
          style={{ flex: 1 }}
        >
          <ScrollView>
            <AccordionSection
              type={type}
              orderSetsBy={orderSetsBy}
              orderSetItemsBy={orderSetItemsBy}
              sendNoSetAvailableToParent={(boolean) => {
                setNoSetAvailable(boolean);
              }}
            />
            {/*View margin for FAB.Group when scrolling down */}
            <View style={{ marginBottom: 78 }}></View>
          </ScrollView>
        </KeyboardAvoidingView>
      </View>
      <FAB.Group
        testID="flashcard-fab-button"
        open={open}
        visible
        icon={open ? "card-text" : "plus"}
        actions={[
          {
            icon: "sort",
            label: "Sort " + typeName(true) + " by",
            onPress: () => {
              confirm({
                icon: "",
                title: "Sort your " + typeName(true) + " by?",
                okText: "Accept",
                okAction: (val) => {
                  setOrderSetItemsBy(val[0] as orderByPrinciple);
                },
                fields: [
                  {
                    type: "radio",
                    icon: "sort",
                    helperText: "Choose a sorting option to your liking",
                    required: true,
                    data: [
                      { key: "oldest to newest", value: "created_at" },
                      {
                        key: "newest to oldest",
                        value: "reverse_created_at",
                      },
                      { key: "ascending priority", value: "priority" },
                      {
                        key: "descending priority",
                        value: "reverse_priority",
                      },
                    ],
                  },
                ],
              });
            },
          },
          {
            icon: "sort",
            label: "Sort sets by",
            onPress: () => {
              confirm({
                icon: "",
                title: "Sort your sets by?",
                okText: "Accept",
                okAction: (val) => {
                  setOrderSetsBy(val[0] as orderByPrinciple);
                },
                fields: [
                  {
                    type: "radio",
                    icon: "sort",
                    helperText: "Choose a sorting option to your liking",
                    required: true,
                    data: [
                      { key: "oldest to newest", value: "created_at" },
                      {
                        key: "newest to oldest",
                        value: "reverse_created_at",
                      },
                      { key: "alphabetical order", value: "name" },
                      {
                        key: "inverse alphab. order",
                        value: "reverse_name",
                      },
                    ],
                  },
                ],
              });
            },
          },
          {
            icon: "plus",
            label: "Add new " + typeName(false),
            onPress: () => setShowAddItem(true),
          },
          {
            icon: "table-settings",
            label: "Create, delete and edit \n" + typeName(false) + " sets",
            onPress: () => {
              confirm({
                icon: "folder",
                title: "Manage your " + typeName(false) + " sets",
                okText: "Done",
                cancelText: "",
                okAction: () => {
                  return;
                },
                fields: [
                  {
                    type: "custom",
                    render: () => {
                      return (
                        <SearchWithList
                          type={type}
                          mode="edit"
                          searchPlaceholder={
                            "Search for " + typeName(false) + " set"
                          }
                          creationOption={true}
                        />
                      );
                    },
                  },
                ],
              });
            },
          },
        ]}
        onStateChange={onStateChange}
      />
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: -8,
  },
});
