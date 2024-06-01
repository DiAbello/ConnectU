import $api from "@/API/http";
import jsonToData from "@/functions/jsonToData";

const adminAPI = {
    async deleteUser(userId: number | undefined) {
        const data = new FormData()
        data.append('userId', userId)
        return await $api.post('/deleteUser', data)
    },
    async createReport(data: Object) {
      return await $api.post('/createReport', jsonToData(data))
    },
    async getReports() {
        return await $api.get('/getReports')
    },
    async deleteReport(id: number) {
        return await $api.delete(`/deleteReport?id=${id}`)
    }
}

export default adminAPI