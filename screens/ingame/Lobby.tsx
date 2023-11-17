import React, { useEffect, useState } from "react";
import { Button, Text, useTheme } from "react-native-paper";
import { PacmanIndicator as LoadingAnimation } from "react-native-indicators";
import { useNavigation } from "@react-navigation/native";
import { SafeAreaView } from "react-native-safe-area-context";
import { useAlerts, useUsernamesByRoom } from "../../utils/hooks";
import { NAVIGATION } from "../../types/common";
import { useRoomStateStore, useRoomStore } from "../../stores/RoomStore";
import { FlatList, View, Image } from "react-native";
import CreateFlashCardGame from "../../components/dialogues/CreateFlashcardGame";
import { responsiveFontSize, responsiveHeight, responsiveWidth } from "react-native-responsive-dimensions";
import { useAuth } from "../../providers/AuthProvider";
import { supabase } from "../../supabase";

export default function Lobby() {
  const theme = useTheme();
  const { confirm } = useAlerts();

  const room = useRoomStore((state) => state.room);
  const roomState = useRoomStateStore((state) => state.roomState);
  const setRoom = useRoomStore((state) => state.setRoom);
  const [userList, setUserList] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const navigation = useNavigation();

  const [showCreateFlashcardGame, setShowCreateFlashcardGame] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const { data: usernames } = await useUsernamesByRoom(room?.id);
        console.log("Usernames: " + usernames);
  
        // Ensure that usernames is an array and is not empty
        if (Array.isArray(usernames) && usernames.length > 0) {
          setUserList(usernames.map(user => {
            return user.username;
          })); // Assuming the username is in the second position
          console.log("Userlist: " + userList);
        } else {
          setUserList([]); // Set an empty array if no usernames are available
        }
  
        setLoading(false);
      } catch (error) {
        setError(error);
        setLoading(false);
      }
    };
  
    fetchData();
  }, [room?.id]);

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

  const user = useAuth().user;
  // Check if the current user is the host
  const isHost = room?.host === user?.id;

  // TODO: is user is owner show host lobby view (list users, select game, close)
  // TODO: oncreate room call db function to insert public_room_state
  //TODO: add functionality with acutal user icon
  return (
    <SafeAreaView
      style={{
        justifyContent: "center",
        alignContent: "center",
        alignItems: "center",
        flex: 1,
        backgroundColor: theme.colors.primaryContainer,
      }}
    >
      {isHost && (
        <View style={{ flex: 1, marginTop: 20 }}>
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
                <Image
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
                />
                <View>
                  {/* Wrap the Text component in a View */}
                  <Text style={{ fontSize: responsiveFontSize(3), marginRight: 3 }}>{item}</Text>
                </View>
              </View>
            )}
          />
          <Button
            icon="home"
            mode="contained"
            style={{ marginTop: responsiveHeight(2.9), margin: 3 }}
            onPress={() => {
              navigation.navigate(NAVIGATION.WHITEBOARD);
            }}
          >
            WHITEBOARD
          </Button>
          <Button
            icon="home"
            mode="contained"
            style={{ marginTop: responsiveHeight(2.9), margin: 3 }}
            onPress={() => {
              setShowCreateFlashcardGame(true);
            }}
          >
            FLASHCARDS
          </Button>
          <Button
            icon="home"
            mode="contained"
            style={{ marginTop: responsiveHeight(2.9), margin: 3 }}
            onPress={() => {
              navigation.navigate(NAVIGATION.EXERCISE_GAME);
            }}
          >
            QUIZ
          </Button>
          <CreateFlashCardGame
            showCreateFlashcardGame={showCreateFlashcardGame}
            close={() => setShowCreateFlashcardGame(false)}
          />
          <View style={{ flexDirection: "row", justifyContent: "space-between", padding: 5 }}>
            <Button
              style={{ width: responsiveWidth(30), padding: 5, margin: 3 }}
              mode="contained"
              onPress={() => {
                navigation.navigate(NAVIGATION.HOME);
              }}
            >
              Close
            </Button>
          </View>
        </View>
      )}
      {!isHost && (
        <View>
          <LoadingAnimation
            size={96}
            style={{ flex: 0, background: "red", marginBottom: 30 }}
            color={theme.colors.primary}
          />
          <Text
            variant="bodyLarge"
            style={{ flex: 0, color: theme.colors.primary }}
          >
            Waiting for host to start a game
          </Text>
          <Button
            style={{ marginTop: 20 }}
            onPress={() =>
              confirm({
                icon: "location-exit",
                title: "Leave room?",
                message: "Are you sure you want to leave this room?",
                okText: "Leave",
                okAction: () => {
                  setTimeout(async () => {
                    const { error } = await supabase.rpc("leave_room");
                    if (error) return error.message;
                    setRoom(null);
                  }, 0);
                },
              })
            }
          >
            Leave
          </Button>
        </View>
      )}
    </SafeAreaView>
  );
}