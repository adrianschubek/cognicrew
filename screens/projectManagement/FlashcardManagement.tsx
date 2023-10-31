import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Button, Text, Divider, List } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import LearningProjectCategory from "../../components/learningProject/LearningProjectCategory";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";

export default function FlashcardManagement({ navigation }) {
  const [expanded, setExpanded] = React.useState(true);

  const handlePress = () => setExpanded(!expanded);
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <View style={styles.upperContainer}>
        <TextWithPlusButton text="add new flash cards" function={() => {}} />
      </View>
      {/* 
      <View style={styles.contentSetStyle}>
        <Text>Set A</Text>
        <Divider style={{ width: responsiveWidth(100) }} />
      </View>
*/}
      <List.Section style={styles.accordionStyle}>
        <List.Accordion
          title="Set A"
          left={(props) => <List.Icon {...props} icon="folder" />}
        >
          <List.Item title="What does Sigmund Freud base his main theory on?" />
          <List.Item title="Why can't find love and why doesn't my family love me?" />
        </List.Accordion>
        <List.Accordion
          title="Set B"
          left={(props) => <List.Icon {...props} icon="folder" />}
          expanded={expanded}
          onPress={handlePress}
        >
          <List.Item title="Why do we live?" />
          <List.Item title="How can i convince my gf to buy me a Porsche?" />
        </List.Accordion>
      </List.Section>
      <Button
        icon="home"
        mode="contained"
        style={{ marginTop: responsiveHeight(5) }}
        contentStyle={{
          height: responsiveHeight(10),
          /*backgroundColor:"yellow",*/ alignItems: "center",
        }}
        labelStyle={{
          lineHeight: responsiveFontSize(3.25),
          fontSize: responsiveFontSize(3),
          textAlignVertical: "center",
          padding: 0,
          height: responsiveFontSize(3),
          //backgroundColor:"red"
        }}
        onPress={() => {
          navigation.navigate("LearningRoom");
        }}
      >
        Create Room
      </Button>
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
    flexDirection: "row",
    justifyContent: "flex-end",
  },
  contentSetStyle: {
    flex: 0,
    width: responsiveWidth(100),
    flexDirection: "column",
    justifyContent: "flex-start",
    //backgroundColor:"red"
  },
  accordionStyle: {
    width: responsiveWidth(100),
  },
});
