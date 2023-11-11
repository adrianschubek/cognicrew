import * as React from "react";
import { createMaterialBottomTabNavigator } from "@react-navigation/material-bottom-tabs";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import HomeScreen from "../screens/Home";
import ManageFriends from "../screens/ManageFriends";
import LearningProjects from "../screens/LearningProjects";
import LearningProject from "../screens/LearningProject";
import Settings from "../screens/AccountSettings";
import Login from "../screens/Login";
import LearningRoom from "../screens/LearningRoom";
import FlashcardManagement from "../screens/projectManagement/FlashcardManagement";
import LinkManagement from "../screens/projectManagement/LinkManagement";
import Achievements from "../screens/Achievements";
import Whiteboard from "../screens/Whiteboard";
import { useAuth } from "../providers/AuthProvider";
import FlashcardGame from "../screens/FlashcardGame";
import ExerciseManagement from "../screens/projectManagement/ExerciseManagement";
import { NAVIGATION } from "../types/common";
import CreateProject from "../screens/projectManagement/CreateProject";
import { useNavigation } from "@react-navigation/native";
import InviteFriends from "./dialogues/InviteFriends";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import AccountManage from "../screens/AccountManage";
import { LogoutButton } from "./settings/AccountInfo";
const Tab = createMaterialBottomTabNavigator();
const Stack = createNativeStackNavigator();

function MainTab() {
  return (
    <Stack.Navigator>
      <Stack.Screen name={NAVIGATION.HOME} component={HomeScreen} />
      <Stack.Screen
        name={NAVIGATION.MANAGE_FRIENDS}
        component={ManageFriends}
      />
      <Stack.Screen name={NAVIGATION.ACHIEVEMENTS} component={Achievements} />

      <Stack.Screen name={NAVIGATION.WHITEBOARD} component={Whiteboard} />

      <Stack.Screen name={NAVIGATION.LEARNING_ROOM} component={LearningRoom} />

      <Stack.Screen
        name={NAVIGATION.FLASHCARD_GAME}
        component={FlashcardGame}
      />
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
        }}
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
        name={NAVIGATION.FLASHCARD_MANAGEMENT}
        component={FlashcardManagement}
      />
      <Stack.Screen
        name={NAVIGATION.FLASHCARD_GAME}
        component={FlashcardGame}
      />
      <Stack.Screen
        name={NAVIGATION.LINK_MANAGEMENT}
        component={LinkManagement}
      />
      <Stack.Screen
        name={NAVIGATION.EXERCISE_MANAGEMENT}
        component={ExerciseManagement}
      />
      <Stack.Screen name={NAVIGATION.LEARNING_ROOM} component={LearningRoom} />
      <Stack.Screen
        name={NAVIGATION.CREATEEDIT_PROJECT}
        component={CreateProject}
      />
    </Stack.Navigator>
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
    <Tab.Navigator initialRouteName="Home" shifting={true}>
      <Tab.Screen
        name="HomeTab"
        options={{ tabBarIcon: "home", title: "Feed" }}
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
