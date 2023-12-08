import * as React from "react";
import { createMaterialBottomTabNavigator } from "@react-navigation/material-bottom-tabs";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import HomeScreen from "../screens/Home";
import ManageFriends from "../screens/ManageFriends";
import LearningProjects from "../screens/LearningProjects";
import LearningProject from "../screens/LearningProject";
import Login from "../screens/Login";
import LearningRoom from "../screens/LearningRoom";
import FlashcardExerciseManagement from "../screens/projectManagement/FlashcardExerciseManagement";
import FilesManagement from "../screens/projectManagement/FilesManagement";
import LinkManagement from "../screens/projectManagement/LinkManagement";
import Achievements from "../screens/Achievements";
import Whiteboard from "../screens/Whiteboard";
import { useAuth } from "../providers/AuthProvider";
import FlashcardGame from "../screens/FlashcardGame";
import { NAVIGATION } from "../types/common";
import CreateEditProject from "../screens/projectManagement/CreateEditProject";
import InviteFriends from "../screens/projectManagement/InviteFriends";
import AccountManage from "../screens/AccountManage";
import { LogoutButton } from "./settings/AccountInfo";
import RoomsList from "../screens/RoomsList";
import { useTheme } from "react-native-paper";
import Lobby from "../screens/ingame/Lobby";
import ExerciseGame from "../screens/ExerciseGame";
import { useRoomStateStore, useRoomStore } from "../stores/RoomStore";
import { useEffect } from "react";
import GuestLobby from "../screens/ingame/GuestLobby";
import { supabase } from "../supabase";
import { useAlerts } from "../utils/hooks";
import RateProject from "../screens/projectManagement/RateProject";
import EndResults from "../screens/ingame/EndResults";
import { GameState, ScreenState } from "../functions/rooms";
import dayjs from "dayjs";
import GlobalStatistics from "../screens/GlobalStatistics";
import ProjectStatistics from "../screens/projectManagement/ProjectStatistics";
const Tab = createMaterialBottomTabNavigator();
const Stack = createNativeStackNavigator();

function MainTab() {
  const theme = useTheme();

  return (
    <Stack.Navigator>
      <Stack.Screen name={NAVIGATION.HOME} component={HomeScreen} />
      <Stack.Screen
        name={NAVIGATION.MANAGE_FRIENDS}
        component={ManageFriends}
      />
      <Stack.Screen name={NAVIGATION.ACHIEVEMENTS} component={Achievements} />

      <Stack.Group
        screenOptions={{
          animation: "slide_from_bottom",
        }}
      >
        <Stack.Screen
          name={NAVIGATION.ROOMS_LIST}
          component={RoomsList}
          options={{ title: "Rooms" }}
        />
        {/* <Stack.Screen
          name={NAVIGATION.LOBBY}
          component={Lobby}
          options={{
            headerStyle: {
              backgroundColor: theme.colors.primaryContainer,
            },
          }}
        /> */}

        <Stack.Screen
          name={NAVIGATION.LEARNING_ROOM}
          component={LearningRoom}
        />
      </Stack.Group>
    </Stack.Navigator>
  );
}

function AccountTab() {
  return (
    <Stack.Navigator>
      <Stack.Screen
        name={NAVIGATION.ACCOUNT}
        component={AccountManage}
        options={{
          headerRight: LogoutButton,
          headerShadowVisible: false,
        }}
      />
      <Stack.Screen
        name={NAVIGATION.GLOBAL_STATISTICS}
        component={GlobalStatistics}
      />
    </Stack.Navigator>
  );
}

function LearningProjectsTab() {
  return (
    <Stack.Navigator>
      <Stack.Screen
        name={NAVIGATION.LEARNING_PROJECTS}
        component={LearningProjects}
      />
      <Stack.Screen
        name={NAVIGATION.INVITE_FRIENDS}
        component={InviteFriends}
      />
      <Stack.Screen
        name={NAVIGATION.LEARNING_PROJECT}
        component={LearningProject}
      />
      <Stack.Screen
        name={NAVIGATION.FLASHCARD_EXERCISE_MANAGEMENT}
        component={FlashcardExerciseManagement}
      />
      <Stack.Screen
        name={NAVIGATION.LINK_MANAGEMENT}
        component={LinkManagement}
      />
      <Stack.Screen
        name={NAVIGATION.FILES_MANAGEMENT}
        component={FilesManagement}
      />
      <Stack.Screen name={NAVIGATION.LEARNING_ROOM} component={LearningRoom} />

      <Stack.Screen name={NAVIGATION.RATE_PROJECT} component={RateProject} />

      <Stack.Screen
        name={NAVIGATION.PROJECT_STATISTICS}
        component={ProjectStatistics}
      />

      <Stack.Screen
        name={NAVIGATION.CREATEEDIT_PROJECT}
        component={CreateEditProject}
      />
    </Stack.Navigator>
  );
}

function MainTabs({ navigation }) {
  const room = useRoomStore((state) => state.room);
  const setRoom = useRoomStore((state) => state.setRoom);
  const setRoomState = useRoomStateStore((state) => state.setRoomState);
  const uid = useAuth().user?.id;
  // redirect to lobby if user is currently ingame
  useEffect(() => {
    if (room) {
      if (room.host === uid) navigation.navigate(NAVIGATION.LOBBY);
      else navigation.navigate(NAVIGATION.GUEST_LOBBY);
    } else navigation.navigate(NAVIGATION.HOME);
  }, [room]);
  const { alert, warning, info } = useAlerts();
  useEffect(() => {
    let lastUpdate = dayjs().valueOf();
    // Health check for server
    const serverAliveInterval = setInterval(() => {
      if (
        lastUpdate + 12000 < dayjs().valueOf() &&
        useRoomStateStore.getState().roomState !== null
      ) {
        warning({
          key: "server-off",
          icon: "wifi-off",
          title: "Connection Lost",
          message:
            "You have lost connection to the server. This can indicate a network issue on your device, a high load or an error on the server. You may leave the room or wait. (#68)",
          okText: "Leave room",
          cancelText: "Wait",
          async okAction(values) {
            await supabase.rpc("leave_room");
            setRoom(null);
            setRoomState(null);
          },
        });
      }
    }, 12000);

    const publicRoomStates = supabase
      .channel("ingame-live-" + room?.id)
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: "public_room_states",
          filter: `room_id=eq.${room?.id}`,
        },
        (payload) => {
          lastUpdate = dayjs(payload.commit_timestamp).valueOf();

          switch (payload.eventType) {
            case "INSERT": // new room state
            case "UPDATE":
              // room state update
              // console.debug(payload.new.data);

              // navigate to correct screen payload.new.data.screen
              switch (payload.new.data.screen) {
                case ScreenState.LOBBY:
                  if (useRoomStore.getState().room.host === uid)
                    navigation.navigate(NAVIGATION.LOBBY);
                  else navigation.navigate(NAVIGATION.GUEST_LOBBY);
                  break;
                case ScreenState.INGAME:
                case ScreenState.ROUND_SOLUTION:
                  switch (payload.new.data.game as GameState) {
                    case GameState.EXERCISES:
                      navigation.navigate(NAVIGATION.EXERCISE_GAME);
                      break;
                    case GameState.FLASHCARDS:
                      navigation.navigate(NAVIGATION.FLASHCARD_GAME);
                      break;
                  }
                  break;
                case ScreenState.ROUND_RESULTS:
                case ScreenState.END_RESULTS:
                  navigation.navigate(NAVIGATION.END_RESULTS);
                  break;
              }

              setRoomState(payload.new.data);
              break;
            case "DELETE":
              if (payload.old.room_id !== room?.id) {
                // FIXME: Fixes bug if room id not mismatch
                console.log(
                  "ignoring room_id mismatch on DELETE ",
                  payload.old.room_id,
                  room?.id,
                );
                return;
              }
              info({
                key: "room-ingame-closed",
                message: "Room was closed by host or server (#70)",
              });
              setRoom(null);
              setRoomState(null);
              break;
          }
        },
      )
      .subscribe();
    return () => {
      publicRoomStates.unsubscribe();
      clearInterval(serverAliveInterval);
    };
  }, [room]);

  return (
    <Tab.Navigator initialRouteName="Home" shifting={true}>
      <Tab.Screen
        name="HomeTab"
        options={{ tabBarIcon: "home", title: "Home" }}
        component={MainTab}
      />
      <Tab.Screen
        name="LearningProjectsTab"
        options={{ tabBarIcon: "book", title: "Projects" }}
        component={LearningProjectsTab}
      />
      <Tab.Screen
        name="SettingsTab"
        options={{ tabBarIcon: "account", title: "Account" }}
        component={AccountTab}
      />
    </Tab.Navigator>
  );
}

export default function MainNav() {
  const { session, user } = useAuth();

  return !session || !user ? (
    <Stack.Navigator
      initialRouteName="Login"
      screenOptions={{ headerShown: false }}
    >
      <Tab.Screen name="Login" component={Login} />
    </Stack.Navigator>
  ) : (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name={"_main_"} component={MainTabs} />
      <Stack.Screen name={NAVIGATION.LOBBY} component={Lobby} />
      <Stack.Screen name={NAVIGATION.GUEST_LOBBY} component={GuestLobby} />
      <Stack.Screen name={NAVIGATION.WHITEBOARD} component={Whiteboard} />
      <Stack.Screen name={NAVIGATION.EXERCISE_GAME} component={ExerciseGame} />
      <Stack.Screen name={NAVIGATION.END_RESULTS} component={EndResults} />
      <Stack.Screen
        name={NAVIGATION.FLASHCARD_GAME}
        component={FlashcardGame}
      />
    </Stack.Navigator>
  );
}
