<template>
  <div class="profile" v-if="store.user && store.selectedProfile">
    <ProfileHeader 
    :user="store.selectedProfile" 
    v-if="store.selectedProfile"
    />
    <div class="d-flex profile-bottom">
      <ProfileContent :user="store.selectedProfile"/>
      <ProfileFriends :friends="store.friends"/>
    </div>
  </div>
</template>

<script setup lang="ts">
import ProfileHeader from "@/components/Profile/ProfileHeader.vue";
import { useUserStore } from "@/stores/userStore";
import ProfileContent from "@/components/Profile/profileContent.vue";
import ProfileFriends from "@/components/Profile/profileFriends.vue";
import { onMounted, onUnmounted } from "vue";
import { useRoute } from "vue-router";
import {usePostStore} from "@/components/GlobalBusines/PostList/store/postStore";

const store = useUserStore()
const route = useRoute()
const postStore = usePostStore()

onMounted(() => {
    store.getUsersProfile(route.path.replace('/', ''))
    store.getAllFriends(store.selectedProfile?.id)
})

onUnmounted(() => {
  store.selectedProfile = null
  console.log('Удаляю пользователя при смене profileview')
  store.userImages = []
  postStore.posts = []
})
</script>

<style scoped lang="scss">
  .profile {
    flex: 0 0 911px;
    .profile-bottom {
      padding: 16px 0;
      gap: 16px;
    }
  }
</style>