<template>
  <div class="message">
    <div class="message__content" :class="{sender: message.tag === userStore.user?.tag, getter: message.tag !== userStore.user?.tag}">
      <div class="message__text">
        {{message.content}}
      </div>
      <div class="message__time">
        {{convertDate(message.send_at)}}
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {Message} from "@/components/Messages/types/Chat";
import convertDate from "../../../../functions/dateConvert";
import {useUserStore} from "@/stores/userStore";

const props = defineProps({
  message: {
    type: Object as PropType<Message>,
    required: true
  }
})
const userStore = useUserStore()


</script>

<style scoped lang="scss">
.sender {
  text-align: right;
  background-color: #2B5278;
  margin-left: auto;
}
.getter {
  text-align: left;
  align-items: flex-start;
  margin-right: auto;
  background-color: #424242;
}
.message {
  padding: 8px 10px;
  &__content {
    width: fit-content;
    border-radius: 8px;
    padding: 8px 8px;
  }
  &__text {
    font-size: 14px;
    letter-spacing: 0.3px;
    font-weight: 400;
    margin-bottom: 5px;
  }

  &__time {
    font-size: 10px;
    color: #a1a1a1;
  }
}
</style>