import Vue from 'vue'
import Vuex from 'vuex'
import user from './modules/user.js'
import knowledge from './modules/knowledge.js'
import forum from './modules/forum.js'
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  },
  getters: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    user,
    knowledge,
    forum
  }
})
