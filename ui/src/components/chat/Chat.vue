<template>
  <div id="chat">
    <contacts :contactList="contactList"></contacts>
    <div id="message-container">
      <message-box></message-box>
      <input-box></input-box>
    </div>
  </div>
</template>

<script>
import Contacts from './Contacts.vue';
import InputBox from './InputBox.vue';
import MessageBox from './MessageBox.vue';

export default {
  name: 'Chat',
  components: {
    Contacts,
    InputBox,
    MessageBox
  },
  data() {
    return { contactList: ['Warren', 'Wawa', 'Neil'] };
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