import { defineStore } from "pinia";
import type {User} from "@/types/User";
import $api from "@/API/http";
import type {Chat, Message, MessageContent, Persons} from "@/components/Messages/types/Chat";
import jsonToData from "@/functions/jsonToData";

export const useChatsStore = defineStore('chatsStore', {

    state: () => ({
        user: {} as User,
        profileImageUrl: '' as string,
        messages: [] as Message[],
        chats: [] as Chat[],
        searchChat: '' as string
    }),
    getters: {
        getSearchedChats(state) {
            return () => state.chats.filter(el => el.name.match(this.searchChat))
        }
    },
    actions: {
        async setUser(id: number) {
            const user = await $api.get(`/getUserById?id=${id}`)
            try {
                this.user = user.data
                this.profileImageUrl = `/src/assets/images/users/${user.data?.tag}/${user.data?.profile_photo}`
            } catch (e) {
                console.log(e)
            }
        },
        async sendMessage(Object: MessageContent) {
            await $api.post('/sendMessage', jsonToData(Object)).then(res => {
                console.log(res)
            })
        },
        async getMessages(Object: Persons) {
            const response = await $api.post('/getMessages', jsonToData(Object))
            try {
                console.log(response.data)
                this.messages = response.data
            } catch (e) {
                console.log(e)
            }
        },
        async getChats(id: number | undefined) {
            const response = await $api.get(`/getChats?id=${id}`)
            try {
                this.chats = response.data
                console.log(response.data)
            } catch (e) {
                console.log(e)
            }
        }

    }
})