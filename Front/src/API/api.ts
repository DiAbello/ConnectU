import axios from 'axios'
import type {User, RegUser, LogUser} from "@/types/User";
import type {Image} from "@/types/Image";

const API = {
    async createUser(user: RegUser) {
        const data = new FormData()
        data.append('name', user.name)
        data.append('surname', user.surname)
        data.append('tag', '@' + user.tag)
        data.append('email', user.email)
        data.append('password', user.password)
        return await axios.post('http://127.0.0.1:8000/api/createUser', data, { headers: {'Access-Control-Allow-Origin': "*"}}).then(res => res)
    },
    async getUser(user: LogUser) {
        return await axios.get<User>(`http://127.0.0.1:8000/api/getUser?email=${user.email}&password=${user.password}`, { headers: {'Access-Control-Allow-Origin': "*"}}).then(res => res)
    },
    async getUserByToken(token: string) {
        return await axios.get<User>(`http://127.0.0.1:8000/api/getUserByToken?remember_token=${token}`, { headers: {'Access-Control-Allow-Origin': "*"}}).then(res => res)
    },
    async updateImage(image: any, id: any, tag: any, name: string) {
        const data = new FormData()
        data.append('file', image)
        data.append('id', id)
        data.append('fileName', name)
        data.append('tag', tag)
        return await axios.post(`http://127.0.0.1:8000/api/updateUserImage`, data, { headers: {'Access-Control-Allow-Origin': "*"}}).then(res => res)
    },
    async getUserImages(id: number) {
        return await axios.get<Image[]>(`http://127.0.0.1:8000/api/getUserImages?id=${id}`, { headers: {'Access-Control-Allow-Origin': "*"}}).then(res => res)
    }
}

export default API