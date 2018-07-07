<template>
  <div class="contact-item">
    <div class="contact-item-bubble md-elevation-1">
        <h2>{{ contact }}</h2>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ContactItem',
  props: {
      contact: String   // String for now, convert to object later
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
}

</style>