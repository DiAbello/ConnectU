<template>
  <div class="post-list">
    <post-item v-for="post in posts" :key="post.id" :post="post"/>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {Post} from "@/components/GlobalBusines/PostList/types/Post";
import PostItem from "@/components/GlobalBusines/PostList/component/PostItem.vue";


const props = defineProps({
  posts: {
    type: Array as PropType<Post[]>,
    required: true
  }
})
</script>

<style scoped lang="scss">
.post-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
</style>