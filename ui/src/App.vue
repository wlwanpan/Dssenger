<template>
  <div id="app">
    <login-dialog
      :showDialog="showLoginDialog"
      @close-dialog="showLoginDialog = false"
      @show-register-dialog="switchDialog" />

    <register-dialog
      @close-dialog="switchDialog"
      :showDialog="registerLoginDialog" />

    <error-dialog
      @close-dialog="resetError"
      :title="error.title"
      :message="error.message"
      :showDialog="hasError"
      />

    <chat></chat>
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
      showLoginDialog: true,
      registerLoginDialog: false,
      error: {
        title: null,
        message: null
      },
      user: {
        username: null,
        avatar: null
      }
    }
  },
  computed: {
    hasError() {
      return Boolean(this.error.title && this.error.message)
    }
  },
  mounted() {
    EventBus.$on('error', ({ title, message }) => {
      this.error.title = title
      this.error.message = message
    })
  },
  methods: {
    switchDialog() {
      this.registerLoginDialog = !this.registerLoginDialog
      this.showLoginDialog = !this.showLoginDialog
    },
    resetError() {
      this.error.title = null
      this.error.message = null
    }
  },
  components: {
    Chat,
    LoginDialog,
    RegisterDialog
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
