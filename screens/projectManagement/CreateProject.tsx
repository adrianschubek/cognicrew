import { useUpsertMutation } from "@supabase-cache-helpers/postgrest-swr";
import { StatusBar } from "expo-status-bar";
import React, { useMemo, useState } from "react";
import { ScrollView } from "react-native";
import {
  Divider,
  FAB,
  HelperText,
  SegmentedButtons,
  Switch,
  Text,
  TextInput,
} from "react-native-paper";
import { supabase } from "../../supabase";
import { useAlerts, useUsername } from "../../utils/hooks";

export default function CreateProject({ navigation, route }) {
  /**
   * edit == null => create new project
   * edit == number => edit project
   * besser: edit = project objekt
   */
  const { edit } = route.params;

  const username = useUsername();

  navigation.setOptions({
    title: edit === null ? "Create Project" : "Edit Project",
  });

  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [group, setGroup] = useState("");
  const [isPublished, setIsPublished] = useState(false);
  const [owner, setOwner] = useState(username.data ?? "???");

  const currentSemesters = useMemo(() => {
    // Create an array to hold the term labels
    const labels = [];

    // Get the current date
    const currentDate = new Date();
    const currentYear = currentDate.getFullYear();
    const currentMonth = currentDate.getMonth() + 1; // Months are 0-based, so add 1.

    // Determine the current semester
    let currentSemester = "";
    if (currentMonth >= 1 && currentMonth <= 4) {
      currentSemester = "Winter";
    } else if (currentMonth >= 5 && currentMonth <= 8) {
      currentSemester = "Summer";
    } else if (currentMonth >= 9 && currentMonth <= 12) {
      currentSemester = "Winter";
    }

    // Calculate labels for previous, current, and next semesters
    const prevYear =
      currentSemester === "Winter" ? currentYear - 1 : currentYear;
    const nextYear =
      currentSemester === "Summer" ? currentYear + 1 : currentYear;

    const prevSemester =
      currentSemester === "Winter"
        ? `Summer ${prevYear}`
        : `Winter ${prevYear - 1}/${prevYear % 100}`;
    labels.push(prevSemester);

    const currentLabel =
      currentSemester === "Winter"
        ? `Winter ${currentYear}/${(currentYear + 1) % 100}`
        : `Summer ${currentYear}`;
    labels.push(currentLabel);

    const nextSemester =
      currentSemester === "Winter"
        ? `Summer ${currentYear}`
        : `Winter ${currentYear % 100}/${nextYear % 100}`;
    labels.push(nextSemester);

    return labels;
  }, []);

  const { success, error: errorAlert, info, okcancel } = useAlerts();

  const {
    isMutating,
    data,
    trigger: upsert,
  } = useUpsertMutation(
    supabase.from("learning_projects"),
    ["id"],
    "name,description,group",
    {
      onSuccess: () => {
        success(`Project ${edit === null ? "created" : "saved"}.`, "Success");
      },
      onError: (error) => {
        errorAlert(error.message, "Error");
      },
    },
  );

  const save = () => {
    upsert({
      // @ts-ignore
      name: title,
      description,
      group,
    });
  };

  return (
    <>
      <ScrollView
        style={{
          flex: 1,
          gap: 8,
          padding: 8,
        }}
      >
        <StatusBar style="auto" />
        <TextInput
          label="Title"
          value={title}
          onChangeText={(text) => setTitle(text)}
          left={<TextInput.Icon icon="format-text" />}
        />
        <HelperText type="info">
          Title should include your course name.
        </HelperText>
        <Divider />
        <TextInput
          style={{ marginTop: 10 }}
          label="Description"
          value={description}
          numberOfLines={4}
          multiline
          onChangeText={(text) => setDescription(text)}
          left={<TextInput.Icon icon="text-box-outline" />}
        />
        <Divider />
        <TextInput
          style={{ marginTop: 10 }}
          label="Semester"
          value={group}
          onChangeText={(text) => setGroup(text)}
          left={<TextInput.Icon icon="tag" />}
        />
        <SegmentedButtons
          style={{ marginTop: 10 }}
          value={group}
          onValueChange={setGroup}
          buttons={currentSemesters.map((semester: string) => ({
            label: semester.replace("Summer", "S").replace("Winter", "W"),
            value: semester,
          }))}
        />
        <Divider />
        <TextInput
          style={{ marginTop: 10 }}
          label="Tags"
          value={group}
          onChangeText={(text) => setGroup(text)}
          left={<TextInput.Icon icon="tag" />}
        />
        <HelperText type="info">
          Tags can be used to filter projects on the feed and make it
          discoverable for other users.
        </HelperText>
        <Divider />
        <TextInput
          style={{ marginTop: 10 }}
          theme={{ roundness: 10 }}
          // mode="outlined"
          label="Visibility"
          value={isPublished ? "Public" : "Private"}
          editable={false}
          left={
            <TextInput.Icon icon={isPublished ? "lock-open-outline" : "lock"} />
          }
          right={
            <TextInput.Icon
              icon={() => (
                <Switch
                  value={isPublished}
                  onValueChange={() => setIsPublished((old) => !old)}
                />
              )}
            />
          }
        />
        <TextInput
          style={{ marginTop: 10 }}
          // mode="outlined"
          label="Owner"
          value={owner}
          editable={false}
          left={<TextInput.Icon icon="account" />}
          right={
            <TextInput.Icon
              /* TODO */
              onPress={() =>
                info(
                  "You cannot change the owner of a project yet.",
                  "Transfer project",
                )
              }
              icon="pencil"
            />
          }
        />
      </ScrollView>
      <FAB
        icon={edit === null ? "plus" : "check"}
        style={{
          position: "absolute",
          margin: 16,
          right: 0,
          bottom: 0,
        }}
        label={edit === null ? "Create" : "Save"}
        onPress={save}
        disabled={isMutating}
      />
    </>
  );
}
