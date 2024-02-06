//@ts-ignore
import $api from "@/API/http";
import {el} from "vuetify/locale";

interface ContentProps {
    text: string,
    images: Array<File>
}

const createPostAPI = {
    async createUserPost(tag: string | undefined, id: number | undefined, content: ContentProps) {
        const data = new FormData()
        //@ts-ignore
        const images = content.images
        data.append('userTag', tag)
        data.append('userId', id)
        data.append('text', content.text)
        images.forEach((el, index) => {
            data.append('images[]', el)
        })
        return $api.post('/createUserPost', data).then(res => res)
    },
    async createPublicPost(id: number | undefined, content: ContentProps) {
        const data = new FormData()
        //@ts-ignore
        data.append('postId', id)
        data.append('content', content)
        return $api.post('/createPublicPost', data).then(res => res)
    }
}

export default createPostAPI