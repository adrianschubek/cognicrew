import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView } from "react-native";
import { FAB, Text } from "react-native-paper";
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
import { useSoundSystem1 } from "../../utils/hooks";

export default function ExerciseManagement() {
  const [showAddExercises, setShowAddExercises] = useState(false);
  const [showManageSets, setShowManageSets] = useState(false);
  const [FABOpen, setFABOpen] = useState({ open: false });
  const onStateChange = ({ open }) => setFABOpen({ open });
  const { open } = FABOpen;
  useSoundSystem1();

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
      <ScrollView>
        <AccordionSection type={ManagementType.EXERCISE} />
      </ScrollView>
      <FAB.Group
        open={open}
        visible
        icon={open ? "card-text" : "plus"}
        actions={[
          {
            icon: "plus",
            label: "Add new exercises",
            onPress: () => setShowAddExercises(true),
          },
          {
            icon: "table-settings",
            label: "Manage exercise sets",
            onPress: () => setShowManageSets(true),
          },
        ]}
        onStateChange={onStateChange}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: -8,
  },
});
