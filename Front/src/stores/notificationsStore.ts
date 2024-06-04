import {defineStore} from 'pinia'
import type {User} from "@/types/User";
import $api from "@/API/http";

export const useNotificationsStore = defineStore('useNotificationsStore', {
    state: () => ({
        notifications: {
            friends: [] as User[]
        }
    }),
    actions: {
        async getFriendNotifications(userId: number | undefined) {
                const friends = await $api.get(`/getFriendNotifications?id=${userId}`)
            console.log(friends)
                try {
                    this.notifications.friends = friends.data
                } catch (e) {
                    console.log(e)
                }
        }
    }
})
