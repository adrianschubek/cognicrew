import * as React from "react";
import { Text } from "react-native-paper";
import { StyleSheet } from "react-native";
import AccordionSection from "../../components/learningRoom/AccordionCreateRoom";


export default function CreateRoom({ navigation }) {
  return (
    <React.Fragment>
      <Text style={[styles.container, { textAlign: "center" }]}>
        Create room:
      </Text>

      <AccordionSection />

    </React.Fragment>
  );
}
const styles = StyleSheet.create({
  container: {
    width: "100%",
    alignItems: "center",
    marginVertical: 10,
  },
});
