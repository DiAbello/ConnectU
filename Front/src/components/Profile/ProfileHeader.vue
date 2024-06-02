<template>
  <div class="profile">
    <v-row class="ma-0" style="max-width: 911px">
      <v-col cols="12" class="profile-header d-flex align-end justify-space-between">
        <div class="d-flex align-center flex-0-0-100 ga-3 header-flex">
          <div>
            <!--  Image Menu        -------------------------------------------------------------------------->
            <VMenu open-on-hover location="bottom left">
              <template v-slot:activator="{props}">
                <v-img
                    width="150px"
                    height="150px"
                    :src="user?.profile_photo === 'def.svg' ? defaultUrl + user?.profile_photo : url + user?.profile_photo"
                    v-bind="props"
                    class="cursor-pointer border-opacity-100"
                    style="border-radius: 50%"
                    cover
                >
                </v-img>
              </template>
              <VList theme="dark" v-if="user?.id === store.user?.id">
                <v-hover v-slot="{isHovering, props}">
                  <VList-item class="d-flex align-center cursor-pointer" v-bind="props"
                               :class.camel="{hovering: isHovering}">
                    <v-dialog width="800" theme="dark" v-model="isImageModalOpen">
                      <template v-slot:activator="{props}">
                        <div v-bind="props">
                          <font-awesome-icon :icon="['fas', 'pen']" style="color: var(--textColor)" class="pr-2"/>
                          Обновить фотографию
                        </div>
                      </template>
                      <template v-slot:default="{isActive}" >
                        <v-card title="Выберите новое изображение" theme="dark" class="v-container text-center rounded-lg">
                          <v-divider class="mt-2"></v-divider>
                          <v-card-text class="font-weight-light text-grey-lighten-1 my-2">
                            Выберите файл с вашим новым изображением. Файлс не должен превышать 2Мб. Разрешённые форматы, *.png, *.jpg, *.bmp
                          </v-card-text>
                          <v-file-input
                              label="Добавьте новую фотографию"
                              accept="image/png, image/jpeg, image/bmp"
                              show-size
                              ref="fileInput"
                              @change="updateImage"
                              v-if="!updateImageLoad"
                          >
                          </v-file-input>
                          <MySpinner class="my-2" v-else :settings="{fontSize: '46px'}"/>
                        </v-card>
                      </template>
                    </v-dialog>
                  </VList-item>
                </v-hover>
              </VList>
            </VMenu>
            <!-------------------------------------------------------------------------------------------------------------->
          </div>
          <div class="flex-1-1-100 d-flex justify-space-between align-start">
            <div class="info d-flex flex-column ga-3">
              <div class="info__name">
                {{ user?.name }} {{ user?.surname }}
              </div>
              <div class="info__info d-flex align-center ga-3 pl-1">
                <div class="location">
                  <font-awesome-icon :icon="['fas', 'location-dot']"/>
                  Москва
                </div>
                <!--     ModalMoreInformationAboutUser         --------------------------------------------------------------------->
                <v-dialog width="560">
                  <template v-slot:activator="{props}">
                    <div class="more" v-bind="props">
                      <font-awesome-icon :icon="['fas', 'circle-info']"/>
                      Подробнее
                    </div>
                  </template>
                  <template v-slot:default="{ isActive }">
                    <v-card title="Подробная информация" theme="dark" class="v-container">
                      <v-divider class="mt-2"></v-divider>
                      <VList>
                        <VList-item min-height="0px" class="py-2">
                          <font-awesome-icon :icon="['fas', 'at']" style="color: #939393" class="px-2"/>
                          {{ user?.tag.replace("@", '') }}
                        </VList-item>
                      </VList>
                      <v-divider></v-divider>
                      <VList base-color="#939393">
                        <VList-item min-height="0px" class="py-2">
                          <font-awesome-icon :icon="['fas', 'gift']" class="px-2"/>
                          День рождения:
                        </VList-item>
                        <VList-item min-height="0px" class="py-2">
                          <font-awesome-icon :icon="['fas', 'house']" class="px-2"/>
                          Город:
                        </VList-item>
                      </VList>
                      <v-divider></v-divider>
                    </v-card>
                  </template>
                </v-dialog>
                <!--              ----------------------------------------------------------------------------------------------->

              </div>
            </div>
            <div class="buttons d-flex ga-3 my-pr-buttons" v-if="user?.id === store.user?.id">
              <router-link to="/edit">
                <VBtn theme="dark" style="text-transform: none; background-color: #393939; letter-spacing: normal">Редактировать профиль</VBtn>
              </router-link>
              <!--            MoreMenu----------------------------------------------------------------------------------------->
              <VMenu open-on-hover location="bottom right">
                <template v-slot:activator="{props}">
                  <VBtn v-bind="props" theme="dark" style="text-transform: none; background-color: #393939; letter-spacing: normal">
                    Ещё
                    <font-awesome-icon :icon="['fas', 'chevron-down']" class="ml-2"/>
                  </VBtn>
                </template>
                <VList theme="dark" class="mt-3" base-color="white">
                  <v-hover v-slot="{isHovering, props}">
                    <router-link to="/settings" class="d-flex align-center ga-2" :class="{hovering: isHovering}"
                                 v-bind="props">
                      <VList-item>
                        <font-awesome-icon :icon="['fas', 'circle-question']" class="pr-1"
                                           style="color: var(--textColor)"/>
                        Мои вопросы
                      </VList-item>
                    </router-link>
                  </v-hover>
                  <v-hover v-slot="{isHovering, props}">
                    <router-link to="/#" class="d-flex align-center ga-2" v-bind="props" :class="{hovering: isHovering}">
                      <VList-item
                      >
                        <font-awesome-icon :icon="['fab', 'rev']" class="pr-1" style="color: var(--textColor)"/>
                        Воспоминания
                      </VList-item>
                    </router-link>
                  </v-hover>
                </VList>
              </VMenu>
              <!--            ------------------------------------------------------------------------------------------------->
            </div>
            <div class="buttons d-flex ga-3 align-center " v-if="user?.id !== store.user?.id ?? store.selectedProfile">
              <VBtn
                  theme="dark"
                  style="text-transform: none; background-color: #393939; letter-spacing: normal"
                  @click="store.addToFriends(store.user?.id, user?.id)"
                  v-if="store.isFriendshipAvailable === 'can add to friend'"
              >
                Добавить в друзья
              </VBtn>
              <VBtn
                  theme="dark"
                  style="text-transform: none; background-color: #565656; letter-spacing: normal"
                  @click="store.addToFriends(store.user?.id, user?.id)"
                  v-if="store.isFriendshipAvailable === 'request sended'"
              >
                Запрос отправлен
              </VBtn>
              <VBtn
                  theme="dark"
                  style="text-transform: none; background-color: #565656; letter-spacing: normal"
                  @click="store.acceptFriendship({from: store.user?.id, to: store.selectedProfile?.id})"
                  v-if="store.isFriendshipAvailable === 'Want to be friends'"
              >
                Хочет добавить вас в друзья
              </VBtn>
              <VBtn
                  theme="dark"
                  style="text-transform: none; background-color: #565656; letter-spacing: normal; background-color: #137313;"
                  @click="store.addToFriends(store.user?.id, user?.id)"
                  v-if="store.isFriendshipAvailable === 'friends'"
              >
                В друзьях
              </VBtn>
              <v-menu open-on-hover location="bottom left" theme="dark">
                <template v-slot:activator="{ props }">
                  <font-awesome-icon :icon="['fas', 'ellipsis']" class="cursor-pointer" style="color: #656565; font-size: 18px;" v-bind="props"/>
                </template>
                <v-list>
                  <v-list-item class="cursor-pointer d-flex align-center ga-3" style="color: red;" @click="reportUser">
                    <font-awesome-icon :icon="['fas', 'circle-exclamation']" />
                    Пожаловаться
                  </v-list-item>
                  <v-list-item class="cursor-pointer d-flex align-center ga-3" style="color: red;" v-if="store.user?.tag === '@admin'" @click="deleteUser">
                    <font-awesome-icon :icon="['fas', 'circle-exclamation']" />
                    Заблокировать пользователя
                  </v-list-item>
                </v-list>
              </v-menu>
            </div>
          </div>
        </div>
      </v-col>
    </v-row>
  </div>
</template>

<script setup lang="ts">
import type {User} from "@/types/User";
import {onMounted, onUnmounted, type PropType} from "vue";
import API from "@/API/api";
import {ref} from "vue";
import {useUserStore} from "@/stores/userStore";
import useStorage from "@/localStorage/useStorage";
import adminAPI from '@/components/adminServices/API/api'
import {useRouter} from "vue-router";
import {useReportsStore} from "@/components/adminServices/store/reportsStore";

const props = defineProps({
  user: {
    type: Object as PropType<User>,
  }
})

const url = `/src/assets/images/users/${props.user?.tag}/`
const defaultUrl = '/src/assets/images/users/'
const updateImageLoad = ref(false)
const isImageModalOpen = ref(false)
const store = useUserStore()
const router = useRouter()
const reportStore = useReportsStore()

function deleteUser() {
  adminAPI.deleteUser(store.selectedProfile?.id).then(res => {
    useStorage.deleteFromStorage(store.selectedProfile?.id)
    router.push('/admin')
    adminAPI.getReports().then(res => {
      reportStore.reports = res.data
    })
  })
}

function reportUser() {
  const data = {
    senderId: store.user?.id,
    offendingId: props.user?.id,
    content: 'Подозрительный пользователь'
  }
  adminAPI.createReport(data).then(res => {
    console.log(res.data)
  })

}
function updateImage(event: any) {
  updateImageLoad.value = true
  API.updateImage(event.target.files[0], props.user?.id, props.user?.tag, event.target.files[0].name).then(res => {
    updateImageLoad.value = false
    isImageModalOpen.value = false
    store.user = res.data
    useStorage.updateStorageItem(res.data, res.data.id)
    store.getUserImages(props.user?.id)
    store.getUsersProfile(props.user?.tag)
  })
}
onMounted(() => {
  store.checkFriendStatus(store.user?.id, store.selectedProfile?.id)
})
</script>

<style scoped lang="scss">
.header-flex {
  @media (max-width: 425px) {
    gap: 2px;
  }
}
.my-pr-buttons {
  @media (max-width: 425px) {
    display: none !important;
  }
}
.hovering {
  background-color: var(--lightDar) !important;
}

.cursor-pointer {
  cursor: pointer;
}
.profile {
  flex: 0 1 911px;
}
.profile-header {
  background-color: var(--dark);
  padding: 20px;
  border-radius: 12px;
  border: 1px solid var(--lightDar);
  @media (max-width: 425px) {
    padding: 12px;
  }
}

.info {
  &__name {
    font-size: 21px;
    font-weight: 500;
  }

  .VBtn span {
    text-transform: none !important;
  }

  &__info {
    color: #939393;
    .more {
      font-size: 13px;
    }

    .location {
      cursor: pointer;
      font-size: 13px;

      &:hover {
        text-decoration: underline;
      }
    }

    .more {
      cursor: pointer;

      &:hover {
        text-decoration: underline;
      }
    }
  }
}

</style>