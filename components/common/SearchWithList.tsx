import { Divider, HelperText, Searchbar, useTheme } from "react-native-paper";
import { Keyboard, View } from "react-native";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { ManagementType, Mode } from "../../types/common";
import React, { useEffect, useState } from "react";
import MultifunctionalList from "./MultifunctionalList";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { useSets } from "../../utils/hooks";
import { useProjectStore } from "../../stores/ProjectStore";

export default function SearchWithList(props: {
  type: ManagementType;
  searchPlaceholder?: string;
  //creationOption decides wether a new entry can be created within the set selection
  creationOption?: boolean;
  creationOptionFocused?: (e: boolean) => any;
  mode?: Mode;
  sendSetId?: any;
  noSetSelected?: boolean;
  [name: string]: any;
}) {
  const theme = useTheme();
  const projectId = useProjectStore((state) => state.projectId);
  const [searchQuery, setSearchQuery] = useState("");
  const [setId, setSetId] = useState(null);
  const { data, isLoading, error } = useSets(props.type, projectId);
  useEffect(() => {
    if (!data) return;
    //console.log(data);
    setFiltered(data);
  }, [data]);
  const [filtered, setFiltered] = useState([]);
  //const [isSearching, setIsSearching] = useState(false);
  const handleSearch = (query) => {
    setSearchQuery(query);
    const filteredItems = data.filter((item) =>
      item.name.toLowerCase().match(query.toLowerCase()),
    );
    setFiltered(filteredItems);
  };
  if (error) return <LoadingOverlay visible={isLoading} />;
  const getSetId = (setId) => {
    props.sendSetId(setId);
    setSetId(setId);
  };
  return (
    <View
      style={{
        width: responsiveWidth(70),
        marginBottom: 8,
        alignSelf: "center",
      }}
    >
      <Searchbar
        testID="input-search-for-flashcard-set"
        value={searchQuery}
        style={{ elevation: 1 }}
        placeholder={props.searchPlaceholder || "Search"}
        //onTouchStart={() => setIsSearching(true)}
        //onBlur={() => setIsSearching(false)}
        onChangeText={handleSearch}
      />
      <Divider style={{}} bold={true} />
      {/*isSearching && (*/}
      <MultifunctionalList
        mode={props.mode}
        dataSource={filtered}
        creationOption={props.creationOption}
        type={props.type}
        sendSetId={getSetId}
        noSetAvailable={data?.length === 0 ? true : false}
        creationOptionFocused={props.creationOptionFocused}
      />
      {props.noSetSelected &&
        !setId /*!setId does that the error message is only shown when the user has not selected a set, 
        it will be removed when the user selects a set, is this the desired behaviour?*/ && (
          <HelperText
            type="error"
            padding="none"
            style={{ alignSelf: "flex-start", marginLeft: 16 }}
          >
            You have to select a set
          </HelperText>
        )}
      {/*)}*/}
    </View>
  );
}
