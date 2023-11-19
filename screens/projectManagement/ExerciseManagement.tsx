import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView } from "react-native";
import { Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";
import AccordionSection from "../../components/learningProject/AccordionSection";
import AddExercises from "../../components/dialogues/AddExercises";
import { useState } from "react";
import ManageSets from "../../components/dialogues/ManageSets";
import { ManagementType } from "../../types/common";
import { useSoundsStore } from "../../stores/SoundsStore";
import { useFocusEffect } from "@react-navigation/native";

export default function ExerciseManagement() {
  const [showAddExercises, setShowAddExercises] = useState(false);
  const [showManageSets, setShowManageSets] = useState(false);

  const { playSound, stopSound, loadSound1 } = useSoundsStore();
  useFocusEffect(
    React.useCallback(() => {
      const { isLoaded} = useSoundsStore.getState();
      if (!isLoaded) {
        const audioSource = require('../../assets/sounds/musicmusicmusic.mp3');
        loadSound1(audioSource);
      } else {
        playSound();
      }
      return () => {
        stopSound();
      };
    }, [])
  );
  
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <AddExercises
        showAddExercises={showAddExercises}
        close={() => setShowAddExercises(false)}
      />
      <ManageSets
        showManageSets={showManageSets}
        close={() => setShowManageSets(false)}
        type={ManagementType.EXERCISE}
      />
      <View style={styles.upperContainer}>
        <TextWithPlusButton
          text="add new Exercises"
          function={() => {
            setShowAddExercises(true);
          }}
        />
        <TextWithPlusButton
          text={"Manage exercise sets"}
          function={() => {
            setShowManageSets(true);
          }}
        />
      </View>
      <ScrollView>
        <AccordionSection type={ManagementType.EXERCISE} />
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(100),
    height: responsiveHeight(100),
    flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
  upperContainer: {
    flex: 0,
    width: responsiveWidth(100),
    //backgroundColor:"red",
    flexDirection: "column",
    alignItems: "flex-end",
  },
});
