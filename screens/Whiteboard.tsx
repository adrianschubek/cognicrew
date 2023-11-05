import * as React from "react";
import { StyleSheet, View, Image } from "react-native";
import { Text, IconButton, useTheme, Button} from "react-native-paper";
import {
    responsiveHeight,
    responsiveWidth,
    responsiveFontSize,
  } from "react-native-responsive-dimensions";


export default function Whiteboard({ navigation }) {
    const theme = useTheme();
  return (
    <React.Fragment>
        <View style={{flexDirection: "column", justifyContent: "space-between", flex: 1}}>
            <View style={styles.top}>
                <View style= {styles.topleft}>
                    <IconButton
                        icon="arrow-left-bold"
                        iconColor={theme.colors.primary}
                        size={40}
                        onPress={() => console.log('Pressed')}
                    />
                    <IconButton
                        icon="arrow-right-bold"
                        iconColor={theme.colors.primary}
                        size={40}
                        onPress={() => console.log('Pressed')}
                    />
                </View>
                <View style ={styles.topright}>
                    <Image
                    source={{
                    uri:
                        "https://iptk.w101.de/storage/v1/object/public/profile-pictures/icon.png"
                    
                    }}
                    style={styles.image}
                    />
                    <Text>User 1</Text>
                    <Image
                    source={{
                    uri:
                        "https://iptk.w101.de/storage/v1/object/public/profile-pictures/icon.png"
                    
                    }}
                    style={styles.image}
                    />
                    <Text>User 2</Text>
                </View>
            </View>
            <View style={styles.bottomLeft}>
                <IconButton
                icon="keyboard"
                iconColor={theme.colors.primary}
                size={40}
                onPress={() => console.log('Pressed')}
                />
                <IconButton
                icon="pencil"
                iconColor={theme.colors.primary}
                size={40}
                onPress={() => console.log('Pressed')}
                />
            </View>
        </View>
    </React.Fragment>
  );
}

const styles = StyleSheet.create({
    top: {
        flexDirection: "row",
       
    },
    topleft: {
        flexDirection: "row",
        flex: 1
    },
    topright: {
        flexDirection: "column",
       
    },
    image: {
        marginLeft: responsiveWidth(7),
        width: responsiveWidth(14),
        height: responsiveHeight(7),
        marginRight: 3,
        borderRadius: 35, // Half of the width and height to make it round
        overflow: "hidden",
      },

    bottomLeft: {
        //flex: 1,
        flexDirection: "column",
    }
  });
  