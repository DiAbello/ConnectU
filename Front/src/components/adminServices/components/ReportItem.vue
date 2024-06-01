<template>
  <div class="report rounded-lg cursor-pointer">
    <div class="report__title title">
      <div class="title__report">
        Жалоба: №{{report.id}}
      </div>
      <div class="title__interaction">
        <v-menu open-on-hover location="bottom left" theme="dark">
          <template v-slot:activator="{ props }">
            <font-awesome-icon :icon="['fas', 'ellipsis']" class="cursor-pointer" style="color: #656565; font-size: 18px;" v-bind="props"/>
          </template>
          <v-list>
            <v-list-item class="cursor-pointer" @click="deleteReport">
              Удалить
            </v-list-item>
          </v-list>
        </v-menu>
      </div>
    </div>
    <div class="report__time">
      {{report.timestamp}}
    </div>
    <div class="report__body body">
      <router-link :to="'/' + report.report_sender.tag" class="body__sender sender">
        <div class="sender__photo">
          <img :src="senderUrl" alt="">
        </div>
        <div class="sender__username">
          {{report.report_sender.name + ' ' + report.report_sender.surname}}
        </div>
      </router-link>
      <div class="body__icon">
        <font-awesome-icon :icon="['fas', 'arrow-right']" style="font-size: 28px;"/>
      </div>
      <div class="body__offending offending">
          <router-link :to="'/' + report.report_offending.tag" class="body__offending offending">
          <div class="offending__photo">
            <img :src="offendingUrl" alt="">
          </div>
          <div class="offending__username">
            {{report.report_offending.name + ' ' + report.report_offending.surname}}
          </div>
        </router-link>
        <VBtn style="letter-spacing: normal; text-transform: none" @click="deleteUser">
          Заблокировать пользователя
        </VBtn>
      </div>
    </div>
    <div class="report__context">
      Жалоба: {{report.content}}
    </div>
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import type {Report} from "@/components/adminServices/types/Report";
import adminAPI from "@/components/adminServices/API/api";
import {useReportsStore} from "@/components/adminServices/store/reportsStore";
import useStorage from "@/localStorage/useStorage";

const props = defineProps({
  report: {
    type: Object as PropType<Report>,
    required: true
  }
})
const senderUrl = `/src/assets/images/users/${props.report?.report_sender?.tag}/${props.report?.report_sender.profile_photo}`
const offendingUrl = `/src/assets/images/users/${props.report?.report_offending?.tag}/${props.report?.report_offending.profile_photo}`
const store = useReportsStore()

function deleteReport() {
  adminAPI.deleteReport(props.report?.id).then(res => {
    adminAPI.getReports().then(res => {
      store.reports = res.data
    })
  })
}

function deleteUser() {
  adminAPI.deleteUser(props.report?.report_offending.id).then(res => {
    useStorage.deleteFromStorage(props.report?.report_offending.id)
    adminAPI.getReports().then(res => {
      store.reports = res.data
    })
  })
}
</script>

<style scoped lang="scss">
.report {
  background-color: #222222;
  padding: 14px 20px;
  &__title {
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid var(--lightDar);
  }
  &__time {
    padding-top: 4px;
    color: #8a8a8a;
    font-size: 12px;
  }
  &__body {
  }
  &__context {
    padding-top: 15px;
    font-size: 13px;
  }
}

.title {
  &__report {
    padding-bottom: 12px;
    font-size: 14px;
    font-weight: 600;
  }

  &__interaction {
  }
}

.body {
  display: flex;
  align-items: center;
  justify-content: space-evenly;
  padding-top: 15px;
  &__sender {
  }

  &__icon {
  }

  &__offending {
  }
}

.sender {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  color: white !important;

  &__photo {
    img {
      width: 60px;
      height: 60px;
      object-fit: cover;
      border-radius: 50%;
    }
  }

  &__username {
  }
}

.offending {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  color: white !important;

  &__photo {
    img {
      width: 60px;
      height: 60px;
      object-fit: cover;
      border-radius: 50%;
    }
  }

  &__username {
  }
}
</style>