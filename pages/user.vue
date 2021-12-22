<template>
  <div class="row">
    <div class="col-md-12"><edit-profile-form> </edit-profile-form></div>
    <div class="col-md-12">
      <change-password-form></change-password-form>
    </div>
  </div>
</template>
<script>
import EditProfileForm from '../components/UserProfile/EditProfileForm.vue';
import UserCard from '../components/UserProfile/UserCard.vue';
import changePasswordForm from '../components/UserProfile/ChangePasswordForm.vue'

export default {
  name: 'user',
  components: {
    EditProfileForm,
    changePasswordForm
  }
};
</script>
<style></style>
