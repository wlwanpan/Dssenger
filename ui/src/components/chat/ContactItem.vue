<template>
  <div class="contact-item">
    <div class="contact-item-bubble md-elevation-1">
      <md-avatar class="md-avatar-icon md-large">
        <img src="../../assets/avatar.jpg" alt="Avatar">
      </md-avatar>
      <div class="contact-item-description">
        <h3>{{ contact.name }}</h3>
        <p>Last message text</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ContactItem',
  props: {
    contact: Object
  }
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
    height: 100px;
    border-radius: 10px;
    margin: 0 0 5px 0;
    background: #238CC5;
    display: flex;
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

</style>