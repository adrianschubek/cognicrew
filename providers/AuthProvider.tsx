import {
  useState,
  useEffect,
  createContext,
  PropsWithChildren,
  useContext,
} from "react";
import { Session, User } from "@supabase/supabase-js";
import { supabase } from "../supabase";

type AuthProps = {
  user: User | null;
  session: Session | null;
  initialized?: boolean;
  signOut?: () => void;
};

export const AuthContext = createContext<Partial<AuthProps>>({});

// Custom hook to read the context values
export function useAuth() {
  return useContext(AuthContext);
}

export const AuthProvider = ({ children }: PropsWithChildren) => {
  const [user, setUser] = useState<User | null>();
  const [session, setSession] = useState<Session | null>(null);
  // const [initialized, setInitialized] = useState<boolean>(false);

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session)
      setUser(session ? session.user : null);
    })

    // Listen for changes to authentication state
    const { data } = supabase.auth.onAuthStateChange(async (event, session) => {
      console.log("Supabase auth event:", event);
      console.log("Supabase auth session:", session);
      
      setSession(session);
      setUser(session ? session.user : null);
      // setInitialized(true);
    });
    return () => {
      data.subscription.unsubscribe();
    };
  }, []);

  const value = {
    user,
    session,
    // initialized,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};
