import { useUpsertMutation } from "@supabase-cache-helpers/postgrest-swr";
import { StatusBar } from "expo-status-bar";
import React, { Fragment, useEffect, useMemo, useState } from "react";
import { Platform, ScrollView, StyleSheet } from "react-native";
import {
  Button,
  Card,
  Divider,
  FAB,
  HelperText,
  IconButton,
  SegmentedButtons,
  Switch,
  Text,
  TextInput,
  useTheme,
} from "react-native-paper";
import { supabase } from "../../supabase";
import {
  useAlerts,
  useDeleteProject,
  useRemoveUserFromLearningProject,
  useSoundSystem1,
  useUsername,
} from "../../utils/hooks";
import LoadingOverlay from "../../components/alerts/LoadingOverlay";
import { Database } from "../../types/supabase";
import { useAuth } from "../../providers/AuthProvider";
import { NAVIGATION } from "../../types/common";
import { View } from "react-native";
import { HeaderBackButton } from "@react-navigation/elements";
export default function CreateEditProject({
  navigation,
  route,
}: {
  navigation: any;
  route: {
    params: {
      edit: Database["public"]["Tables"]["learning_projects"]["Row"] | null;
    };
  };
}) {
  /**
   * edit == null => create new project
   * edit = project objekt
   */
  useSoundSystem1();

  const { edit: project } = route.params;

  const username = useUsername(project?.owner_id ?? null);
  const { success, error: errorAlert, info, confirm } = useAlerts();
  const theme = useTheme();

  const myid = useAuth().user.id;

  useEffect(() => {
    navigation.setOptions({
      title: project === null ? "Create Project" : "Edit Project",
    });
  }, []);

  useEffect(() => {
    navigation.setOptions({
      headerLeft: (props) => (
        <HeaderBackButton
          {...props}
          style={styles.fixHeaderStyles}
          onPress={() => {
            confirm({
              title: "Discard changes?",
              message:
                "All unsaved changes will be lost. Do you want to continue?",
              okText: "Continue",
              okAction: () => navigation.goBack(),
            });
          }}
        />
      ),
    });
  }, [navigation]);
  const { trigger: removeUserFromLearningProject } =
    useRemoveUserFromLearningProject();
  const { trigger: deleteProject } = useDeleteProject();
  const [title, setTitle] = useState(project?.name ?? "");
  const [description, setDescription] = useState(project?.description ?? "");
  const [group, setGroup] = useState(project?.group ?? "");
  const [isPublished, setIsPublished] = useState(
    project?.is_published ?? false,
  );
  const [owner, setOwner] = useState(username.data);
  const [tags, setTags] = useState(project?.tags ?? "");

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

  const { isMutating, trigger: upsert } = useUpsertMutation(
    supabase.from("learning_projects"),
    ["id"],
    "id,name,description,group,is_published,tags",
    {
      onSuccess: () => {
        // success(
        //   `Project ${project === null ? "created" : "saved"}.`,
        //   "Success",
        // );
        success({
          title: `Project ${project === null ? "created" : "saved"}.`,
          message: "You can now invite other users to join your project.",
          okAction: () => navigation.navigate(NAVIGATION.LEARNING_PROJECTS),
        });
      },
      onError: (error) => {
        let err = "";
        switch (error.message) {
          case 'new row for relation "learning_projects" violates check constraint "check_group_format"':
            err =
              "Invalid semester. Please use the format 'Summer XXXX' or 'Winter XX/YY'.";
            break;
          case 'new row for relation "learning_projects" violates check constraint "learning_projects_name_check"':
            err = "Please enter a title between 2 and 99 characters.";
            break;
          default:
            err = error.message;
        }
        errorAlert({
          message: err,
        });
      },
    },
  );

  const save = () => {
    upsert({
      // @ts-expect-error
      id: project?.id,
      name: title,
      description,
      group,
      is_published: isPublished,
      tags,
    });
  };

  return (
    <Fragment>
      <LoadingOverlay visible={isMutating} />
      <ScrollView
        style={{
          flex: 1,
          gap: 8,
          padding: 8,
        }}
      >
        <StatusBar style="auto" />
        {project && project?.owner_id !== myid && (
          <Card
            theme={{
              colors: {
                surface: theme.colors.errorContainer,
                outline: theme.colors.errorContainer,
              },
            }}
            style={{ marginVertical: 10 }}
            mode="outlined"
          >
            <Card.Content>
              <Text>
                You have no permission to edit this project. Please contact the
                owner.
              </Text>
            </Card.Content>
          </Card>
        )}
        {((project && project?.owner_id === myid) || !project) && (
          <>
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
            <Divider style={{ marginTop: 8 }} />
            <TextInput
              style={{ marginTop: 10 }}
              label="Semester"
              value={group}
              onChangeText={(text) => setGroup(text)}
              left={<TextInput.Icon icon="calendar-range" />}
            />
            <SegmentedButtons
              style={{ marginTop: 10 }}
              value={group}
              onValueChange={setGroup}
              buttons={[...currentSemesters, "All"].map((semester: string) => ({
                /* This will break in year 21XX but i don't care tbh. */
                label: semester
                  .replace("Summer", "S")
                  .replace("Winter", "W")
                  .replace("20", ""),
                value: semester,
              }))}
            />
            <HelperText type="info">
              Choose the semester this project is for. Use "All" if it is not
              bound to a specific semester. You can change the years.
            </HelperText>
            <Divider />
            <TextInput
              style={{ marginTop: 10 }}
              label="Tags"
              value={tags}
              onChangeText={(text) => setTags(text)}
              left={<TextInput.Icon icon="tag" />}
            />
            <HelperText type="info">
              Tags will make your project easier to find. Use commas to seperate
              tags.
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
                <TextInput.Icon
                  icon={isPublished ? "lock-open-outline" : "lock"}
                />
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
            <HelperText type={isPublished ? "info" : "info"}>
              {isPublished
                ? "Other users can find and clone this project. They will NOT be able to edit THIS project."
                : "Project is hidden and only project members can see and edit."}
            </HelperText>
            <Divider />
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
                    info({
                      title: "Transfer project",
                      message: "This feature will be added soon.",
                    })
                  }
                  icon="pencil"
                />
              }
            />
            <HelperText type="info">
              Only the owner can edit the project settings.
            </HelperText>
            <Divider />
            <HelperText type="info" style={{ marginBottom: 8 }}>
              You may invite other users to join your project on the learning
              project page.
            </HelperText>
          </>
        )}
        {project && project?.owner_id === myid && (
          <Button
            style={{
              alignSelf: "flex-start",
              marginBottom: 24,
              backgroundColor: theme.colors.errorContainer,
            }}
            mode="elevated"
            onPress={() => {
              confirm({
                icon: "delete",
                title: "Delete project?",
                message:
                  "Deleted projects cannot be restored.\nDo you want to continue?",
                okAction: () => {
                  deleteProject({ id: project.id });
                  navigation.navigate(NAVIGATION.LEARNING_PROJECTS);
                },
              });
            }}
          >
            <Text>Delete project</Text>
          </Button>
        )}
        {!project && <View style={{ marginBottom: 60 }}></View>}
      </ScrollView>
      {project && project?.owner_id !== myid && (
        <Button
          style={{
            alignSelf: "flex-start",
            justifyContent: "flex-end",
            marginBottom: 16,
            marginLeft: 8,
            backgroundColor: theme.colors.errorContainer,
          }}
          mode="elevated"
          onPress={() => {
            confirm({
              icon: "alert-octagon",
              title: "Leave Project?",
              message:
                "You will lose all access to this project \nDo you want to continue?",
              okAction: () => {
                console.log(project);
                removeUserFromLearningProject({
                  learning_project_id: project.id,
                  user_id: myid
                });
                navigation.navigate(NAVIGATION.LEARNING_PROJECTS);
              },
            });
          }}
        >
          <Text>Leave project</Text>
        </Button>
      )}
      {(!project || project?.owner_id === myid) && (
        <FAB
          icon={project === null ? "plus" : "check"}
          color={theme.colors.onPrimary}
          style={{
            position: "absolute",
            margin: 16,
            right: 0,
            bottom: 0,
            backgroundColor: theme.colors.primary,
          }}
          label={!project ? "Create" : "Save"}
          onPress={() => {
            save();
          }}
          disabled={isMutating}
        />
      )}
    </Fragment>
  );
}

const styles = StyleSheet.create({
  fixHeaderStyles: {
    ...Platform.select({
      android: {
        marginLeft: -3,
        marginRight: 29,
      },
    }),
  },
});