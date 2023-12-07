import React from "react";
import { View, StyleSheet, ScrollView } from "react-native";
import { Divider, Text } from "react-native-paper";

import PieChart from "react-native-pie-chart";

export default function ProjectStatistics() {
  const widthAndHeight = 100;
  const series = [123, 321, 123, 789, 537];
  const sliceColor = ["#fbd203", "#ffb300", "#ff9100", "#ff6c00", "#ff3c00"];

  return (
    <ScrollView style={styles.container}>
      <Text variant="headlineSmall" style={{ marginBottom: 20 }}>
        Project Statistics
      </Text>
      <Divider />
      <Text
        variant="headlineSmall"
        style={[{ marginBottom: 20, marginTop: 30 }]}
      >
        Files statistics
      </Text>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant="titleLarge">CogniCards</Text>
        <Text variant="titleMedium">Amount of Sets:</Text>
        <Text variant="titleMedium">Amount of Cards:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant="titleLarge">CogniCises</Text>
        <Text variant="titleMedium">Amount of Sets:</Text>
        <Text variant="titleMedium">Amount of Exercises:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant="titleLarge">CogniLinks</Text>
        <Text variant="titleMedium">Amount of Links:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant="titleLarge">Cognifiles</Text>
        <Text variant="titleMedium">Amount of Files:</Text>
        <Text variant="titleMedium">Amount of photos:</Text> {/*Why is files capitalized and photos not? Should be consistent*/}
      </View>
      <Divider />
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant="headlineSmall" style={[{ marginTop: 30 }]}>
          Games statistics
        </Text>
        <Text variant="titleLarge">CogniQuiz</Text>
        <Text variant="titleMedium">Wins:</Text>
        <Text variant="titleMedium">Time spent playing:</Text>
        <Text variant="titleLarge">Time spent with each set:</Text>
        <PieChart
          widthAndHeight={widthAndHeight}
          series={series}
          sliceColor={sliceColor}
        />
        <Text variant="titleMedium">Global rank:</Text>
        <Text variant="titleMedium">Rank under friends:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant="titleLarge">CogniCards</Text>
        <Text variant="titleMedium">Wins:</Text>
        <Text variant="titleMedium">Time spent playing:</Text>
        <Text variant="titleLarge">Time spent with each set:</Text>
        <PieChart
          widthAndHeight={widthAndHeight}
          series={series}
          sliceColor={sliceColor}
        />
        <Text variant="titleMedium">Global rank:</Text>
        <Text variant="titleMedium">Rank under friends:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant="titleLarge">CogniBoard</Text>
        <Text variant="titleMedium">Time spent sketching:</Text>
      </View>
      <Divider />
      <Text
        variant="headlineSmall"
        style={[{ marginBottom: 20, marginTop: 30 }]}
      >
        Leaderboard
      </Text>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant="titleLarge">Relative time spent on each game:</Text>
        <PieChart
          widthAndHeight={widthAndHeight}
          series={series}
          sliceColor={sliceColor}
        />
        <Text variant="titleMedium">Global rank:</Text>
        <Text variant="titleMedium">Rank under friends:</Text>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    //flex: 1,
    //justifyContent: 'center',
    //alignItems: 'center',
  },
  categoryStyle: {
    gap: 20,
    marginBottom: 20,
  },
});
