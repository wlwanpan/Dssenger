<template>
  <div id="message-box">
    <div id="message-header">
      <h2>{{ username }}</h2>
    </div>
    <div id="messages">
      <div v-for="(msg, index) in conversation" :key="`msg-${index}`">
        <div v-if="msg.sender_id == user._id" class="message-own">
          <md-avatar class="md-avatar-icon md-small accent">
            <img :src="user.avatar" alt="Avatar">
          </md-avatar>
          <div class="message-bubble">
            {{ msg.body }}
          </div>
        </div>
        <div v-else class="message-response">
          <md-avatar class="md-avatar-icon md-small accent">
            <img :src="currentContact.avatar" alt="Avatar">
          </md-avatar>
          <div class="message-bubble">
            {{ msg.body }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import { EventBus } from '../../helper/event-bus.js';

export default {
  name: 'MessageBox',
  props: {
    user: Object,
    currentContact: Object,
  },
  data() {
      return {
          username: "",
          conversation: []
      }
  },
  async mounted() {

    EventBus.$on('contact-switch', contact => {
      this.username = contact.username;
      this.currentContact = contact;

      this.conversation = [];
      if (this.user._id) {
        this.loadContactConversation(contact);
      }
    });

    EventBus.$on('post-message', data => {
      let msg = data.msg;
      let contact = data.contact;
<<<<<<< Updated upstream
      let d = new Date();
      let min = d.getMinutes();
      if (min < 10) {
          min = "0" + min;
      }
      let hour = d.getHours();
      if (hour < 10) {
          hour = "0" + hour;
      }

      this.conversation.unshift({ created_at: hour + ":" + min, body: msg, sender_id: this.user._id });
=======
      let date = new Date();
      // let min = d.getMinutes();
      // if (min < 10) {
      //     min = "0" + min;
      // }
      // let hour = d.getHours();
      // if (hour < 10) {
      //     hour = "0" + hour;
      // }
      debugger
      this.conversation.unshift({ created_at: date, body: msg, sender_id: this.user._id });
>>>>>>> Stashed changes

      // add new line to DB
      this.addMessage(msg, contact);
    });

    let objDiv = document.getElementById("messages");
    objDiv.scrollTop = objDiv.scrollHeight;
  },
  methods: {
    async loadContactConversation(contact) {

      var response = await this.$apiCall({
        type: 'get',
        url: `/user/${this.user._id}/conversation/${contact._id}`
      })

      if (response) {
        this.conversation = response.reverse();
      }
    },
    async addMessage(msg, contact) {

      let response = await this.$apiCall({
        type: 'post',
        url: `/user/${this.user._id}/conversation/${contact._id}`,
        data: { message: msg }
      })

      if (response != '') {
        this.$eventBusEmit('error', {
          title: 'Message',
          message: 'Message could not be added'
        })
      }
    }
  }
}
</script>

<style scoped>
#message-box {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 90%;
}

#messages {
  width: 100%;
  height: 100%;
  overflow: scroll;
  display: flex;
  flex-direction: column-reverse;
  margin-bottom: 10px;
}

#message-header {
  display: flex;
  margin-left: 10px;
  height: 60px;
}

.message-bubble {
  padding: 5px 10px;
  margin: 5px 0;
  -webkit-border-radius: 13px;
  -moz-border-radius: 13px;
  border-radius: 13px;
}

.message-own {
  display: flex;
  flex-direction: row-reverse;
  margin-right: 20px;
}

.message-response {
  display: flex;
  flex-direction: row;
  margin-left: 20px;
}

.message-own .message-bubble {
  background: #0084FF;
}

.message-own .md-avatar {
  margin: 0 0 0 7px;
  align-self: center;
}

.message-response .message-bubble {
  background: #E9EBEE;
}

.message-response .md-avatar {
  margin: 0 7px 0 0px;
  align-self: center;
}

</style>