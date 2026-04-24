<template>
  <div class="container">
    <div class="logo">
      <img src="@/assets/logo.svg" alt="" id="logo" />
    </div>

    <el-tabs id="nav" v-model="path" @tab-click="tabClick">
      <el-tab-pane label="主页" name="/home"></el-tab-pane>
      <el-tab-pane label="宠物" name="/pet"></el-tab-pane>
      <el-tab-pane label="宠物论坛" name="/forum"></el-tab-pane>
      <el-tab-pane label="宠物科普" name="/knowledge"></el-tab-pane>
      <el-tab-pane label="智能匹配" name="/match"></el-tab-pane>
    </el-tabs>

    <div class="search" :style="{visibility: searchInput?'visible':'hidden'}">
      <i class="el-icon-search"></i>
      <input type="text" placeholder="找文章" v-model="search" @keyup.enter="handleSearch()">
    </div>

    <div class="login">
      <el-popover
        placement="top-start"
        width="200"
        trigger="hover">

        <el-avatar
          :src="$store.state.user.userInfo.icon?$imageBaseUrl+$store.state.user.userInfo.icon:'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png'"
          id="avatar"
          slot="reference"
          v-show="$store.state.user.userInfo.token">
        </el-avatar>
        <p id="userID">{{ $store.state.user.userInfo.username }}</p>
        <el-menu :router="true" :default-active="path"><!-- 启用该模式会在激活导航时以 index 作为 path 进行路由跳转 -->
          <el-menu-item index="/personal">
            <i class="el-icon-user"></i>
            <span>个人信息</span>
          </el-menu-item>
          <el-menu-item index="/examine"><!--  index设置路径即可 -->
            <i class="el-icon-view"></i>
            <span>审核中心</span>
          </el-menu-item>
          <el-menu-item @click="dialogVisible=true" index=""><!--  这个index没什么用，只是为了避免被选中 -->
            <i class="el-icon-switch-button"></i>
            <span>退出登录</span>
          </el-menu-item>
        </el-menu>

      </el-popover>
      <i id="state">{{greetings()}}！ {{$store.state.user.userInfo.username?$store.state.user.userInfo.username:'游客,请'}}
        <a href="#/login" v-if="!$store.state.user.userInfo.token">登录</a>
      </i>
    </div>

    <el-tabs class="userMsg" :class="{newMsg:true}" v-model="path" @tab-click="tabClick"><!--  newMsg类是消息提醒的小圆点 -->
      <el-tab-pane label="消息" name="/message/0"></el-tab-pane>
      <el-tab-pane label="我要捐赠" name="/donate"></el-tab-pane>
    </el-tabs>

    <el-dialog
      title="退出登录"
      :visible.sync="dialogVisible"
      width="15vw"
      top="5vh">
      <span>确定要退出登录吗？</span>
      <span slot="footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="exitLogin()">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { logout } from '@/api/login'
export default {
  data () {
    return {
      path: this.$route.path, // 用于路由跳转
      searchInput: false, // 是否显示搜索框
      search: '', // 搜索框内容
      dialogVisible: false // 是否显示退出登录提示弹窗
    }
  },
  methods: {
    // 切换页面
    tabClick (tab) {
      this.$router.push(this.path, () => { })
    },
    sb (tab) {
      this.$router.push(this.path)
    },
    // 问候语
    greetings () {
      const time1 = new Date()
      if (time1.getHours() < 12) return '早上好'
      else if (time1.getHours() < 18) return '下午好'
      else return '晚上好'
    },
    // 退出登录
    async exitLogin () {
      this.dialogVisible = false
      try {
        const res = await logout()
        this.$message({
          type: 'success',
          message: res.data
        })

        this.$store.commit('user/exitLogin')
        localStorage.removeItem('petHouseToken')
        localStorage.removeItem('petHouseInfo')

        // 判断当前页面是否为权限页面
        const publicPath = ['/display', '/home', '/pet', '/knowledge', '/login']
        if (!publicPath.includes(this.$route.path)) window.location.reload()
      } catch (error) {
        console.log(error)
      }
    },
    // 搜索
    handleSearch () {
      this.$store.dispatch('forum/findPosts', this.search)
    }
  },
  watch: {
    '$route' (to) {
      this.path = to.path
      if (to.path === '/forum') {
        this.searchInput = true
      } else this.searchInput = false
    }
  }
}
</script>

<style scoped>
*{
  margin: 0;
  padding: 0;
}
.container{
  height: 10vh;
  width: calc(99vw - 40px);
  display: flex;
  flex-wrap: nowrap;
}

/* logo部分 */
.logo {
  /* margin-left: 10%; */
  height:100%;
}
#logo {
  height: 100%;
  mix-blend-mode: multiply /* 去图片颜色白底 */;
}

/* 导航栏部分 */
#nav {
  margin-left: 3%;
  height: 100%;
}
::v-deep .el-tabs__item{
  font-size: 1.01vw;
}

/* 搜索框部分 */
.search{
  width: 40%;
  height: 100%;
  display: flex;
  flex-wrap: nowrap;
  align-items: center;
}
.search>input{
  background: #F5F5F5;
  width: 75%;
  height: 50%;
  position: relative;
  left: 2%;
  border: none;
  font-size:1.2121vw;
  padding-left: 10%;
}
.el-icon-search{
  position: relative;
  left: 9%;
  z-index: 1;
  font-size: 1.5vw;
  color: rgba(255, 195, 0, 1);
}

/* 登录部分 */
.login {
  display: flex;
  flex-wrap: nowrap;
  align-items: center;
  width: 11%;
}
#avatar{
  margin-top: 85%;
}
#state{
  /* margin-left:3% ; */
  font-size: 1.01vw;
  white-space: nowrap;
}
#userID{
  text-align: center;
  line-height: 200%;
}

.userMsg{
  height: 100%;
  margin: 0 0 0 1.5%;
  position: relative;
}
.newMsg::before{
  content: '';
  display: block;
  width: 7px;
  height: 7px;
  background: rgba(212, 48, 48, 1);
  border-radius: 50%;
  position: absolute;
  top: 22%;
  left: 25%;
}

::v-deep .el-dialog {
  border-radius:21px;
  line-height: normal;
}
::v-deep .el-dialog .el-button{
  padding: 6px 10px;
}
</style>
