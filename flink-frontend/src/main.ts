import {createApp} from 'vue'
import 'vant/es/toast/style'
import App from './App.vue'
import * as VueRouter from 'vue-router'
import routes from "./config/route";


const router = VueRouter.createRouter({
    history: VueRouter.createWebHashHistory(),
    routes: routes,
})


const app = createApp(App);
app.use(router);
app.mount("#app");
