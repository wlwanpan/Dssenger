<template>
  <div id="input-container">
    <div id="input-text">
      <input type="text" id="input-text-box" name="input-text-box" placeholder="Type a message"
        v-model="msg"
        v-on:keyup.enter="postMessage()">
    </div>
    <div id="input-button">
      <md-button v-on:click="postMessage">Send</md-button>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Input',
  data() {
    return {
      msg: ""
    }
  },
  methods: {
    async postMessage() {
      if (this.msg !== "") {
        return
      }

      // fix here
      var response = await this.$apiCall({
        type: 'post',
        url: `users/conversations/${asdf}/message`,
        data: {
          body: this.msg
        }
      })
      if (response) {
        this.$eventBusEmit('post-message', this.msg)
      }

      this.msg = ""
    }
  }
}
</script>

<style scoped>
#input-container {
  width: 100%;
  height: 60px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  border-top: 1px solid #E5E5E5;
}

#input-text {
  width: 100%;
  display: flex;
  justify-content: center;
}

#input-text input {
  width: 95%;
  height: 30px;
  align-self: center;
  font-size: 15px;
  border: 0;
  background: #FAFAFA;
}

#input-button {
  height: 100%;
  align-self: center;
}

#input-button button {
  height: 100%;
  margin: 0;
}

</style>