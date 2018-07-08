<template>
  <div>
    <md-dialog
      :md-click-outside-to-close='false'
      :md-active.sync="showDialog">
      <md-dialog-title>Register New Account</md-dialog-title>

      <md-dialog-content>

        <form novalidate class="md-layout" @submit.prevent="validateUser">

          <md-field :class="getValidationField('username')">
            <label for="username">Username</label>
            <md-input name="username" id="username" v-model="form.username" :disabled="sending" />
            <span class="md-error" v-if="!$v.form.username.required">Username is required</span>
            <span class="md-error" v-else-if="!$v.form.username.minlength">Invalid username</span>
          </md-field>

          <md-field :class="getValidationField('email')">
            <label for="email">Email</label>
            <md-input name="email" id="email" v-model="form.email" :disabled="sending" />
            <span class="md-error" v-if="!$v.form.email.required">Email is required</span>
            <span class="md-error" v-else-if="!$v.form.email.minlength">Invalid Email</span>
          </md-field>

          <md-field :class="getValidationField('password')">
            <label for="email">Password</label>
            <md-input type="password" name="password" id="password" v-model="form.password" :disabled="sending" />
            <span class="md-error" v-if="!$v.form.password.required">Password is required</span>
            <span class="md-error" v-else-if="!$v.form.password.minlength">Invalid Password</span>
          </md-field>

          <md-field :class="getValidationField('confirmPassword')">
            <label for="email">Confirm Password</label>
            <md-input type="password" name="confirmPassword" id="confirmPassword" v-model="form.confirmPassword" :disabled="sending" />
            <span class="md-error" v-if="!$v.form.confirmPassword.required">Confirm password is required</span>
            <span class="md-error" v-else-if="!$v.form.confirmPassword.minlength">Invalid Password</span>
          </md-field>

          <md-field>
            <label for="avatar">Upload Avatar</label>
            <md-file v-model="form.avatar" accept="image/*" @change="convertAvatar"/>
          </md-field>

          <md-card-actions>
            <md-button class="md-primary" @click.prevent="navigateback()">Back</md-button>
            <md-button type="submit" class="md-primary" :disabled="sending">Register</md-button>
          </md-card-actions>

        </form>

      </md-dialog-content>

    </md-dialog>
  </div>
</template>

<script>
import { validationMixin } from 'vuelidate'
import { required, email, minLength } from 'vuelidate/lib/validators'

export default {
  name: 'RegisterDialog',
  mixins: [validationMixin],
  data() {
    return {
      sending: false,
      form: {
        username: '',
        email: '',
        password: '',
        confirmPassword: '',
        avatar: ''
      }
    }
  },
  methods: {
    convertAvatar(event) {
      var input = event.target
      if (input.files && input.files[0]) {
        var reader = new FileReader()
        reader.onload = (e) => {
          this.form.avatar = e.target.result
        }
        reader.readAsDataURL(input.files[0])
      }
    },
    getValidationField(fieldName) {
      const field = this.$v.form[fieldName]

      if (field) {
        return {
          'md-invalid': field.$invalid && field.$dirty
        }
      }
    },
    validateUser() {
      this.$v.$touch()

      if (!this.$v.$invalid) {
        this.registerUser()
      }
    },
    async registerUser() {
      this.sending = true

      var response = await this.$apiCall({
        type: 'post',
        url: '/register',
        data: {
          username: this.form.username,
          email: this.form.email,
          password: this.form.password,
          avatar: this.form.avatar
        }
      })

      if (response) {
        this.resetFields()
        this.navigateback()
      }
      else {
        this.resetFields(['password', 'confirmPassword'])
      }

      this.sending = false
    },
    resetFields(fieldsToReset) {
      var fieldNames = fieldsToReset || ['username', 'email', 'password', 'confirmPassword']
      fieldNames.forEach(fieldName => this.form[fieldName] = '')
    },
    navigateback() {
      this.$emit('close-dialog')
    }
  },
  validations: {
    form: {
      username: {
        required,
        minLength: minLength(5)
      },
      email: {
        required,
        email
      },
      password: {
        required,
        minLength: minLength(5)
      },
      confirmPassword: {
        required,
        minLength: minLength(5)
      }
    }
  },
  props: {
    showDialog: Boolean
  }
}
</script>

<style>
</style>