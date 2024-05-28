<template>
  <div class="chatList">
    <ChatItem/>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {Chat} from "@/components/Messages/types/Chat";
import ChatItem from "@/components/Messages/components/ChatItem/ChatItem.vue";

defineProps({
  chats: {
    type: [] as PropType<Chat[]>,
    required: false
  }
})
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