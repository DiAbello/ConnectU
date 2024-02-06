<template>
  <div class="auth">
    <div class="auth__content content">
      <div class="content__top">
        <Transition name="translate" mode="out-in">
          <KeepAlive>
            <component :is="location" @updateLocation="location = LogComponent"></component>
          </KeepAlive>
        </Transition>
      </div>
      <div class="content__bottom bottom">
        <div class="bottom__body">
            <MyButton
                v-if="location === LogComponent"
                @click="location = RegComponent"
                :settings="{color: 'black', backgroundColor: 'white', onHover: 'gray'}"
            >
              Зарегестрироваться
            </MyButton>
            <MyButton
                v-if="location === RegComponent"
                @click="location = LogComponent"
                :settings="{color: 'white', backgroundColor: '#4BB34B', onHover: '#398539'}"
            >
              Вход
            </MyButton>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import LogComponent from "@/components/Auth/LogComponent.vue";
import RegComponent from "@/components/Auth/RegComponent.vue";
import { shallowRef } from "vue";

const location = shallowRef(RegComponent)
</script>

<style scoped lang="scss">
//===========================================================================
.translate-enter-active,
.translate-leave-active {
  transition: all 0.3s ease;
}

.translate-enter-from,
.translate-leave-to {
  opacity: 0;
}

//=============================================================================
.auth {
  flex: 0 1 40%;
  &__content {

  }
}

.content {
  display: flex;
  flex-direction: column;
  gap: 15px;
  &__top {
    flex: 1 1 100%;
  }

  &__bottom {
  }
}

.bottom {
  background-color: var(--dark);
  border-radius: 10px;
  padding: 32px;
  &__body {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
}

</style>