import type {User} from "@/types/User";

export interface Chat extends User{
    chatId: number,
    content: string,
    userId: number
}

export interface MessageContent {
    content: string,
    sender: number | undefined,
    getter: number
}
export interface Message {
    name: string,
    surname: string,
    send_at: string,
    profile_photo: string,
    content: string,
    tag: string,
    id: number
}

export interface Persons {
    person1: number | undefined,
    person2: number
}
