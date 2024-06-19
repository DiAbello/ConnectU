<script lang="ts" setup>
import type {PropType} from "vue";
import type {User} from "@/types/User";
import FriendNotification from "@/components/HeaderItem/components/FriendNotification.vue";

const props = defineProps({
  ntFriends: {
    type: Array as PropType<User[]>,
    required: false
  }
})
</script>

<template>
  <div class="content__notifications notification">
    <v-menu :close-on-content-click="false" location="bottom left">
      <template v-slot:activator="{ props }">
        <div class="icon" v-if="ntFriends && ntFriends?.length > 0">
          <span>{{ntFriends?.length}}</span>
        </div>
        <font-awesome-icon :icon="['fas', 'bell']" v-bind="props" class="notification__icon" style="color: #6F6F6F; font-size: 18px"/>
      </template>
      <v-list theme="dark" width="470px" height="auto" class="pa-3" style="border: 1px solid var(--lightDar); border-top: none; border-top-left-radius: 0px; border-top-right-radius: 0px; background-color: #292929" v-if="ntFriends && ntFriends?.length > 0">
        <friend-notification v-for="friend in ntFriends" :key="friend.id" :friend="friend"/>
      </v-list>
      <v-list theme="dark" width="470px" height="auto" class="pa-3" style="border: 1px solid var(--lightDar); border-top: none; border-top-left-radius: 0px; border-top-right-radius: 0px; background-color: #292929" v-else>
        Новых уведомлений пока что нет...
      </v-list>
    </v-menu>
  </div>
</template>

<style scoped lang="scss">
.icon {
  position: absolute;
  top: 10%;
  right: 0;
  span {
    padding: 2px 5px;
    background-color: red;
    border-radius: 50%;
    font-size: 12px;
  }
}
.notification {
  position: relative;
  @media (max-width: 425px) {
    //display: none;
  }
  &__icon {
    cursor: pointer;
    margin-left: 15px;
    padding: 16px 15px;
    &:hover {
      background-color: #333333;
    }
    @media (max-width: 425px) {
      margin-left: 0;
      padding: 16px 4px;
    }
  }
}

</style>