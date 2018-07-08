<template>
  <div id="chat">
    <contacts :user="user"></contacts>
    <div id="message-container">
      <message-box :user="user"></message-box>
      <input-box :user="user"></input-box>
    </div>
    <div id="buffer">
      <md-empty-state
        class="md-primary"
        md-label="Account"
        :md-description="description">
        <md-avatar class="md-avatar-icon md-large">
          <img :src="userAvatar" alt="Avatar">
        </md-avatar>
      </md-empty-state>
    </div>
  </div>
</template>

<script>
import Contacts from './chat/Contacts.vue';
import InputBox from './chat/InputBox.vue';
import MessageBox from './chat/MessageBox.vue';

export default {
  name: 'Chat',
  components: {
    Contacts,
    InputBox,
    MessageBox
  },
  computed: {
    description() {
      if (this.user && this.user.username) {
        return 'Logged in as:' + this.user.username
      }
      else {
        return 'Not logged in'
      }
    },
    userAvatar() {
      if (this.user && this.user.avatar) {
        return this.user.avatar
      }
      else {
        return ''
      }
    }
  },
  props: {
    user: Object
  }
}
</script>

<style scoped>
#chat {
  display: flex;
}

#message-container {
  display: flex;
  flex-direction: column;
  width: 70%;
  justify-content: space-between;
  height: 100vh;
}

#buffer {
  border-left: 1px solid #E5E5E5;
  width: 30%;
}
</style>