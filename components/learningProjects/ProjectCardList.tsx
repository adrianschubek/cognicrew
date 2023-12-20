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
  header?: React.ComponentType<any> | React.ReactElement<any, string | React.JSXElementConstructor<any>>
  footer?: React.ComponentType<any> | React.ReactElement<any, string | React.JSXElementConstructor<any>>
}) {
  const theme = useTheme();
  const { data, save, header, footer} = props;

  return (
    <SafeAreaView>
      <FlatList
        data={data}
        renderItem={({ item }) => {
          return <ProjectCard item={item} save={save} />;
        }}
        ListHeaderComponent={header}
        ListFooterComponent={footer}
      />
    </SafeAreaView>
  );
}
