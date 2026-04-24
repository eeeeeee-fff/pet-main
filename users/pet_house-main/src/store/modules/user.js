export default {
  namespaced: true,
  state: {
    userInfo: {
      userId: null,
      username: null,
      password: null,
      icon: null,
      email: null,
      phone: null,
      gender: null,
      age: null,
      personality: null,
      children: null,
      wage: null,
      experience: null,
      catOrDog: null,
      timewithpet: null,
      cleanwithpet: null,
      bodytypewithpet: null,
      environment: null,
      questionFk: null,
      code: null,
      token: null
    }
  },
  getters: {
  },
  mutations: {
    // 储存登录信息
    setUserInfo (state, obj) {
      state.userInfo = obj
      if (state.userInfo?.icon) state.userInfo.icon = state.userInfo.icon.replace(/^\[|\]$/g, '').trim()
    },
    // 退出登录
    exitLogin (state) {
      for (const [key] of Object.entries(state.userInfo)) {
        state.userInfo[key] = null
      }
    }
  },
  actions: {
  },
  modules: {
  }
}
