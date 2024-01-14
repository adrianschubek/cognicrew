import React, { useEffect, useState } from "react";
import { StyleSheet, View } from "react-native";
import { Button, Text, useTheme } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";
import { useAlerts, toArray } from "react-native-paper-fastalerts";
import { useSets, useUsernamesByRoom } from "../../utils/hooks";
import { ManagementType, NAVIGATION } from "../../types/common";
import { useRoomStateStore, useRoomStore } from "../../stores/RoomStore";
import { supabase } from "../../supabase";
import LearningProjectCategory from "../../components/learningProject/LearningProjectCategory";
import { useProjectStore } from "../../stores/ProjectStore";
import LoadingOverlay from "../../components/alerts/LoadingOverlay";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { handleEdgeError } from "../../utils/common";
import { RoomClientInit } from "../../functions/rooms";
import ProfilePictureAvatar from "../../components/profile/ProfilePictureAvatar";

export default function Lobby({ navigation }) {
  const theme = useTheme();
  const { confirm } = useAlerts();

  const room = useRoomStore((state) => state.room);
  const setRoomState = useRoomStateStore((state) => state.setRoomState);
  const setRoom = useRoomStore((state) => state.setRoom);
  const [userList, setUserList] = useState<{ id: string; username: string }[]>(
    [],
  );

  useEffect(() => {
    const fetchData = async () => {
      await useUsernamesByRoom().then((userNames) => {
        setUserList(userNames.data);
      });
    };
    fetchData();
    const tracker = supabase
      .channel("list-rooms-tracker")
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: "tracker",
          filter: "key=eq.rooms",
        },
        (payload) => {
          console.log("refetching lobby members (lobby)");
          fetchData();
        },
      )
      .subscribe();
    return () => {
      tracker.unsubscribe();
    };
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
        key: "leave-room",
        icon: "location-exit",
        title: "Leave room?",
        message: "Are you sure you want to leave this room?",
        okText: "Leave",
        okAction: async () => {
          const { error } = await supabase.rpc("leave_room");
          if (error) return error.message;
          setRoom(null);
          setRoomState(null);
        },
      });
    });
  }, [confirm, navigation]);

  const projectId = useProjectStore((state) => state.projectId);
  const {
    data: flashcards,
    error: flashError,
    isLoading: islf,
  } = useSets(ManagementType.FLASHCARD, projectId);
  const {
    data: quizzes,
    error: quizError,
    isLoading: islq,
  } = useSets(ManagementType.EXERCISE, projectId);

  // TODO: add subscribe tracker where key=rooms

  // TODO: oncreate room call db function to insert public_room_state
  //TODO: add functionality with acutal user icon
  //TODO: Live Loading of users (useSubscription)

  if (flashError || quizError) {
    return <Text>{flashError?.message || quizError?.message}</Text>;
  }

  if (islf || islq) {
    return <LoadingOverlay visible />;
  }

  return (
    <>
      <SafeAreaView
        style={{
          width: "100%",
          height: "100%",
        }}
      >
        <View style={{ flex: 1, marginTop: 20, alignItems: "center" }}>
          <View
            style={{
              flex: 1,
              marginHorizontal: 10,
              flexDirection: "column",
              justifyContent: "flex-start",
              flexWrap: "wrap",
            }}
          >
            {userList.slice(0, 12).map((user, index) => {
              return (
                <View
                  key={index}
                  style={{
                    flexDirection: "row",
                    alignItems: "center",
                    height: "33%",
                  }}
                >
                  <ProfilePictureAvatar
                    size={24}
                    userId={user.id}
                    username={user.username}
                  />
                  <Text style={{ marginHorizontal: 10 }}>{user.username}</Text>
                </View>
              );
            })}
          </View>
          <View style={{ flex: 6 }}>
            <LearningProjectCategory
              style={[styles.learningProjectCategory]}
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
                        console.log("Round Duration: " + +values[0]);
                        console.log("Number of Rounds: " + +values[1]);
                        const { data, error } = await supabase.functions.invoke(
                          "room-init",
                          {
                            body: {
                              type: ManagementType.FLASHCARD,
                              sets: toArray(setValues[0], (el) => +el),
                              roundDuration: +values[0],
                              numberOfRounds: +values[1],
                            } as RoomClientInit,
                          },
                        );
                        if (error) return handleEdgeError(error);
                        setRoom({ ...room, is_ingame: true });
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
                        value: set.id.toString(),
                      })),
                    },
                  ],
                });
              }}
            />
            <LearningProjectCategory
              style={[styles.learningProjectCategory]}
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
                    if (setValues[0].length === 0)
                      return "Please select at least one set.";
                    confirm({
                      title: "Configure game",
                      icon: "cog",
                      dismissable: false,
                      okText: "Start Game",
                      okAction: async (values) => {
                        // TODO show SplashIntro (also for guest)
                        const { data, error } = await supabase.functions.invoke(
                          "room-init",
                          {
                            body: {
                              type: ManagementType.EXERCISE,
                              sets: toArray(setValues[0], (el) => +el),
                              roundDuration: +values[0],
                              numberOfRounds: +values[1],
                            } as RoomClientInit,
                          },
                        );
                        if (error) return handleEdgeError(error);
                        setRoom({ ...room, is_ingame: true });
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
                        value: set.id.toString(),
                      })),
                    },
                  ],
                });
              }}
            />
            <LearningProjectCategory
              style={[styles.learningProjectCategory]}
              path={require("../../assets/teamwork_symbol.png")}
              name={"Cogniboard"}
              function={() => {
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
                          type: ManagementType.BOARD,
                          name: values[0],
                        } as RoomClientInit,
                      },
                    );
                    if (error) return handleEdgeError(error);
                    setRoom({ ...room, is_ingame: true });
                  },
                  fields: [
                    {
                      type: "custom",
                      render() {
                        return (
                          <Text
                            variant="labelSmall"
                            style={{ textAlign: "center" }}
                          >
                            No options available
                          </Text>
                        );
                      },
                    },
                  ],
                });
                // confirm({
                //   title: "Choose cogniboard",
                //   icon: "cards",
                //   dismissable: false,
                //   okText: "Load",
                //   okAction: (setValues) => {
                //     // TODO: load cogniboard. same dialog as below
                //   },
                //   fields: [
                //     {
                //       /* TODO: implement or remove */ type: "search-radio",
                //       placeholder: "Search cogniboards",
                //       data: [],
                //       required: true,
                //     },
                //     {
                //       type: "button",
                //       label: "New Cogniboard",
                //       icon: "plus",
                //       action(values) {
                //         confirm({
                //           title: "Configure game",
                //           icon: "cog",
                //           dismissable: false,
                //           okText: "Start Game",
                //           okAction: async (values) => {
                //             const { data, error } =
                //               await supabase.functions.invoke("room-init", {
                //                 body: {
                //                   type: ManagementType.BOARD,
                //                   name: values[0],
                //                 } as RoomClientInit,
                //               });
                //             if (error) return handleEdgeError(error);
                //             setRoom({ ...room, is_ingame: true });
                //           },
                //           fields: [
                //             {
                //               type: "text",
                //               label: "Name",
                //               helperText:
                //                 "Optionally save your cogniboard as...",
                //               icon: "format-text",
                //               errorText:
                //                 "Please enter a value between 0 and 600",
                //               required: false,
                //             },
                //           ],
                //         });
                //       },
                //     },
                //   ],
                // });
              }}
            />
          </View>

          <View style={{ alignItems: "center", marginBottom: 10 }}>
            <Button
              mode="contained"
              theme={{
                colors: {
                  primary: !room?.is_ingame
                    ? theme.colors.primaryContainer
                    : theme.colors.secondaryContainer,
                  onPrimary: theme.colors.secondary,
                },
              }}
              style={{
                width: responsiveWidth(95),
                alignSelf: "flex-start",
                marginVertical: 5,
                borderRadius: 10,
              }}
              contentStyle={{ paddingVertical: 5 }}
              onPress={async () => {
                let { data, error } = await supabase.rpc("switch_locked_room");
                if (error) console.error(error);
                else {
                  setRoom({ ...room, is_ingame: data });
                }
              }}
              icon={!room?.is_ingame ? "lock-open-variant-outline" : "lock"}
            >
              {!room?.is_ingame ? "Room is open" : "Room is closed"}
            </Button>
            {/* </View>
          <View style={{ flex: 4, alignItems: "center" }}> */}
            <Button
              mode="contained"
              theme={{
                colors: {
                  primary: theme.colors.errorContainer,
                  onPrimary: theme.colors.error,
                },
              }}
              style={{
                width: responsiveWidth(95),
                alignSelf: "flex-start",
                marginVertical: 5,
                borderRadius: 10,
              }}
              contentStyle={{ paddingVertical: 5 }}
              onPress={async () => {
                const { error } = await supabase.rpc("leave_room");
                if (error) return error.message;
                setRoom(null);
                setRoomState(null);
                navigation.navigate(NAVIGATION.HOME);
              }}
              icon={"trash-can-outline"}
            >
              Delete Room
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
