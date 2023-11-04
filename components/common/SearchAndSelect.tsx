import { List, Searchbar, useTheme } from "react-native-paper";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { ManagementType } from "../../types/commonTypes";
import React, { useState } from "react";
import SearchDropDown from "./SearchDropDown";

export default function SearchAndSelect(props: { type: ManagementType }) {
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
    { title: "Set N", id: 15, type: "exercise" },
  ];
  const theme = useTheme();
  const [dataSource] = useState(Items);
  const [filtered, setFiltered] = useState(dataSource);
  const [searchQuery, setSearchQuery] = React.useState("");
  const [isSearching, setIsSearching] = useState(false);
  const onSearch = (text) => {
    if (text) {
      setIsSearching(true);
      const temp = text.toLowerCase();
      const tempList = dataSource.filter((item) => {
        if (item.title.match(temp)) return item;
      });
      setFiltered(tempList);
    } else setIsSearching(false);
    setFiltered(dataSource);
  };

  return (
    <React.Fragment>
      {/* 
      <List.Section>
        <List.Accordion
          title="add to learning Set:"
          titleNumberOfLines={4}
          style={{
            width: responsiveWidth(70),
            backgroundColor: theme.colors.secondaryContainer,
          }}
        >
          {Items
            .filter((learningSet) => learningSet.type === props.type)
            .map((learningSet) => (
              <List.Item title={learningSet.title} />
            ))}
        </List.Accordion>
      </List.Section>
      */}
      <Searchbar
        value={searchQuery}
        style={{ elevation: 1 }}
        placeholder="Search"
        onChangeText={() => {
          onSearch;
          setSearchQuery(searchQuery);
        }}
        icon="folder"
      />
      {isSearching && <SearchDropDown dataSource={filtered} />}
    </React.Fragment>
  );
}
