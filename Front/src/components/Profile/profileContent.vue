<template>
  <div class="profile-content d-flex flex-column">
    <profile-media></profile-media>
    <create-post v-if="store.user?.id === store.selectedProfile?.id" :user="store.user" :post-for="'user'"></create-post>
    <post-list :posts="postStore.posts" v-if="postStore.posts"/>
  </div>
</template>

<script setup lang="ts">
import ProfileMedia from "@/components/Profile/profileMedia.vue";
import CreatePost from "@/components/GlobalBusines/createPost/createPost.vue";
import {useUserStore} from "@/stores/userStore";
import PostList from "@/components/GlobalBusines/PostList/component/PostList.vue";
import {usePostStore} from "@/components/GlobalBusines/PostList/store/postStore";
import {onMounted} from "vue";
import type {User} from "@/types/User";
import type {PropType} from "vue";

const props = defineProps({
  user: {
    type: Object as PropType<User>,
    required: true
  }
})

const store = useUserStore()
const postStore = usePostStore()

onMounted(() => {
  postStore.getUserPosts(props?.user?.id)
})

</script>

<style scoped>
.profile-content {
  flex: 0 1 550px;
  gap: 16px;
}
</style>