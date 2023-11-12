import { Text } from "react-native-paper";

export default function Lobby() {
  // TODO: if owner exists this screen. delete room rpc(delete_room) !!!
  //TODO: in database: cron auto cleanup rooms after X minutes
  // TODO: maybe delte immediately after lobby started from rooms table. and use room_code in profiles table?
  return <Text>Lobby</Text>;
}
