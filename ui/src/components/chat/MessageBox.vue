<template>
  <div id="message-box">
    <div id="message-header">
      <h2>{{ username }}</h2>
    </div>
    <div id="messages">
      <div v-for="(msg, index) in conversation" :key="`msg-${index}`">
        <div v-if="msg.own" class="message-own">
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
          test: "",
          conversation: []
      }
  },
  async mounted() {
    EventBus.$on('contact-switch', contact => {
      this.username = contact.username;
      console.log(this.user);
      if (this.user._id) {
        this.loadContactConversation();
        console.log(this.test);
      }
    });

    EventBus.$on('post-message', msg => {
      let d = new Date();
      let min = d.getMinutes();
      if (min < 10) {
          min = "0" + min;
      }
      let hour = d.getHours();
      if (hour < 10) {
          hour = "0" + hour;
      }
      this.conversation.unshift({timestamp: hour + ":" + min, body: msg, own: true});
    });

    let objDiv = document.getElementById("messages");
    objDiv.scrollTop = objDiv.scrollHeight;
  },
  methods: {
    async loadContactConversation() {
      var response = await this.$apiCall({
        type: 'get',
        url: `/user/${this.user._id}/contacts`
      })

      if (response) {
        this.test = response;
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