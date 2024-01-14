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
  SEARCH_GLOBAL_PROJECTS = "SearchProjects",
  GUEST_LOBBY = "GuestLobby",
  LOBBY = "Lobby",
  ROOMS_LIST = "RoomsList",
  ACCOUNT = "Account",
  SPLASH_INGAME = "SplashIngame",
  END_RESULTS = "EndResults",
  PROJECT_STATISTICS = "ProjectStatistics",
  GLOBAL_STATISTICS = "GlobalStatistics",
}
export const enum ManagementType {
  FLASHCARD = 0,
  EXERCISE = 1,
  FILE = 2,
  LINK = 3,
  BOARD = 4,
}
export type orderByPrinciple =
  | "title"
  | "reverse_title"
  | "name"
  | "reverse_name"
  | "created_at"
  | "reverse_created_at"
  | "priority"
  | "reverse_priority";

  export type PathType = {
    path: string[];
    color: string;
    stroke: number;
    size: number;
    type: "path";
  };
  
  export type TextType = {
    x: number;
    y: number;
    text: string;
    color: string;
    type: "text";
  };
  
  export type Action = PathType | TextType;