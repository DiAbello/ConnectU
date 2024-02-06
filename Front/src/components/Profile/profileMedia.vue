<template>
  <div class="media rounded-lg">
    <div class="select-buttons d-flex align-center ga-3">
      <v-hover v-slot="{isHovering, props}">
        <button :class="{active: activeComponent === profileImages, hovering: isHovering}" class="bg-grey-darken-5 btn d-flex align-center ga-2" @click="activeComponent = profileImages" v-bind="props">
          <font-awesome-icon :icon="['fas', 'image']" />
          Фото
        </button>
      </v-hover>

      <v-hover v-slot="{isHovering, props}">
        <button class="bg-grey-darken-5 btn d-flex align-center ga-1" :class="{active: activeComponent === profileMusic, hovering: isHovering}" @click="activeComponent = profileMusic" v-bind="props">
          <font-awesome-icon :icon="['fas', 'music']" />
          Музыка
        </button>
      </v-hover>
    </div>
    <Transition name="slide-fade">
      <component :is="activeComponent" :user="store.selectedProfile" v-if="store.selectedProfile !== null" class="mt-3"></component>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import {shallowRef} from "vue";
import profileImages from '@/components/Profile/profileMediaComponent/profileImages.vue'
import profileMusic from '@/components/Profile/profileMediaComponent/profileMusic.vue'
import {useUserStore} from "@/stores/userStore";

const activeComponent = shallowRef(profileImages)
const store = useUserStore()

</script>

<style scoped lang="scss">
.slide-fade-enter-active {
  transition: all 0.1s linear;
}

.slide-fade-leave-active {
  transition: all 0.1s linear;
}

.slide-fade-enter-from,
.slide-fade-leave-to {
  //transform: translateX(2px);
  opacity: 0;
}
//=========================================================================================
  .media {
    background-color: #222222;
    padding: 12px;
    border: 1px solid var(--lightDar);
    .select-buttons {
      .btn {
        padding: 5px 15px;
        font-size: 15px;
        transition: all .2s linear;
        color: #656565;
      }
      .active {
        border: 1px solid var(--lightDar);
        background-color: #292929;
        border-radius: 8px;
        color: white;
      }
      .hovering {
        background-color: var(--lightDar);
        border-radius: 8px;
      }
    }
  }
</style>