<template>
  <friend-item v-for="friend in friends" :key="friend.id">
    {{friend}}
  </friend-item>
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

<style scoped>

</style>