<script lang="ts" setup>
import {computed, type PropType, type Ref} from "vue";
import type {Post} from "@/components/GlobalBusines/PostList/types/Post";
import {onMounted, ref} from "vue";
import getPostImages from "@/components/GlobalBusines/PostList/api/getPostImages";
import ImageSlider from "@/components/GlobalBusines/imageSlider.vue";
import convertDate from "@/functions/dateConvert";
import type {Image} from "@/types/Image";
import {useUserStore} from "@/stores/userStore";
import {usePostStore} from "@/components/GlobalBusines/PostList/store/postStore";

const props = defineProps({
  post: {
    type: Object as PropType<Post>,
    required: true
  },
})
const postImages: Ref<Array<Image>> = ref([])
const url = `/src/assets/images/users/${props.post?.tag}/`;
const userStore = useUserStore()
const postStore = usePostStore()

const userInfo = {
  tag: props.post?.tag,
  name: props.post?.name,
  surname: props.post?.surname,
  profile_photo: props.post?.profile_photo
}

onMounted(() => {
  getPostImages(props?.post?.id).then(res => {
    postImages.value = res.data
    console.log(postImages.value.length)
  })
})


const test = computed(() => {
  return postImages.value.length
})

</script>

<template>
  <div class="post rounded-lg">
    <div class="post__header header">
      <div class="header__author">
        <router-link :to="'/' + post?.tag" style="color: white">
          <div class="avatar d-flex align-center ga-2">
            <img :src="url + post?.profile_photo" alt="" class="object-cover">
            <div class="d-flex flex-column ga-1">
              <div>
                {{post?.name + ' ' + post?.surname}}
              </div>
              <div style="color: #B9B9B9; font-size: 12px;">
                {{post?.created_at ? convertDate(post?.created_at) : ''}}
              </div>
            </div>
          </div>
        </router-link>
      </div>
      <div class="header__options">
        <v-menu open-on-hover location="bottom right" theme="dark">
          <template v-slot:activator="{ props }">
            <font-awesome-icon :icon="['fas', 'ellipsis']" class="cursor-pointer" style="color: #656565; font-size: 18px;" v-bind="props"/>
          </template>
          <v-list>
            <v-list-item class="cursor-pointer" v-if="post?.tag === userStore.user?.tag" @click="postStore.deletePost(post.id)">
              Удалить
            </v-list-item>
            <v-list-item class="cursor-pointer" v-if="post?.tag === userStore.user?.tag">
              Редактировать
            </v-list-item>
          </v-list>
        </v-menu>
      </div>
    </div>
    <div class="post__content content">
      {{post.content}}
    </div>
    <div class="post__images images d-flex flex-wrap ga-1" >
      <image-slider
          :image-size="{width: '200px', height: '300px'}"
          :is-required-short="true"
          :images="postImages"
          :slider-for="'post'"
          :user-info="userInfo"
      />
    </div>
    <div class="post__interaction interaction">
      <div class="interaction__likes d-flex align-center ga-2 ">
        <font-awesome-icon :icon="['far', 'heart']" style="font-size: 16px"/>
        {{post.like_count}}
        <v-tooltip activator="parent" location="top">
          Нравится
        </v-tooltip>
      </div>
      <div class="interaction__comments d-flex align-center ga-2">
        <font-awesome-icon :icon="['far', 'message']" style="font-size: 16px"/>
        <v-tooltip activator="parent" location="top">
          Коментарии
        </v-tooltip>
      </div>
      <div class="interaction__share d-flex align-center ga-2">
        <font-awesome-icon :icon="['fas', 'share']" style="font-size: 16px"/>
        <v-tooltip activator="parent" location="top">
          Поделиться
        </v-tooltip>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>



//=================================================================================
  .post {
    background-color: #222222;
    border: 1px solid var(--lightDar);
    padding: 16px 18px;
    display: flex;
    max-width: 550px;
    gap: 12px;
    flex-direction: column;
    overflow: hidden;
    &__header {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    &__content {
    }

    &__images {
    }
    &__interaction {
      display: flex;
      align-items: center;
      color: #B2B2B2;
      font-weight: 500;
      font-size: 14px;
      gap: 8px;
      user-select: none;
    }
  }
  .interaction {
    &__likes {
      background-color: #333333;
      border-radius: 16px;
      padding: 6px 12px;
      cursor: pointer;
      transition: background-color .3s ease;
      &:hover {
        background-color: #3d3d3d;
      }
    }

    &__comments {
      background-color: #333333;
      border-radius: 16px;
      padding: 6px 12px;
      cursor: pointer;
      transition: background-color .3s ease;
      &:hover {
        background-color: #3d3d3d;
      }
    }

    &__share {
      background-color: #333333;
      border-radius: 16px;
      padding: 6px 12px;
      cursor: pointer;
      transition: background-color .3s ease;
      &:hover {
        background-color: #3d3d3d;
      }
    }
  }

  .header {
    &__author {
      img {
        width: 30px;
        height: 30px;
        border-radius: 50%;
      }
    }
  }

  .content {
  }

  .post {

  }

</style>