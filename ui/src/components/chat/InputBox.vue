<template>
  <div id="input-container">
    <div id="input-text">
      <md-field>
        <label>Type here!</label>
        <md-textarea v-model="autogrow" md-autogrow></md-textarea>
      </md-field>
    </div>
    <div id="input-button">
      <md-button>Send</md-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Input',
  data: () => ({
    autogrow: null
  })
}
</script>

<style scoped>
#input-container {
  border: 1px solid red;
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

#input-text {
}

#input-button {
  align-self:center;

}

</style>