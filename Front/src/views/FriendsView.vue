<template>
  <div class="friends">
    <div class="friends__body rounded-lg">
      <div class="switch-friends">
        <div class="--all">
          Все друзья
          <span>{{store.friends.length}}</span>
        </div>
      </div>
      <div class="search-friends">
        <div class="search-label">
          <input type="text" placeholder="Посик друзей" class="input">
          <font-awesome-icon :icon="['fas', 'magnifying-glass']" class="search-icon"/>
        </div>
      </div>
      <FriendsList :friends="store.friends"/>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from "vue-router";
import {onMounted, onUnmounted} from "vue";
import FriendsList from "@/components/Frineds/components/FriendsList.vue";
import { useUserStore } from "@/stores/userStore";

const router = useRouter()
const store = useUserStore()

onMounted(() => {
  store.getAllFriends(Number(router.currentRoute.value.params.id))
})
onUnmounted(() => {
  store.friends = []
})
</script>

<style scoped lang="scss">
.friends {
  flex: 0 1 550px;
  &__body {
    background-color: #222222;
    border: 1px solid var(--lightDar);
    .switch-friends {
      padding: 16px 20px;
      display: flex;
      align-items: center;
      .--all {
        cursor: pointer;
        padding: 6px 10px;
        background-color: #333333;
        font-weight: 600;
        font-size: 13px;
        border-radius: 8px;
        span {
          color: #939393;
          margin-left: 3px;
        }
      }
    }
    .search-friends {
      padding: 0 20px 18px 20px;
      .search-label {
        display: flex;
        align-items: center;
        .input {
          border: 1px solid #595959;
          border-right: none;
          border-radius: 6px 0 0 6px;
          width: 100%;
          padding: 8px 12px;
          color: white;
        }
        .search-icon {
          cursor: pointer;
          padding: 9px 20px;
          border: 1px solid #595959;
          border-radius: 0 6px 6px 0;
          background-color: #393939;
          color: #828282;
          transition: all 0.3s ease;
          &:hover {
            background-color: #545454;
            color: #a4a4a4;
          }
        }
      }
    }
    .friend-list {
      padding: 0 20px 15px 20px;
    }
  }
}
</style>