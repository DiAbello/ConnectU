<template>
  <div class="friend cursor-pointer">
    <router-link :to="'/' + friend.tag" class="friend__photo">
      <img :src="senderUrl" alt="">
    </router-link>
    <div class="friend__content content">
      <router-link :to="'/' + friend.tag" class="content__username">
        {{friend.name + ' ' + friend.surname}} <span>Хочет добавить вас в друзья</span>
      </router-link>
      <div class="content__sendMessage">
        <button class="accept" @click="acceptFriendship">
          Принять запрос
        </button>
        <button class="deny" @click="denyFriendship">
          Отклонить
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {User} from "@/types/User";
import { useUserStore } from "@/stores/userStore";
import {useNotificationsStore} from "@/stores/notificationsStore";

const props = defineProps({
  friend: {
    type: Object as PropType<User>,
    required: true
  }
})
const userStore = useUserStore()
const notificationsStore = useNotificationsStore()
const senderUrl = `/src/assets/images/users/${props.friend?.tag}/${props.friend?.profile_photo}`

function acceptFriendship() {
  userStore.acceptFriendship({from: userStore.user?.id, to: props.friend?.id}).then(
      res => {
        notificationsStore.getFriendNotifications(userStore.user?.id)
      }
  )
}
function denyFriendship() {
  userStore.denyFriendship(userStore.user?.id, props.friend?.id).then(res => {
    notificationsStore.getFriendNotifications(userStore.user?.id)
  })
}
</script>

<style scoped lang="scss">

.friend {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  border-bottom: 1px solid var(--lightDar);
  padding-bottom: 8px;
  padding-top: 9px;
  &__photo {
    img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      object-fit: cover;
    }
  }

  &__content {
    flex: 1 1 auto;
  }

  &__interaction {
    padding-top: 10px;
  }
}

.content {
  display: flex;
  flex-direction: column;
  gap: 8px;
  &__username {
    font-size: 14px;
    font-weight: 600;
    letter-spacing: 0.4px;
    color: white;
    span {
      font-size: 10px;
      color: #949494;
      letter-spacing: normal;
      margin-left: 10px;
    }
  }

  &__sendMessage {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 12px;
    color: white;
    .accept {
      padding: 4px 8px;
      background-color: green;
      border-radius: 8px;
    }
    .deny {

    }
  }
}
</style>