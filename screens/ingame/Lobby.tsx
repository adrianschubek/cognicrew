import React, { useEffect, useState } from "react";
import { StyleSheet } from "react-native";
import { Button, Text, useTheme } from "react-native-paper";
import { PacmanIndicator as LoadingAnimation } from "react-native-indicators";
import { useNavigation } from "@react-navigation/native";
import { SafeAreaView } from "react-native-safe-area-context";
import { useAlerts, useUsernamesByRoom } from "../../utils/hooks";
import { NAVIGATION } from "../../types/common";
import { useRoomStateStore, useRoomStore } from "../../stores/RoomStore";
import { FlatList, View, Image } from "react-native";
import CreateFlashCardGame from "../../components/dialogues/CreateFlashcardGame";
import {
  responsiveFontSize,
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useAuth } from "../../providers/AuthProvider";
import { supabase } from "../../supabase";
import LearningProjectCategory from "../../components/learningProject/LearningProjectCategory";

export default function Lobby({ navigation }) {
  const theme = useTheme();
  const { confirm } = useAlerts();

  const room = useRoomStore((state) => state.room);
  const roomState = useRoomStateStore((state) => state.roomState);
  const setRoom = useRoomStore((state) => state.setRoom);
  const [userList, setUserList] = useState([]);
  const [showCreateFlashcardGame, setShowCreateFlashcardGame] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      await useUsernamesByRoom().then((userNames) => {
        setUserList(userNames.data.map((user) => user.username));
      });
    };
    fetchData();
  }, []);

  useEffect(() => {
    navigation.setOptions({
      headerShown: false,
    });
    navigation.addListener("beforeRemove", (e) => {
      // Prevent default behavior of leaving the screen
      e.preventDefault();
      // Prompt the user before leaving the screen
      confirm({
        icon: "location-exit",
        title: "Leave room?",
        message: "Are you sure you want to leave this room?",
        okText: "Leave",
        okAction: async () => {
          const { error } = await supabase.rpc("leave_room");
          if (error) return error.message;
          setRoom(null);
        },
      });
    });
  }, [confirm, navigation]);

  // TODO: add subscribe tracker where key=rooms

  // TODO: oncreate room call db function to insert public_room_state
  //TODO: add functionality with acutal user icon
  //TODO: Live Loading of users (useSubscription)
  return (
    <SafeAreaView
      style={{
        flexDirection: "column",
        flex: 1,
        backgroundColor: theme.colors.primaryContainer,
      }}
    >
      <View style={{ marginTop: 20 }}>
        <FlatList
          contentContainerStyle={{
            marginTop: 3,
            flexDirection: "column",
            alignItems: "flex-end",
            alignSelf: "flex-end",
          }}
          data={userList}
          keyExtractor={(item, index) => index.toString()}
          renderItem={({ item }) => (
            <View style={{ flexDirection: "row", alignItems: "center" }}>
              {/* <Image
                  source={{
                    uri:
                      "https://iptk.w101.de/storage/v1/object/public/profile-pictures/icon.png"
                  }}
                  style={{
                    width: responsiveWidth(10),
                    height: responsiveHeight(5),
                    marginRight: 3,
                    borderRadius: 20,
                    overflow: "hidden",
                    alignItems: "flex-end",
                  }}
                /> */}
              <View>
                {/* Wrap the Text component in a View */}
                <Text>{item}</Text>
              </View>
            </View>
          )}
        />
        <View style={{}}>
          <LearningProjectCategory
            style={[
              styles.learningProjectCategory,
              { backgroundColor: theme.colors.backdrop },
            ]}
            path={require("../../assets/completed_task_symbol.png")}
            name={"Cogniquiz"}
            function={() => {
              navigation.navigate(NAVIGATION.EXERCISE_GAME);
              console.log("Quiz Game Pressed");
            }}
          />
          <LearningProjectCategory
            style={[
              styles.learningProjectCategory,
              { backgroundColor: theme.colors.backdrop },
            ]}
            path={require("../../assets/cards_symbol.png")}
            name={"Cognicards"}
            flexDirection="row-reverse"
            function={() => {
              setShowCreateFlashcardGame(true);
              console.log("Flashcard Game Pressed");
            }}
          />

          <LearningProjectCategory
            style={[
              styles.learningProjectCategory,
              { backgroundColor: theme.colors.backdrop },
            ]}
            path={require("../../assets/teamwork_symbol.png")}
            name={"Cogniboard"}
            function={() => {
              navigation.navigate(NAVIGATION.WHITEBOARD);
              console.log("Whiteboard pressed");
            }}
          />
        </View>
        <CreateFlashCardGame
          showCreateFlashcardGame={showCreateFlashcardGame}
          close={() => setShowCreateFlashcardGame(false)}
        />
        <View style={{}}>
          <Button
            mode="contained"
            style={{ width: 200 }}
            onPress={async () => {
              const { error } = await supabase.rpc("leave_room");
              if (error) return error.message;
              setRoom(null);
              navigation.navigate(NAVIGATION.HOME);
            }}
          >
            Close
          </Button>
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  learningProjectCategory: {
    backgroundColor: "red",
  },
});
