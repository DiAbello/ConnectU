<script lang="ts" setup>
import { useDebouncedInput } from "@/components/HeaderItem/helpers/debounce";
import {ref, watch} from "vue";

const { inputValue, handleInput, queryResponse } = useDebouncedInput(700);
const queryStatus = ref(false)
const url = `/src/assets/images/users/`;

watch(queryResponse, () => {
  queryStatus.value = false
})
</script>

<template>
  <v-menu :close-on-content-click="true" theme="dark" location="bottom left">
    <template v-slot:activator="{props}">
      <label class="d-flex align-center input-label" v-bind="props">
        <font-awesome-icon :icon="['fas', 'magnifying-glass']" style="color: #757575"/>
        <input type="text" class="input" placeholder="Поиск" @input="handleInput" v-model="inputValue" @keydown="queryStatus = true">
      </label>
    </template>
    <v-list style="border: 1px solid var(--lightDar); border-top: none; border-top-left-radius: 0px; border-top-right-radius: 0px; background-color: #292929" width="344px" class="pa-3 mt-2 overflow-hidden" v-if="inputValue.length > 0">
      <div v-if="queryResponse.users && !queryStatus">
        <div class="px-2" style="font-size: 16px; font-weight: 600;">
          Люди
        </div>
        <v-divider class="my-1"/>
        <div v-for="(item, index) in queryResponse.users" :key="index" class="item d-flex flex-column pa-2 cursor-pointer">
          <router-link :to="'/' + item.tag" style="color: white" @click="inputValue = ''">
            <div class="d-flex align-center ga-2">
              <div class="avatar">
                <img :src="url + '/' + item.tag + '/' + item.profile_photo" class="object-cover" alt="" style="width: 40px; height: 40px; border-radius: 50%">
              </div>
              <div class="content" style="font-size: 13px;">
                {{item.name + ' ' + item.surname}}
              </div>
            </div>
          </router-link>
        </div>
        <div v-if="queryResponse.users.length === 0 && !queryStatus" class="pa-2">
          Ничего не нашёл
        </div>
      </div>
      <div v-else class="text-center">
        <MySpinner :settings="{fontSize: '18px', color: 'white'}"></MySpinner>
      </div>
    </v-list>
  </v-menu>
</template>

<style lang="scss" scoped>
.item {
  transition: background-color .3s ease;
  border-radius: 8px;
  &:hover {
    background-color: #313131;
  }
}
.input-label {
  width: 230px;
  background-color: #424242;
  border-radius: 10px;
  padding: 8px 30px 8px 15px;
  transition: background-color .3s ease;
  margin-left: 58px;
  @media (max-width: 425px) {
    margin: 16px;
    width: 210px;
  }
  &:hover {
    background-color: #525252;
  }
  .input {
    color: white;
    margin-left: 10px;
  }
}
</style>