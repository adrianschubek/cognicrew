import { Text } from "react-native-paper";
import { NAVIGATION } from "../types/common";
import AccountSettings from "./AccountSettings";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import { useEffect } from "react";
import { LogoutButton } from "../components/settings/AccountInfo";
import ManageFriends from "./ManageFriends";
import Achievements from "./Achievements";

const Top = createMaterialTopTabNavigator();
export default function AccountManage({ navigation }) {
  return (
    <Top.Navigator>
      <Top.Screen name={NAVIGATION.ACHIEVEMENTS} component={Achievements} />
      <Top.Screen
        name={NAVIGATION.MANAGE_FRIENDS}
        options={{ title: "Friends" }}
        component={ManageFriends}
      />
      <Top.Screen name={NAVIGATION.SETTINGS} component={AccountSettings} />
    </Top.Navigator>
  );
}
