<template>
  <div class="friend-list">
    <FriendsItem v-for="friend in friends" :key="friend.id" :friend="friend"/>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {User} from "@/types/User";
import FriendsItem from "@/components/Frineds/components/FriendsItem.vue";

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
  flex-direction: column;
  gap: 16px;
}
</style>