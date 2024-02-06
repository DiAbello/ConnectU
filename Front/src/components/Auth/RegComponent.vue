<template>
  <div class="top">
    <div class="top__logo">
      <font-awesome-icon :icon="['far', 'circle']" style="color: #ffffff;" />
    </div>
    <div class="top__title">
      Регистрация
    </div>
    <form class="top-form" @submit.prevent="createUser(user)">
      <MyInput :settings="{required: true, type: 'text', placeholder: 'Введите имя'}" v-model="user.name"/>
      <MyInput :settings="{required: true, type: 'text', placeholder:  'Введите фамилию'}" v-model="user.surname"/>
      <MyInput
          :settings="{required: true, type: 'text', placeholder: invalidAuthentication.tag ? `Введённый тэг уже занят` : 'Введите тэг', errorClass: invalidAuthentication.tag}"
          v-model="user.tag"/>
      <MyInput
          :settings="{required: true, type: 'email', placeholder: invalidAuthentication.email ? 'Введённая почта уже занята' : 'Введите почту', errorClass: invalidAuthentication.email}"
          v-model="user.email"/>
      <MyInput
          :settings="{required: true, type: 'password', placeholder: invalidAuthentication.password ? 'Развные пароли' : 'Введите пароль', errorClass: invalidAuthentication.password}"
          v-model="user.password"/>
      <transition name="slide-fade" mode="out-in">
        <MyInput v-if="user.password.length >= 6"
                 :settings="{required: true, type: 'password', placeholder: 'Подтвердите пароль'}"
                 v-model="user.conPass"/>
      </transition>
      <MyButton
          :settings="{color: 'black', backgroundColor: 'white', type: 'submit'}"
      >
        <div v-if="!isLoading">Зарегестрироваться</div>
        <MySpinner v-else :settings="{fontSize: '15px'}"/>
      </MyButton>
    </form>
  </div>
</template>

<script setup lang="ts">
import {ref, watch} from "vue";
import type {Ref} from 'vue'
import API from "@/API/api";
import type {RegUser} from "@/types/User";

const user: Ref<RegUser> = ref({
  name: '',
  surname: '',
  tag: '',
  email: '',
  password: '',
  conPass: ''
})
const isLoading: Ref<boolean> = ref(false)
const invalidAuthentication = ref({
  tag: false,
  email: false,
  password: false,
})

watch(invalidAuthentication.value, () => {
  setTimeout(() => {
    invalidAuthentication.value.tag = false
    invalidAuthentication.value.email = false
    invalidAuthentication.value.password = false
  }, 3000)
})


const emits = defineEmits([
  'updateLocation'
])

function clearInput() {
  user.value.name = ''
  user.value.surname = ''
  user.value.tag = ''
  user.value.email = ''
  user.value.password = ''
  user.value.conPass = ''
}

function createUser(user: RegUser) {
  if (user.password === user.conPass) {
      isLoading.value = true
      API.createUser(user).then(res => {
        isLoading.value = false
        clearInput()
        if (typeof res.data === 'number') {
          emits('updateLocation')
        } else if (typeof res.data === 'string') {
          if(res.data.split('')[0] === '@') {
            invalidAuthentication.value.tag = true
          } else if (res.data.match('@')) {
            invalidAuthentication.value.email = true
          }
        }
      })
  } else {
    invalidAuthentication.value.password = true
  }
}
</script>

<style scoped lang="scss">
//==============================================================================================
.slide-fade-enter-active {
  transition: all 0.3s ease;
}

.slide-fade-leave-active {
  transition: all 0.3s ease;
}

.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateX(20px);
  opacity: 0;
}

//=============================================================================================
.top {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 15px;
  background-color: var(--dark);
  border-radius: 10px;
  padding: 32px;

  &__logo {
    svg {
      font-size: 56px;
    }
  }

  &__title {
    padding: 16px 0;
    font-size: 20px;
  }
}

.top-form {
  display: flex;
  flex-direction: column;
  gap: 8px;
  align-self: normal;
}

.input {
  background-color: var(--lightDar);
  padding: 8px 12px;
  border-radius: 10px;
  flex: 1 1 auto;
  width: 100%;
  color: white;
  border: 1px solid var(--darkText);
  font-size: 13px;

  &:focus {
    border: 1px solid var(--link);
  }

}
</style>