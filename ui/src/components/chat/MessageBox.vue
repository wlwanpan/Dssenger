<template>
  <div id="message-box">
    <div id="message-header">
      <h2>{{ username }}</h2>
    </div>
    <div id="messages">
      <div v-for="(msg, index) in conversation" :key="`msg-${index}`">
        <div v-if="msg.sender == user._id" class="message-own">
          <div class="message-bubble">
            {{ msg.body }}
          </div>
        </div>
        <div v-else class="message-response">
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
  },
  data() {
      return {
          username: "",
          conversation: []
      }
  },
  async mounted() {
    console.log(this.user._id);
    EventBus.$on('contact-switch', contact => {
      this.username = contact.username;
      if (this.user._id) {
        this.loadContactConversation(contact);
      }
    });

    EventBus.$on('post-message', data => {
      let msg = data.msg;
      let contact = data.contact;
      let d = new Date();
      let min = d.getMinutes();
      if (min < 10) {
          min = "0" + min;
      }
      let hour = d.getHours();
      if (hour < 10) {
          hour = "0" + hour;
      }
      debugger
      this.conversation.unshift({ timestamp: hour + ":" + min, body: msg, createdBy: this.user._id });

      // add new line to DB
      this.addMessage(msg, contact);
    });

    let objDiv = document.getElementById("messages");
    objDiv.scrollTop = objDiv.scrollHeight;
  },
  methods: {
    async loadContactConversation(contact) {
      debugger
      var response = await this.$apiCall({
        type: 'get',
        url: `/user/${this.user._id}/conversation/${contact._id}`
      })

      if (response) {
        this.test = response;
      }
    },
    async addMessage(msg, contact) {

      let response = await this.$apiCall({
        type: 'post',
        url: `/user/${this.user._id}/conversation/${contact._id}`,
        data: { message: msg, sender: this.user._id }
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

.message-response .message-bubble {
  background: #E9EBEE;
}

</style>