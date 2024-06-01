import {defineStore} from 'pinia'
import type {User} from "@/types/User";
import useStorage from "@/localStorage/useStorage";
import type {Image} from "@/types/Image";
import axios from "axios";
import convertDate from '@/functions/dateConvert';
import $api from "@/API/http";
import type {UnwrapRef} from "vue";
import jsonToData from "@/functions/jsonToData";

export const useUserStore = defineStore('useUserStore', {
    state: () => ({
        user: null as unknown as User | null | undefined,
        localUsers: [] as User[],
        userImages: [] as Image[],
        selectedProfile: null as unknown as User | null | undefined,
        friends: [] as User[],
        isFriendshipAvailable: '' as string
    }),
    actions: {
        deleteLocalUser(id: number) {
            this.localUsers = this.localUsers.filter(el => el.id !== id)
            useStorage.deleteFromStorage(id)
        },
        setLocalUsers() {
            this.localUsers = JSON.parse(localStorage.getItem('local_users') || '[]')
        },
        async getUserImages(id: number | undefined) {
            const images = await axios.get<Image[]>(`http://127.0.0.1:8000/api/getUserImages?id=${id}`)
            try {
                images.data.forEach(el => {
                    el.created_at = convertDate(el.created_at)
                })
                this.userImages = images.data
                console.log('Задаю картинки')
            } catch (e) {
                console.log(e)
            }
        },
        async getUsersProfile(tag: string | undefined) {
            const user = await axios.get(`http://127.0.0.1:8000/api/getUserByTag?tag=${tag}`)
            try {
                this.selectedProfile = user.data
                console.log('Задаю пользователя')
            } catch (e) {
                console.log(e)
            }
        },
        async getAllFriends(userId: UnwrapRef<User["id"]> | undefined) {
            const friends = await $api.get(`/getAllFriends?id=${userId}`)
            try {
                console.log(friends)
                this.friends = friends.data
            } catch (e) {
                console.log(e)
            }
        },

        async addToFriends(from: UnwrapRef<User["id"]> | undefined, to: number | undefined) {
            const data = new FormData()
            data.append('from', from)
            data.append('to', to)
            await $api.post('/addToFriends', data).then(res => {
                if(res.data) {
                    this.isFriendshipAvailable = 'request sended'
                }
            })
        },
        async acceptFriendship(data: Object) {
            await $api.post('/acceptFriendship', jsonToData(data))
        },
        async checkFriendStatus(from: UnwrapRef<User["id"]> | undefined, to: number | undefined) {
            console.log(from)
            console.log(to)
            const data = new FormData()
            data.append('from', from)
            data.append('to', to)
            const response = await $api.post('/checkFriendStatus', data)
            try {
                console.log(response)
                this.isFriendshipAvailable = response.data
            } catch (e) {
                console.log(e)
            }
        }
    }

})
