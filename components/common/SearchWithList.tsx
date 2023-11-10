import { Button, Divider, List, Searchbar, useTheme } from "react-native-paper";
import { Keyboard } from "react-native";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { ManagementType, Mode } from "../../types/common";
import React, { useEffect, useState } from "react";
import MultifunctionalList from "./MultifunctionalList";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { useSets } from "../../utils/hooks";
import { get } from "cypress/types/lodash";

export default function SearchWithList(props: {
  type: ManagementType;
  searchPlaceholder?: string;
  //creationOption decides wether a new entry can be created within the set selection
  creationOption?: boolean;
  mode?: Mode;
  sendSetId?: any;
  [name: string]: any;
}) {
  const theme = useTheme();
  const [searchQuery, setSearchQuery] = useState("");
  const { data, isLoading, error } = useSets(props.type);
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
  };
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
        sendSetId={getSetId}
        close={() => {
          /*setIsSearching(false);*/ Keyboard.dismiss();
        }}
      />
      {/*)}*/}
    </React.Fragment>
  );
}
