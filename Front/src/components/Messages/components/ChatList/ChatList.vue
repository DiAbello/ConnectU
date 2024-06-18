<template>
  <div class="chatList">
    <ChatItem v-for="chat in chatStore.getSearchedChats()" :key="chat.chatId" :chat="chat"/>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {Chat} from "@/components/Messages/types/Chat";
import ChatItem from "@/components/Messages/components/ChatItem/ChatItem.vue";
import {useChatsStore} from "@/components/Messages/store/chatsStore";

defineProps({
  chats: {
    type: Array as PropType<Chat[]>,
    required: true
  }
})
const chatStore = useChatsStore()
</script>

<style scoped lang="scss">
.chatList {
  background-color: #222222;
  max-width: 550px;
  overflow: hidden;
  border: 1px solid var(--lightDar);
  border-bottom: none;
  border-radius: 0 0 8px 8px;
}
</style>