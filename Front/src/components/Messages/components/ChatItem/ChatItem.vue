<template>
  <div class="chatItem" @click="$router.push(`/im${chat?.id}`)">
    <div class="chatItem__body body" :class="{ newMessage: chat?.userId !== userStore.user?.id }">
      <div class="body__img">
        <img :src="url" alt="">
      </div>
      <div class="body__content content">
        <div class="content__username">
          {{chat?.name + ' ' + chat?.surname}}
        </div>
        <div class="content__lastMessage" v-if="chat?.userId !== userStore.user?.id">
          {{chat?.content}}
        </div>
        <div class="content__lastMessage myMessage" v-else>
          <img :src="authUserUrl" alt="">
          {{chat?.content}}
        </div>
      </div>
      <div class="body__helpers helpers">
        <div class="helpers__time">
          24 апр
        </div>
        <div class="helpers__count" v-if="chat?.userId !== userStore.user?.id">
          1
        </div>
        <div class="helpers__ui">
          <v-menu open-on-hover location="bottom right" theme="dark">
            <template v-slot:activator="{ props }">
              <font-awesome-icon :icon="['fas', 'ellipsis']" class="cursor-pointer" style="color: #656565; font-size: 18px;" v-bind="props"/>
            </template>
            <v-list>
              <v-list-item>
                test
              </v-list-item>
              <v-list-item>
                test
              </v-list-item>
            </v-list>
          </v-menu>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {Chat} from "@/components/Messages/types/Chat";
import {useUserStore} from "@/stores/userStore";

const props = defineProps({
  chat: {
    type: Object as PropType<Chat>
  }
})
const userStore = useUserStore()
const url = `/src/assets/images/users/${props.chat?.tag}/${props.chat?.profile_photo}`
const authUserUrl = `/src/assets/images/users/${userStore.user?.tag}/${userStore.user?.profile_photo}`
</script>

<style scoped lang="scss">
.newMessage {
  background-color: #333333 !important;
}
.myMessage {
  display: flex;
  align-items: center;
  gap: 6px;
}
.chatItem {
  &__body {
    padding: 10px 15px 10px 15px;
    cursor: pointer;
    &:hover {
      background-color: #333333;
    }
  }
}

.body {
  display: flex;
  align-items: flex-start;
  gap: 16px;
  border-bottom: 1px solid var(--lightDar);
  &__img {
    img {
      border-radius: 50%;
      width: 50px;
      height: 50px;
      object-fit: cover;
    }
  }

  &__content {

  }

  &__helpers {
    margin-left: auto;
  }
}

.content {

  &__username {
    font-size: 13px;
    color: #e1e3e6;
    margin: 3px 0 10px 0;
    font-weight: 500;
  }

  &__lastMessage {
    font-size: 13px;
    overflow: hidden;
    color: #939393;
    max-height: 26px;
    max-width: 380px;
    white-space: nowrap;
    text-overflow: ellipsis;
    img {
      border-radius: 50%;
      object-fit: cover;
      width: 20px;
      height: 20px;
    }
  }
}

.helpers {
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  gap: 6px;
  &__time {
    font-size: 10px;
    text-wrap: none;
    width: 100%;
    color: #747474;
    font-weight: 500;
  }
  &__count {
    background-color: #E1E3E6;
    border-radius: 50%;
    padding: 3px 6px;
    font-size: 12px;
    color: black;
  }

  &__ui {
    visibility: hidden;
  }
}
</style>