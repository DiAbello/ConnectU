<template>
  <div>
    <div class="d-flex flex-wrap image">
      <image-slider :image-size="{width:  '167px', height: '167px'}" :is-required-short="true" :images="store.userImages" :user-info="userInfo" v-if="store.userImages" :slider-for="'default'"/>
    </div>
    <div class="d-flex ga-1">
      <VBtn width="50%" class="mt-3 bg-grey-darken-3 flex-1-1-100" theme="dark" style="text-transform: none; letter-spacing: normal; background-color: #393939">
        Загрузить фотографии
      </VBtn>
      <RouterLink :to="'/images/' + store.selectedProfile?.id + '/' + store.selectedProfile?.tag" class="flex-1-1-100">
        <VBtn width="100%" class="mt-3 bg-grey-darken-3" theme="dark" style="text-transform: none; letter-spacing: normal; background-color: #393939">
          Показать все фотографии
        </VBtn>
      </RouterLink>
    </div>

  </div>
</template>

<script setup lang="ts">
// ==========================================================================================================
import { onMounted, ref, computed, watch, onUnmounted } from "vue";
import type { PropType } from "vue";
import type {User, UserdataForSlider} from "@/types/User";
import { useUserStore } from "@/stores/userStore";
import type { Ref } from "vue";
import type { Image } from "@/types/Image";
import ImageSlider from "@/components/GlobalBusines/imageSlider.vue";

const props = defineProps({
  user: {
    type: Object as PropType<User>
  }
})
const userInfo = {
  tag: props.user?.tag,
  name: props.user?.name,
  surname: props.user?.surname,
  profile_photo: props.user?.profile_photo
}

const store = useUserStore()

onMounted(() => {
  store.getUserImages(props.user?.id)
})

</script>

<style scoped lang="scss">
// ==========================================================================================================
.cursor-pointer {
  cursor: pointer;
}
.v-list-item-subtitle {
  font-size: 13px !important;
}
.image {
  gap: 3px;
}
.carousel {
  flex: 0 1 70%;
}
</style>