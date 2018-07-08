<template>
  <div id="message-box">
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
</template>


<script>
import { EventBus } from '../../helper/event-bus.js';

export default {
  name: 'MessageBox',
  data() {
      return {
          conversation: []
      }
  },
  mounted() {
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
      debugger
      this.conversation.unshift({timestamp: hour + ":" + min, body: msg, own: true});
    });

    let objDiv = document.getElementById("message-box");
    objDiv.scrollTop = objDiv.scrollHeight;
  }
}
</script>

<style scoped>
#message-box {
    margin: 10px 0;
    width: 100%;
    height: 90%;
    overflow: scroll;
    display: flex;
    flex-direction: column-reverse;
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