<template>
  <div id="app">
    <login-dialog></login-dialog>
    <chat></chat>
  </div>
</template>

<script>
import Chat from './components/Chat.vue'
import LoginDialog from './dialogs/loginDialog.vue'

export default {
  name: 'app',
  components: {
    Chat,
    LoginDialog
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
}

</style>
