import React, { useEffect, useState } from "react";
import { StyleSheet } from "react-native";
import { Button, Text, useTheme } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";
import {
  useAlerts,
  useSets,
  useSoundSystem1,
  useUsernamesByRoom,
} from "../../utils/hooks";
import { ManagementType, NAVIGATION } from "../../types/common";
import { useRoomStateStore, useRoomStore } from "../../stores/RoomStore";
import { FlatList, View } from "react-native";
import CreateFlashCardGame from "../../components/dialogues/CreateFlashcardGame";
import { supabase } from "../../supabase";
import LearningProjectCategory from "../../components/learningProject/LearningProjectCategory";
import { useProjectStore } from "../../stores/ProjectStore";
import { useLoadingStore } from "../../stores/LoadingStore";
import { useSoundsStore } from "../../stores/SoundsStore";
import { useFocusEffect } from "@react-navigation/native";

export default function Lobby({ navigation }) {
  useSoundSystem1();

  const theme = useTheme();
  const { confirm } = useAlerts();

  const room = useRoomStore((state) => state.room);
  const roomState = useRoomStateStore((state) => state.roomState);
  const setRoom = useRoomStore((state) => state.setRoom);
  const [userList, setUserList] = useState([]);
  const [showCreateFlashcardGame, setShowCreateFlashcardGame] = useState(false);
  const setLoading = useLoadingStore((state) => state.setLoading);

  useEffect(() => {
    const fetchData = async () => {
      room &&
        roomState &&
        (await useUsernamesByRoom().then((userNames) => {
          setUserList(userNames.data.map((user) => user.username));
        }));
    };
    fetchData();
    const roomsTracker = supabase
      .channel("list-rooms-tracker")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "tracker" },
        (payload) => {
          fetchData();
        },
      )
      .subscribe();
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

  const projectId = useProjectStore((state) => state.projectId);
  const { data: flashcards } = useSets(ManagementType.FLASHCARD, projectId);
  const { data: quizzes } = useSets(ManagementType.EXERCISE, projectId);

  // TODO: add subscribe tracker where key=rooms

  // TODO: oncreate room call db function to insert public_room_state
  //TODO: add functionality with acutal user icon
  //TODO: Live Loading of users (useSubscription)
  return (
    <>
      <CreateFlashCardGame
        showCreateFlashcardGame={showCreateFlashcardGame}
        close={() => setShowCreateFlashcardGame(false)}
      />
      <SafeAreaView
        style={{
          width: "100%",
          height: "100%",
          backgroundColor: theme.colors.primaryContainer,
        }}
      >
        <View style={{ flex: 1, marginTop: 20 }}>
          <View style={{ flex: 1 }}>
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
          </View>
          <View style={{ flex: 6 }}>
            <LearningProjectCategory
              style={[
                styles.learningProjectCategory,
                {
                  backgroundColor:
                    //@ts-expect-error
                    theme.colors.backdropWithLowerOpacity,
                },
              ]}
              path={require("../../assets/completed_task_symbol.png")}
              name={"Cogniquiz"}
              function={() => {
                confirm({
                  title: "Choose sets",
                  icon: "cards",
                  dismissable: false,
                  okText: "Select",
                  okAction: (setValues) => {
                    /**
                     * //TODO: add choose game style
                     * 
                     * Vanilla: 
                     * 
                     * 
                     * // TODO: Radio button
                     */
                    console.log(setValues);
                    if (setValues[0].length === 0)
                      return "Please select at least one set.";
                    confirm({
                      title: "Configure game",
                      icon: "cog",
                      dismissable: false,
                      okText: "Start Game",
                      okAction: async (values) => {
                        const { data, error } = await supabase.functions.invoke(
                          "room-init",
                          {
                            body: {
                              type: ManagementType.EXERCISE,
                              sets: setValues[0].split("|").map((set) => +set),
                              roundDuration: +values[0],
                              numberOfRounds: +values[1],
                            },
                          },
                        );
                        if (error) return JSON.stringify(error);
                        console.log(data);
                        navigation.navigate(NAVIGATION.EXERCISE_GAME);
                      },
                      fields: [
                        {
                          type: "number",
                          label: "Round duration (seconds)",
                          helperText: "How long should a round last?",
                          icon: "timer-sand",
                          defaultValue: "30",
                          validator: (value, allValues) =>
                            +value > 0 && +value < 60 * 10,
                          errorText: "Please enter a value between 0 and 600",
                          required: true,
                        },
                        {
                          type: "number",
                          label: "Number of rounds",
                          helperText: "How many cards should be played?",
                          icon: "counter",
                          defaultValue: "10",
                          validator: (value, allValues) =>
                            +value > 0 && +value < 100,
                          errorText: "Please enter a value between 0 and 100",
                          required: true,
                        },
                      ],
                    });
                  },
                  fields: [
                    {
                      type: "search-select",
                      placeholder: "Search cogniquiz sets",
                      data: quizzes.map((set) => ({
                        key: set.name,
                        value: set.id,
                      })),
                    },
                  ],
                });
              }}
            />
            <LearningProjectCategory
              style={[
                styles.learningProjectCategory,
                {
                  backgroundColor:
                    //@ts-expect-error
                    theme.colors.backdropWithLowerOpacity,
                },
              ]}
              path={require("../../assets/cards_symbol.png")}
              name={"Cognicards"}
              flexDirection="row-reverse"
              function={() => {
                confirm({
                  title: "Choose sets",
                  icon: "cards",
                  dismissable: false,
                  okText: "Select",
                  okAction: (setValues) => {
                    console.log(setValues);
                    if (setValues[0].length === 0)
                      return "Please select at least one set.";
                    confirm({
                      title: "Configure game",
                      icon: "cog",
                      dismissable: false,
                      okText: "Start Game",
                      okAction: async (values) => {
                        console.log(
                          "Sets: " + setValues[0].split("|").map((set) => +set),
                        );
                        console.log("Round Duration: " + +values[0]);
                        console.log("Number of Rounds: " + +values[1]);
                        const { data, error } = await supabase.functions.invoke(
                          "room-init",
                          {
                            body: {
                              type: ManagementType.FLASHCARD,
                              sets: setValues[0].split("|").map((set) => +set),
                              roundDuration: +values[0],
                              numberOfRounds: +values[1],
                            },
                          },
                        );
                        if (error) return JSON.stringify(error);
                        console.log(data);
                        navigation.navigate(NAVIGATION.FLASHCARD_GAME, {
                          sets: setValues[0].split("|").map((set) => +set),
                          roundDuration: +values[0],
                          numberOfRounds: +values[1],
                        });
                      },
                      fields: [
                        {
                          type: "number",
                          label: "Round duration (seconds)",
                          helperText: "How long should a round last?",
                          icon: "timer-sand",
                          defaultValue: "30",
                          validator: (value, allValues) =>
                            +value > 0 && +value < 60 * 10,
                          errorText: "Please enter a value between 0 and 600",
                          required: true,
                        },
                        {
                          type: "number",
                          label: "Number of rounds",
                          helperText: "How many cards should be played?",
                          icon: "counter",
                          defaultValue: "10",
                          validator: (value, allValues) =>
                            +value > 0 && +value < 100,
                          errorText: "Please enter a value between 0 and 100",
                          required: true,
                        },
                      ],
                    });
                  },
                  fields: [
                    {
                      type: "search-select",
                      placeholder: "Search cognicard sets",
                      data: flashcards.map((set) => ({
                        key: set.name,
                        value: set.id,
                      })),
                    },
                  ],
                });
              }}
            />

            <LearningProjectCategory
              style={[
                styles.learningProjectCategory,
                {
                  backgroundColor:
                    //@ts-expect-error
                    theme.colors.backdropWithLowerOpacity,
                },
              ]}
              path={require("../../assets/teamwork_symbol.png")}
              name={"Cogniboard"}
              function={() => {
                navigation.navigate(NAVIGATION.WHITEBOARD);
              }}
            />
          </View>

          <View style={{ flex: 4, alignItems: "center" }}>
            <Button
              mode="contained"
              style={{ width: 300 }}
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
    </>
  );
}

const styles = StyleSheet.create({
  learningProjectCategory: {},
});
