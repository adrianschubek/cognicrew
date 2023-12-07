import React from "react";
import { View, StyleSheet, ScrollView } from "react-native";
import { Divider, Text } from "react-native-paper";

import PieChart from "react-native-pie-chart";

export default function ProjectStatistics() {
  const heading = "headlineSmall";
  const heading2 = "titleLarge";
  const heading3 = "titleMedium";
  //const heading4 = "labelLarge";
  const widthAndHeight = 100;
  const series = [123, 321, 123, 789, 537];
  const sliceColor = ["#fbd203", "#ffb300", "#ff9100", "#ff6c00", "#ff3c00"];

  return (
    <ScrollView style={styles.container}>
      <Text variant={heading} style={{ marginBottom: 20 }}>
        Project Statistics
      </Text>
      <Divider />
      <Text variant={heading} style={[{ marginBottom: 20, marginTop: 30 }]}>
        Files statistics
      </Text>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>CogniCards</Text>
        <Text variant={heading3}>Amount of Sets:</Text>
        <Text variant={heading3}>Amount of Cards:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>CogniCises</Text>
        <Text variant={heading3}>Amount of Sets:</Text>
        <Text variant={heading3}>Amount of Exercises:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>CogniLinks</Text>
        <Text variant={heading3}>Amount of Links:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>Cognifiles</Text>
        <Text variant={heading3}>Amount of Files:</Text>
        <Text variant={heading3}>Amount of photos:</Text>
        {/*Why is files capitalized and photos not? Should be consistent*/}
      </View>
      <Divider />
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading} style={[{ marginTop: 30 }]}>
          Games statistics
        </Text>
        <Text variant={heading2}>CogniQuiz</Text>
        <Text variant={heading3}>Wins:</Text>
        <Text variant={heading3}>Time spent playing:</Text>
        <Text variant={heading2}>Time spent with each set:</Text>
        <PieChart
          widthAndHeight={widthAndHeight}
          series={series}
          sliceColor={sliceColor}
        />
        <Text variant={heading3}>Global rank:</Text>
        <Text variant={heading3}>Rank under friends:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>CogniCards</Text>
        <Text variant={heading3}>Wins:</Text>
        <Text variant={heading3}>Time spent playing:</Text>
        <Text variant={heading2}>Time spent with each set:</Text>
        <PieChart
          widthAndHeight={widthAndHeight}
          series={series}
          sliceColor={sliceColor}
        />
        <Text variant={heading3}>Global rank:</Text>
        <Text variant={heading3}>Rank under friends:</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>CogniBoard</Text>
        <Text variant={heading3}>Time spent sketching:</Text>
      </View>
      <Divider />
      <Text variant={heading} style={[{ marginBottom: 20, marginTop: 30 }]}>
        Leaderboard
      </Text>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>Relative time spent on each game:</Text>
        <PieChart
          widthAndHeight={widthAndHeight}
          series={series}
          sliceColor={sliceColor}
        />
        <Text variant={heading3}>Global rank:</Text>
        <Text variant={heading3}>Rank under friends:</Text>
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
