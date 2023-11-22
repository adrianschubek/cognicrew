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
  FLASHCARD_EXERCISE_MANAGEMENT = "FlashcardExerciseManagement",
  FLASHCARD_GAME = "FlashcardGame",
  EXERCISE_GAME = "ExerciseGame",
  LINK_MANAGEMENT = "LinkManagement",
  FILES_MANAGEMENT = "FilesManagement",
  CREATEEDIT_PROJECT = "CreateEditProject",
  RATE_PROJECT = "RateProject",
  INVITE_FRIENDS = "InviteFriends",
  DISCOVER = "Discover",
  GUEST_LOBBY = "GuestLobby",
  LOBBY = "Lobby",
  ROOMS_LIST = "RoomsList",
  ACCOUNT = "Account",
  SPLASH_INGAME = "SplashIngame",
}
export const enum ManagementType {
  FLASHCARD = 0,
  EXERCISE = 1,
  FILE = 2,
  LINK = 3,
}
export type orderByPrinciple =
  | "name"
  | "reverse_name"
  | "created_at"
  | "reverse_created_at"
  | "priority"
  | "reverse_priority";
