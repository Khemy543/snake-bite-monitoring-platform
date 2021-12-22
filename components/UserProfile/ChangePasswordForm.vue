<template>
  <card>
    <h5 slot="header" class="title">Change Password</h5>
    <form @submit.prevent="updatePassword">
      <div class="row">
        <div class="col-md-12">
          <base-input
            type="password"
            label="Current Password"
            placeholder="Current Password"
            v-model="form.password"
          >
          </base-input>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12">
          <base-input
            type="password"
            label="New Password"
            placeholder="New Password"
            v-model="form.new_password"
          >
          </base-input>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12">
          <base-input
            type="password"
            label="Confirm Password"
            placeholder="Confirm Password"
            v-model="form.confirm_password"
          >
          </base-input>
        </div>
      </div>

      <base-button native-type="submit" type="primary" class="btn-fill">
        Change Password
      </base-button>
    </form>
  </card>
</template>
<script>
export default {
  data() {
    return {
      form: {
        new_password:"",
        password : "",
        confirm_password : ''
      }
    };
  },
  methods: {
    async updatePassword() {
      console.log(this.form)
      try {
        if(this.form.new_password === this.form.confirm_password){
        const response = this.$axios.post('admin/auth/change/password', this.form);

          if(response && response.data){
            this.$notify({type:'success', message :'Password changed successfully!'})
          }
        }
      } catch (error) {
        console.log(error)
          this.$notify({type:'error', message :'Error changing password!'})
      }
    }
  },
};
</script>
<style></style>
