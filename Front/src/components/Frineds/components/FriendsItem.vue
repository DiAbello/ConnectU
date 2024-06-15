<template>
  <div class="friend cursor-pointer">
    <router-link :to="'/' + friend.tag" class="friend__photo">
      <img :src="senderUrl" alt="">
    </router-link>
    <div class="friend__content content">
      <router-link :to="'/' + friend.tag" class="content__username">
        {{friend.name + ' ' + friend.surname}}
      </router-link>
      <router-link :to="`/im${friend.id}`" class="content__sendMessage">
        Написать сообщение
      </router-link>
    </div>
    <div class="friend__interaction">
      <v-menu open-on-hover location="bottom left" theme="dark">
        <template v-slot:activator="{ props }">
          <font-awesome-icon :icon="['fas', 'ellipsis']" class="cursor-pointer" style="color: #656565; font-size: 18px;" v-bind="props"/>
        </template>
        <v-list>
          <v-list-item class="cursor-pointer" @click="denyFriendship" v-if="userStore.user?.id === Number(router.currentRoute.value.params.id)">
            Удалить из друзей
          </v-list-item>
        </v-list>
      </v-menu>
    </div>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {User} from "@/types/User";
import { useUserStore } from "@/stores/userStore";
import {useRouter} from "vue-router";

const props = defineProps({
  friend: {
    type: Object as PropType<User>,
    required: true
  }
})
const router = useRouter()
const userStore = useUserStore()
const senderUrl = `/src/assets/images/users/${props.friend?.tag}/${props.friend?.profile_photo}`

function denyFriendship() {
  userStore.denyFriendship(userStore.user?.id, props.friend?.id).then(res => {
    userStore.getAllFriends(Number(router.currentRoute.value.params.id))
  })
}
</script>

<style scoped lang="scss">
.friend {
  display: flex;
  align-items: flex-start;
  gap: 16px;
  border-bottom: 1px solid var(--lightDar);
  padding-bottom: 12px;
  &__photo {
    img {
      width: 80px;
      height: 80px;
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
  padding-top: 10px;
  display: flex;
  flex-direction: column;
  gap: 8px;
  &__username {
    font-size: 14px;
    font-weight: 600;
    letter-spacing: 0.4px;
    color: white;
  }

  &__sendMessage {
    font-size: 12px;
    color: var(--link);
  }
}
</style>