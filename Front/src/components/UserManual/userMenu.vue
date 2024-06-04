<template>
  <div class="user-manual2">
    <v-menu
        v-model="menu"
        :close-on-content-click="false"
        location="bottom right"
    >
      <template v-slot:activator="{ props }">
        <div
            v-bind="props"
            class="d-flex align-center ga-2 user-manual"
            style="user-select: none"
        >
          <div class="user__img">
            <img :src="store.user?.profile_photo === 'def.svg' ? defaultUrl + store.user?.profile_photo : url + store.user?.profile_photo">
          </div>
          <div class="user__dropdown">
            <font-awesome-icon :icon="['fas', 'angle-down']" style="color: #8d8b8b"/>
          </div>
        </div>
      </template>

      <v-card min-width="300" theme="dark">
        <v-hover v-slot="{isHovering, props}">
          <v-list :class="{hovering: isHovering}" v-bind="props" @click="menu = false">
            <router-link :to="'/' + store.user?.tag" class="text-white">
              <v-list-item
                  :prepend-avatar="store.user?.profile_photo === 'def.svg' ? defaultUrl + store.user?.profile_photo : url + store.user?.profile_photo"
                  :title="store.user?.name + ' ' + store.user?.surname"
                  :subtitle="store.user?.tag"
              >
                <template v-slot:append>
                    <font-awesome-icon :icon="['fas', 'angle-right']" />
                </template>
              </v-list-item>
            </router-link>
          </v-list>
        </v-hover>

        <v-divider></v-divider>

        <v-list>
          <v-hover v-slot="{isHovering, props}">
            <router-link to="/settings" class="d-flex align-center ga-2 text-white" :class="{hovering: isHovering}" v-bind="props" @click="menu = false">
            <v-list-item >
                <font-awesome-icon :icon="['fas', 'gear']" style="color: var(--textColor)"/>
                Настройкий
            </v-list-item>
            </router-link>
          </v-hover>

          <v-hover v-slot="{isHovering, props}">
            <v-list-item v-bind="props" :class="{hovering: isHovering}" @click="logout">
              <div class="d-flex align-center ga-2 user-manual size">
                <font-awesome-icon :icon="['fas', 'arrow-right-from-bracket']" style="color: var(--textColor)"/>
                Выйти
              </div>
            </v-list-item>
          </v-hover>
        </v-list>
      </v-card>
    </v-menu>
  </div>
</template>

<script setup lang="ts">
import {ref} from 'vue'
import { useUserStore } from "@/stores/userStore";
import { useRouter } from 'vue-router';
import Cookies from 'universal-cookie';
import {useNotificationsStore} from "@/stores/notificationsStore";

const menu = ref(false)
const notificationsStore = useNotificationsStore()
const store = useUserStore()
const url = `/src/assets/images/users/${store.user?.tag}/`
const defaultUrl = '/src/assets/images/users/'
const router = useRouter()
const cookies = new Cookies(['locale'])

function logout() {
  cookies.remove('user_token')
  router.push({path: '/auth'})
  store.user = null
  store.selectedProfile = null
  store.friends = []
  notificationsStore.notifications.friends = []
  store.userImages = []
}
</script>

<style scoped lang="scss">
.user-manual2 {
  padding: 8px 10px;
  transition: background-color .3s ease;
  &:hover {
    background-color: #333333;
  }
  @media (max-width: 425px) {
    display: none;
  }
}
.hovering {
  background-color: var(--lightDar);
}
  .user-manual {
    cursor: pointer;

    .user__img {
      img {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        object-fit: cover;
      }
    }
  }
  .test {
    background: var(--lightDar) !important;
  }
  .v-item .on-hover {
    background-color: white;
  }
</style>