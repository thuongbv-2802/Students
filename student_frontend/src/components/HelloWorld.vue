<template>
  <div id="watchers">
    <div>{{ reverseMessage }}</div>
      <div><button @click="changeMessage">Click me</button></div>
    </div>
</template>

<script>
  export default {
    name: 'HelloWorld',
    data () {
      return {
        message: 'Trứng rán cần mỡ'
      }
    },
    methods: {
        changeMessage () {
            this.message = 'Cần cậu cơ'
        }
    },
    computed: {
      reverseMessage () {
        return this.message.split('').reverse().join('')
      }
    },
    watch: {
      reverseMessage () {
        console.log('Computed changed')
      }
    }
  }
</script>

<style scoped>
</style>