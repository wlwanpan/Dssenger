<template>
  <div class='add-contact-dialog'>
    <md-dialog
      :md-active.sync="showDialog">
      <md-dialog-title>Add Contact</md-dialog-title>

      <md-dialog-content>
        <contact-item
          v-for="(contact, index) in filteredContactList" :key="index" :contact="contact"
          @on-click="addToUserContact(contact)"/>
      </md-dialog-content>

      <md-card-actions>
        <md-button class="md-primary" @click="onClose()">Close</md-button>
      </md-card-actions>
    </md-dialog>
  </div>
</template>

<script>
import ContactItem from './ContactItem'

export default {
  name: 'AddContactDialog',
  data() {
    return {
      contactList: []
    }
  },
  async mounted() {
    var response = await this.$apiCall({
      type: 'get',
      url: '/users'
    })

    if (response && response instanceof Array) {
      this.contactList = response
    }
  },
  computed: {
    filteredContactList() {
      var userId = this.user ? this.user._id : ''
      return this.contactList.filter(contact => contact._id != userId)
    }
  },
  methods: {
    async addToUserContact(contact) {
      var response = await this.$apiCall({
        type: 'post',
        url: `/user/${this.user._id}/add-contact`,
        data: {
          contact_id: contact._id
        }
      })
      this.onClose()
      if (response) {
        this.$emit('on-selected', contact)
        this.$eventBusEmit('error', {
          title: 'Success',
          message: 'Contact added!'
        })
      }
    },
    onClose() {
      this.$emit('close-dialog')
    }
  },
  watch: {
  },
  props: {
    user: Object,
    showDialog: Boolean
  },
  components: {
    ContactItem
  }
}

</script>

<style>
</style>