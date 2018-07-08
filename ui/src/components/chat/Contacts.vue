<template>
  <div id="contacts">
    <div class="contact-list">
      <contact-item v-for="(contact, index) in contactList" :key="index" :contact="contact"></contact-item>
    </div>
    <div class="contact-actions">
      <md-button class="md-fab md-primary">
        <md-icon>add</md-icon>
      </md-button>
    </div>
  </div>
</template>

<script>
import ContactItem from './ContactItem.vue';

export default {
  name: 'Contacts',

  data() {
    return {
      contactList: []
    }
  },

  async mounted() {
    try {
      var response = await this.$apiCall({
        type: 'get',
        url: '/users'
      })
      this.contactList = response.data
    }
    catch (e) {
      // To display error message in popup dialog
      return e
    }
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
    min-width: 30vh;
}

</style>