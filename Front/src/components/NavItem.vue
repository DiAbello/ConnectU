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
            <router-link to="/im" class="nav__link">
              <font-awesome-icon :icon="['far', 'comment']" style="color: var(--textColor)"/>
              <span>Сообщения</span>
            </router-link>
          </li>
          <li class="nav__item">
            <router-link to="/friends" class="nav__link">
              <font-awesome-icon :icon="['fas', 'user-group']" style="color: var(--textColor)"/>
              <span>Друзья</span>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import {useUserStore} from "@/stores/userStore";

const store = useUserStore()
</script>

<style scoped lang="scss">

  .active {
    color: #1DA1F2 !important;
  }
  .nav {
    flex: 0 0 164px;
    color: white;
    position: relative;
    z-index: 30;

    &__content {
      display: flex;
      flex-direction: column;
      padding-top: 10px;
    }

    &__list {
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
      }
    }

    &__link {
      color: white;
      display: flex;
      align-items: center;
      span {
        font-size: 12px;
        letter-spacing: 0.3px;
        font-weight: 400;
        margin-left: 10px;
      }
    }
  }
</style>