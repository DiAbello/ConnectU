import {defineStore} from "pinia";
import $api from "@/API/http";
import deletePost from "@/components/GlobalBusines/PostList/api/deletePost";
import type {Post} from "@/components/GlobalBusines/PostList/types/Post";


export const usePostStore = defineStore('usePostStore', {
    state: () => {
        return {
            posts: [] as Post[]
        }
    },
    actions: {
        async getUserPosts(id: number) {
            const userPosts = await $api.get(`/getUserPosts?id=${id}`)
            try {
                this.posts = userPosts.data
                console.log('Задаю посты')
            } catch (e) {
                console.log(e)
            }
        },
        async getAllPosts() {
            const allPosts = await $api.get('/getAllPosts')
            console.log(allPosts)
            try {
                this.posts = allPosts.data
            } catch (e) {
                console.log(e)
            }
        },
        async deletePost(id: number) {
            await deletePost(id)
            try {
                this.posts = this.posts.filter(el => el.id !== id)
            }
            catch (e) {
                console.log(e)
            }
        }
    }
})