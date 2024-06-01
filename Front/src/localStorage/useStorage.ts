import type {User} from "@/types/User";

const useStorage = {
    Storage(newUser: User) {
        const users: User[] = JSON.parse(localStorage.getItem('local_users') || '{}')
        if(users.find(el => el.id === newUser.id)) {
            return false
        } else {
            users.push(newUser)
        }
        localStorage.setItem('local_users', JSON.stringify(users))
    },
    deleteFromStorage(id: number | undefined) {
        let users: User[] = JSON.parse(localStorage.getItem('local_users') || '{}')
        users = users.filter(el => el.id !== id)
        localStorage.setItem('local_users', JSON.stringify(users))
    },
    updateStorageItem(user: User, id: number) {
        let users: User[] = JSON.parse(localStorage.getItem('local_users') || '{}')
        users = users.filter(el => el.id !== id)
        users.push(user)
        localStorage.setItem('local_users', JSON.stringify(users))
    }
}

export default useStorage