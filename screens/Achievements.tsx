import { ScrollView } from "react-native";
import React, { useEffect, useState } from "react";
import { StyleSheet, View } from "react-native";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useAchievements, useUnlockAchievement } from "../utils/hooks";
import { Avatar, Divider, List, Text } from "react-native-paper";
import { supabase } from "../supabase";
import { StatusBar } from "expo-status-bar";
import { usePreferencesStore } from "../stores/PreferencesStore";

export default function Achievements() {
  const [achievementsAchieved, setAchievementsAchieved] = useState([]);
  const [achievementsNotAchieved, setAchievementsNotAchieved] = useState([]);
  const { data, error, isLoading, mutate } = useAchievements();
  useEffect(() => {
    if (!data) return;
    setAchievementsAchieved(data[0].achieved_achievements);
    setAchievementsNotAchieved(data[0].not_achieved_achievements);
  }, [data]);
  const { achievementSignal } = usePreferencesStore();

  useEffect(() => {
    mutate();
  }, [achievementSignal]);
  const list = [achievementsAchieved, achievementsNotAchieved];
  //if (isLoading) return <LoadingOverlay visible={isLoading} />;
  return (
    <>
      <StatusBar style="auto" />
      {achievementsAchieved.length > 0 ? (
        <ScrollView
          contentContainerStyle={{
            marginTop: -8,
            width: responsiveWidth(100),
            flexDirection: "column",
            alignItems: "center",
            justifyContent: "flex-start",
          }}
        >
          <View>
            {/* Achievement list */}
            <List.Section style={{ width: responsiveWidth(100) }}>
              {list.map((achievementList, listIndex) => {
                return achievementList?.map((achievement, index) => (
                  <View
                    key={achievement.id}
                    style={
                      listIndex === 0 ? styles.achieved : styles.notAchieved
                    }
                  >
                    <List.Item
                      title={achievement.name}
                      titleStyle={{ marginBottom: 2, marginTop: -2 }}
                      description={() => (
                        <Text variant="bodySmall">
                          {achievement.description}
                        </Text>
                      )}
                      left={() => (
                        <Avatar.Image
                          source={{
                            uri: supabase.storage
                              .from("achievements")
                              .getPublicUrl(achievement.icon_name).data
                              .publicUrl,
                          }}
                          style={{
                            marginLeft: responsiveWidth(2),
                            marginRight: 3,
                            overflow: "hidden",
                          }}
                        />
                      )}
                    />
                    {(listIndex === 0 ||
                      index < achievementList.length - 1) && <Divider />}
                  </View>
                ));
              })}
            </List.Section>
          </View>
        </ScrollView>
      ) : (
        <View
          style={{
            alignItems: "center",
            justifyContent: "center",
            flex: 1,
            gap: 8,
          }}
        >
          <Avatar.Icon icon="lock-question" size={70} />
          <Text variant="headlineSmall">Not yet unlocked!</Text>
        </View>
      )}
    </>
  );
}

const styles = StyleSheet.create({
  notAchieved: {
    opacity: 0.5,
  },
  achieved: {
    opacity: 1.0,
  },
});
