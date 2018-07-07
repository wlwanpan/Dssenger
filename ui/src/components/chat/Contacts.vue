<template>
  <div id="contacts">
    <contact-item v-for="c in contactList" :key="c" :contact="c"></contact-item>
  </div>
</template>

<script>
import ContactItem from './ContactItem.vue';

export default {
  name: 'Contacts',
  props: {
    name: String,
    contactList: Array,
  },
  components: {
    ContactItem
  },

}
</script>

<style scoped>
#contacts {
    height: 100vh;
    background: #05A6FF;
    padding-top: 10px;
}

</style>