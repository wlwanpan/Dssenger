<template>
  <div class='add-contact-dialog'>
    <md-dialog
      :md-active.sync="showDialog">
      <md-dialog-title>Add Contact</md-dialog-title>
      <md-dialog-content>
        <md-field>
          <md-input v-model="searchValue" placeholder="Search user..."></md-input>
        </md-field>
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
      searchValue: '',
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
      var regexp = new RegExp(this.searchValue, 'g')
      return this.contactList.filter(contact => {
        if (contact._id == userId) {
          return false
        }
        else if (this.searchValue == '') {
          return true
        }
        else {
          return regexp.test(contact.username)
        }
      })
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

<style scoped>
.md-dialog-content {
  padding: 0 15px 5px !important;
}
.md-dialog-title {
  margin-bottom: 0px !important;
  min-width: 35px !important;
}
.md-dialog {
  min-height: 500px !important;
}
</style>