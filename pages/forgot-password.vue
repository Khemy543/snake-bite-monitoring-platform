<template>
  <div style="width:30%;">
        <div class="row">
            <div class="col-md-12">
                <h4>Forgot Password</h4>
                <br/>
                <form class="login-form" @submit.prevent="handleLogin">
                    <base-input
                        type="email"
                        label="Email"
                        placeholder="Enter email"
                        v-model="email"
                    >
                    </base-input>
                    <base-button native-type="submit" type="primary" class="btn-fill" :loading="loading">
                        Submit
                    </base-button>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    layout: 'starter',
    middleware : ['authRedirect'],
    data(){
        return{
            email : ''
        }
    },
    methods:{
        async requestPasswordReset(){
            try {
                const response = await this.$axios.post('', {email:this.email});

                if(response && response.data){
                    
                }
            } catch (error) {
                
            }
        }
    }

}
</script>

<style>

</style>