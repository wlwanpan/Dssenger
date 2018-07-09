<template>
  <div class="contact-item">
    <div class="contact-item-bubble md-elevation-1"
    v-on:click.prevent="contactSwitch()">
      <md-avatar class="md-avatar-icon md-large">
        <img :src="contact.avatar" alt="Avatar">
      </md-avatar>
      <div class="contact-item-description">
        <h3>{{ contact.username }}</h3>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ContactItem',
  methods: {
    contactSwitch: function() {
      this.$emit('on-click')
      this.$eventBusEmit('contact-switch', this.contact)
      // document.getElementsByClassName('selected')[0].classList.remove("selected");
      // document.getElementsByClassName('contact-' + this.index)[0].classList.add("selected");
    }
  },
  props: {
    index: Number,
    contact: Object
  },
}
</script>

<style scoped>

.contact-item {
    // border: 1px solid black;
    width: 320px;
    display: flex;
    justify-content: center;
}

.contact-item-bubble {
    width: 305px;
    border-radius: 10px;
    margin: 0 0 10px 0;
    background: #238CC5;
    display: flex;
}

.contact-item-bubble:hover {
  cursor: pointer;
  background: #7d97c1;
}

.md-avatar {
    margin: 10px;
    align-self: center;
}

.contact-item-description {
    margin-left: 10px;
    align-self: flex-start;
    color: #ffffff;
    text-align: left;
    padding-top: 5px;
}

.contact-item-description h3 {
    margin-bottom: 0;
}

.contact-item-description p {
    margin-top: 10px;
}

.selected .contact-item-bubble {
  background: #3460a8;
}

</style>