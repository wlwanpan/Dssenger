<template>
  <div>
    <md-dialog
      :md-click-outside-to-close='false'
      :md-active.sync="showDialog">
      <md-dialog-title>{{ title }}</md-dialog-title>

      <md-dialog-content>
        {{ message }}
      </md-dialog-content>

      <md-card-actions>
        <md-button class="md-primary" @click="onClose()">Close</md-button>
      </md-card-actions>
    </md-dialog>
  </div>
</template>

<script>

export default {
  name: 'ErrorDialog',
  methods: {
    onClose () {
      this.$emit('close-dialog')
    }
  },
  props: {
    title: String,
    message: String,
    showDialog: Boolean
  }
}

</script>