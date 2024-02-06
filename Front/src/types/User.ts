export interface User {
    "id": number,
    "name": string,
    "surname": string,
    "tag": string,
    "email": string,
    "password": string,
    "profile_photo": string,
    "remember_token": string
}

export interface RegUser {
    name: string,
    surname: string,
    tag: string,
    email: string,
    password: string,
    conPass: string
}

export interface LogUser {
    email: string,
    password: string,
}
export interface UserdataForSlider {
    tag: string,
    name: string,
    surname: string,
    profile_photo: string
}