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
export default {
  name: 'MessageBox',
  props: {
    conversation: Array
  },
}
</script>

<style scoped>
#message-box {
    margin-top: 10px;
    width: 100%;
    height: 90%;
    overflow: scroll;
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