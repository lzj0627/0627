import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import '@/assets/css/global.css'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import settings from "@/assets/js/settings";
import cookies from 'vue-cookies'
import axios from "axios";
import {mymixin} from "@/global";


Vue.config.productionTip = false
Vue.prototype.$settings = settings
Vue.prototype.$cookies = cookies
Vue.prototype.$axios = axios


Vue.use(ElementUI);
Vue.mixin(mymixin)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')


