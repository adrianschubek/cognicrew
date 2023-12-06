import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { Divider } from 'react-native-paper';

import PieChart from 'react-native-pie-chart'

export default function ProjectStatistics() {


    const widthAndHeight = 100
    const series = [123, 321, 123, 789, 537]
    const sliceColor = ['#fbd203', '#ffb300', '#ff9100', '#ff6c00', '#ff3c00']

  return (
    <ScrollView style={styles.container}>

      <Text style={styles.heading}>Project Statistics</Text>
      <Divider style={styles.divider}/>
      <Text style={[styles.heading, {marginTop: 30}]}>Files statistics</Text>
        <Divider />
        <Text style={styles.heading2}>CogniCards</Text>
            <Text style={styles.heading3}>Amount of Sets:</Text>
            <Text style={styles.heading3}>Amount of Cards:</Text>
        <Divider />
        <Text style={styles.heading2}>CogniCises</Text>
            <Text style={styles.heading3}>Amount of Sets:</Text>
            <Text style={styles.heading3}>Amount of Exercises:</Text>
        <Divider />
        <Text style={styles.heading2}>CogniLinks</Text>
            <Text style={styles.heading3}>Amount of Links:</Text>
        <Divider />
        <Text style={styles.heading2}>Cognifiles</Text>
            <Text style={styles.heading3}>Amount of Files:</Text>
            <Text style={styles.heading3}>Amount of photos:</Text>
        <Divider />
      <Divider style={styles.divider}/>
      <Text style={[styles.heading, {marginTop: 30}]}>Games statistics</Text>
        <Text style={styles.heading2}>CogniQuiz</Text>
            <Text style={styles.heading3}>Wins:</Text>
            <Text style={styles.heading3}>Time spent playing:</Text>
            <Text style={styles.heading2}>Time spent with each set:</Text>
            <PieChart widthAndHeight={widthAndHeight} series={series} sliceColor={sliceColor} />
            <Text style={styles.heading3}>Global rank:</Text>
            <Text style={styles.heading3}>Rank under friends:</Text>
        <Divider />
        <Text style={styles.heading2}>CogniCards</Text>
            <Text style={styles.heading3}>Wins:</Text>
            <Text style={styles.heading3}>Time spent playing:</Text>
            <Text style={styles.heading2}>Time spent with each set:</Text>
            <PieChart widthAndHeight={widthAndHeight} series={series} sliceColor={sliceColor} />
            <Text style={styles.heading3}>Global rank:</Text>
            <Text style={styles.heading3}>Rank under friends:</Text>
        <Divider />
        <Text style={styles.heading2}>CogniBoard</Text>
            <Text style={styles.heading3}>Time spent sketching:</Text>
        <Divider style={styles.divider}/>
        <Text style={[styles.heading, {marginTop: 30}]}>Leaderboard</Text>
            <Divider />
            <Text style={styles.heading2}>Relative time spent on each game:</Text>
            <PieChart widthAndHeight={widthAndHeight} series={series} sliceColor={sliceColor} />
            <Text style={styles.heading3}>Global rank:</Text>
            <Text style={styles.heading3}>Rank under friends:</Text>

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
  divider: {
    height: 1,
    backgroundColor: "black",
  },
});
