import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    has_router: false,
    menu_list: [],
    bro_all: [],
    permission_list: []
  },
  getters: {
  },
  mutations: {
    setMenuList(state, menus){
      state.menu_list = menus
      state.has_router = true
    },
    setBro(state, bro){
      state.bro_all = bro
    },
    setPermissionList(state, permission){
      state.permission_list = permission
    }
  },
  actions: {
  },
  modules: {
  }
})
