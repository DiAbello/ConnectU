import MyButton from "@/components/UI/MyButton.vue";
import MyInput from "@/components/UI/MyInput.vue";
import MySpinner from "@/components/UI/MySpinner.vue";
const components = [
    { name: 'MyButton', component: MyButton },
    { name: 'MyInput', component: MyInput },
    {name: 'MySpinner', component: MySpinner}
]
export default {
    install(app: any) {
        components.forEach(({name, component}) => {
            app.component(name, component)
        })
    }
}