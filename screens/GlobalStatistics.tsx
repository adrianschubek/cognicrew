import React, { useEffect } from "react";
import { View, StyleSheet, ScrollView, SafeAreaView } from "react-native";
import { Divider, Text, useTheme } from "react-native-paper"; //Text always needs to be imported from react-native-paper @Alex

import PieChart from "react-native-pie-chart";

export default function GlobalStatistics() {
  //Pie chart variables
  const widthAndHeight = 100;
  const series = [10, 20, 17]; //hours spent
  const sliceColor = ["#fbd203", "#ffb300", "#ff9100"]; //colors
  //see, i am using your terminology here @Alex, that is my way of honouring you
  const heading ="titleLarge"
  const heading3 ="titleMedium"
  const heading4 ="labelLarge"
  //Calculaions of pie chart statistics
  let sumTimeGames = series.reduce(
    (accumulator, currentValue) => accumulator + currentValue,
    0,
  );
  let percentExercise = ((series[0] / sumTimeGames) * 100).toFixed(2);
  let percentQuiz = ((series[1] / sumTimeGames) * 100).toFixed(2);
  let percentWhiteboard = ((series[2] / sumTimeGames) * 100).toFixed(2);

  return (
    <ScrollView style={styles.container}>
      <Text variant={heading} style={{ marginBottom: 20 }}>
        Global Statistics
      </Text>
      <Divider />

      <Text variant={heading3} style={{ marginBottom: 20 }}>
        Total time spent on this app:{" "}
      </Text>
      <Text variant={heading} style={[{ marginBottom: 20, marginTop: 30 }]}>
        Files statistics
      </Text>
      <Divider />
      <View style={{ gap: 20, marginBottom: 30 }}>
        <Text variant={heading3}>Total amount of exercises:</Text>
        <Text variant={heading3}>Total amount of links:</Text>
        <Text variant={heading3}>Total amount of files: </Text>
      </View>
      <Text variant={heading} style={[{ marginBottom: 20 }]}>
        Game statistics
      </Text>
      <Divider />
      <View style={{ gap: 20, marginBottom: 20 }}>
        <Text variant={heading3}>Total amount of learning projects:</Text>
        <Text variant={heading3}>Total amount of flashcards:</Text>
        <Text variant={heading3}>Time spent in learning games:</Text>
      </View>
      <View style={styles.piechart}>
        <PieChart
          widthAndHeight={widthAndHeight}
          series={series}
          sliceColor={sliceColor}
        />
        <View style={styles.piechartExplanation}>
          <Text variant={heading4} style={[{ color: sliceColor[0] }]}>
            Exercises: {series[0]} hours, {percentExercise} %{" "}
          </Text>
          <Text variant={heading4} style={[{ color: sliceColor[1] }]}>
            Flashcards: {series[1]} hours, {percentQuiz} %{" "}
          </Text>
          <Text variant={heading4} style={[{ color: sliceColor[2] }]}>
            Whiteboard: {series[2]} hours, {percentWhiteboard} %
          </Text>
        </View>
      </View>
      <Divider />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    //flex: 1,
    //justifyContent: 'center',
    //alignItems: 'center',
  },
  piechart: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 20,
  },
  piechartExplanation: {
    flexDirection: "column",
    marginLeft: 20,
    gap: 20,
  },
});
