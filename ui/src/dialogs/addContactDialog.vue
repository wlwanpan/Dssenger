<template>
  <div class='add-contact-dialog'>
    <md-dialog
      :md-active.sync="showDialog">
      <md-dialog-title>Add Contact</md-dialog-title>

      <md-dialog-content>
        {{ 'asdf' }}
      </md-dialog-content>

      <md-card-actions>
        <md-button class="md-primary" @click="onClose()">Close</md-button>
      </md-card-actions>
    </md-dialog>
  </div>
</template>

<script>

export default {
  name: 'AddContactDialog',
  async mounted() {
    var response = await this.$apiCall({
      type: 'get',
      url: '/users'
    })

    if (response) {
      console.log(response)
    }
  },
  methods: {
    onClose() {
      this.$emit('close-dialog')
    }
  },
  props: {
    user: Object,
    showDialog: Boolean
  }
}

</script>

<style>
</style>