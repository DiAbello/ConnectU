<template>
  <div class="d-flex flex-wrap ga-1 my-4">
    <image-slider
        :is-required-short="false"
        :images="images"
        v-if="images"
        :user-info="userInfo"
        :image-size="{width: '200px'}"
        :slider-for="'default'"
    />
  </div>
</template>

<script setup lang="ts">
import type { User } from '@/types/User';
import type { PropType} from 'vue';
import type { Image } from '@/types/Image';
import ImageSlider from "@/components/GlobalBusines/imageSlider.vue";


const props = defineProps({
        user: {
            type: Object as PropType<User | undefined>
        },
        images: {
            type: Array as PropType<Image[] | undefined>
        }
    }
)
const userInfo = {
  tag: props.user?.tag,
  name: props.user?.name,
  surname: props.user?.surname,
  profile_photo: props.user?.profile_photo
}


</script>

<style scoped lang="scss">

</style>
