<script lang="ts" setup>
import { ref } from "vue";
import type {User} from "@/types/User";
import type { PropType, Ref } from "vue";
import createPostAPI from "@/components/GlobalBusines/createPost/api";
import {usePostStore} from "@/components/GlobalBusines/PostList/store/postStore";


type propsType = 'user' | 'public'
interface newPost {
  text: string,
  images: Array<File>
}

const props = defineProps({
  user: {
    type: Object as PropType<User | undefined | null>,
    required: false
  },
  public: {
    type: Object,
    required: false
  },
  postFor: {
    type: String as PropType<propsType>,
    required: true
  }
})

const textarea = ref()
const openRequiredContent = ref(false)
const url = `/src/assets/images/users/${props.user?.tag}/`;
const defaultUrl = "/src/assets/images/users/";

const newPost: Ref<newPost> = ref({
  text: '',
  images: []
})
const postStore = usePostStore()
function autoSize() {
  textarea.value.style.height = "auto"
  textarea.value.style.height = textarea.value.scrollHeight + 'px'
}

function createUserPost() {
  if(newPost.value.text.length > 0 || newPost.value.images.length > 0) {
    createPostAPI.createUserPost(props?.user?.tag, props?.user?.id, newPost.value).then(res => {
      console.log(res.data)
      postStore.posts.unshift(res.data)
      newPost.value.images = []
      newPost.value.text = ''
      openRequiredContent.value = false
    })
  }
}

function createPublicPost() {
  if(newPost.value.text.length > 0 || newPost.value.images.length > 0) {
    createPostAPI.createPublicPost(props?.user?.id, newPost.value).then(res => {
      console.log(res.data)
      newPost.value.images = []
      newPost.value.text = ''
    })
  }
}
function setImages(e: any) {
  const images: Array<File> = Array.from(e.target.files)
  images.forEach(el => {
    newPost.value.images.push(el)
  })
}
function removeImageItem(index: number) {
  newPost.value.images.splice(index, 1)
}
</script>

<template>
    <div class="create-post rounded-lg">
      <div class="top-content">
        <div class="user_ico" v-if="user">
          <router-link :to="'/' + user.tag" >
            <img :src="user.profile_photo === 'def.svg' ? defaultUrl + 'def.svg' : url + user.profile_photo" alt="" class="object-cover">
          </router-link>
        </div>
        <textarea class="input" placeholder="Что у вас нового?" @focus="openRequiredContent = true" @input="autoSize()" ref="textarea" v-model="newPost.text"/>
      </div>
      <div class="textarea-options pt-3" v-if="openRequiredContent">
        <v-divider class="pb-3"/>
        <div class="d-flex align-center ga-1 uploaded-image-box">
          <div v-for="(image, index) in newPost.images" :key="index" class="loaded-image d-flex align-center ga-2 uploaded-image">
            {{image?.name}}
            <font-awesome-icon :icon="['fas', 'xmark']" class="cursor-pointer" @click="removeImageItem(index)"/>
          </div>
        </div>
        <div class="options">
          <div class="d-flex ga-3 align-center">
            <v-tooltip text="Изображение" location="top" class="position-relative" style="z-index: 50">
              <template v-slot:activator="{props}">
                <div class="position-relative d-inline-block cursor-pointer">
                  <input type="file" multiple class="inputFile" accept="image/png, image/jpeg" @input="setImages">
                  <font-awesome-icon v-bind="props" :icon="['far', 'image']" style="cursor: pointer; color: gray; font-size: 16px; position: relative;"/>
                </div>
              </template>
            </v-tooltip>
            <v-tooltip text="Видеозапись" location="top">
              <template v-slot:activator="{props}">
                <font-awesome-icon v-bind="props" :icon="['fas', 'video']" style="cursor: pointer; color: gray; font-size: 16px;"/>
              </template>
            </v-tooltip>
            <v-tooltip text="Аудиозапись" location="top">
              <template v-slot:activator="{props}">
                <font-awesome-icon v-bind="props" :icon="['fas', 'music']" style="cursor: pointer; color: gray; font-size: 16px;"/>
              </template>
            </v-tooltip>
          </div>
          <div class="d-flex ga-3 align-center">
            <v-menu
                open-on-hover
                theme="dark"
                location="bottom center"
                :close-on-content-click="false"
            >
              <template v-slot:activator="{ props }">
                <font-awesome-icon :icon="['fas', 'gear']" v-bind="props" style="color: gray; cursor: pointer"/>
              </template>
                <v-list class="pa-3">
                  <div class="option d-flex flex-column ga-2">
                    <div class="d-flex ga-2">
                      <input type="checkbox" name="coments">
                      <label>Оставлять коментарии</label>
                    </div>
                    <div class="d-flex ga-2">
                      <input type="checkbox" name="notification">
                      <label>Не отправлять уведомления</label>
                    </div>
                  </div>
                </v-list>
            </v-menu>
            <v-btn v-if="postFor === 'user'" theme="light" style="text-transform: none" @click="createUserPost">Опубликовать</v-btn>
            <v-btn v-if="postFor === 'public'" theme="light" style="text-transform: none" @click="createPublicPost">Опубликовать</v-btn>
          </div>
        </div>
      </div>
    </div>

</template>

<style lang="scss" scoped>

.uploaded-image-box {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
}
.uploaded-image {
  max-height: 82px;
}
.create-post {
  background-color: #222222;
  max-width: 550px;
  overflow: hidden;
  border: 1px solid var(--lightDar);
  padding: 16px;
  .top-content {
    display: flex;
    gap: 16px;
    .user_ico {
      img {
        border-radius: 50%;
        width: 35px;
        height: 35px;
      }
    }
    .input {
      width: 100%;
      color: white;
      resize: none;
      overflow: hidden;
      &::placeholder {
        user-select: none;
      }
    }
  }
  .options {
    display: flex;
    gap: 16px;
    justify-content: space-between;
  }
}
.inputFile {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  opacity: 0;
  z-index: 5;
  cursor: pointer;
}
.loaded-image {
  border: 1px solid var(--lightDar);
  padding: 6px;
  border-radius: 8px;
  color: white;
  font-size: 12px;
}


</style>