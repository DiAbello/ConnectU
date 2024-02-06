<template>
  <div class="log">
    <div class="log__logo">
      <font-awesome-icon :icon="['far', 'circle']" style="color: #ffffff;" />
    </div>
    <div class="log__title">
      Вход
    </div>
    <form class="log-form" @submit.prevent="startSession(user)">
      <MyInput
          :settings="{type: 'email', placeholder: invalidLog ? 'Неверный логин или пароль' : 'Введите почту', required: true, errorClass: invalidLog}"
          v-model="user.email"
      />
      <MyInput
          :settings="{type: 'password', placeholder: 'Введите пароль', required: true}"
          v-model="user.password"
      />
      <MyButton
          :settings="{color: 'white', backgroundColor: '#4BB34B', type: 'submit'}"
      >
        <div v-if="!isLoading">Войти</div>
        <MySpinner v-else :settings="{fontSize: '15px', color: 'white'}"/>
      </MyButton>
    </form>
  </div>
</template>

<script setup lang="ts">
import {ref, watch} from "vue";
import type {Ref} from 'vue'
import type {LogUser} from "@/types/User";
import API from "@/API/api";
import {useUserStore} from "@/stores/userStore";
import Cookies from "universal-cookie";
import useStorage from "@/localStorage/useStorage";
import {useRouter} from "vue-router";

const store = useUserStore()
const cookies = new Cookies(['locale'])
const router = useRouter()

const user: Ref<LogUser> = ref({
  email: '',
  password: '',
})

const invalidLog: Ref<boolean> = ref(false)
const isLoading: Ref<boolean> = ref(false)

function clearInput() {
  user.value.email = ''
  user.value.password = ''
}

watch(invalidLog, () => {
  setTimeout(() => {
    invalidLog.value = false
  }, 3000)
})

function startSession(user: LogUser) {
  isLoading.value = true
  API.getUser(user).then(res => {
    store.getUsersProfile(res.data.tag)
    clearInput()
    isLoading.value = false
    if (res.data instanceof Object) {
      store.user = res.data
      cookies.set('user_token', res.data.remember_token)
      if (JSON.parse(localStorage.getItem('local_users') || 'null') === null || JSON.parse(localStorage.getItem('local_users') || '[]').length < 1) {
        localStorage.setItem('local_users', JSON.stringify([res.data]))
      } else {
        useStorage.Storage(res.data)
      }
      router.push({path: '/feed'})
      store.setLocalUsers()
    } else {
      invalidLog.value = true
    }
  })
}
</script>

<style scoped lang="scss">
.log {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 15px;
  background-color: var(--dark);
  border-radius: 10px;
  padding: 32px;

  &__logo {
    svg {
      font-size: 50px;
      font-weight: 800;
    }
  }

  &__title {
    padding: 16px 0;
    font-size: 20px;
  }
}

.log-form {
  display: flex;
  flex-direction: column;
  gap: 8px;
  align-self: normal;
}


</style>