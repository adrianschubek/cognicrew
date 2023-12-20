import { FlatList, SafeAreaView, View } from "react-native";
import {
  Button,
  Divider,
  Text,
  useTheme,
} from "react-native-paper";
import ProjectCard from "./ProjectCard";

export default function ProjectCardList(props: {
  data: ArrayLike<any>;
  save: (item, vars) => void;
  reScramble: () => void;
}) {
  const theme = useTheme();
  const { data, save, reScramble } = props;

  const renderHeader = () => {
    return (
      <View>
        <Text
          style={{
            fontSize: 25,
            fontWeight: "bold",
            marginLeft: 10,
            margin: 10,
            color: theme.colors.primary,
          }}
        >
          Recommendations for you
        </Text>

        <Divider style={{ marginBottom: 10 }} />
      </View>
    );
  };

  const renderFooter = () => (
    <View style={{ flexDirection: "row" }}>
      <Divider />
      <Button
        mode="contained-tonal"
        icon="autorenew"
        labelStyle={{ fontSize: 18 }}
        onPress={reScramble}
      >
        Re-scramble
      </Button>
    </View>
  );
  return (
    <SafeAreaView>
      <FlatList
        data={data}
        renderItem={({ item }) => {
          return <ProjectCard item={item} save={save} />;
        }}
        ListHeaderComponent={renderHeader}
        ListFooterComponent={renderFooter}
      />
    </SafeAreaView>
  );
}
