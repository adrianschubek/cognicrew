import { useEffect, useRef } from "react";
import { supabase } from "../../../supabase";
import { usePresenceStore } from "../../../stores/PresenceStore";
import { useAuth } from "../../../providers/AuthProvider";
import { useUsername } from "../../../utils/hooks";

export default function LivePresenceFunctionality(props: {
  listItemId: any;
  isEditing: boolean;
}) {
  const { listItemId, isEditing } = props;
  const { user } = useAuth();
  const username = useUsername();
  const updateEditedBy = usePresenceStore(
    (state) => state.updateCardQuizEditing,
  );

  const realtime = useRef(
    supabase.channel(`cardquiz:edit:${listItemId}`, {
      config: { presence: { key: user.id } },
    }),
  );

  useEffect(() => {
    realtime.current
      .on("presence", { event: "sync" }, () => {
        const newState = realtime.current.presenceState();
        updateEditedBy(
          listItemId,
          Object.values(newState)
            // @ts-expect-error user_name not defined
            .filter((u) => u[0].user_name !== username.data)
            .flatMap((e: any) => e[0].user_name as string),
        );
      })
      .subscribe();
  }, []);
  useEffect(() => {
    if (isEditing) startEditing();
    else endEditing();
  }, [isEditing]);
  
  const startEditing = async () => {
    const presenceTrackStatus = await realtime.current.track({
      user_name: username.data,
    });
    // console.log(presenceTrackStatus);
  };

  const endEditing = async () => {
    const presenceTrackStatus = await realtime.current.untrack();
    // console.log(presenceTrackStatus);
  };
  return null;
}
