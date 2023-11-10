import { Button, Divider, List, Searchbar, useTheme } from "react-native-paper";
import { Keyboard } from "react-native";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { ManagementType, Mode } from "../../types/common";
import React, { useEffect, useState } from "react";
import MultifunctionalList from "./MultifunctionalList";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { useSets } from "../../utils/hooks";

export default function SearchWithList(props: {
  type: ManagementType;
  searchPlaceholder?: string;
  //creationOption decides wether a new entry can be created within the set selection
  creationOption?: boolean;
  mode?: Mode;
  [name: string]: any;
}) {
  const Items = [
    { title: "Set A", id: 1, type: "flashcard" },
    { title: "Set B", id: 2, type: "flashcard" },
    { title: "Set C", id: 3, type: "flashcard" },
    { title: "Set D", id: 4, type: "flashcard" },
    { title: "Set E", id: 5, type: "flashcard" },
    { title: "Set F", id: 6, type: "flashcard" },
    { title: "Set G", id: 7, type: "flashcard" },
    { title: "Set H", id: 8, type: "flashcard" },
    { title: "Set I", id: 9, type: "flashcard" },
    { title: "Set J", id: 11, type: "flashcard" },
    { title: "Set K", id: 12, type: "flashcard" },
    { title: "Set L", id: 13, type: "flashcard" },
    { title: "Set M", id: 14, type: "exercise" },
    { title: "Set N", id: 16, type: "exercise" },
    { title: "Set O", id: 17, type: "exercise" },
    { title: "Set P", id: 18, type: "exercise" },
    { title: "Set Q", id: 19, type: "exercise" },
    { title: "Set R", id: 20, type: "exercise" },
  ];
  const theme = useTheme();
  const [searchQuery, setSearchQuery] = useState("");
  const { data, isLoading, error } = useSets(props.type);
  useEffect(() => {
    if (!data) return;
    //console.log(data);
    setFiltered(data);
  }, [data])
  const [filtered, setFiltered] = useState([]);
  //const [isSearching, setIsSearching] = useState(false);
  const handleSearch = (query) => {
    setSearchQuery(query);
    const filteredItems = data.filter((item) =>
      item.name.toLowerCase().match(query.toLowerCase()),
    );
    setFiltered(filteredItems);
  };
  if(isLoading || error) return <LoadingOverlay visible={isLoading}/>
  return (
    <React.Fragment>
      <Searchbar
        value={searchQuery}
        style={{ elevation: 1, width: responsiveWidth(70) }}
        placeholder={props.searchPlaceholder || "Search"}
        //onTouchStart={() => setIsSearching(true)}
        //onBlur={() => setIsSearching(false)}
        onChangeText={handleSearch}
      />
      {/*isSearching && (*/}
      <MultifunctionalList
        mode={props.mode}
        dataSource={filtered}
        creationOption={props.creationOption}
        type={props.type}
        close={() => {
          /*setIsSearching(false);*/ Keyboard.dismiss();
        }}
      />
      {/*)}*/}
    </React.Fragment>
  );
}