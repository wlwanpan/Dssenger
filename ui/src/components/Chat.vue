<template>
  <div id="chat">
    <contacts></contacts>
    <div id="message-container">
      <message-box></message-box>
      <input-box></input-box>
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
    return {}
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
  width: 100%;
  justify-content: space-between;
}
</style>