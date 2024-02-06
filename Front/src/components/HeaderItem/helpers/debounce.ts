import {ref, onUnmounted} from 'vue';
import type {Ref, UnwrapRef} from "vue";
import type {User} from "@/types/User";
//@ts-ignore
import {setQuery} from "@/components/HeaderItem/api/headerAPI";

interface InputElement extends Event {
    target: HTMLInputElement
}

interface GlobalQueryResponse {
    users: User[]
}
export function useDebouncedInput(delay: number) {
    const inputValue = ref('');
    let timeoutId: number;
    const queryResponse: Ref<GlobalQueryResponse> = ref({ users: [] })

    function handleInput(event: InputElement) {
        clearTimeout(timeoutId);
        timeoutId = setTimeout(() => {
            inputValue.value = event.target.value;
            setQuery(inputValue.value).then(res => {
                queryResponse.value = res.data
            })
        }, delay);
    }

    onUnmounted(() => {
        clearTimeout(timeoutId);
    });

    return {
        inputValue,
        handleInput,
        queryResponse
    };
}