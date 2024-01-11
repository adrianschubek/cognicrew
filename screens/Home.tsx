import * as React from "react";
import { View, Image, ScrollView } from "react-native";
import { StatusBar } from "expo-status-bar";
import { Button, Text, useTheme } from "react-native-paper";
import JoinRoom from "../components/learningRoom/JoinRoom";
import { useUsername } from "../utils/hooks";
import { useEffect } from "react";
import { useAuth } from "../providers/AuthProvider";
import ProfilePictureAvatar from "../components/profile/ProfilePictureAvatar";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import RoomsList from "./RoomsList";
import { supabase } from "../supabase";

export default function HomeScreen({ navigation }) {
  const { data, isLoading } = useUsername();
  const { user } = useAuth();
  const theme = useTheme();
  useEffect(() => {
    navigation.setOptions({
      title: "CogniCrew",
      headerRight: () => (
        <Image
          source={require("../assets/icon.png")}
          style={{ height: 42, width: 41 }}
        />
      ),
    });
  }, []);

  // useEffect(() => {
  //   // if (!user || !username /* || !alreadyFetchedRealtime */) return;
  //   // alreadyFetchedRealtime.current = true;
  //   const realtime = supabase.channel(`xxx`/* , { // TODO: das ist nen satte hiuer global packen useref
  //     config: { presence: { key: "1" } },
  //   } */);
  //   realtime
  //     .on("presence", { event: "sync" }, () => {
  //       const newState = realtime.presenceState();
  //       console.log(
  //         "syncccc",
  //         newState,
  //         // Object.values(newState).flatMap((e: any) => e[0].user_name),
  //       );
  //       // setRealtimeState(
  //       //   Object.values(newState).flatMap((e: any) => e[0].user_name),
  //       // );
  //     })

  //     .on("presence", { event: "join" }, ({ key, newPresences }) => {
  //       console.log("join", key, newPresences);
  //     })
  //     .on("presence", { event: "leave" }, ({ key, leftPresences }) => {
  //       console.log("leave", key, leftPresences);
  //     })
  //     // .subscribe();
  //   .subscribe(async (status) => {
  //     if (status !== "SUBSCRIBED") {
  //       return;
  //     }
  //     const presenceTrackStatus = await realtime.track({
  //      a:5555
  //     });
  //     console.log(presenceTrackStatus);
  //   });
  // }, []);

  // const fuckme = async () => {
  //   console.log("FFF");
  //   const realtime = supabase.channel(`xxx`, {
  //     config: { presence: { key: "1" } },
  //   });
  //   realtime
  //   .on("presence", { event: "sync" }, () => {
  //     const newState = realtime.presenceState();
  //     console.log(
  //       "yyyyyy",
  //       newState,
  //       // Object.values(newState).flatMap((e: any) => e[0].user_name),
  //     );
  //     // setRealtimeState(
  //     //   Object.values(newState).flatMap((e: any) => e[0].user_name),
  //     // );
  //   }).
  //   subscribe(async (status) => {
  //     if (status !== "SUBSCRIBED") {
  //       return;
  //     }
  //     const presenceTrackStatus = await realtime.track({
  //       a: 1,
  //     });
  //     console.log(presenceTrackStatus+ "aaaaaaaaaaa");
  //   });
  // };

  // const fuckme2 = async () => {
  //   console.log("FFF");
  //   const realtime = supabase.channel(`xxx`, {
  //     config: { presence: { key: "1" } },
  //   });
  //   realtime
  //   .on("presence", { event: "sync" }, () => {
  //     const newState = realtime.presenceState();
  //     console.log(
  //       "bbb",
  //       newState,
  //       // Object.values(newState).flatMap((e: any) => e[0].user_name),
  //     );
  //     // setRealtimeState(
  //     //   Object.values(newState).flatMap((e: any) => e[0].user_name),
  //     // );
  //   }).
  //   subscribe(async (status, err) => {
  //     if(err) console.log("SUBSCRIPTION ERROR:"+ err);
  //     if (status !== "SUBSCRIBED") {
  //       return;
  //     }
  //     const presenceTrackStatus = await realtime.track({
  //       a: 1222222222,
  //     });
  //     console.log(presenceTrackStatus+ "bbbbbbbb");
  //   });
  // };

  if (isLoading)
    return (
      <>
        <StatusBar style="auto" />
        <LoadingOverlay visible={isLoading} />
      </>
    );
  return (
    <ScrollView
      style={{
        flex: 1,
        paddingHorizontal: 35,
        gap: 10,
      }}
    >
      <StatusBar style="auto" />
      <View
        style={{
          flexDirection: "row",
          alignItems: "center",
          justifyContent: "space-between",
          paddingTop: 10,
          marginBottom: 10,
        }}
      >
        {/* <Button onPress={fuckme}>FFFFF</Button> */}
        {/* <Button onPress={fuckme2}>HHHHH</Button> */}
        <Text variant="titleLarge">Hello, {isLoading ? "...." : data}</Text>
        <ProfilePictureAvatar
          username={isLoading ? "...." : data}
          userId={user.id}
          size={48}
        />
      </View>
      <View
        style={{
          marginBottom: 20,
          gap: 10,
        }}
      >
        <JoinRoom
          style={{
            gap: 5,
            //alignSelf: "flex-start",
          }}
        />
        <RoomsList />
      </View>
    </ScrollView>
  );
}
