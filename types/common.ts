export type Mode = "edit" | "select";

export const enum NAVIGATION {
  HOME = "Home",
  MANAGE_FRIENDS = "ManageFriends",
  ACHIEVEMENTS = "Achievements",
  LEARNING_ROOM = "LearningRoom",
  WHITEBOARD = "Whiteboard",
  SETTINGS = "Settings",
  LEARNING_PROJECT = "LearningProject",
  LEARNING_PROJECTS = "LearningProjects",
  FLASHCARD_MANAGEMENT = "FlashcardManagement",
  FLASHCARD_GAME = "FlashcardGame",
  EXERCISE_MANAGEMENT = "ExerciseManagement",
  EXERCISE_GAME = "ExerciseGame",
  LINK_MANAGEMENT = "LinkManagement",
  FILES_MANAGEMENT = "FilesManagement",
  CREATEEDIT_PROJECT = "CreateEditProject",
  INVITE_FRIENDS = "InviteFriends",
  DISCOVER = "Discover",
  ACCOUNT = "Account",
}
export const enum ManagementType {
  FLASHCARD = 0,
  EXERCISE = 1,
  FILE = 2,
  LINK = 3,
}
