<template>
  <div class="message-list">
    <MessageItem v-for="(message, index) in messages" :key="index" :message="message"/>
  </div>
</template>

<script setup lang="ts">
import MessageItem from "@/components/Messages/components/MessageItem/MessageItem.vue";
import type {PropType} from "vue";
import type {Message} from "@/components/Messages/types/Chat";


defineProps({
  messages: {
    type: Array as PropType<Message[]>,
    required: true
  }
})
</script>

<style scoped lang="scss">
.message-list {
  display: flex;
  flex-direction: column;
}
</style>