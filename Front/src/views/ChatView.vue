<template>
  <div class="chat rounded-lg">
    <div class="chat__header header">
      <div class="header__back back" @click="router.push('/im')">
        <font-awesome-icon :icon="['fas', 'angle-left']" />
        <div class="back__text">
          Назад
        </div>
      </div>
      <div class="header__person person">
        <router-link :to="'/' + chatStore.user.tag" class="person__username" v-if="chatStore.user.name">
          {{chatStore?.user.name + ' ' + chatStore.user.surname}}
        </router-link>
      </div>
      <div class="header__ui ui">
        <router-link :to="'/' + chatStore.user.tag" class="ui__img" v-if="chatStore.user.profile_photo">
          <img :src="chatStore.profileImageUrl" alt="">
        </router-link>
      </div>
    </div>
    <div class="chat__body body">
      <MySpinner :settings="{fontSize: '24px', color: 'white'}" v-if="isChatLoading" style="margin-top: 120px; text-align: center"/>
      <MessageList :messages="chatStore.messages" v-if="chatStore.messages.length > 0 && !isChatLoading"/>
      <div v-else-if="!isChatLoading && chatStore.messages.length < 1" class="text-center mt-4 text-grey-darken-1">
        Сообщений пока нет. Начните писать и всё появится
      </div>
    </div>
    <div class="chat__sendMessage sendMessage">
      <div class="sendMessage__attach attach cursor-pointer">
        <v-menu open-on-hover location="bottom right" theme="dark">
          <template v-slot:activator="{ props }">
            <font-awesome-icon :icon="['fas', 'paperclip']" class="attach__icon" style="color: #656565; font-size: 22px;" v-bind="props"/>
          </template>
          <v-list>
            <v-list-item class="cursor-pointer">
              Удалить
            </v-list-item>
            <v-list-item class="cursor-pointer">
              Редактировать
            </v-list-item>
          </v-list>
        </v-menu>
      </div>
      <div class="sendMessage__input sndInput">
          <input type="text" class="sndInput__input" placeholder="Напишите сообщение..." v-model="messageText" @keyup.enter="sendMessage">
      </div>
      <div class="sendMessage__button sndButton cursor-pointer" @click="sendMessage">
        <font-awesome-icon :icon="['fas', 'paper-plane']" style="color: #898989" class="sndButton__button"/>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import {useRouter} from "vue-router";
import {onMounted, onUnmounted, ref} from "vue";
import { useChatsStore } from "@/components/Messages/store/chatsStore";
import {useUserStore} from "@/stores/userStore";
import MessageList from "@/components/Messages/components/MessageList/MessageList.vue";

const chatStore = useChatsStore()
const userStore = useUserStore()
const router = useRouter()
const messageText = ref<string>('')
const isChatLoading = ref(false)

onMounted(() => {
  isChatLoading.value = true
  chatStore.setUser(Number(router.currentRoute.value.params.chatId)).then(() => {
    chatStore.getMessages({person1: userStore.user?.id, person2: chatStore.user.id}).then(() => {
      isChatLoading.value = false
    })
  })
})

function sendMessage() {
  if(messageText.value.length > 0) {
    chatStore.sendMessage({content: messageText.value, sender: userStore.user?.id, getter: chatStore.user.id})
    messageText.value = ''
    chatStore.getMessages({person1: userStore.user?.id, person2: chatStore.user.id}).then(() => {
      chatStore.getChats(userStore.user?.id)
    })
  }
}

onUnmounted(() => {
  chatStore.user = {}
  chatStore.messages = []
})
</script>

<style scoped lang="scss">
.chat {
  flex: 0 1 550px;
  border: 1px solid var(--lightDar);
  background-color: var(--dark);
  display: flex;
  flex-direction: column;
  height: 90vh;
  @media (max-width: 425px) {
    height: 83vh;
  }
  &__header {
    position: sticky;
    top: 0;
    left: 0;
  }

  &__body {
    flex-grow: 1;
  }

  &__sendMessage {
  }
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-bottom: 1px solid var(--lightDar);
  &__back {
  }

  &__person {
  }

  &__ui {
  }
}

.back {
  display: flex;
  align-items: center;
  padding: 10px 0 10px 15px;
  cursor: pointer;
  gap: 12px;
  color: #828282;
  transition: color 0.3s ease;
  &:hover {
    color: #d7d7d7;
  }
  &__text {
  }
}

.person {
  &__username {
    font-size: 13px;
    color: #e1e3e6;
    font-weight: 500;
  }
}

.ui {
  padding: 10px 15px 10px 0;
  &__img {
    img {
      width: 30px;
      height: 30px;
      border-radius: 50%;
      object-fit: cover;
    }
  }
}

.body {
  overflow: auto;
  padding: 16px;
  -ms-overflow-style: none;
  scrollbar-width: none;
  &::-webkit-scrollbar {
    display: none;
  }
}

.sendMessage {
  background-color: #292929;
  display: flex;
  align-items: center;
  border-top: 1px solid var(--lightDar);
  &__attach {
  }
  &__input {
    flex: 1 1 auto;
  }
  &__button {
  }
}
.attach__icon {
  transition: color 0.3s ease;
}
.attach {
  padding: 20px 16px 15px 20px;
  font-size: 16px;
  &:hover {
    .attach__icon {
      color: #b2b2b2 !important;
    }
  }
}
.sndInput {
  &__input {
    color: white;
    width: 100%;
    border: 1px solid #898989;
    border-radius: 4px;
    padding: 8px 0 8px 13px;
    font-size: 13px;
    font-weight: 400;
    margin: 12px 0;
    &::placeholder {
      user-select: none;
    }
  }
}
.sndButton {
  padding: 15px 16px 15px 16px;
  &:hover {
    .sndButton__button {
      color: #e3e3e3 !important;
    }
  }
  &__button {
    font-size: 16px;
    transition: color 0.3s ease;

  }
}
</style>