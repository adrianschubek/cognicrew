import * as React from "react";
import { useState } from "react";
import { PaperProvider, TextInput } from "react-native-paper";
import { expo } from ".././app.json";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, Image } from "react-native";
import {Text} from "react-native-paper"
import { Button } from "react-native-paper";
import Modal from "react-native-modal";
import { IconButton, MD3Colors } from 'react-native-paper';


export default function Login({navigation}) {
  const [text, setText] = React.useState("");
  const [text2, setText2] = React.useState("");

  const [isModalVisible, setModalVisible] = useState(false);

  const toggleModal = () => {
    setModalVisible(!isModalVisible);
  };


    return (
      <View style={styles.container}>
        <View style={styles.topIcons}>
          <Image 
          source={require("../assets/icon.png")}
          style={{width: 100, height: 100}} />
          <IconButton
              icon="setting"
              iconColor={'#303F9F'}
              size={60}
              onPress={() => console.log('Pressed')}
            />
        </View>
      <View style={styles.container}>
          <Text style={styles.titleText}>
           Welcome to CogniCrew!
          </Text>
     </View>
     <View style={styles.container}>
          <Text style={styles.baseText}>
            Your favorite place to supercharge {"\n"}
            your learning, collaborate with peers, and {"\n"}
            unlock your full potential. {"\n"}
          </Text>
      </View>
      <View style={styles.container}>
          <TextInput 
            style={styles.dataInput}
            label="Username or E-mail address:"
            value={text}
            onChangeText={text => setText(text)}
          />
      </View>
      <View style={styles.container}>
          <TextInput style={styles.dataInput}
            label="Password"
            secureTextEntry={true}
            value={text2}
            onChangeText={text2 => setText2(text2)}
          />
      </View>
      <View style={styles.container}>
        <View style={styles.oneLine}>
          <Text>
            Your first time? You can register 
          </Text>
          <Button onPress={toggleModal}  > 
          here
          </Button>
          <Text>
            !
          </Text>
          <Button
            onPress={() => {
              navigation.goBack();
              console.log("Login screen pressed")
              }
            }
          >
            Password forgotten?
          </Button>
      
          <Modal isVisible={isModalVisible}>
            <Text>If you havent already got an account please fill in the form below:</Text>
            <Button onPress={toggleModal} 
            > Submit form
            </Button>
          </Modal>
          <StatusBar style="auto" />
      </View>
          <Button
            mode="contained"
            onPress={() => {
              navigation.navigate("Home")
              console.log("Login screen pressed")
              }
            }
          >
            Login
          </Button>
      </View>
    );
}

const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: 'white',//"#fff",
      alignItems: "center",
      justifyContent: "center",
    },
    topIcons: {
      flex: 1,
      bottom: 0,
      alignItems: 'flex-start',
      flexDirection: 'row',
      justifyContent: 'space-between',
      backgroundColor: 'white',
      width:'100%' // add width 
    },
    baseText: {
      fontSize: 18,
      fontFamily: 'Roboto',
    },
    titleText: {
      fontSize: 24,
      fontWeight: 'bold',
      fontFamily: 'Roboto',
    },
    dataInput: {
      //backgroundColor: 'white',
      width: 300,
    }
  });