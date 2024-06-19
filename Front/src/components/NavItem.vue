<template>
  <div class="nav">
    <div class="nav__content">
      <div class="nav__menu">
        <ul class="nav__list">
          <li class="nav__item">
            <router-link :to="'/' + store.user?.tag" class="nav__link">
              <font-awesome-icon :icon="['far', 'circle-user']" style="color: var(--textColor)"/>
              <span>Моя страница</span>
            </router-link>
          </li>
          <li class="nav__item">
            <router-link to="/feed" class="nav__link">
              <font-awesome-icon :icon="['fas', 'newspaper']" style="color: var(--textColor)"/>
              <span>Новости</span>
            </router-link>
          </li>
          <li class="nav__item">
            <router-link to="/im" class="nav__link messages">
              <font-awesome-icon :icon="['far', 'comment']" style="color: var(--textColor)"/>
              <span>Сообщения</span>
                <span class="newMessagesCount" v-if="newMessagesCount > 0">
                {{newMessagesCount}}
                </span>
            </router-link>
          </li>
          <li class="nav__item">
            <router-link :to="'/friends/' + store.user?.id" class="nav__link messages">
              <font-awesome-icon :icon="['fas', 'user-group']" style="color: var(--textColor)"/>
              <span>Друзья</span>
              <span class="newMessagesCount" v-if="newFriendsCount > 0">
                {{newFriendsCount}}
                </span>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import {useUserStore} from "@/stores/userStore";
import {useChatsStore} from "@/components/Messages/store/chatsStore";
import {computed} from "vue";
import {useNotificationsStore} from "@/stores/notificationsStore";

const store = useUserStore()
const chatStore = useChatsStore()
const notificationsStore = useNotificationsStore()

const newMessagesCount = computed(() => {
  let count = 0;
  chatStore.chats.forEach(el => {
    if(el.userId !== store.user?.id) {
      count++
    }
  })
  return count
})
const newFriendsCount = computed(() => {
  return notificationsStore.notifications.friends.length;
})
</script>

<style scoped lang="scss">
.messages {
  position: relative;
  .newMessagesCount {
    background-color: #828282;
    font-size: 12px;
    padding: 4px 6px;
    border-radius: 50%;
    margin-left: auto;
    @media (max-width: 425px) {
      position: absolute;
      top: -6px;
      right: 15px;
      background-color: red;
    }
  }
}

  .active {
    color: #1DA1F2 !important;
  }
  .nav {
    flex: 0 0 164px;
    color: white;
    position: relative;
    z-index: 30;
    @media (max-width: 425px) {
      flex: 1 1 auto;
      position: fixed;
      width: 100%;
      bottom: 0;
      left: 0;
      background-color: #222222;
    }

    &__content {
      display: flex;
      flex-direction: column;
      padding-top: 10px;
      @media (max-width: 425px) {
        padding: 0;
      }
    }

    &__list {
      @media (max-width: 425px) {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 15px;
      }
    }

    &__item {
      padding: 8px 5px;
      transition: background-color .3s ease;
      border-radius: 8px;
      &:hover {
        background-color: #333333;
      }
      svg {
        font-size: 18px;
        @media (max-width: 425px) {
          font-size: 22px;
        }
      }
    }

    &__link {
      color: white;
      display: flex;
      align-items: center;
      gap: 4px;
      @media (max-width: 425px) {
        flex-direction: column;
      }
      span {
        font-size: 12px;
        letter-spacing: 0.3px;
        font-weight: 400;
        margin-left: 10px;
        @media (max-width: 425px) {
          margin: 0;
        }
      }
    }
  }
</style>