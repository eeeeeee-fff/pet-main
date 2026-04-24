import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeVue from '@/views/HomeVue.vue'
import FrameVue from '@/views/FrameVue.vue'
import LoginVue from '@/views/LoginVue.vue'
import Donate from '@/views/DonateVue.vue'
import ForumVue from '@/views/ForumVue.vue'
import KnowledgeVue from '@/views/KnowledgeVue.vue'
import MatchVue from '@/views/MatchVue.vue'
import PetVue from '@/views/PetVue.vue'
import DisplayVue from '@/views/DisplayVue.vue'
import PersonalVue from '@/views/PersonalVue.vue'
import ExamineVue from '@/views/ExamineVue.vue'
import DetailVue from '@/views/DetailVue.vue'
import MessageVue from '@/views/MessageVue.vue'
Vue.use(VueRouter)

const routes = [
  { path: '/', redirect: '/display' },
  {
    path: '/pethouse',
    component: FrameVue,
    redirect: '/home',
    children: [
      { path: '/home', component: HomeVue },
      { path: '/donate', component: Donate },
      { path: '/forum', component: ForumVue },
      { path: '/knowledge', component: KnowledgeVue },
      { path: '/match', component: MatchVue },
      { path: '/pet', component: PetVue },
      { path: '/detail/:id', component: DetailVue },
      { path: '/personal', component: PersonalVue },
      { path: '/examine', component: ExamineVue },
      { path: '/message/:userId', component: MessageVue }
    ]
  },
  { path: '/login', component: LoginVue },
  { path: '/display', component: DisplayVue }

]

const router = new VueRouter({
  routes
})

const publicPath = ['/display', '/home', '/pet', '/knowledge', '/login']
router.beforeEach((to, from, next) => {
  if (publicPath.includes(to.path)) {
    // 访问无权限页面
    next()
  } else {
    // 访问权限页面
    if (localStorage.getItem('petHouseToken')) {
      next()
    } else {
      if (/detail/.test(to.path)) {
        router.push('/login')
      } else next('/login')
    }
  }

  // const isAuthenticated = localStorage.getItem('token') // 假设使用 localStorage 存储登录状态
  // if (to.matched.some(record => record.meta.requiresAuth) && !isAuthenticated) {
  //   next({
  //     path: '/login'
  //   }) // 如果路由需要认证且用户未登录，重定向到登录页面
  // } else {
  //   next() // 允许访问
  // }
})
export default router
