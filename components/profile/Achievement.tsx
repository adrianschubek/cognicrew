import React, { useEffect, useState } from "react";
import { StyleSheet, View, Image } from "react-native";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { useAchievements, useUnlockAchievement } from "../../utils/hooks";
import { Divider, List } from "react-native-paper";
import { supabase } from "../../supabase";
import LoadingOverlay from "../alerts/LoadingOverlay";

export default function Achievement() {
  const [achievementsAchieved, setAchievementsAchieved] = useState([]);
  const [achievementsNotAchieved, setAchievementsNotAchieved] = useState([]);
  const { data, error, isLoading, mutate } = useAchievements();
  useEffect(() => {
    if (!data) return;
    setAchievementsAchieved(data[0].achieved_achievements);
    setAchievementsNotAchieved(data[0].not_achieved_achievements);
  }, [data]);

  const list = [achievementsAchieved, achievementsNotAchieved];
  //if (isLoading) return <LoadingOverlay visible={isLoading} />;
  return (
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
                  <Image
                    source={{
                      uri: supabase.storage
                        .from("achievements")
                        .getPublicUrl(achievement.icon_name).data.publicUrl,
                    }}
                    style={styles.image}
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
  );
}

const styles = StyleSheet.create({
  notAchieved: {
    opacity: 0.5,
  },
  achieved: {
    opacity: 1.0,
  },
  image: {
    marginLeft: responsiveWidth(7),
    width: 70,
    height: 70,
    marginRight: 3,
    borderRadius: 35,
    overflow: "hidden",
  },
});
