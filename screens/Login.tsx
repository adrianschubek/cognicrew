import * as React from "react";
import { useState } from "react";
import { PaperProvider, TextInput } from "react-native-paper";
import { expo } from ".././app.json";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, Image } from "react-native";
import {Text} from "react-native-paper"
import { Button } from "react-native-paper";
import Modal from "react-native-modal";
import { IconButton } from 'react-native-paper';
import { Pressable } from "react-native";


export default function Login({navigation}) {
  const [text, setText] = React.useState("");
  const [text2, setText2] = React.useState("");
  const [text3, setText3] = React.useState("");
  const [text4, setText4] = React.useState("");
  const [text5, setText5] = React.useState("");
  const [text6, setText6] = React.useState("");

  const [isModalVisible, setModalVisible] = useState(false);
  const [isModal2Visible, setModal2Visible] = useState(false);

  const toggleModal = () => {
    setModalVisible(!isModalVisible);
  };

  const toggleModal2 = () => {
    setModal2Visible(!isModal2Visible);
  };

    return (
      <View style={styles.container}>
        <View style={styles.topIcons}>
          <Image 
          source={require("../assets/icon.png")}
          style={{width: 100, height: 100}} />
          <IconButton
              icon="cog"
              iconColor={'#303F9F'}
              size={60}
              onPress={() => {
                navigation.navigate("SettingsTab");
                console.log('Pressed')}}
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
            placeholder="Max Mustermann"
            value={text}
            onChangeText={text => setText(text)}
          />
      </View>
      <View style={styles.container}>
          <TextInput style={styles.dataInput}
            label="Password"
            placeholder="angola15"
            secureTextEntry={true}
            value={text2}
            onChangeText={text2 => setText2(text2)}
          />
      </View>
      <View style={styles.container}>

          <Text>
            Your first time? You can register <Pressable onPress={toggleModal}><Text>here!</Text></Pressable>
          </Text>

          <Button style={styles.noHover}
              onPress={() => {
              toggleModal2();
              console.log("Login screen pressed")
              }
            }
          >
            Password forgotten?
          </Button>
      
          <Modal isVisible={isModal2Visible}>
              <View style={styles.whiteModal}>
                <Text>
                  Please insert your e-mail address and a mail will be sent to your address with the option to change your password. 
                </Text>
                <TextInput 
                        style={styles.dataInput}
                        label="E-mail:"
                        inputMode="email"
                        keyboardType="email-address"
                        placeholder="max-mustermann@gmail.com"
                        value={text4}
                        onChangeText={text4 => setText4(text4)}
                  />
                <Button style={styles.dataInput}
                  onPress={toggleModal2} 
                  mode="contained"
                > Send new password
                </Button>
              </View>
          </Modal>

          <Modal isVisible={isModalVisible}>
                <View style = {styles.whiteModal}>
                 <View style={styles.container}>
                    <Text style={styles.titleText}>
                      If you havent already got an account please fill in the form below:
                    </Text>
                    </View>
                  <View style={styles.leftSide}>
                        <TextInput 
                        style={styles.dataInput}
                        label="Username:"
                        value={text3}
                        onChangeText={text3 => setText3(text3)}
                        />
                  </View>
                  <View style={styles.leftSide}>
                        <TextInput 
                        style={styles.dataInput}
                        label="E-mail:"
                        inputMode="email"
                        keyboardType="email-address"
                        placeholder="max-mustermann@gmail.com"
                        value={text4}
                        onChangeText={text4 => setText4(text4)}
                        />
                        </View>
                  <View style={styles.leftSide}>
                        <TextInput 
                        style={styles.dataInput}
                        label="Password:"
                        placeholder="angola15"
                        value={text5}
                        secureTextEntry={true}
                        onChangeText={text5 => setText5(text5)}
                        />
                        </View>
                  <View style={styles.leftSide}>
                        <TextInput 
                        style={styles.dataInput}
                        label="Repeat password:"
                        placeholder="angola15"
                        value={text6}
                        secureTextEntry={true}
                        onChangeText={text6 => setText6(text6)}
                        />
                        </View>
                  <View style={{...styles.leftSide, backgroundColor:'white'}}>
                        <Text>
                          Upload icon:
                        </Text>
                      <IconButton
                          icon="file-png-box"
                          iconColor={'#303F9F'}
                          size={60}
                          onPress={() => console.log('Pressed')}
                        />
                        </View>
                  <View style={styles.container}>
                        <Button 
                        style={styles.dataInput}
                         mode="contained"
                        onPress={toggleModal} 
                        > Submit form
                        </Button>
                    </View>
                  </View>
          </Modal>
          <StatusBar style="auto" />
      </View>
          <Button style={styles.dataInput}
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

    },
    titleText: {
      fontSize: 24,
      fontWeight: 'bold',
    },
    dataInput: {
      //backgroundColor: 'white',
      width: 300,
      margin: 10
    },
    oneLine: {
      flexDirection: 'row',
    },
    noHover: {
        backgroundColor: "#FFF"
    },
    leftSide: {
        flexDirection: 'row',
        justifyContent: 'flex-start',
        alignContent: 'flex-start',
        margin: 10
    },
    whiteModal: {

      backgroundColor: 'white',
    }
  });