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
          answer: string
          created_at: string
          exercise: number
          id: number
          is_correct: boolean
        }
        Insert: {
          answer: string
          created_at?: string
          exercise: number
          id?: number
          is_correct: boolean
        }
        Update: {
          answer?: string
          created_at?: string
          exercise?: number
          id?: number
          is_correct?: boolean
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
          id: number
          priority: number | null
          question: string
          set_id: number
        }
        Insert: {
          created_at?: string
          id?: number
          priority?: number | null
          question?: string
          set_id: number
        }
        Update: {
          created_at?: string
          id?: number
          priority?: number | null
          question?: string
          set_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "exercises_set_id_fkey"
            columns: ["set_id"]
            referencedRelation: "sets"
            referencedColumns: ["id"]
          }
        ]
      }
      flashcards: {
        Row: {
          answer: string | null
          created_at: string
          id: number
          priority: number | null
          question: string | null
          set_id: number
        }
        Insert: {
          answer?: string | null
          created_at?: string
          id?: number
          priority?: number | null
          question?: string | null
          set_id: number
        }
        Update: {
          answer?: string | null
          created_at?: string
          id?: number
          priority?: number | null
          question?: string | null
          set_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "flashcards_set_id_fkey"
            columns: ["set_id"]
            referencedRelation: "sets"
            referencedColumns: ["id"]
          }
        ]
      }
      friends: {
        Row: {
          created_at: string
          user_from_id: string
          user_to_id: string
        }
        Insert: {
          created_at?: string
          user_from_id: string
          user_to_id: string
        }
        Update: {
          created_at?: string
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
      learning_projects: {
        Row: {
          created_at: string
          description: string
          group: string
          id: number
          is_published: boolean
          name: string
          owner_id: string | null
          tags: string | null
        }
        Insert: {
          created_at?: string
          description: string
          group: string
          id?: number
          is_published: boolean
          name: string
          owner_id?: string | null
          tags?: string | null
        }
        Update: {
          created_at?: string
          description?: string
          group?: string
          id?: number
          is_published?: boolean
          name?: string
          owner_id?: string | null
          tags?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "learning_projects_owner_id_fkey"
            columns: ["owner_id"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          }
        ]
      }
      links: {
        Row: {
          created_at: string
          description: string | null
          id: number
          learning_project: number | null
          link_url: string | null
          subtitle: string | null
          title: string | null
        }
        Insert: {
          created_at?: string
          description?: string | null
          id?: number
          learning_project?: number | null
          link_url?: string | null
          subtitle?: string | null
          title?: string | null
        }
        Update: {
          created_at?: string
          description?: string | null
          id?: number
          learning_project?: number | null
          link_url?: string | null
          subtitle?: string | null
          title?: string | null
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
      private_room_states: {
        Row: {
          created_at: string
          data: Json | null
          room_id: string
        }
        Insert: {
          created_at?: string
          data?: Json | null
          room_id: string
        }
        Update: {
          created_at?: string
          data?: Json | null
          room_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "private_room_states_room_id_fkey"
            columns: ["room_id"]
            referencedRelation: "rooms"
            referencedColumns: ["id"]
          }
        ]
      }
      profiles: {
        Row: {
          id: string
          room_id: string | null
          username: string
        }
        Insert: {
          id: string
          room_id?: string | null
          username: string
        }
        Update: {
          id?: string
          room_id?: string | null
          username?: string
        }
        Relationships: [
          {
            foreignKeyName: "profiles_id_fkey"
            columns: ["id"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "profiles_room_id_fkey"
            columns: ["room_id"]
            referencedRelation: "rooms"
            referencedColumns: ["id"]
          }
        ]
      }
      project_ratings: {
        Row: {
          created_at: string
          project_id: number
          rating: number
          user_id: string
        }
        Insert: {
          created_at?: string
          project_id?: number
          rating: number
          user_id: string
        }
        Update: {
          created_at?: string
          project_id?: number
          rating?: number
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "project_ratings_project_id_fkey"
            columns: ["project_id"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "project_ratings_user_id_fkey"
            columns: ["user_id"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          }
        ]
      }
      public_room_states: {
        Row: {
          created_at: string
          data: Json
          room_id: string
        }
        Insert: {
          created_at?: string
          data: Json
          room_id: string
        }
        Update: {
          created_at?: string
          data?: Json
          room_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "public_room_states_room_id_fkey"
            columns: ["room_id"]
            referencedRelation: "rooms"
            referencedColumns: ["id"]
          }
        ]
      }
      rooms: {
        Row: {
          code: number | null
          created_at: string
          host: string
          id: string
          is_ingame: boolean
          is_private: boolean
          max_size: number
          name: string | null
          project_id: number | null
          secret_key: string
          share_code: number | null
        }
        Insert: {
          code?: number | null
          created_at?: string
          host: string
          id?: string
          is_ingame?: boolean
          is_private?: boolean
          max_size?: number
          name?: string | null
          project_id?: number | null
          secret_key?: string
          share_code?: number | null
        }
        Update: {
          code?: number | null
          created_at?: string
          host?: string
          id?: string
          is_ingame?: boolean
          is_private?: boolean
          max_size?: number
          name?: string | null
          project_id?: number | null
          secret_key?: string
          share_code?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "rooms_host_fkey"
            columns: ["host"]
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "rooms_project_id_fkey"
            columns: ["project_id"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          }
        ]
      }
      sets: {
        Row: {
          created_at: string
          id: number
          name: string
          project_id: number
          type: number
        }
        Insert: {
          created_at?: string
          id?: number
          name: string
          project_id: number
          type: number
        }
        Update: {
          created_at?: string
          id?: number
          name?: string
          project_id?: number
          type?: number
        }
        Relationships: [
          {
            foreignKeyName: "sets_project_id_fkey"
            columns: ["project_id"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          }
        ]
      }
      user_achievements: {
        Row: {
          achievement_id: number
          created_at: string
          user_id: string
        }
        Insert: {
          achievement_id: number
          created_at?: string
          user_id: string
        }
        Update: {
          achievement_id?: number
          created_at?: string
          user_id?: string
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
      user_content: {
        Row: {
          created_at: string
          data: Json | null
          id: number
          learning_project_id: number | null
          name: string | null
          type: string | null
        }
        Insert: {
          created_at?: string
          data?: Json | null
          id?: number
          learning_project_id?: number | null
          name?: string | null
          type?: string | null
        }
        Update: {
          created_at?: string
          data?: Json | null
          id?: number
          learning_project_id?: number | null
          name?: string | null
          type?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_content_learning_project_id_fkey"
            columns: ["learning_project_id"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          }
        ]
      }
      user_learning_projects: {
        Row: {
          created_at: string
          learning_project_id: number
          user_id: string
        }
        Insert: {
          created_at?: string
          learning_project_id: number
          user_id: string
        }
        Update: {
          created_at?: string
          learning_project_id?: number
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_learning_projects_learning_project_id_fkey"
            columns: ["learning_project_id"]
            referencedRelation: "learning_projects"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_learning_projects_user_id_fkey"
            columns: ["user_id"]
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
      create_room: {
        Args: {
          p_project_id: number
          p_code: number
          p_name: string
          p_share_code: number
        }
        Returns: Record<string, unknown>
      }
      delete_friend: {
        Args: {
          p_other_userid: string
        }
        Returns: boolean
      }
      delete_room: {
        Args: {
          p_room_id: string
        }
        Returns: undefined
      }
      get_usernames: {
        Args: {
          user_ids: string[]
        }
        Returns: unknown
      }
      getUsername: {
        Args: {
          user_id: string
        }
        Returns: string
      }
      invite_user_to_project: {
        Args: {
          p_project_id: number
          p_other_user_id: string
        }
        Returns: undefined
      }
      join_room: {
        Args: {
          p_room_id: number
          p_room_code: number
        }
        Returns: Record<string, unknown>
      }
      list_friends: {
        Args: Record<PropertyKey, never>
        Returns: {
          created_at: string
          user_from_id: string
          user_to_id: string
        }[]
      }
      list_rooms: {
        Args: Record<PropertyKey, never>
        Returns: {
          id: string
          name: string
          created_at: string
          protected: boolean
          host: string
        }[]
      }
      quick_join_room: {
        Args: {
          p_share_code: number
        }
        Returns: Record<string, unknown>
      }
      remove_user_from_project: {
        Args: {
          p_project_id: number
          p_other_user_id: string
        }
        Returns: undefined
      }
      search_user: {
        Args: {
          search_query: string
        }
        Returns: Record<string, unknown>
      }
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
