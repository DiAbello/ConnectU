//@ts-ignore
import $api from "@/API/http";

async function getPostImages(id: number) {
    return await $api.get(`/getPostImages?postId=${id}`).then(res => res)
}

export default getPostImages