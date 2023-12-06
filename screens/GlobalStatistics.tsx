import React, { useEffect } from 'react';
import { View, Text, StyleSheet, ScrollView, SafeAreaView } from 'react-native';
import { Divider } from 'react-native-paper';

import PieChart from 'react-native-pie-chart'

export default function GlobalStatistics() {

    //Pie chart variables
    const widthAndHeight = 100
    const series = [10, 20, 17] //hours spent
    const sliceColor = ['#fbd203', '#ffb300', '#ff9100'] //colors

    //Calculaions of pie chart statistics
    let sumTimeGames = series.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
    let percentExercise = ((series[0] / sumTimeGames) * 100).toFixed(2);
    let percentQuiz = ((series[1] / sumTimeGames) * 100).toFixed(2);
    let percentWhiteboard = ((series[2] / sumTimeGames) * 100).toFixed(2);

    


  return (
    <ScrollView style={styles.container}>
      <Text style={styles.heading}>Global Statistics</Text>
      <Divider style={styles.divider}/>
       <Text style={styles.heading3}>Total time spent on this app: </Text>
        <Text style={[styles.heading, {marginTop: 30}]}>Files statistics</Text>
          <Divider />
          <Text style={styles.heading3}>Total amount of exercises:</Text>
            <Text style={styles.heading3}>Total amount of links:</Text>
            <Text style={styles.heading3}>Total amount of files: </Text>

          <Text style={[styles.heading, {marginTop: 30}]}>Game statistics</Text>
          <Divider />
            <Text style={styles.heading3}>Total amount of learning projects:</Text>
            <Text style={styles.heading3}>Total amount of flashcards:</Text>
            <Text style={styles.heading3}>Time spent in learning games:</Text>
                <View style={styles.piechart}>
                <PieChart widthAndHeight={widthAndHeight} series={series} sliceColor={sliceColor} />
                <View style={styles.piechartexplanation}>
                  <Text style={[styles.heading4, {color: sliceColor[0]}]}>Exercises: {series[0]} hours,  {percentExercise} % </Text>
                  <Text style={[styles.heading4, {color: sliceColor[1]}]}>Flashcards: {series[1]} hours, {percentQuiz} % </Text>
                  <Text style={[styles.heading4, {color: sliceColor[2]}]}>Whiteboard: {series[2]} hours, {percentWhiteboard} %</Text>
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
  heading: {
    fontSize: 24,
    fontWeight: "bold",
    marginBottom: 20,
  },
  heading2: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 20,
  },
  heading3: {
    fontSize: 18,
    fontWeight: "bold",
    marginBottom: 20,
  },
  heading4: {
    fontSize: 14,
    fontWeight: "bold",
    marginBottom: 20,
  },
  divider: {
    height: 1,
    backgroundColor: "black",
  },
  piechart: {
    flexDirection: "row",
    
  },
  piechartexplanation: {
    flexDirection: "column",
    marginLeft: 20
  },
});
