<template>
  <div class="friend-list">
    <friend-item v-for="friend in friends" :key="friend.id" :friend="friend" class=""/>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {User} from "@/types/User";
import FriendItem from "@/components/Profile/Friends/FriendItem.vue";

const props = defineProps({
  friends: {
    type: Array as PropType<User[]>,
    required: true
  }
})
</script>

<style scoped lang="scss">
.friend-list {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
  margin-top: 12px;
}
</style>