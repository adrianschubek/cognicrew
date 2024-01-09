import { ScrollView } from "react-native";
import React, { useEffect, useState } from "react";
import { StyleSheet, View } from "react-native";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { useAchievements, useUnlockAchievement } from "../utils/hooks";
import { Avatar, Divider, List } from "react-native-paper";
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
    <ScrollView /*style={styles.container}*/
      contentContainerStyle={styles.scrollContent}
    >
      <StatusBar style="auto" />
      <View>
        {/* Achievement list */}
        <List.Section style={{ width: responsiveWidth(100) }}>
          {list.map((achievementList, listIndex) => {
            return achievementList?.map((achievement, index) => (
              <View
                key={achievement.id}
                style={listIndex === 0 ? styles.achieved : styles.notAchieved}
              >
                <List.Item
                  title={achievement.name}
                  description={achievement.description}
                  left={() => (
                    <Avatar.Image
                      source={{
                        uri: supabase.storage
                          .from("achievements")
                          .getPublicUrl(achievement.icon_name).data.publicUrl,
                      }}
                      style={{
                        marginLeft: responsiveWidth(2),
                        marginRight: 3,
                        overflow: "hidden",
                      }}
                    />
                  )}
                />
                {(listIndex === 0 || index < achievementList.length - 1) && (
                  <Divider />
                )}
              </View>
            ));
          })}
        </List.Section>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  scrollContent: {
    marginTop: -8,
    width: responsiveWidth(100),
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
  notAchieved: {
    opacity: 0.5,
  },
  achieved: {
    opacity: 1.0,
  },
});
