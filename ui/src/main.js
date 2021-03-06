import Vue from 'vue'
import App from './App.vue'
import VueMaterial from 'vue-material'
export const EventBus = new Vue()

import './plugins/api.js'

import './assets/css/normalize.css'
import 'vue-material/dist/theme/default.css'
import 'vue-material/dist/vue-material.min.css'

Vue.use(VueMaterial)

Vue.config.productionTip = false

new Vue({
  render: h => h(App)
}).$mount('#app')
