<template>
  <router-link :to="'/' + friend.tag" class="friend-item item">
    <div class="item__photo">
      <img :src="senderUrl" alt="">
    </div>
    <div class="item__username">
      {{friend.name}}
    </div>
  </router-link>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {User} from "@/types/User";

const props = defineProps({
  friend: {
    type: Object as PropType<User>,
    required: true
  }
})
const senderUrl = `/src/assets/images/users/${props.friend?.tag}/${props.friend?.profile_photo}`

</script>

<style scoped lang="scss">
.friend-item {
}

.item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
  &__photo {
    img {
      width: 64px;
      height: 64px;
      border-radius: 50%;
      object-fit: cover;
    }
  }

  &__username {
    color: white;
    font-size: 13px;
  }
}
</style>