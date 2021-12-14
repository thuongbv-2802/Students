<template>
    <div>
        <label>Email</label>
        <input type="text" name="email" v-model="email" />
         <label>Password</label>
        <input type="passowrd" name="password" v-model="password" />
         <label>Re-enter password</label>
        <input type="passowrd" name="password" v-model="rePassword" />
    </div>
</template>

<script>
export default {
    data() {
        return {
            email: '',
            password: '',
            rePassword: '',
        }
    }
    methods: {
             validateEmail() {
                 // Logic for validate email
             },
             validatePassword() {
                // Logic for validate password
            }
    }
}
</script>