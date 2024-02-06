//@ts-ignore
import $api from "@/API/http";

async function deletePost(id: number) {
    return await $api.delete(`/deletePost?id=${id}`).then(res => res)
}

export default deletePost