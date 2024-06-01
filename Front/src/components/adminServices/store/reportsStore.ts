import { defineStore } from "pinia";

export const useReportsStore = defineStore('reportsStore', {
    state: () => ({
        reports: [] as Report[]
    }),
    getters: {

    },
})