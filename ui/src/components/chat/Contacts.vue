<template>
  <div id="contacts">
    <add-contact-dialog
      :user="user"
      @close-dialog="showAddContact = false"
      :showDialog="showAddContact"
      />
    <div class="contact-list">
      <div v-if="contactList.length">
        <contact-item v-for="(contact, index) in contactList" :key="index" :contact="contact"></contact-item>
      </div>
      <div v-else>
        <md-empty-state
          md-label="No Contacts"
          md-description="Add user before starting a conversation.">
        </md-empty-state>
      </div>
    </div>
    <div class="contact-actions">
      <md-button class="md-fab md-primary" @click="openAddContactDialog">
        <md-icon>add</md-icon>
      </md-button>
    </div>
  </div>
</template>

<script>
import ContactItem from './ContactItem'
import AddContactDialog from './AddContactDialog'

export default {
  name: 'Contacts',
  data() {
    return {
      contactList: [],
      showAddContact: false
    }
  },
  async mounted() {
    if (this.user._id) {
      this.loadContacts()
    }
  },
  watch: {
    user() {
      this.loadContacts()
    }
  },
  methods: {
    async loadContacts() {
      var response = await this.$apiCall({
        type: 'get',
        url: `/user/${this.user._id}/contacts`
      })
      if (response) {
        this.contactList = response
      }
    },
    openAddContactDialog() {
      this.showAddContact = true
    }
  },
  props: {
    user: Object
  },
  components: {
    ContactItem,
    AddContactDialog
  }
}
</script>

<style scoped>

#contacts {
  height: 100vh;
  background: #05A6FF;
  padding-top: 10px;
  min-width: 320px;
}

</style>