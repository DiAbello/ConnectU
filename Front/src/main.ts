import '@/assets/base.css'
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

import {fas} from "@fortawesome/free-solid-svg-icons"
import {far} from "@fortawesome/free-regular-svg-icons"
import {fab} from "@fortawesome/free-brands-svg-icons"
import GlobalComponents from '@/components/UI/global'

import 'vuetify/styles'
import {createVuetify} from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router/router'

library.add(far, fas, fab)

const app = createApp(App)
const pinia = createPinia()
const vuetify = createVuetify({
    components, directives
})

app.use(pinia).use(router).use(GlobalComponents).use(vuetify).component("font-awesome-icon", FontAwesomeIcon).mount('#app')

