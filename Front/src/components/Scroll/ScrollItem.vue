<script lang="ts" setup>
import { ref, watch } from 'vue'
import { useRouter } from 'vue-router'

const lastScrollPosition = ref(0)
const isScrollEnabled = ref(false)
const scrollDown = ref(false)
const router = useRouter()

window.addEventListener('scroll', function () {
  const scrollPosition = window.scrollY;
  if(lastScrollPosition.value !== 0 && scrollPosition <= 180) {
    scrollDown.value = true
  } else if (scrollPosition >= 180 && lastScrollPosition.value === 0) {
    isScrollEnabled.value = true
  } else if (scrollPosition >= lastScrollPosition.value || scrollPosition > 50) {
    scrollDown.value = false
  }
});
watch(router.currentRoute, () => {
  lastScrollPosition.value = 0
  isScrollEnabled.value = false
  scrollDown.value = false
})


function scrollTo() {
  if(lastScrollPosition.value === 0 || !scrollDown.value) {
    let currentPosition = window.scrollY
    window.scrollTo({
      top: 0,
      behavior: 'instant'
    })
    lastScrollPosition.value = currentPosition
  } else {
    window.scrollTo({
      top: lastScrollPosition.value,
      behavior: 'instant'
    })
  }
}
</script>

<template>
    <div class="scroll" @click="scrollTo" v-if="isScrollEnabled">
      <div class="scroll-content" v-if="isScrollEnabled">
        <div v-if="lastScrollPosition === 0 || !scrollDown">
          <font-awesome-icon :icon="['fas', 'chevron-up']" style="margin-right: 3px; font-size: 16px;"/>
          Наверх
        </div>
        <font-awesome-icon v-if="lastScrollPosition !== 0 && scrollDown" :icon="['fas', 'chevron-down']" style="text-align: left; margin-left: -50px; font-size: 16px;"/>
      </div>
    </div>
</template>

<style scoped lang="scss">
    .v-enter-active,
    .v-leave-active {
      transition: opacity 0.5s ease;
    }

    .v-enter-from,
    .v-leave-to {
      opacity: 0;
    }
  //=====================================================================================================
    .scroll {
      @media (max-width: 425px) {
        display: none;
      }
      width: 350px;
      height: 100vh;
      position: fixed;
      left: 0;
      bottom: -50px;
      cursor: pointer;
      &:hover {
        .scroll-content {
          background-color: #2d2d2d;
          color: #35455d;
        }
      }
    }
  .scroll-content {
    width: 110px;
    height: 100vh;
    position: fixed;
    left: 0;
    bottom: -50px;
    color: #2C3C4E;
    font-size: 13px;
    text-align: center;
    padding: 12px;
    cursor: pointer;
    transition: background-color .3s ease;
    display: block;

  }
</style>
