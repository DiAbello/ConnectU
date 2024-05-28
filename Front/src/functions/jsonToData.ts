export default function jsonToData<T extends object>(object: T) {
    const data = new FormData()
    for (const [key, value] of Object.entries(object)) {
        data.append(key, value)
    }
    return data
}