<template>
    <div class=" container">
            <div class="row row justify-content-center align-items-center">
              <div class="col-md-6">
                <div class="card p-4">
                <h5>Create Admin</h5>
                <form @submit.prevent="addAdmin">
                    <div class="row">
                        <div class=" col-md-12">
                            <base-input
                                type="text"
                                label="Name of Admin"
                                placeholder="Name"
                                v-model="form.name"
                            >
                        </base-input>
                        </div>
                    </div>
                  
                    <div class="row">
                        <div class="col-md-12">
                            <base-input
                                type="text"
                                label="Email address"
                                placeholder="Email Address"
                                v-model="form.email"
                            >
                            </base-input>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <base-input
                                type="text"
                                label="Phone Number"
                                placeholder="Phone Number"
                                v-model="form.phone"
                            >
                            </base-input>
                        </div>
                    </div>
                  <base-button native-type="submit" type="primary" class="btn-fill" :loading="loading">
                    Add Admin
                  </base-button>
                </form>
              </div>
            </div>
            </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                loading : false,
                form : {
                    name: "",
                    email : "",
                    phone : ""
                }
            }
        },
        methods : {
            async addAdmin(){
                try {
                    this.loading = true; 
                    const response = await this.$axios.$post('admin/add-new-admin',this.form);

                    if(response){
                        this.$notify({ type:'success', message : 'Admin created successfully' });
                        this.form = {
                            name: "",
                            email : "",
                            phone : ""
                        }
                    }
                } catch (error) {
                    this.$notify({ type : 'danger', message : 'Error creating admin, Please try again later' })
                }
                this.loading = false
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>