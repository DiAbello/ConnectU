<template>
  <div class="authentication">
      <div class="authentication__content content">
        <AuthInfo/>
        <AuthAuth/>
      </div>
    <FooterItem/>
  </div>
</template>

<script setup lang="ts">
import AuthInfo from "@/components/Auth/AuthInfo.vue";
import AuthAuth from "@/components/Auth/AuthAuth.vue";
import {useUserStore} from "@/stores/userStore";
//@ts-ignore
import FooterItem from "@/components/Footer/FooterItem.vue";
import {onMounted, onUnmounted} from "vue";

const userStore = useUserStore()
onUnmounted(() => {
  userStore.selectedProfile = null
  console.log('очищаю пользователя на авторизации')
})
</script>

<style scoped lang="scss">
.authentication {
  display: flex;
  flex-direction: column;
  height: 100%;
  gap: 30px;
  &__content {
    flex: 1 1 auto;
  }
}

.content {
  display: flex;
  gap: 15px;
}
</style>