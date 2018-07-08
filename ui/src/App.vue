<template>
  <div id="app">
    <login-dialog
      :showDialog="showLoginDialog"
      @close-dialog="showLoginDialog = false"
      @show-register-dialog="showRegisterDialog">
    </login-dialog>
    <register-dialog
      @close-dialog="registerLoginDialog = false"
      :showDialog="registerLoginDialog">
    </register-dialog>
    <chat></chat>
  </div>
</template>

<script>
import Chat from './components/Chat.vue'
import LoginDialog from './dialogs/loginDialog.vue'
import RegisterDialog from './dialogs/registerDialog.vue'

export default {
  name: 'app',
  data() {
    return {
      showLoginDialog: true,
      registerLoginDialog: false
    }
  },
  mounted() {
  },
  methods: {
    showRegisterDialog() {
      this.registerLoginDialog = true
      this.showLoginDialog = false
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
