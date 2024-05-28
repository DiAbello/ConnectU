<template>
  <div class="messages">
    <SearchChat/>
    <ChatList/>
  </div>
</template>

<script setup lang="ts">

import SearchChat from "@/components/Messages/components/SearchChat/SearchChat.vue";
import ChatList from "@/components/Messages/components/ChatList/ChatList.vue";
</script>

<style scoped lang="scss">
  .messages {
    flex: 0 1 550px;
  }
</style>