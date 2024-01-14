import { useUpsertMutation } from "@supabase-cache-helpers/postgrest-swr";
import { StatusBar } from "expo-status-bar";
import React, { Fragment, useEffect, useRef, useState } from "react";
import { Platform, ScrollView, StyleSheet } from "react-native";
import {
  Button,
  Card,
  Divider,
  FAB,
  HelperText,
  Switch,
  Text,
  TextInput,
  useTheme,
} from "react-native-paper";
import { supabase } from "../../supabase";
import { useAlerts } from "react-native-paper-fastalerts";
import {
  useDeleteProject,
  useRemoveUserFromLearningProject,
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

  const { edit: project } = route.params;
  const showDiscardPopUp = useRef<boolean>(true);
  const username = useUsername(project?.owner_id ?? null);
  const { success, error: errorAlert, info, confirm } = useAlerts();
  const theme = useTheme();

  const myId = useAuth().user.id;

  useEffect(() => {
    navigation.setOptions({
      title: project === null ? "Create Project" : "Edit Project",
    });
  }, []);

  useEffect(() => {
    navigation.setOptions({
      gestureEnabled: false,
      headerLeft: (props) => (
        <HeaderBackButton
          {...props}
          style={styles.fixHeaderStyles}
          onPress={() => {
            if (project?.owner_id !== myId && project !== null) {
              showDiscardPopUp.current = false;
            }
            navigation.goBack();
          }}
        />
      ),
    });
    navigation.addListener("beforeRemove", (e) => {
      // Prevent default behavior of leaving the screen
      e.preventDefault();

      if (showDiscardPopUp.current) {
        confirm({
          key: "discard",
          title: "Discard changes?",
          message:
            "You may have unsaved changes. Are you sure to discard them?",
          okAction: () => navigation.dispatch(e.data.action),
        });
      } else {
        navigation.dispatch(e.data.action);
      }
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

  const { isMutating, trigger: upsert } = useUpsertMutation(
    supabase.from("learning_projects"),
    ["id"],
    "id,name,description,group,is_published,tags",
    {
      onSuccess: () => {
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
              "Invalid semester. Please use the format 'Summer XXXX' or 'Winter XXXX/YY'.";
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
        {project && project?.owner_id !== myId && (
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
        {((project && project?.owner_id === myId) || !project) && (
          <>
            <TextInput
              testID="input-project-title"
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
              testID="input-project-description"
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
              editable={false}
              left={<TextInput.Icon icon="calendar-range" />}
              right={
                <TextInput.Icon
                  testID="input-project-semester"
                  onPress={() =>
                    confirm({
                      title: "Select semester",
                      icon: "calendar-range",
                      okAction(values) {
                        const year = values[0];
                        const term = values[1];
                        setGroup(
                          `${term} ${
                            term === "Winter"
                              ? `${year}/${(+year + 1).toString().substring(2)}`
                              : year
                          }`,
                        );
                      },
                      fields: [
                        {
                          label: "Year",
                          type: "number",
                          defaultValue: `${new Date().getFullYear()}`,
                          required: true,
                        },
                        {
                          label: "Semester",
                          type: "radio",
                          data: [
                            { key: "Winter term", value: "Winter" },
                            { key: "Summer term", value: "Summer" },
                          ],
                          required: true,
                        },
                        {
                          type: "button",
                          label: "Multi-term",
                          action() {
                            setGroup("All");
                          },
                        },
                      ],
                    })
                  }
                  icon="pencil"
                />
              }
            />
            <HelperText type="info">
              Choose the semester this project is for. Use "All" if it is not
              bound to a specific semester. You can change the years.
            </HelperText>
            <Divider />
            <TextInput
              testID="input-project-tags"
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
                      testID="input-project-visibility"
                      value={isPublished}
                      onValueChange={() => setIsPublished((old) => !old)}
                    />
                  )}
                />
              }
            />
            <HelperText type={"info"}>
              {isPublished
                ? "Other users can find and clone this project. They will NOT be able to edit THIS project."
                : "Project is hidden and only project members can access it."}
            </HelperText>
            <Divider />
          </>
        )}
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
              onPress={() => {
                showDiscardPopUp.current = false;
                confirm({
                  title: "Change owner",
                  message:
                    "Transfer this project to another user. You may loose access to this project.\nThis action cannot be undone.",
                  icon: "account-convert",
                  okText: "Transfer project",
                  async okAction(values) {
                    const newOwner = values[0];
                    let { error } = await supabase.rpc("transfer_project", {
                      p_owner_name: newOwner,
                      p_project_id: project?.id,
                    });
                    if (error) return error.message;
                    else {
                      setOwner(newOwner);
                      success({
                        title: "Project transferred",
                        message: `Project was successfully transferred to ${newOwner}.`,
                      });
                    }
                  },
                  fields: [
                    {
                      label: "Username",
                      placeholder: owner,
                      type: "text",
                      required: true,
                      helperText: "Enter the username of the new owner.",
                    },
                  ],
                });
              }}
              icon="pencil"
            />
          }
        />
        <HelperText type="info">
          Only the owner can edit the project settings.
        </HelperText>

        {project && project?.owner_id === myId && (
          <>
            <Divider />
            <HelperText type="info">
              You may invite other users to join your project on the learning
              project page.
            </HelperText>
            <Button
              testID="delete-project-button"
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
                    showDiscardPopUp.current = false;
                    deleteProject({ id: project.id });
                    navigation.navigate(NAVIGATION.LEARNING_PROJECTS);
                  },
                });
              }}
            >
              <Text>Delete project</Text>
            </Button>
          </>
        )}
        {!project && <View style={{ marginBottom: 60 }}></View>}
      </ScrollView>
      {project && project?.owner_id !== myId && (
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
                showDiscardPopUp.current = false;
                removeUserFromLearningProject({
                  learning_project_id: project.id,
                  user_id: myId,
                });
                navigation.navigate(NAVIGATION.LEARNING_PROJECTS);
              },
            });
          }}
        >
          <Text>Leave project</Text>
        </Button>
      )}
      {(!project || project?.owner_id === myId) && (
        <FAB
          testID="create-project-button"
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
            showDiscardPopUp.current = false;
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
