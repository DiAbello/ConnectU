<template>
  <div class="chatItem" @click="$router.push(`/im${1}`)">
    <div class="chatItem__body body">
      <div class="body__img">
        <img src="@/assets/images/users/@egoist/e4b61df4dbc010bdab8f2db1e0b6d495.jpg" alt="">
      </div>
      <div class="body__content content">
        <div class="content__username">
          Павел Павлов
        </div>
        <div class="content__lastMessage">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, architecto autem beatae consequatur deserunt dolorem eos expedita fugiat iusto.
        </div>
      </div>
      <div class="body__helpers helpers">
        <div class="helpers__time">
          24 апр
        </div>
        <div class="helpers__ui">
          <v-menu open-on-hover location="bottom right" theme="dark">
            <template v-slot:activator="{ props }">
              <font-awesome-icon :icon="['fas', 'ellipsis']" class="cursor-pointer" style="color: #656565; font-size: 18px;" v-bind="props"/>
            </template>
            <v-list>
              <v-list-item>
                test
              </v-list-item>
              <v-list-item>
                test
              </v-list-item>
            </v-list>
          </v-menu>
        </div>
      </div>
    </div>
  </div>
  <div class="chatItem">
    <div class="chatItem__body body">
      <div class="body__img">
        <img src="@/assets/images/users/@egoist/e4b61df4dbc010bdab8f2db1e0b6d495.jpg" alt="">
      </div>
      <div class="body__content content">
        <div class="content__username">
          Павел Павлов
        </div>
        <div class="content__lastMessage">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, architecto autem beatae consequatur deserunt dolorem eos expedita fugiat iusto.
        </div>
      </div>
      <div class="body__helpers helpers">
        <div class="helpers__time">
          24 апр
        </div>
        <div class="helpers__ui">
          <v-menu open-on-hover location="bottom right" theme="dark">
            <template v-slot:activator="{ props }">
              <font-awesome-icon :icon="['fas', 'ellipsis']" class="cursor-pointer" style="color: #656565; font-size: 18px;" v-bind="props"/>
            </template>
            <v-list>
              <v-list-item>
                test
              </v-list-item>
              <v-list-item>
                test
              </v-list-item>
            </v-list>
          </v-menu>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {Chat} from "@/components/Messages/types/Chat";

defineProps({
  chat: {
    type: Object as PropType<Chat>
  }
})
</script>

<style scoped lang="scss">
.chatItem {
  &__body {
    padding: 10px 15px 10px 15px;
    cursor: pointer;
    &:hover {
      background-color: var(--lightDar);
    }
  }
}

.body {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  border-bottom: 1px solid var(--lightDar);
  &__img {
    img {
      border-radius: 50%;
      width: 50px;
      height: 50px;
      object-fit: cover;
    }
  }

  &__content {

  }

  &__helpers {
    margin-left: auto;
  }
}

.content {

  &__username {
    font-size: 13px;
    color: #e1e3e6;
    margin: 3px 0 10px 0;
    font-weight: 500;
  }

  &__lastMessage {
    font-size: 13px;
    overflow: hidden;
    color: #939393;
    max-height: 26px;
    max-width: 380px;
    white-space: nowrap;
    text-overflow: ellipsis;
  }
}

.helpers {
  display: flex;
  align-items: center;
  gap: 6px;
  &__time {
    font-size: 10px;
    text-wrap: none;
    width: 100%;
    color: #747474;
    font-weight: 500;
  }

  &__ui {
    visibility: hidden;
  }
}
</style>