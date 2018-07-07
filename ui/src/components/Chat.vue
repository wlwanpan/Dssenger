<template>
  <div id="chat">
    <contacts></contacts>
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
      conversation: [
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: false},
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: false},
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: false},
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: true},
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: false},
        {timestamp: '12:00', body: 'this is own msg', own: false},
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: false},
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: false},
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: false},
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: true},
        {timestamp: '12:00', body: 'this is own msg', own: true},
        {timestamp: '12:01', body: 'this is the reply', own: false},
        {timestamp: '12:00', body: 'this is own msg', own: false},
      ],
      contactList: ['Warren', 'Wawa', 'Neil'] };
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
  border: 1px solid blue;
  width: 30%;
}
</style>