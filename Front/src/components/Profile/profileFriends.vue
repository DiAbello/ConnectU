<template>
  <div class="profile-friends rounded-lg">
    <div class="friends --online pa-2" v-if="false">
      Друзья онлайн
    </div>
    <v-divider v-if="false"/>
    <div class="friends --all pa-2">
      <router-link :to="'/friends/' + store.selectedProfile?.id" style="color: white" class="d-flex align-center ga-2">
        <div class="title">
          Друзья
        </div>
        <div class="friends_count">
         {{friends.length}}
        </div>
      </router-link>
      <friend-list :friends="friends" v-if="friends.length > 0"/>
      <div v-else class="no-friends">
        Список друзей пуст...
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import FriendList from "@/components/Profile/Friends/FriendList.vue";
import type {PropType} from "vue";
import type {User} from "@/types/User";
import {useUserStore} from "@/stores/userStore";

const props = defineProps({
  friends: {
    type: Array as PropType<User[]>,
    required: true
  }
})
const store = useUserStore()
</script>

<style scoped>
  .profile-friends {
    flex: 1 1 auto;
    height: fit-content;
    max-width: 100%;
    border: 1px solid var(--lightDar);
    padding: 12px;
    background-color: #222222;
    .friends {
      max-width: 320px;
    }
    .no-friends {
      margin-top: 16px;
      font-size: 13px;
      color: #7c7c7c;
    }
    .title {
      font-size: 14px;
      font-weight: 500;
    }
    .friends_count {
      font-size: 12px;
      color: #939393;
    }
  }
</style>