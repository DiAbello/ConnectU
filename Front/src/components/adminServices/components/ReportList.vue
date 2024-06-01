<template>
  <div class="report-list" v-if="reports.length > 0">
    <ReportItem :report="report" v-for="report in reports" :key="report.id"/>
  </div>
  <div v-else class="report-empty">
    Новых жалоб нет
  </div>
</template>

<script setup lang="ts">
import type {PropType} from "vue";
import ReportItem from "@/components/adminServices/components/ReportItem.vue";
import type {Report} from "@/components/adminServices/types/Report";

defineProps({
  reports: {
    type: Array as PropType<Report[]>,
    required: true
  }
})
</script>

<style scoped lang="scss">
.report-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.report-empty {
  font-size: 14px;
}
</style>