export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          operationName?: string
          query?: string
          variables?: Json
          extensions?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  pgbouncer: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      get_auth: {
        Args: {
          p_usename: string
        }
        Returns: {
          username: string
          password: string
        }[]
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      achievements: {
        Row: {
          created_at: string
          description: string | null
          icon_name: string | null
          id: number
          name: string | null
        }
        Insert: {
          created_at?: string
          description?: string | null
          icon_name?: string | null
          id?: number
          name?: string | null
        }
        Update: {
          created_at?: string
          description?: string | null
          icon_name?: string | null
          id?: number
          name?: string | null
        }
        Relationships: []
      }
      answers_exercises: {
        Row: {
          answer: string | null
          correct_answer: boolean | null
          created_at: string
          exercise: number | null
          id: number
        }
        Insert: {
          answer?: string | null
          correct_answer?: boolean | null
          created_at?: string
          exercise?: number | null
          id?: number
        }
        Update: {
          answer?: string | null
          correct_answer?: boolean | null
          created_at?: string
          exercise?: number | null
          id?: number
        }
        Relationships: [
          {
            foreignKeyName: "answers_exercises_exercise_fkey"
            columns: ["exercise"]
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          }
        ]
      }
      exercises: {
        Row: {
          created_at: string
          group: string | null
          id: number
          learning_project: number | null
          priority: number | null
          question: string | null
        }
        Insert: {
          created_at?: string
          group?: string | null
          id?: number
          learning_project?: number | null
          priority?: number | null
          question?: string | null
        }
        Update: {
          created_at?: string
          group?: string | null
          id?: number
          learning_project?: number | null
          priority?: number | null
          question?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "exercises_learning_project_fkey"
            columns: ["learning_project"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          }
        ]
      }
      files: {
        Row: {
          created_at: string
          data: Json | null
          id: number
          learning_project: number | null
          name: string | null
        }
        Insert: {
          created_at?: string
          data?: Json | null
          id?: number
          learning_project?: number | null
          name?: string | null
        }
        Update: {
          created_at?: string
          data?: Json | null
          id?: number
          learning_project?: number | null
          name?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "files_learning_project_fkey"
            columns: ["learning_project"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          }
        ]
      }
      flashcards: {
        Row: {
          answer: string | null
          created_at: string
          group: string | null
          id: number
          learning_project: number | null
          priority: number | null
          question: string | null
        }
        Insert: {
          answer?: string | null
          created_at?: string
          group?: string | null
          id?: number
          learning_project?: number | null
          priority?: number | null
          question?: string | null
        }
        Update: {
          answer?: string | null
          created_at?: string
          group?: string | null
          id?: number
          learning_project?: number | null
          priority?: number | null
          question?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "flashcards_learning_project_fkey"
            columns: ["learning_project"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          }
        ]
      }
      friends: {
        Row: {
          created_at: string
          is_pending: boolean | null
          user_from_id: string
          user_to_id: string
        }
        Insert: {
          created_at?: string
          is_pending?: boolean | null
          user_from_id: string
          user_to_id: string
        }
        Update: {
          created_at?: string
          is_pending?: boolean | null
          user_from_id?: string
          user_to_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "friends_user_from_id_fkey"
            columns: ["user_from_id"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "friends_user_to_id_fkey"
            columns: ["user_to_id"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          }
        ]
      }
      groups_learning_projects: {
        Row: {
          created_at: string
          id: number
          name: string | null
        }
        Insert: {
          created_at?: string
          id?: number
          name?: string | null
        }
        Update: {
          created_at?: string
          id?: number
          name?: string | null
        }
        Relationships: []
      }
      learning_projects: {
        Row: {
          created_at: string
          description: string | null
          id: number
          name: string | null
          rating: number | null
        }
        Insert: {
          created_at?: string
          description?: string | null
          id?: number
          name?: string | null
          rating?: number | null
        }
        Update: {
          created_at?: string
          description?: string | null
          id?: number
          name?: string | null
          rating?: number | null
        }
        Relationships: []
      }
      links: {
        Row: {
          created_at: string
          id: number
          learning_project: number | null
          link_url: string | null
        }
        Insert: {
          created_at?: string
          id?: number
          learning_project?: number | null
          link_url?: string | null
        }
        Update: {
          created_at?: string
          id?: number
          learning_project?: number | null
          link_url?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "links_learning_project_fkey"
            columns: ["learning_project"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          }
        ]
      }
      profiles: {
        Row: {
          id: string
          room: number | null
          username: string | null
        }
        Insert: {
          id: string
          room?: number | null
          username?: string | null
        }
        Update: {
          id?: string
          room?: number | null
          username?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "profiles_id_fkey"
            columns: ["id"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "profiles_room_fkey"
            columns: ["room"]
            referencedRelation: "rooms"
            referencedColumns: ["id"]
          }
        ]
      }
      rooms: {
        Row: {
          created_at: string
          id: number
          name: string | null
        }
        Insert: {
          created_at?: string
          id?: number
          name?: string | null
        }
        Update: {
          created_at?: string
          id?: number
          name?: string | null
        }
        Relationships: []
      }
      user_achievements: {
        Row: {
          achievement_id: number
          created_at: string
          user_id: string | null
        }
        Insert: {
          achievement_id: number
          created_at?: string
          user_id?: string | null
        }
        Update: {
          achievement_id?: number
          created_at?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_achievements_achievement_id_fkey"
            columns: ["achievement_id"]
            referencedRelation: "achievements"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_achievements_user_id_fkey"
            columns: ["user_id"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          }
        ]
      }
      user_has_learning_projects: {
        Row: {
          created_at: string
          group: string | null
          id: number
          is_owner: boolean | null
          learning_project: number | null
          user: string | null
        }
        Insert: {
          created_at?: string
          group?: string | null
          id?: number
          is_owner?: boolean | null
          learning_project?: number | null
          user?: string | null
        }
        Update: {
          created_at?: string
          group?: string | null
          id?: number
          is_owner?: boolean | null
          learning_project?: number | null
          user?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_has_learning_projects_learning_project_fkey"
            columns: ["learning_project"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_has_learning_projects_user_fkey"
            columns: ["user"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          }
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  storage: {
    Tables: {
      buckets: {
        Row: {
          allowed_mime_types: string[] | null
          avif_autodetection: boolean | null
          created_at: string | null
          file_size_limit: number | null
          id: string
          name: string
          owner: string | null
          public: boolean | null
          updated_at: string | null
        }
        Insert: {
          allowed_mime_types?: string[] | null
          avif_autodetection?: boolean | null
          created_at?: string | null
          file_size_limit?: number | null
          id: string
          name: string
          owner?: string | null
          public?: boolean | null
          updated_at?: string | null
        }
        Update: {
          allowed_mime_types?: string[] | null
          avif_autodetection?: boolean | null
          created_at?: string | null
          file_size_limit?: number | null
          id?: string
          name?: string
          owner?: string | null
          public?: boolean | null
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "buckets_owner_fkey"
            columns: ["owner"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          }
        ]
      }
      migrations: {
        Row: {
          executed_at: string | null
          hash: string
          id: number
          name: string
        }
        Insert: {
          executed_at?: string | null
          hash: string
          id: number
          name: string
        }
        Update: {
          executed_at?: string | null
          hash?: string
          id?: number
          name?: string
        }
        Relationships: []
      }
      objects: {
        Row: {
          bucket_id: string | null
          created_at: string | null
          id: string
          last_accessed_at: string | null
          metadata: Json | null
          name: string | null
          owner: string | null
          path_tokens: string[] | null
          updated_at: string | null
          version: string | null
        }
        Insert: {
          bucket_id?: string | null
          created_at?: string | null
          id?: string
          last_accessed_at?: string | null
          metadata?: Json | null
          name?: string | null
          owner?: string | null
          path_tokens?: string[] | null
          updated_at?: string | null
          version?: string | null
        }
        Update: {
          bucket_id?: string | null
          created_at?: string | null
          id?: string
          last_accessed_at?: string | null
          metadata?: Json | null
          name?: string | null
          owner?: string | null
          path_tokens?: string[] | null
          updated_at?: string | null
          version?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "objects_bucketId_fkey"
            columns: ["bucket_id"]
            referencedRelation: "buckets"
            referencedColumns: ["id"]
          }
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      can_insert_object: {
        Args: {
          bucketid: string
          name: string
          owner: string
          metadata: Json
        }
        Returns: undefined
      }
      extension: {
        Args: {
          name: string
        }
        Returns: string
      }
      filename: {
        Args: {
          name: string
        }
        Returns: string
      }
      foldername: {
        Args: {
          name: string
        }
        Returns: unknown
      }
      get_size_by_bucket: {
        Args: Record<PropertyKey, never>
        Returns: {
          size: number
          bucket_id: string
        }[]
      }
      search: {
        Args: {
          prefix: string
          bucketname: string
          limits?: number
          levels?: number
          offsets?: number
          search?: string
          sortcolumn?: string
          sortorder?: string
        }
        Returns: {
          name: string
          id: string
          updated_at: string
          created_at: string
          last_accessed_at: string
          metadata: Json
        }[]
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}
