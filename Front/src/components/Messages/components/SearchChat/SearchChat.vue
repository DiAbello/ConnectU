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
          v-model="chatStore.searchChat"
      >
      <font-awesome-icon
          v-if="chatStore.searchChat.length > 0"
          :icon="['fas', 'xmark']"
          style="color: #757575"
          class="cursor-pointer ml-auto"
          @click="chatStore.searchChat = ''"
      />
    </label>
  </div>
</template>

<script setup lang="ts">
import {useChatsStore} from "@/components/Messages/store/chatsStore";

const chatStore = useChatsStore()
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