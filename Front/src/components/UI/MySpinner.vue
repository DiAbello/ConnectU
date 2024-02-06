<template>
  <div>
    <font-awesome-icon :icon="['fas', 'circle-notch']" spin :style="{color: settings?.color, fontSize: settings?.fontSize}"/>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
interface SpinnerSettings {
  fontSize: string,
  color: string
}

const props = defineProps({
  settings: {
    type: Object as PropType<SpinnerSettings>
  }
})
</script>

<style scoped>

</style>