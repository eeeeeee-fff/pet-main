<template>
  <div class="back">
    <div class="container">
      <!-- 表单部分 -->
      <div class="form-box" ref="form_box">
        <el-form class="el_form" :model="formData" :rules="rules" ref="form" status-icon>
          <!-- 注册 -->
          <div class="register-box hidden" ref="register_box">
            <h1>注册</h1>
            <!-- 姓名 -->
            <el-form-item class="el_form_item" prop="name">
              姓名：<input type="text" v-model="formData.name" @blur="triggerValidation('name')">
            </el-form-item>

            <!-- 密码 -->
            <el-form-item  class="el_form_item" prop="password">
              密码：<input type="password" v-model="formData.password">
            </el-form-item>

            <!-- 邮箱 -->
            <el-form-item  class="el_form_item" prop="mail">
              邮箱：<input type="text" v-model="formData.mail" @blur="triggerValidation('mail')">
            </el-form-item>

            <!-- 手机号 -->
            <el-form-item  class="el_form_item" prop="number">
              手机：<input type="text" v-model="formData.number" @blur="triggerValidation('number')">
            </el-form-item>

            <!-- 性别 -->
            <el-form-item  class="el_form_item" prop="sex">
              性别：
              <el-radio-group v-model="formData.sex" id="sex" >
                <el-radio label="1"><i>男</i></el-radio>
                <el-radio label="2"><i>女</i></el-radio>
              </el-radio-group>
            </el-form-item>

            <!-- 收入 -->
            <el-form-item  class="el_form_item" prop="income">
              <div class="select_income">
                <input type="text" v-model="formData.income" @click="showIncomeOption" id="income" readonly>
                <i :class="{'el-icon-arrow-down':!showIncomeOp,'el-icon-arrow-up':showIncomeOp}"  @click="showIncomeOption"></i>
                <div class="incomesOp" :style="{visibility:showIncomeOp?'visible':'hidden',zIndex:showIncomeOp?1:-1}">
                  <input type="text" value="0-3000" @click="chooseIncome('0-3000')" class="income_option" readonly>
                  <input type="text" value="3000-7000" @click="chooseIncome('3000-7000')" class="income_option" readonly>
                  <input type="text" value="7000-10000" @click="chooseIncome('7000-10000')" class="income_option" readonly>
                  <input type="text" value="10000以上" @click="chooseIncome('10000以上')" class="income_option" readonly>
                </div>
              </div>
            </el-form-item>

            <!-- 年龄 -->
            <el-form-item class="el_form_item" prop="age" :style="{visibility:!showIncomeOp?'visible':'hidden'}">
              年龄：<input type="text" v-model="formData.age" @blur="triggerValidation('age')">
            </el-form-item>

            <!-- 养宠经验 -->
            <el-form-item class="el_form_item" prop="experience">
              <div class="select_experience" :style="{visibility:!showIncomeOp?'visible':'hidden'}">
                <input type="text" v-model="formData.experience" @click="showExperienceOption" id="experience" readonly>
                <i :class="{'el-icon-arrow-down':!showExperienceOp,'el-icon-arrow-up':showExperienceOp}" @click="showExperienceOption"></i>
                <div class="experienceOp" :style="{visibility:showExperienceOp?'visible':'hidden'}">
                  <input type="text" value="0 到 两年半" @click='chooseExperience("0 到 两年半")' class="experience_option" readonly>
                  <input type="text" value="两年半 到 十年" @click='chooseExperience("两年半 到 十年")' class="experience_option" readonly>
                  <input type="text" value="十年以上" @click='chooseExperience("十年以上")' class="experience_option" readonly>
                </div>
              </div>
            </el-form-item>

            <!-- 偏爱 -->
            <el-form-item  class="el_form_item" prop="preference"  :style="{visibility:!showExperienceOp?'visible':'hidden'}">
              偏爱：
              <el-radio-group v-model="formData.preference" id="preference">
                <el-radio label="狗"><i>狗</i></el-radio>
                <el-radio label="猫"><i>猫</i></el-radio>
              </el-radio-group>
            </el-form-item>

            <button :style="{visibility:!showExperienceOp?'visible':'hidden'}" @click.prevent="signUp">注册</button>
          </div>

          <!-- 登录 -->
          <div class="login-box" ref="login_box">
            <h1>登录</h1>
            <!-- 用户名/邮箱 -->
            <el-form-item class="el_form_item">
              {{ loginMode==='邮箱登录'?'用户名':'邮箱' }}：
              <input type="text" v-model="formData.LoginData.userName">
            </el-form-item>
            <!-- 密码 -->
            <el-form-item class="el_form_item" v-show="loginMode=='邮箱登录'">
              密 码：
              <input type="password" v-model="formData.LoginData.password">
            </el-form-item>
            <!-- 验证码 -->
            <el-form-item class="el_form_item">
              验证码：
              <input type="text" v-model="formData.LoginData.code">
            </el-form-item>
            <!-- <img src="https://img0.baidu.com/it/u=3528227727,3536117093&fm=253&fmt=auto&app=138&f=JPEG?w=395&h=200" alt="" v-show="loginMode=='邮箱登录'" id="code"> -->
            <!-- 图片验证码 -->
            <div class="code" @click="refreshCode"  v-show="loginMode=='邮箱登录'">
              <s-identify :fresh="flag" @makedCode="getMakedCode"></s-identify>
            </div>
            <button @click.prevent="signIn">登录</button>
            <button id="login_way" @click="loginWay">{{loginMode}}</button>
            <button id="getCode" :class="{gettingCode:codeSendTime}" @click="getCode" v-show="loginMode!=='邮箱登录'">{{!codeSendTime?'获取验证码':codeSendTime+'秒'}}</button>
          </div>
        </el-form>
      </div>

      <!-- 侧边欢迎提示部分 -->
      <div class="con-box left" ref="con_box_left">
        <h2>欢迎来到<span>宠物之家</span></h2>
        <p>快来领取你的专属<span>宠物</span>吧</p>
        <p>已有账号</p>
        <button id="login" @click="handleLogin">去登录</button>
      </div>
      <div class="con-box right" ref="con_box_right">
        <h2>欢迎来到<span>宠物之家</span></h2>
        <p>快来看看你的可爱<span>宠物</span>吧</p>
        <p>没有账号？</p>
        <button id="register" @click="handleLogup">去注册</button>
      </div>
    </div>
  </div>
</template>

<script>
import { sendMailCode, mailLogin, usernameLogin, logup } from '@/api/login.js'
import SIdentify from '@/components/SIdentify.vue'
export default {
  components: {
    SIdentify
  },
  data () {
    const nameValidate = (rule, value, callback) => {
      if (!value) {
        return callback(Error('请输入姓名'))
      }
      callback()
    }
    const numberValidate = (rule, value, callback) => {
      const phoneRegex = /^1[3-9]\d{9}$/ // 手机号码的正则
      if (!value) {
        return callback(Error('请输入手机号'))
      }
      if (!phoneRegex.test(value)) {
        return callback(Error('请输入有效的手机号'))
      }
      callback()
    }
    const mailValidate = (rule, value, callback) => {
      if (!value) {
        return callback(Error('请输入邮箱地址'))
      }
      if (value.includes('@')) {
        callback()
      }
      callback(Error('请输入有效的邮箱地址'))
    }
    const incomeValidate = (rule, value, callback) => {
      if (value === '请选择你的薪资水平') return callback(Error('请选择您的薪资水平'))
      callback()
    }
    const experienceValidate = (rule, value, callback) => {
      if (value === '请选择你的养宠经验') return callback(Error('请选择您的养宠经验'))
      callback()
    }
    const ageValidate = (rule, value, callback) => {
      if (!value) callback(Error('请输入年龄'))

      const age = Number(value.trim())
      if (/^\d+$/.test(value)) {
        if (age < 0 || age > 120) return callback(Error('请输入正确的年龄'))
        else callback()
      } else {
        callback(Error('请输入正确的年龄'))
      }
    }
    return {
      formData: {
        name: '',
        password: '',
        mail: '',
        number: '',
        sex: '1',
        income: '请选择你的薪资水平',
        age: '',
        experience: '请选择你的养宠经验',
        preference: '狗',
        LoginData: {
          userName: '', // 用户名 或者 邮箱地址
          password: '',
          code: ''
        }
      },
      rules: {
        name: { validator: nameValidate },
        number: { validator: numberValidate },
        mail: { validator: mailValidate },
        income: { validator: incomeValidate },
        experience: { validator: experienceValidate },
        age: { validator: ageValidate }
      },
      showIncomeOp: false,
      showExperienceOp: false,
      loginMode: '邮箱登录', // 登录按钮下方的登录方式切换的文本，值为‘邮箱登录’时 代表当前登录方式是‘用户名登录’，反之
      codeSendTime: 0, // 距离下一次可发送邮箱验证码的时间
      flag: true, // 控制验证码刷新
      code: '' // 存储生成的验证码
    }
  },
  methods: {
    // 点击 → 去登录
    handleLogin () {
      this.$refs.form_box.style.transform = 'translateX(-0.5%)'
      this.$refs.register_box.classList.add('hidden')
      this.$refs.login_box.classList.remove('hidden')
      this.$refs.con_box_left.style.visibility = 'hidden'
      this.$refs.con_box_right.style.visibility = 'visible'
    },
    // 点击 → 去注册
    handleLogup () {
      this.$refs.form_box.style.transform = 'translateX(104%)'
      this.$refs.login_box.classList.add('hidden')
      this.$refs.register_box.classList.remove('hidden')
      this.$refs.con_box_right.style.visibility = 'hidden'
      this.$refs.con_box_left.style.visibility = 'visible'
    },
    // 展开收入选项
    showIncomeOption () {
      this.showIncomeOp = !this.showIncomeOp
      // 隐藏下方的多选框，防止用户先点下面又不选
      this.showExperienceOp = false
    },
    // 用户选择 收入选项
    chooseIncome (userInput) {
      this.formData.income = '收入：' + userInput
      this.showIncomeOp = false
    },
    // 展开养宠经验选项
    showExperienceOption () {
      this.showExperienceOp = !this.showExperienceOp
    },
    // 用户选择 养宠经验
    chooseExperience (userInput) {
      this.formData.experience = '养宠经验：' + userInput
      this.showExperienceOp = false
    },
    // 登录方式切换
    loginWay () {
      if (this.loginMode === '邮箱登录') {
        // 切换成 邮箱登录
        this.loginMode = '用户名登录'
        this.formData.LoginData.userName = ''
        this.formData.LoginData.password = ''
        this.formData.LoginData.code = ''
      } else if (this.loginMode === '用户名登录') {
        // 切换成 用户名登录
        this.loginMode = '邮箱登录'
        this.formData.LoginData.userName = ''
        this.formData.LoginData.password = ''
        this.formData.LoginData.code = ''
      }
    },
    // 获取验证码
    async getCode () {
      if (this.formData.LoginData.userName === '') {
        this.$message.error('请输入邮箱地址')
        return
      }
      try {
        const res = await sendMailCode(this.formData.LoginData.userName)
        if (res.code === 200) {
          // 提示发送成功
          this.$message({
            message: res.data,
            type: 'success'
          })
          // 按钮倒计时
          this.codeSendTime = 60
          const time1 = setInterval(() => {
            this.codeSendTime -= 1
            if (!this.codeSendTime) clearInterval(time1)
          }, 1000)
        } else if (res.msg?.includes('注册')) {
          // 没有注册的用户 跳转到注册页面
          this.handleLogup()
        }
      } catch (err) {
        console.log(err)
      }
    },
    // 验证表单子项
    triggerValidation (fieldName) {
      this.$refs.form.validateField(fieldName)
    },
    // 注册
    signUp () {
      // 先进行表单验证
      this.$refs.form.validate((valid) => {
        if (valid) {
          const experienceVal = {
            '养宠经验：0 到 两年半': 1,
            '养宠经验：两年半 到 十年': 2,
            '养宠经验：十年以上': 3
          }
          const incomeVal = {
            '收入：0-3000': 1,
            '收入：3000-7000': 2,
            '收入：10000以上': 3
          }
          const data = {
            username: this.formData.name,
            password: this.formData.password,
            email: this.formData.mail,
            phone: this.formData.number,
            gender: Number(this.formData.sex),
            age: parseInt(this.formData.age),
            wage: incomeVal[this.formData.income],
            experience: experienceVal[this.formData.experience],
            catOrDog: this.formData.preference
          }
          logup(data)
            .then((res) => {
              if (res.code === 200) {
                // 注册成功
                this.$message({
                  message: '注册成功',
                  type: 'success'
                })
                // 注册成功后跳转到邮箱登录模式，并为用户输入邮箱地址
                this.handleLogin()
                this.loginMode = '用户名登录'
                this.formData.LoginData.userName = this.formData.mail
              }
            }).catch((error) => {
            // 失败
              console.log(error)
            })
        }
      })
    },
    // 登录
    async signIn () {
      // 该判断是检查 用户名登录 时，验证码是否正确
      if (this.loginMode === '邮箱登录' && this.formData.LoginData.code !== this.code) {
        this.$message.error('请输入正确的验证码！')
        return
      }
      if (this.loginMode === '用户名登录') {
        try {
          // 用户使用 邮箱登录
          const res = await mailLogin(this.formData.LoginData.userName, this.formData.LoginData.code)
          this.$store.commit('user/setUserInfo', res.data)
          localStorage.setItem('petHouseToken', res.data.token)
          localStorage.setItem('petHouseInfo', JSON.stringify(res.data.data))
          // 提示信息
          this.$message({
            message: res.msg ?? '登录成功',
            type: 'success'
          })
          // 页面跳转
          this.$router.push('/home')
        } catch (error) {
          console.log(error)
        }
      } else if (this.loginMode === '邮箱登录') {
        try {
          // 用户使用 用户名登录
          const res = await usernameLogin(this.formData.LoginData.userName, this.formData.LoginData.password)
          if (res.msg?.includes('没有查询')) {
            this.handleLogup()
            return
          }
          // 存入数据
          this.$store.commit('user/setUserInfo', res.data)
          localStorage.setItem('petHouseToken', res.data.token)
          localStorage.setItem('petHouseInfo', JSON.stringify(res.data))
          // 提示信息
          this.$message({
            message: '登录成功',
            type: 'success'
          })
          // 页面跳转
          this.$router.push('/home')
        } catch (error) {
          console.log(error)
        }
      }
    },
    // 接收验证码
    getMakedCode (code) {
      this.code = code
    },
    // 手动刷新验证码
    refreshCode () {
      this.flag = !this.flag // 切换 fresh 的值以触发刷新
    }
  },
  mounted () {
    this.flag = !this.flag // 生成验证码
  },
  watch: {
    // 用户选择后进行表单验证
    'formData.income' () {
      this.triggerValidation('income')
    },
    'formData.experience' () {
      this.triggerValidation('experience')
    }
  }
}
</script>

<style scoped>
*{
  margin: 0;
  padding: 0;
}
/* 表单部分 */
.back{
  position: relative;
  /* 100%窗口高度 */
  height: 100vh;
  background: url(../assets/login_background.jpg);
  background-size: cover; /* 覆盖整个元素 */
  display: flex;
  justify-content: flex-start;
  align-items: center;
}
.container{
  width: 650px;
  height: 650px;
  border-radius: 10px;/* 圆角 */

  /* 定位 */
  position: relative;
  left: 8%;

  /* 毛玻璃 边框 阴影*/
  backdrop-filter:blur(8px);
  border:1px solid rgba(255,255,255,.5);
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.5);
}
.el_form{
  width: 100%;
}
.el_form_item {
  width: 100%;
  position: relative;
  left: 15%;
  margin-bottom: 15px;
}
.form-box{
  width: 320px;
  height: 650px;

  backdrop-filter:blur(8px);
  box-shadow: 2px 0 10px rgba(0,0,0,0.5);
  border-radius: 10px;

  display: flex;
  align-items: center;

  z-index: 2;
  /* 动画过渡 加速后减速 */
  transition: 0.5s ease-in-out;
}
.register-box,.login-box{
  /* 弹性布局 垂直排列 */
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
}
.login-box .el_form_item{
  left: 10%;
}
.hidden{
  display: none;
  transition: 0.5s;
}
h1{
  text-align: center;
  /* margin-bottom: 25px; */
  color: #fff;
  /* 字间距 */
  letter-spacing: 5px;
  margin-bottom: 17px;
}
input{
  /* 透明 */
  background-color: transparent;
  /* width: 70%; */
  width: 50%;
  color: #fff;
  border: none;
  /* 下边框样式 */
  border-bottom: 1px solid rgba(255,255,255,0.6);
  padding: 10px 0;
  text-indent: 10px;
  /* margin: 8px 0; */
  font-size: 14px;
  letter-spacing: 2px;
}
.el_form_item{
  color: #fff;
  letter-spacing: 5px;
}
input::placeholder{
  color: #fff;
}
input:focus{
  color: black;
  outline: none;
  border-bottom: 1px solid #a262ad80;
  transition: 0.5s;
}
input:focus::placeholder{
  opacity: 0;
}
.form-box button{
  width: 70%;
  margin-top: 5px;
  background-color: #C09258;
  outline: none;
  border-radius: 8px;
  padding: 13px;
  color: #fff;
  letter-spacing: 2px;
  border: none;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
}
.form-box button:hover{
  /* background-color: #a97f4d; */
  color: #f6f6f6;
  transition: background-color 0.5s ease;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.5);
}
i{
  /* icon和单选框字体颜色 */
  color: #fff;
}
#sex,#preference{
  width: 60%;
  height: 36px;
  display: flex;
  align-items: center;
  position: absolute;
  top: 5%;
  left: 20%;
}
.select_income{
  width: 70%;;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
}
.select_income>i{
  position: absolute;
  top: 37%;
  left: 90%;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
}
#income{
  width: 100%;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
}
.incomesOp{
  width: 100%;
  position: absolute;
  display: flex;
  flex-direction: column;
  top: 86%;
  border-left: 1px solid rgba(255,255,255,0.4);
  border-right:1px solid rgba(255,255,255,0.4);
}
.income_option{
  width: 100%;
  margin: 0;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
}
.income_option:hover{
  background-color: #A97F4D;
}
/* 该部分开始与上述一样 */
.select_experience{
  width: 70%;;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
}
.select_experience>i{
  position: absolute;
  top: 37%;
  left: 90%;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
}
#experience{
  width: 100%;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
}
.experienceOp{
  visibility: hidden;
  width: 100%;
  position: absolute;
  display: flex;
  flex-direction: column;
  top: 86%;
  border-left: 1px solid rgba(255,255,255,0.4);
  border-right:1px solid rgba(255,255,255,0.4);
}
.experience_option{
  width: 100%;
  margin: 0;
  z-index: 1;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
}
.experience_option:hover{
  background-color: #A97F4D;
}
/* 结束 */
#code {
  width: 30%;
  align-self: flex-start;
  padding: 13px 0 0 113px;
}
#login_way {
  margin-top:15px;
  background-color: transparent;
  color: #fff;
  border: 1px solid rgba(0, 0, 0, 0.1);
}
#login_way:hover {
  border: 1px solid #a97f4d;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.5);
}
#getCode {
  margin-top: 0px;
  position: absolute;
  top:44%;
  left:61%;
  width: 30%;
  padding: 10px 0px;
}
.login-box>.gettingCode {
  background-color: transparent;
  cursor:not-allowed;
  border: 1px solid rgba(0, 0, 0, 0.2);
}
.login-box>.gettingCode:hover {
  box-shadow: none;
}
.login-box button{
  margin-top: 25px;
}

/* 文字提示 */
.con-box{
  width: 50%;
  /* 弹性布局 垂直排列 居中 */
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  /* 绝对定位 居中 */
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
}
.con-box.left{
  left: -2%;
  visibility: hidden;
}
.con-box.right{
  right: -2%;
}
.con-box h2{
  color: #fff;
  font-size: 25px;
  font-weight: bold;
  letter-spacing: 3px;
  text-align: center;
  margin-bottom: 4px;
}
.con-box p{
  font-size: 12px;
  letter-spacing: 2px;
  color: #fff;
  text-align: center;
}
.con-box span{
  color: #fff;
}
.con-box img{
  width: 150px;
  height: 150px;
  opacity: 0.9;
  margin: 40px 0;
}
.con-box button{
  margin-top: 3%;
  background-color: #C09258;
  color: #fff;
  border: 1px solid #C09258;
  padding: 6px 10px;
  border-radius: 5px;
  letter-spacing: 1px;
  outline: none;
  cursor: pointer;
}
.con-box button:hover{
  background-color: #a97f4d;
  color: #fff;
}
</style>
