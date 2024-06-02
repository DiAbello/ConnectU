<script setup lang="ts">
import CreatePost from "@/components/GlobalBusines/createPost/createPost.vue";
import {useUserStore} from "@/stores/userStore";
import PostList from "@/components/GlobalBusines/PostList/component/PostList.vue";
import {usePostStore} from "@/components/GlobalBusines/PostList/store/postStore";
import {onMounted, onUnmounted, ref, type Ref} from "vue";

const userStore = useUserStore()
const postStore = usePostStore()

onMounted(() => {
  postStore.getAllPosts()
})
onUnmounted(() => {
  console.log('Демонтирую посты')
  postStore.posts = []
})

</script>

<template>
  <div class="feed">
    <div class="mb-4">
      <create-post :post-for="'user'" :user="userStore.user" v-if="userStore.user"/>
    </div>
    <post-list :posts="postStore.posts" v-if="postStore.posts"/>
  </div>
</template>

<style lang="scss" scoped>
.feed {
flex: 0 1 550px;
}
</style>
