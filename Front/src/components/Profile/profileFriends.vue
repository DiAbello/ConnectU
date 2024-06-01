<template>
  <div class="profile-friends rounded-lg">
    <div class="friends --online pa-2" v-if="false">
      Друзья онлайн
    </div>
    <v-divider v-if="false"/>
    <div class="friends --all pa-2">
      Друзья
      <friend-list :friends="friends"/>
    </div>
  </div>
</template>

<script setup lang="ts">
import FriendList from "@/components/Profile/Friends/FriendList.vue";
import type {PropType} from "vue";
import type {User} from "@/types/User";

const props = defineProps({
  friends: {
    type: Array as PropType<User[]>,
    required: true
  }
})
</script>

<style scoped>
  .profile-friends {
    flex: 1 0 auto;
    height: fit-content;
    max-width: 100%;
    border: 1px solid var(--lightDar);
    padding: 12px;
    background-color: #222222;
    .friends {
      max-width: 320px;
    }
  }
</style>