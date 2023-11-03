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
import { useAuth } from "../providers/AuthProvider";
const Tab = createMaterialBottomTabNavigator();

const Stack = createNativeStackNavigator();

function MainTab() {
  return (
    <Stack.Navigator>
      <Stack.Screen
        name="Home"
        component={HomeScreen}
        options={{ title: "CogniCrew" }}
      />
      <Stack.Screen name="Login" component={Login} />
      <Stack.Screen name="ManageFriends" component={ManageFriends} />

      <Stack.Screen name="Achievements" component={Achievements} />
    </Stack.Navigator>
  );
}

function SettingsTab() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Settings" component={Settings} />
    </Stack.Navigator>
  );
}

function LearningProjectsTab() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="LearningProjects" component={LearningProjects} />
      <Stack.Screen name="LearningProject" component={LearningProject} />
      <Stack.Screen name="LearningRoom" component={LearningRoom} />
      <Stack.Screen
        name="FlashcardManagement"
        component={FlashcardManagement}
      />
      <Stack.Screen name="LinkManagement" component={LinkManagement} />
    </Stack.Navigator>
  );
}

export default function MainNav() {
  // Auth
  const { initialized, session, user } = useAuth();

  // if (!initialized || 0) return <View>
  //   <Text>Test</Text>
  // </View>

  // console.log("Initialized: ", initialized);
  // useEffect(() => {
  //   console.log("!!!Session: ", session);
  // }, [initialized])

  console.log(">>>> " + session);

  return !session ? (
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
        options={{ tabBarIcon: "cogs", title: "Settings" }}
        component={SettingsTab}
      />
    </Tab.Navigator>
  );
}
{
  /* // TODO: eigene tab seite für projects leraning */
}
