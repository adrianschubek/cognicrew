import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import {
  Dialog,
  Portal,
  TextInput,
  Text,
  Button,
  Checkbox,
  Searchbar
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useState } from "react";
import { accordionSectionItems } from "../learningProject/AccordionSection";
import { ScrollView } from "react-native";
import { useNavigation } from '@react-navigation/native';
import { useRoute } from '@react-navigation/native';
import { NAVIGATION } from "../../types/common";

export default function CreateDrawing({showDrawing, close}) {
    
  return (
    <>
        <Portal>
            <Dialog visible={showDrawing} onDismiss={close}>
                <Dialog.Title>Drawing</Dialog.Title>
                     <Dialog.Content>
                            <Text> Round duration</Text>
                                <View style={styles.container}>
                                    <TextInput
                                        
                                    />
                                </View>
                    </Dialog.Content>
                <Dialog.Actions>
                    <Button 
                    onPress={close}
                    style={{ marginRight: 'auto' }}>Cancel</Button>
                    <Button 
                        onPress={() => {
                            close();
                        }}
                    >Done</Button>
                </Dialog.Actions>
            </Dialog>
        </Portal>
    </>
     );
}

const styles = StyleSheet.create({
   container: {

   }
});
