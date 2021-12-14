<template>
  <div class="about">
    <Modal :visible="modalVisible">
      <h2>hello</h2>
      <template v-slot:header>
          <p>Info</p>
      </template>
      <template>
          <i class="success-icon" />
          <p>Purchase success!</p>
      </template>
      <template>
          <button @click="closeModal">Close</button>
      </template>
    </Modal>

    <button @click="openModal">Open modal</button>
  </div>
</template>

<script>
export default {
  data () {
    return {
      modalVisible: false
    }
  },
  methods: {
    openModal () {
      this.modalVisible = true
    },
    closeModal () {
      this.modalVisible = false
    }
  }
}
</script>
