<template>
  <div id="app">
    <chat></chat>
  </div>
</template>

<script>
import Chat from './components/chat/Chat.vue'

export default {
  name: 'app',
  components: {
    Chat
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
