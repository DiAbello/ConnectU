<template>
  <div class="admin rounded-lg">
     <ReportList :reports="reportStore.reports"/>
  </div>
</template>

<script setup lang="ts">

import ReportList from "@/components/adminServices/components/ReportList.vue";
import {onMounted} from "vue";
import adminAPI from "@/components/adminServices/API/api";
import { useReportsStore} from "@/components/adminServices/store/reportsStore";

const reportStore = useReportsStore()

onMounted(() => {
  adminAPI.getReports().then(res => {
    reportStore.reports = res.data
  })
})
</script>

<style scoped lang="scss">
.admin {
  flex: 0 1 550px;
}
</style>