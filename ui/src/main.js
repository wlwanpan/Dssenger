import Vue from 'vue'
import App from './App.vue'
import './assets/css/normalize.css';

import { MdElevation } from 'vue-material/dist/components';
import 'vue-material/dist/vue-material.min.css'

Vue.use(MdElevation);

Vue.config.productionTip = false

new Vue({
  render: h => h(App)
}).$mount('#app')
