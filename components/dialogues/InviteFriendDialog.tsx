import React from "react";
import { Dialog, Paragraph, Button } from 'react-native-paper';

/**
 * @deprecated delete this. useAlerts hook instead
 */
const InviteFriendDialog = ({ showInviteDialog, friend, sendInvite, close }) => {
  return (
    <Dialog visible={showInviteDialog} onDismiss={close}>
      <Dialog.Title>Invitation</Dialog.Title>
      <Dialog.Content>
        <Paragraph>
          Your invitation was successful!
        </Paragraph>
      </Dialog.Content>
      <Dialog.Actions>
        <Button onPress={close}>Continue</Button>
      </Dialog.Actions>
    </Dialog>
  );
};

export default InviteFriendDialog;
