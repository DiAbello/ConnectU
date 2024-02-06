<template>
  <div class="header">
    <div class="wrapper-container">
      <div class="header__content content">
        <div class="d-flex align-center">
          <router-link to="/feed">
            <div class="content__logo">
              <img src="../../../assets/images/logo/connectu-high-resolution-logo-transparent.svg" alt="">
            </div>
          </router-link>
          <SearchComponent/>
          <NotificationsComponent/>
        </div>
          <UserMenu v-if="store.user"/>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import {useUserStore} from "@/stores/userStore";
import UserMenu from '@/components/UserManual/userMenu.vue'
import NotificationsComponent from "@/components/HeaderItem/components/NotificationsComponent.vue";
import SearchComponent from "@/components/HeaderItem/components/SearchComponent.vue";

const store = useUserStore()

</script>

<style scoped lang="scss">
//==========================================================================================================
.slide-fade-enter-active {
  transition: all 0.1s ease-out;
}

.slide-fade-leave-active {
  transition: all 0.1s ease-out;
}

.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateX(5px);
  opacity: 0;
}
//================================================================================================
.header {
  background-color: var(--dark);
  position: sticky;
  top: 0;
  z-index: 50;
  overflow: hidden;
  .wrapper-container {
    max-width: 1135px;
    margin: 0 auto;
    padding: 0 15px;

  }
  &__content {
    height: 50px;
  }
}
.content {
  display: flex;
  align-items: center;
  justify-content:space-between;
  &__user {

  }
  &__logo {
    position: relative;

    img {
      width: 130px;
    }
  }
}

.user {
  display: flex;
  align-items: center;
  cursor: pointer;
  gap: 8px;
  &__img {
    img {
      width: 32px;
      height: 32px;
    }
  }
  &__dropdown {
    position: relative;
  }
}
.dropdown-menu {
  background-color: #292929;
  position: absolute;
  top: 32px;
  right: 0;
  width: fit-content;
  height: fit-content;
  border-radius: 0 0 10px 10px;
}

.menu {
  display: flex;
  flex-direction: column;
  gap: 5px;
  &__profile {
  }

  &__actions {
  }
}

.profile {
  background-color: var(--lightDar);
  border-radius: 10px;
  display: flex;
  align-items: center;
  gap: 8px;
  margin: 16px 16px 0 16px;
  padding: 12px;
  &__img {
    img {
      width: 32px;
      height: 32px;
    }
  }

  &__content {
    display: flex;
    flex-direction: column;
    gap: 2px;
  }

  &__name {
    display: flex;
    align-items: center;
    gap: 3px;
  }

  &__tag {
    color: #828282;
  }
}

.actions {
  display: flex;
  flex-direction: column;
  &__item {
    padding: 8px 16px;
    display: flex;
    gap: 8px;
    align-items: center;
    transition: all 0.3s ease;
    &:last-child{
      margin-bottom: 8px;
    }
    svg {
      font-size: 16px;
    }
    &:hover {
      background-color: var(--lightDar);
    }
  }
}
</style>