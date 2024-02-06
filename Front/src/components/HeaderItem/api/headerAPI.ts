import type {UnwrapRef} from "vue";
import $api from "@/API/http";

export async function setQuery(searchedValue: UnwrapRef<string>) {
    return await $api.get(`/getQueryResult?q=${searchedValue}`)
}