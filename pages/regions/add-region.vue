<template>
    <div>
            <div class="row">
              <div class="col-md-12">
                  <div class="card p-3">
                <form @submit.prevent="AddRegion">
                    
                  <base-input
                        type="text"
                        label="Name of region"
                        placeholder="Name"
                        v-model="form.name"
                    >
                    </base-input>
                    <div class="row">
                        <div class="col-md-6">
                            <base-input
                                type="text"
                                label="Director General"
                                placeholder="Director General"
                                v-model="form.name_of_director_general"
                            >
                            </base-input>
                        </div>
                        <div class="col-md-6">
                            <base-input
                                type="textt"
                                label="Director General Address"
                                placeholder="Address"
                                v-model="form.address_of_director_general"
                            >
                            </base-input>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <base-input
                                type="text"
                                label="Regional Director"
                                placeholder="Regional Director"
                                v-model="form.name_of_regional_health_director"
                            >
                            </base-input>

                        </div>
                        <div class="col-md-6">
                            <base-input
                                type="text"
                                label="Regional Director Address"
                                placeholder="Address"
                                v-model="form.address_of_regional_health_director"
                            >
                            </base-input>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <base-input
                                type="text"
                                label="Regional Minister"
                                placeholder="Regional Minister"
                                v-model="form.name_of_regional_minister"
                            >
                            </base-input>
                        </div>
                        <div class="col-md-6">
                            
                            <base-input
                                type="text"
                                label="Regional Minister Address"
                                placeholder="Address"
                                v-model="form.address_of_regional_minister"
                            >
                            </base-input>
                        </div>
                    </div>
                  <base-button native-type="submit" type="primary" class="btn-fill" :loading="loading">
                    Save
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
                    name_of_director_general : "",
                    address_of_director_general : "",
                    name_of_regional_health_director : "",
                    address_of_regional_health_director : "",
                    name_of_regional_minister : "",
                    address_of_regional_minister : ""
                }
            }
        },
        methods : {
            AddRegion(){
                this.loading = true; 
                this.$axios.$post('admin/store/regions',this.form)
                .then(response => {
                    this.$notify({ type:'success', message : 'Region added successfully' });
                    this.form = {
                        name: "",
                        name_of_director_general : "",
                        address_of_director_general : "",
                        name_of_regional_health_director : "",
                        address_of_regional_health_director : "",
                        name_of_regional_minister : "",
                        address_of_regional_minister : ""
                    }
                })
                .catch(error => {
                    this.$notify({ type : 'error', message : 'Error adding region, Please try again later' })
                })
                .finally((_) => this.loading = false)
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>