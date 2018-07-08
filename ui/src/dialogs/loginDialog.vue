<template>
  <div>
    <md-dialog
      :md-click-outside-to-close='false'
      :md-active.sync="showDialog">
      <md-dialog-title>Login Account</md-dialog-title>

      <md-dialog-content>
        <form novalidate class="md-layout" @submit.prevent="validateUser">

          <md-card-content>

            <md-field :class="getValidationField('username')">
              <label for="username">Username</label>
              <md-input name="username" id="username" v-model="form.username" :disabled="sending" />
              <span class="md-error" v-if="!$v.form.username.required">Username is required</span>
              <span class="md-error" v-else-if="!$v.form.username.minlength">Invalid username</span>
            </md-field>

            <md-field :class="getValidationField('password')">
              <label for="email">Password</label>
              <md-input type="text" name="username" id="username" v-model="form.password" :disabled="sending" />
              <span class="md-error" v-if="!$v.form.password.required">The email is required</span>
              <span class="md-error" v-else-if="!$v.form.password.minlength">Invalid Password</span>
            </md-field>

          </md-card-content>

          <md-progress-bar md-mode="indeterminate" v-if="sending" />

          <md-card-actions>
            <md-button type="submit" class="md-primary" :disabled="sending">Login</md-button>
          </md-card-actions>

          <md-snackbar :md-active.sync="userSaved">The user was saved with success!</md-snackbar>
        </form>

      </md-dialog-content>

    </md-dialog>

  </div>
</template>

<script>
import { validationMixin } from 'vuelidate'
import { required, minLength} from 'vuelidate/lib/validators'

export default {
  name: 'LoginDialog',
  mixins: [validationMixin],
  data() {
    return {
      showDialog: true,
      userSaved: false,
      sending: false,
      form: {
        username: null,
        password: null
      },
    }
  },
  validations: {
    form: {
      username: {
        required,
        minLength: minLength(5)
      },
      password: {
        required,
        minLength: minLength(5)
      }
    }
  },
  methods: {
    getValidationField (fieldName) {
      const field = this.$v.form[fieldName]

      if (field) {
        return {
          'md-invalid': field.$invalid && field.$dirty
        }
      }
    },
    validateUser () {
      this.$v.$touch()

      if (!this.$v.$invalid) {
        this.loginUser()
      }
    },
    async loginUser() {
      var user = await this.$apiCall({
        type: 'post',
        url: '/login',
        data: {
          username: this.form.username,
          password: this.form.password
        }
      })

      if (user.exist) {
        console.log(user) // user data here << _id / avatar / username
        this.showDialog = false
      }
      else {
        window.alert('Account does not exist')
      }

    }
  }
}

</script>

<style scoped>

.md-dialog {
  width: 80%;
  max-width: 500px;
}

.md-card-content {
  width: 100%;
}

.md-card-actions {
}

</style>