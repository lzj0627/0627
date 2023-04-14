import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import cookies from "vue-cookies";
import TestView from "@/views/TestView";
import IndexView from "@/components/IndexView";
import menu from "@/components/MenuTest";
import store from "@/store";
import axios from "axios";
import settings from "@/assets/js/settings";
import UserView from "@/components/UserView";

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'home',
        component: HomeView,
        children: [
            {
                path: '/index',
                name: 'index',
                component: IndexView
            },
        ]
    },
    {
        path: '/login',
        name: 'login',
        component: () => import(/* webpackChunkName: "about" */ '../views/LoginView.vue')
    }
]


const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})


router.beforeEach((to, from, next) => {
    let has_router = store.state.has_router
    let token = cookies.get('token')
    if (to.path === '/login' || to.path === '/test') {//登陆页面，直接走
        next()
    } else if (!token) {  //token不存在，跳转到登陆页面
        next({path: '/login'})
    } else if (token && !has_router) {
        axios.get(settings.BASE_URL + '/permission/menu/', {headers: {Authorization: cookies.get('token')}}).then(res => {
            // console.log(res)
            store.commit('setMenuList', res.data.data)
            store.commit('setPermissionList', res.data.permission)
            let newRoute = router.options.routes
            res.data.data.forEach(menu => {
                if (menu.children) {
                    menu.children.forEach(e => {
                        let route = setRouter(e)
                        newRoute[0].children.push(route)
                    })
                }
            })
            router.addRoutes(newRoute)
            store.state.has_router = true
        })
    }
    next()
})

const setRouter = (menu) => {
    let route = {
        path: menu.path,
        name: menu.name,
    }
    route.component = () => import('@/components/' + menu.component + '.vue')
    return route
}

export default router
