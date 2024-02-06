<template>
  <div>
    <input class="input"
           v-if="props.settings?.type !== 'textarea'"
           :type="props.settings?.type"
           :placeholder="props.settings?.placeholder"
           :value="props.modelValue"
           @input="updateInput"
           :required="props.settings?.required"
           :class="{error: props.settings?.errorClass}"
    >
    <textarea class="input"
              v-if="props.settings?.type === 'textarea'"
              :placeholder="props.settings?.placeholder"
              :value="props.modelValue"
              @input="updateInput"
    />
  </div>
</template>

<script setup lang="ts">
import type { PropType } from 'vue'
import { defineEmits } from 'vue'

interface InputSettings {
  placeholder?: string,
  type: 'text' | 'email' | 'password' | 'radio' | 'checkbox' | 'textarea',
  required: boolean,
  errorClass: boolean
}

const props = defineProps({
    settings: {
      type: Object as PropType<InputSettings>
    },
    modelValue: [String, Number]
})

function updateInput(event: any) {
  emits('update:modelValue', event.target.value as String | Number)
}

const emits = defineEmits([
    'update:modelValue'
])
</script>

<style scoped lang="scss">
.error{
  border: 1px solid red !important;
  &::placeholder {
    color: red !important;
  }
}

.input {
  background-color: var(--lightDar);
  padding: 8px 12px;
  border-radius: 10px;
  flex: 1 1 auto;
  width: 100%;
  color: white;
  border: 1px solid var(--darkText);
  font-size: 13px;
  &:focus {
    border: 1px solid var(--link);
  }
}
</style>