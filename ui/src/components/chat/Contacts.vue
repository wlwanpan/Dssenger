<template>
  <div id="contacts">
    <add-contact-dialog
      :user="user"
      @close-dialog="showAddContact = false"
      @on-selected="onSelect"
      :showDialog="showAddContact"
      />
    <div class="contact-list">
      <div v-if="contactList.length">
        <h1>Contacts</h1>
        <contact-item v-for="(contact, index) in contactList"
          :key="index"
          :contact="contact"
          :class="['contact-' + index, index === 0 ? 'selected' : '']"
          :index="index"></contact-item>
      </div>
      <div v-else-if="loadingContacts">
        <md-empty-state
          md-label="Loading ..."
          md-description="Retrieving your contact list.">
        </md-empty-state>
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
      loadingContacts: false,
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
    onSelect(contact) {
      this.contactList.push(contact)
    },
    async loadContacts() {
      this.loadingContacts = true
      var response = await this.$apiCall({
        type: 'get',
        url: `/user/${this.user._id}/contacts`
      })
      if (response) {
        this.contactList = response
        if (this.contactList.length > 0) {
          // open convo of first contact in list
          this.$eventBusEmit('contact-switch', this.contactList[0]);
        } else {
          // set input box to invisible if no user
          this.$eventBusEmit('update-input-visibility', false);
        }
      }
      this.loadingContacts = false
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