import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui'
import './theme/element/index.css'
import HeaderVue from '@/components/HeaderVue.vue'
import './css/font.css'

// 调用Vue.component 进行全局注册HeaderVue组件
Vue.component('HeaderVue', HeaderVue)

// 设置全局图片基地址
Vue.prototype.$imageBaseUrl = 'http://localhost:8080'

Vue.config.productionTip = false
Vue.use(ElementUI)

// 获取本地用户信息
const userInfo = localStorage.getItem('petHouseInfo')
if (userInfo) {
  store.commit('user/setUserInfo', JSON.parse(userInfo))
}

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
