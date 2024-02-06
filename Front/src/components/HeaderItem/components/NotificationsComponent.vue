<script lang="ts" setup>

</script>

<template>
  <div class="content__notifications notification">
    <v-menu :close-on-content-click="false" location="bottom left">
      <template v-slot:activator="{ props }">
        <font-awesome-icon :icon="['fas', 'bell']" v-bind="props" class="notification__icon" style="color: #6F6F6F; font-size: 18px"/>
      </template>
      <v-list theme="dark" width="470px" height="auto" class="pa-3" style="border: 1px solid var(--lightDar); border-top: none; border-top-left-radius: 0px; border-top-right-radius: 0px; background-color: #292929">
        Нет новых уведомлений
      </v-list>
    </v-menu>
  </div>
</template>

<style scoped lang="scss">
.notification {
  &__icon {
    cursor: pointer;
    margin-left: 15px;
    padding: 16px 15px;
    &:hover {
      background-color: #333333;
    }
  }
}
</style>