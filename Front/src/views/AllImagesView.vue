<template>
    <div class="allImages bg-grey-darken-4 rounded pa-4" >
        <div class="d-flex justify-space-between align-center my-3">
            <h3 class="title pl-2">Все изображения</h3>
            <VBtn theme="dark" style="text-transform: none;" v-if="store.user?.id === Number(router.currentRoute.value.params.id)">Загрузить изображение</VBtn>
        </div>
        <VDivider/>
        <UserImages :user="store.selectedProfile" :images="store.userImages" v-if="store.selectedProfile !== null"/>
    </div>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted } from 'vue';
import { useRouter } from 'vue-router';
import { useUserStore } from '@/stores/userStore';
import UserImages from '@/components/UserManual/userImages.vue';

const router = useRouter()
const store = useUserStore()

onMounted(() => {
    store.getUsersProfile(router.currentRoute.value.params.tag as string)
    store.getUserImages(Number(router.currentRoute.value.params.id))
})

onUnmounted(() => {
    store.selectedProfile = null
    store.userImages = []
})
</script>

<style scoped lang="scss">
    .allImages {
        flex: 0 1 911px;
        .title {
            font-size: 20px;
            font-weight: 600;
        }
    }
</style>