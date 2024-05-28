<template>
  <div class="searchChat">
    <label class="d-flex align-center input-label">
      <font-awesome-icon
          :icon="['fas', 'magnifying-glass']"
          style="color: #757575"
      />
      <input
          type="text"
          class="input"
          placeholder="Поиск"
          v-model="searchedValue"
      >
      <font-awesome-icon
          v-if="searchedValue.length > 0"
          :icon="['fas', 'xmark']"
          style="color: #757575"
          class="cursor-pointer ml-auto"
          @click="searchedValue = ''"
      />
    </label>
  </div>
</template>

<script setup lang="ts">

import {ref} from "vue";

const searchedValue = ref('')
</script>

<style scoped lang="scss">
.searchChat {
  background-color: #222222;
  max-width: 550px;
  overflow: hidden;
  border: 1px solid var(--lightDar);
  border-bottom: none;
  border-radius: 8px 8px 0 0;
  .input-label {
    border-radius: 10px;
    padding: 15px 10px 15px 15px;
    transition: background-color .3s ease;
    .input {
      color: white;
      margin-left: 10px;
    }
  }
}
</style>