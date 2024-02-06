export interface Post {
    id: number;
    user_id?: number,
    public_id?: number,
    surname: string,
    name: string,
    tag: string,
    profile_photo: string,
    created_at: string;
    content: string;
    like_count: number
}