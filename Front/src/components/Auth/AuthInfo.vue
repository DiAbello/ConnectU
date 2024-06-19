<template>
  <div class="info">
    <div class="info__content content">
      <div class="content__recentUsers recentUsers">
        <div class="recentUsers__title">
          Недавно входили на сайт с этого компьютера
        </div>
        <div class="recentUsers__subtitle">
          Нажмите на фотографию или имя, чтобы войти
        </div>
        <div class="recentUsers__users users">
          <transition-group name="list">
            <div class="users__item" v-for="user in store.localUsers" :key="user.id">
              <div class="close" @click.prevent="store.deleteLocalUser(user.id)">
                <font-awesome-icon :icon="['fas', 'xmark']" style="color: #949494" />
              </div>
              <div class="users__img imgActive" @click="setUser(user)">
                <img :src="path + user.tag + '/' + user.profile_photo" alt="">
              </div>
              <div class="users__name userActive">
                {{user.name}} {{user.surname}}
              </div>
            </div>
          </transition-group>
          <div class="users__item">
            <div class="users__img">
              <font-awesome-icon :icon="['fas', 'plus']" class="icon" style="color: #828282" />
            </div>
            <div class="users__name">
              Войдите в другой аккаунт
            </div>
          </div>
        </div>
      </div>
      <div class="content__mobile-promo mobile-promo">
          <div class="mobile-promo__info">
            <div class="mobile-promo__title">
              ConnectU для мобильных устройств
            </div>
            <div class="mobile-promo__text">
              Скачать для iOS из App Store или Android из Google Play и RuStore
            </div>
          </div>
          <div class="mobile-promo__img">
            <img src="@/assets/images/auth/auth-promo.png" alt="">
          </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import {useUserStore} from "@/stores/userStore";
import type {User} from "@/types/User";
import {onMounted, ref} from "vue";
import Cookies from "universal-cookie";
import {useRouter} from "vue-router";
import API from "@/API/api";
import {useNotificationsStore} from "@/stores/notificationsStore";
import {useChatsStore} from "@/components/Messages/store/chatsStore";


const store = useUserStore()
const path = `/src/assets/images/users/`
const cookies = new Cookies(['locale'])
const router = useRouter()
const notificationsStore = useNotificationsStore()
const chatsStore = useChatsStore()

onMounted(() => {
  store.setLocalUsers()
})

function setUser(user: User) {
  cookies.set('user_token', user.remember_token)
  store.user = user
  router.push({path: '/feed'})
    notificationsStore.getFriendNotifications(store.user?.id).then(() => {
      chatsStore.getChats(store.user?.id)
    })
}
</script>

<style scoped lang="scss">
//==================================================================================================

.list-enter-active,
.list-leave-active {
  transition: all 0.5s ease;
}
.list-enter-from,
.list-leave-to {
  opacity: 0;
  transform: translateY(30px);
}

//===================================================================================================
.userActive {
  color: white !important;
}
.imgActive {
  background: none !important;
}
.info {
  flex: 0 1 60%;
  &__content {
  }
}

.content {
  display: flex;
  flex-direction: column;
  &__recentUsers {
    margin-top: 15px;
  }

  &__mobile-promo {
    margin-top: 15px;

  }
}

.recentUsers {
  background-color: var(--dark);
  padding: 32px;
  border-radius: 10px;
  &__title {
    font-size: 20px;
    margin-bottom: 6px;
  }

  &__subtitle {
    font-size: 14px;
    color: var(--darkText);
  }

  &__users {
    margin-top: 20px;
  }
}

.users {
  display: flex;
  align-items: center;
  gap: 15px;
  flex-wrap: wrap;
  &__item {
    border: 1px solid var(--lightDar);
    border-radius: 10px;
    user-select: none;
    padding: 16px;
    display: flex;
    flex-direction: column;
    align-items: center;
    cursor: pointer;
    transition: all 0.3s ease;
    gap: 16px;
    position: relative;
    .close {
      position: absolute;
      width: 15px;
      height: 15px;
      top: 0;
      right: 0;
      margin: 8px;
      display: flex;
      align-self: center;
      justify-content: center;
    }
    &:hover {
      background-color: var(--lightDar);
      img {
      }
    }
  }

  &__img {
    background-color: var(--lightDar);
    border-radius: 50%;
    width: 80px;
    height: 80px;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    .icon {
      font-size: 26px;
    }
    img {
      position: absolute;
      width: 100%;
      height: 100%;
      border-radius: 50%;
      top: 0;
      left: 0;
      object-fit: cover;
    }
  }

  &__name {
    color: var(--darkText);
    width: 150px;
    height: 28px;
    text-align: center;
  }
}


.mobile-promo {
  display: flex;
  background-color: var(--dark);
  justify-content: space-between;
  padding: 32px 32px 32px 32px;
  border-radius: 10px;
  &__info {
    display: flex;
    flex-direction: column;
    gap: 16px;
    flex: 0 1 30%;
    justify-content: center;
  }

  &__title {
    font-size: 20px;
    line-height: 110%;
    font-weight: 500;
  }

  &__text {
    font-size: 14px;
    color: var(--darkText);
  }

  &__img {
    flex: 0 1 70%;
    display: flex;
    justify-content: flex-end;
    img {
      margin-bottom: -32px;
    }
  }
}
</style>