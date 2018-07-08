<template>
  <div id="chat">
    <contacts :user="user"></contacts>
    <div id="message-container">
      <message-box :conversation="conversation"></message-box>
      <input-box></input-box>
    </div>
    <div id="buffer">
      <p>PLACEHOLDER.. OTHER CONTENT HERE??</p>
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
  data() {
    return {
      conversation: [],
      contactList: ['Warren', 'Wawa', 'Neil']
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