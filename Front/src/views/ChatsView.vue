<template>
  <div class="messages">
    <SearchChat/>
    <ChatList :chats="chatStore.chats"/>
  </div>
</template>

<script setup lang="ts">
import SearchChat from "@/components/Messages/components/SearchChat/SearchChat.vue";
import ChatList from "@/components/Messages/components/ChatList/ChatList.vue";
import {useChatsStore} from "@/components/Messages/store/chatsStore";
import {useUserStore} from "@/stores/userStore";
import {onMounted, onUnmounted} from "vue";

const chatStore = useChatsStore()
const userStore = useUserStore()

onMounted(() => {
  setTimeout(() => {
    chatStore.getChats(userStore.user?.id)
  }, 1000)
})

</script>

<style scoped lang="scss">
  .messages {
    flex: 0 1 550px;
  }
</style>