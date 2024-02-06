<script setup lang="ts">
import { ref, watch } from "vue";
import type { PropType, Ref } from "vue";
import type { Image } from "@/types/Image";
import type {User, UserdataForSlider} from "@/types/User";
import convertDate from "@/functions/dateConvert";

interface imageProps {
  width: string,
  height?: string
}
type sliderForProps = 'default' | 'post'

const props = defineProps({
  images: {
    type: Array as PropType<Image[]>,
    required: true,
  },
  isRequiredShort: {
    type: Boolean,
    required: true,
  },
  userInfo: {
    type: Object as PropType<UserdataForSlider | undefined>,
    required: false,
  },
  imageSize: {
    type: Object as PropType<imageProps>,
    required: true
  },
  sliderFor: {
    type: String as PropType<sliderForProps>,
    required: true
  }
});
//умняш
const url = `/src/assets/images/users/${props.userInfo?.tag}/`;
const defaultUrl = "/src/assets/images/users/";
const urlForUserPost = `/src/assets/images/posts/users/${props.userInfo?.tag}/`;
// const publicUrl = `/src/assets/images/publics/${props.images[0].}/`;

const selectedIndex: Ref<number> = ref(-1);
const imageInfo: Ref<Image | undefined> = ref()

watch(selectedIndex, (newVal) => {
    imageInfo.value = props.images[newVal]
});
</script>

<template>
  <VDialog width="1200px">
    <template v-slot:activator="{ props }">
      <VImg
          v-if="images.length > 0"
        v-for="(item, index) in isRequiredShort ? images?.slice(0, 5) : images"
        :key="item.id"
        :src="sliderFor === 'post' && userInfo ? urlForUserPost + item.image_name : url + item.image_name"
        v-bind="props"
        :width="imageSize.width"
        :height="imageSize?.height"
        @click="selectedIndex = index"
        class="cursor-pointer"
        cover
      >
      </VImg>
      <VImg
          v-else-if="images.length < 1"
          :width="imageSize.width"
          height="300px"
          style="background-color: #424242"
          cover
          class="rounded-sm"
      >
        <template v-slot:placeholder>
          <div class="d-flex align-center justify-center fill-height">
            <v-progress-circular
                color="grey-lighten-4"
                indeterminate
            ></v-progress-circular>
          </div>
        </template>
      </VImg>
    </template>
    <template v-slot:default="{ isActive }">
      <VRow>
        <v-col cols="9" class="pr-0">
          <v-card theme="dark" class="pa-4 rounded-0">
            <VCarousel
              class="carousel"
              hide-delimiters
              show-arrows
              v-model="selectedIndex"
            >
              <template v-slot:prev="{ props }">
                <font-awesome-icon
                  :icon="['fas', 'angle-left']"
                  @click="props.onClick"
                  size="2xl"
                  class="cursor-pointer"
                />
              </template>
              <template v-slot:next="{ props }">
                <font-awesome-icon
                  :icon="['fas', 'angle-right']"
                  @click="props.onClick"
                  size="2xl"
                  class="cursor-pointer"
                />
              </template>
              <VCarouselItem
                v-for="(item, index) in images"
                :key="index"
                :src="sliderFor === 'post' && userInfo ? urlForUserPost + item.image_name : url + item.image_name"
              >

              </VCarouselItem>
            </VCarousel>
            <div class="text-grey-lighten-1 px-3 pt-4" style="user-select: none">
              Фотграфия {{selectedIndex + 1}} из {{images.length}}
            </div>
          </v-card>
        </v-col>
        <v-col cols="3" class="d-flex flex-column pl-0">
          <v-card theme="dark" class="rounded-0 pa-4 bg-grey-darken-4" height="100%">
            <VList class="rounded-xl px-2">
              <VListItem
                :prepend-avatar="
                  userInfo
                    ? userInfo?.profile_photo === 'def.svg'
                      ? defaultUrl + userInfo?.profile_photo
                      : url + userInfo?.profile_photo
                    : publicUrl + images[0].image_name
                "
                :title="userInfo ? userInfo?.name + ' ' + userInfo?.surname : images[0].public_name"
                :subtitle="imageInfo?.created_at ? convertDate(imageInfo?.created_at) : ''"
              >
              </VListItem>
              <VDivider class="my-2" />
              <VListItem class="pt-0">
                <div class="position-relative" style="width: fit-content">
                  <input
                    type="checkbox"
                    class="position-absolute"
                    style="
                      z-index: 5;
                      top: 0;
                      left: 0;
                      height: 100%;
                      width: 100%;
                      opacity: 0;
                    "
                  />

                  <font-awesome-icon
                    :icon="['fas', 'heart']"
                    class="text-grey-darken-1 cursor-pointer mr-2 position-relative"
                    size="xl"
                    style="z-index: 3"
                  >
                  </font-awesome-icon>
                  {{ imageInfo?.like_count }}
                </div>
              </VListItem>
            </VList>
          </v-card>
        </v-col>
      </VRow>
    </template>
  </VDialog>
</template>
