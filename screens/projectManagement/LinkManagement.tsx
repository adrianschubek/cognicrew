import * as React from "react";
import {
  View,
  ScrollView,
  StyleSheet,
  StatusBar,
  Keyboard,
} from "react-native";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";
import LinkCards from "../../components/learningProject/LinkCards";
import {
  useAlerts,
  useLinks,
  useSoundSystem1,
  useUpsertLink,
} from "../../utils/hooks";
import { useEffect, useState } from "react";
import { useProjectStore } from "../../stores/ProjectStore";
import { supabase } from "../../supabase";
import { FAB, Text } from "react-native-paper";

export default function LinkManagement() {
  const { confirm } = useAlerts();
  useSoundSystem1();

  function ensureHttpURL(url: string) {
    return url.match(/^(https?:\/\/)/i)
      ? url.slice(0, 5).toLowerCase() + url.slice(5)
      : `http://${url}`;
  }
  const projectId = useProjectStore((state) => state.projectId);
  const { data, isLoading, error, mutate } = useLinks(projectId);
  const [noLinkCardAvailable, setNoLinkCardAvailable] =
    useState<boolean>(false);
  const { isMutating, trigger: upsertLink } = useUpsertLink();
  const [FABOpen, setFABOpen] = useState({ open: false });
  const onStateChange = ({ open }) => setFABOpen({ open });
  const { open } = FABOpen;

  useEffect(() => {
    if (!data) return;
    setLinkItems(data);
    setNoLinkCardAvailable(data.length === 0);
  }, [data]);

  useEffect(() => {
    const realtimeLinks = supabase
      .channel("sets_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "links" },
        (payload) => {
          mutate();
        },
      )
      .subscribe();
  }, []);

  const [linkItems, setLinkItems] = useState([]);
  const handleEdit = (link) => {
    openAddEditLinkDialog(link);
  };

  const addOrEdit = (id, title, subtitle, description, url) => {
    upsertLink({
      // @ts-expect-error
      learning_project: projectId,
      id: id ? id : undefined,
      title: title,
      subtitle: subtitle,
      description: description,
      link_url: url,
    });
    Keyboard.dismiss();
  };
  function openAddEditLinkDialog(link?: any) {
    link = link || null;
    confirm({
      icon: link ? "link" : "link-plus", //"link-edit" isn't working ;/
      title: link ? "Edit link" : "Add new link",
      okText: "Save",
      okAction: async (vars) => {
        addOrEdit(link?.id, vars[0], vars[1], vars[2], ensureHttpURL(vars[3]));
      },
      fields: [
        {
          label: "Title:",
          defaultValue: link?.title ?? "",
          type: "text",
          icon: "format-text",
          required: true,
        },
        {
          label: "Subtitle:",
          defaultValue: link?.subtitle ?? "",
          type: "text",
          icon: "subtitles",
          required: false,
        },
        {
          label: "Description:",
          defaultValue: link?.description ?? "",
          type: "text",
          icon: "text-box",
          required: false,
        },
        {
          label: "URL:",
          defaultValue: link?.link_url ?? "",
          type: "text",
          icon: "link",
          required: true,
        },
      ],
    });
  }
  return (
    <>
      <StatusBar />
      {noLinkCardAvailable && (
        <View
          style={{
            flex: 1,
            justifyContent: "center",
            alignItems: "center",
            marginHorizontal: 16,
          }}
        >
          <Text variant="titleMedium" style={{ textAlign: "center" }}>
            Welcome to your link management space {"\n"}
            Currently you don't have any links {"\n"}
            {"\n"}Click on the plus button to create one!
          </Text>
        </View>
      )}
      <View style={[noLinkCardAvailable ? { flex: 0 } : styles.container]}>
        <ScrollView>
          <LinkCards links={linkItems} onEdit={handleEdit} />
          {/*View margin for FAB.Group when scrolling down */}
          <View style={{ marginBottom: 78 }}></View>
        </ScrollView>
      </View>

      <FAB.Group
        open={open}
        visible
        icon={open ? "card-text" : "plus"}
        actions={[
          {
            icon: "plus",
            label: "Add new " + "link",
            onPress: openAddEditLinkDialog,
          },
        ]}
        onStateChange={onStateChange}
      />
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(100),
    height: responsiveHeight(100),
    flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
});
