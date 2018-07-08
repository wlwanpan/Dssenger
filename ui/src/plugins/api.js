import Vue from 'vue'
import axios from 'axios'

Vue.use({

  install(_vue) {
    _vue.prototype.$apiCall = async (options) => {
      var { type, url, data } = options

      // To configure webpack for process.ENV -> check local vs production
      const BASE_URL_PRODUCTION = '18.220.107.107:80'
      const BASE_URL_LOCAL = 'localhost:4567'

      var endpoint = `http://${BASE_URL_LOCAL}${url}`
      var packet = type === 'post' ? [endpoint, data] : [endpoint]

      var response = await axios[type](...packet) // let caller handle error
      return response
    }
  }

})