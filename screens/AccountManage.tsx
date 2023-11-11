import { Icon } from "react-native-paper";
import { NAVIGATION } from "../types/common";
import AccountSettings from "./AccountSettings";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import ManageFriends from "./ManageFriends";
import Achievements from "./Achievements";

const Top = createMaterialTopTabNavigator();
export default function AccountManage({ navigation }) {
  return (
    <Top.Navigator
      screenOptions={{
        tabBarLabelStyle: { textTransform: "none" },
      }}
      initialRouteName={NAVIGATION.MANAGE_FRIENDS}
    >
      <Top.Screen
        name={NAVIGATION.ACHIEVEMENTS}
        component={Achievements}
        options={{
          tabBarIcon: () => <Icon size={24} source="trophy" />,
        }}
      />
      <Top.Screen
        name={NAVIGATION.MANAGE_FRIENDS}
        component={ManageFriends}
        options={{
          title: "Friends",
          tabBarIcon: () => <Icon size={24} source="account-group" />,
        }}
      />
      <Top.Screen
        name={NAVIGATION.SETTINGS}
        component={AccountSettings}
        options={{
          tabBarIcon: () => <Icon size={24} source="cogs" />,
        }}
      />
    </Top.Navigator>
  );
}
