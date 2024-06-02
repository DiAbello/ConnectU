<template>
  <div class="wrapper">
    <HeaderItem/>
    <ScrollItem/>
    <div class="wrapper-container">
      <div class="content" v-if="store.user !== null">
        <NavItem/>
        <RouterView v-slot="{Component}" class="mt-5">
          <Transition name="fade" mode="out-in">
            <component :is="Component" :key="$route.path"></component>
          </Transition>
        </RouterView>
      </div>
      <RouterView
        v-else
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import NavItem from "@/components/NavItem.vue";
import HeaderItem from "@/components/HeaderItem/components/HeaderItem.vue";
import { useUserStore } from "@/stores/userStore";
import { onMounted } from "vue";
import Cookies from "universal-cookie";
import API from "@/API/api";
import ScrollItem from "@/components/Scroll/ScrollItem.vue";

const store = useUserStore()
const cookies = new Cookies(['locale'])

onMounted(() => {
  if(cookies.get('user_token')) {
    const token = cookies.get('user_token')
    store.user = undefined
    API.getUserByToken(token).then(res => {
      store.user = res.data
    })
  }
})
</script>

<style lang="scss" scoped>
.wrapper {
  min-height: 100%;
  background-color: var(--backgroung);
  color: white;
  font-family: 'Roboto', sans-serif;
  .wrapper-container {
    max-width: 1135px;
    margin: 0 auto;
    padding: 0 15px;
    overflow: hidden;
    .content {
      display: flex;
      align-items: flex-start;
      gap: 24px;
      .main-view {
        margin: 20px 0;
      }
    }
  }
}

//================================================================================
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
//================================================================================
</style>