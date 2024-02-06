<template>
  <button class="btn"
          :type="props.settings?.type"
  >
    <slot></slot>
  </button>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import {computed} from "vue";
interface ButtonSettings {
  color?: string,
  backgroundColor?: string,
  type?: 'submit' | 'button',
  onHover?: string
}

const props = defineProps({
  settings: {
    type: Object as PropType<ButtonSettings>
  }
})

const HoverColor = computed(() => {
  if(props.settings?.onHover === undefined) {
    return props.settings?.backgroundColor
  } else {
    return props.settings?.onHover
  }
})
const Color = computed(() => {
  return props.settings?.color
})
const BackColor = computed(() => {
  return props.settings?.backgroundColor
})

</script>

<style scoped lang="scss">
.btn {
  color: v-bind(Color);
  background-color: v-bind(BackColor);
  border-radius: 10px;
  transition: all 0.3s ease;
  padding: 10px 0;
  min-width: 272px;
  &:active {
    transform: scale(1.02);
  }
  &:hover {
    background-color: v-bind(HoverColor);
  }
}
</style>