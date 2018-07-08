<template>
  <div id="app">
    <login-dialog
      :showDialog="showDialog[0]"
      @login-user="loginUser"
      @show-register-dialog="switchTo(1)" />

    <register-dialog
      @close-dialog="switchTo(0)"
      :showDialog="showDialog[1]" />

    <error-dialog
      @close-dialog="resetError"
      :title="error.title"
      :message="error.message"
      :showDialog="showDialog[2]"
      />

    <chat :user="user"></chat>
  </div>
</template>

<script>
import Chat from './components/Chat.vue'
import LoginDialog from './dialogs/loginDialog.vue'
import RegisterDialog from './dialogs/registerDialog.vue'
import ErrorDialog from './dialogs/errorDialog.vue'
import { EventBus } from './helper/event-bus'

export default {
  name: 'app',
  data() {
    return {
      showDialog: [true, false, false],
      prevDialog: [],
      error: {
        title: null,
        message: null
      },
      user: {
        _id: null,
        username: null,
        avatar: null
      }
    }
  },
  computed: {
  },
  mounted() {
    EventBus.$on('error', ({ title, message }) => {
      if !(title || message) {
        return
      }
      this.error.title = title
      this.error.message = message
      this.showError()
    })
  },
  methods: {
    loginUser(userData) {
      this.closeAll()
      this.user = userData
    },
    switchTo(dialogIndex) {
      var output = [false, false, false]
      output[dialogIndex] = true
      this.showDialog = output
    },
    resetError() {
      this.error.title = null
      this.error.message = null
      this.showDialog = this.prevDialog
    },
    showError() {
      this.prevDialog = this.showDialog
      this.showDialog = [false, false, true]
    },
    closeAll() {
      this.showDialog = [false, false, false]
    }
  },
  components: {
    Chat,
    LoginDialog,
    RegisterDialog,
    ErrorDialog
  },
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Roboto:400,500,700,400italic|Material+Icons');

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  overflow: hidden;
}

.md-overlay {
  background: rgba(0,0,0,.8) !important;
}

*:focus {
  outline: none;
}

</style>
