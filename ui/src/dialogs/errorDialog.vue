<template>
  <div>
    <md-dialog-confirm
      :md-active.sync="showDialog"
      :md-title="title"
      :md-content="message"
      md-confirm-text="Ok"
      @md-confirm="onClose" />

    <md-button class="md-primary md-raised" @click="onClose">Ok</md-button>
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