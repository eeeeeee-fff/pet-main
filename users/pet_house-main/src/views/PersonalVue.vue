<template>
  <!-- main -->
  <el-main>
    <div class="personal-center">
      <!-- 介绍框 -->
      <div class="message">
        <!-- 头像 -->
        <div class="avatar">
          <el-avatar
            src="https://img.js.design/assets/img/6661ad4b84c4114ed2bd6e5e.png#0aa2527e5614836a235142773f1b8998"></el-avatar>
        </div>
        <p class="userName">{{ this.$store.state.user.userInfo.username }}</p>
        <p class="welcome">欢迎来到掌灯星屿！</p>
        <img class="img" src="../assets/personal.png" alt="">
      </div>
      <!-- 个人信息框 -->
      <div class="message2">
        <h1>
          个人信息
        </h1>
        <hr class="divider">
        <div class="nameShow">
          <div class="smallBox" v-for="(item, index) in userInfo" :key="index">
            <div class="tip">{{ item.label }}</div>
            <div class="value" v-if="item.value">{{ item.value }}</div>
            <div class="value" v-else>暂无信息</div>
          </div>
        </div>
        <el-button type="primary" style="margin-left:200px;width: 100px;margin-top: 30px" @click="dialogVisible = true">
          编辑
          </el-button>
        <img src="../assets/aside_1.png" alt="" class="aside">
        <!-- 个人信息表单弹窗 -->
        <el-dialog title="个人信息编辑" :visible.sync="dialogVisible" width="600px" :before-close="handleClose" append-to-body
          modal-append-to-body lock-scroll close-on-click-modal="true">
          <el-form :model="form" :rules="rules" ref="formRef"> <!-- 添加 ref="formRef" -->
            <el-form-item label="用户名" prop="name">
              <el-input v-model="form.name"></el-input>
            </el-form-item>
            <el-form-item label="性别" prop="gender">
              <el-radio v-model="form.gender" label="1">男</el-radio>
              <el-radio v-model="form.gender" label="2">女</el-radio>
            </el-form-item>
            <el-form-item label="年龄" prop="age">
              <el-input v-model="form.age"></el-input>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="form.email"></el-input>
            </el-form-item>
            <el-form-item label="电话" prop="number">
              <el-input v-model="form.number"></el-input>
            </el-form-item>
          </el-form>
          <span slot="footer" class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="handleSubmit">确 定</el-button>
          </span>
        </el-dialog>
      </div>
      <!-- 我的宠物 -->
      <div class="pet-message">
        <h1>
          我的宠物
        </h1>
        <hr class="divider">
        <el-empty description="暂无宠物，快来添加吧！" v-if="showEmpty">
          <el-button type="primary" style="margin-top: 20px" @click="showPetForm = true">添加</el-button>
        </el-empty>
        <!-- 宠物信息表单弹窗 -->
        <el-dialog title="宠物信息" :visible.sync="showPetForm" width="600px" :before-close="handleClose" append-to-body
          modal-append-to-body lock-scroll close-on-click-modal="true">
          <el-form :model="petForm" :rules="rules" ref="formPetRef"> <!-- 添加 ref="formRef" -->
            <el-form-item label="宠物名字" prop="petName">
              <el-input v-model="petForm.petName"></el-input>
            </el-form-item>
            <el-form-item label="性别" prop="petGender">
              <el-radio v-model="petForm.petGender" label="1">男</el-radio>
              <el-radio v-model="petForm.petGender" label="2">女</el-radio>
            </el-form-item>
            <el-form-item label="年龄" prop="petAge">
              <el-input v-model="petForm.petAge"></el-input>
            </el-form-item>
            <!-- 照片上传(上传了照片不会显示，缺了后端接口，仅用于模拟 POST 请求的响应) -->
            <el-form-item label="照片" prop="petPicture">
              <el-upload action="http://localhost:8081/head/img" list-type="picture-card"
                :on-preview="handlePictureCardPreview" :on-remove="handleRemove" :on-success="handleUploadSuccess" :headers="{'pet':$store.state.user.userInfo.token}">
                <i class="el-icon-plus"></i>
              </el-upload>
              <el-dialog :visible.sync="dialogImgVisible">
                <img width="100%" :src="dialogImageUrl" alt="">
              </el-dialog>
            </el-form-item>
          </el-form>
          <span slot="footer" class="dialog-footer">
            <el-button @click="showPetForm = false">取 消</el-button>
            <el-button type="primary" @click="submitPetForm">确 定</el-button>
          </span>
        </el-dialog>
        <!-- 宠物信息描述列表 -->
        <div v-if="showDescriptions" class="petDescriptionsBox">
          <img :src="uploadedImageUrl || require('../assets/1.jpeg')" alt="我的宠物" class="petImg">
          <!-- <el-descriptions :column="1" border responsive class="petDescriptions">
            <el-descriptions-item contentClassName="item-content" labelClassName="item-label" label-width="10px"
              v-for="(item, index) in petInfo" :key="index" :label="item.label" :width="150"
              :contentStyle="{ 'width': '200px', 'text-align': 'center' }"
              :labelStyle="{ 'width': '100px', 'text-align': 'center' }">
              <span v-if="item.value">{{ item.value }}</span>
              <span v-else>暂无信息</span>
            </el-descriptions-item>
          </el-descriptions> -->
          <div class="nameShow">
           <div class="smallBox" v-for="(item, index) in petInfo" :key="index">
            <div class="tip">{{ item.label }}</div>
            <div class="value" v-if="item.value">{{ item.value }}</div>
            <div class="value" v-else>暂无信息</div>
           </div>
         </div>

        </div>
      </div>
    </div>
  </el-main>
</template>
<script>
// import { state } from '@/store/modules/user'
import { mapState } from 'vuex'
export default {
  data () {
    // 数据
    return {
      radio: '',
      dialogVisible: false,
      dialogImgVisible: false,
      dialogImageUrl: '',
      dialogPetVisible: false,
      userInfo: [],
      petInfo: [],
      uploadedImageUrl: '', // 新增数据项，用于保存上传图片的 URL
      showPetForm: false, // 控制宠物信息表单弹窗的显示
      showEmpty: true, // 控制 el-empty 组件的显示
      showDescriptions: false, // 控制描述列表的显示
      form: {
        username: '',
        age: '',
        email: '',
        gender: '',
        number: '',
        petName: ''
      },
      petForm: {
        petName: '',
        petAge: '',
        petGender: '',
        petPicture: ''
      },
      rules: {
        // 用户信息表单验证规则
        name: { validator: this.nameValidate, trigger: 'blur' },
        gender: { validator: this.genderValidate, trigger: 'change' },
        number: { validator: this.numberValidate, trigger: 'blur' },
        age: { validator: this.ageValidate, trigger: 'blur' },
        // 宠物信息表单验证规则
        petName: { validator: this.petNameValidate, trigger: 'blur' },
        petGender: { validator: this.petGenderValidate, trigger: 'change' },
        petAge: { validator: this.petAgeValidate, trigger: 'blur' },
        petPicture: { validator: this.petPictureValidate, trigger: 'blur' }
      }
    }
  },
  watch: {
    '$store.state.user.userInfo': {
      deep: true,
      immediate: true,
      handler () {
        const userInfoFromState = this.$store.state.user.userInfo
        console.log('新的 userInfo 值:', userInfoFromState)
        if (userInfoFromState) {
          // 更新表单数据
          this.form.username = userInfoFromState.username || ''
          this.form.age = userInfoFromState.age || ''
          this.form.email = userInfoFromState.email || ''
          this.form.gender = userInfoFromState.gender || ''
          this.form.number = userInfoFromState.phone || ''
          // 更新显示的用户信息数组
          this.handleWatch()
        }
      }
    },
    form: {
      deep: true,
      handler () {
        this.handleWatch()
      }
    }
  },
  computed: {
    genderText () {
      if (typeof this.form.gender === 'number') {
        return '男'
      }
      return this.form.gender === '1' ? '男' : (this.form.gender === '2' ? '女' : '暂无信息')
    },
    petGenderText () {
      return this.petForm.petGender === '1' ? '男' : (this.petForm.petGender === '2' ? '女' : '暂无信息')
    },
    ...mapState('user', ['userInfo'])
  },
  created () {
    // 在 created 钩子函数中初始化 userInfo
    this.userInfo = [
      { label: '用户名:', value: this.form.username },
      { label: '性别:', value: this.genderText },
      { label: '年龄:', value: this.form.age },
      { label: '邮箱:', value: this.form.email },
      { label: '电话:', value: this.form.number }
    ]
    this.petInfo = [
      { label: '宠物名', value: this.petForm.petName },
      { label: '性别', value: this.petGenderText },
      { label: '年龄', value: this.petForm.petAge },
      { label: '照片', value: this.petForm.petPicture }
    ]
    this.personalContent = [
      { name: '用户名:', content: '暂无，快来添加吧！' },
      { name: '性别:', content: '暂无，快来添加吧！' },
      { name: '年龄:', content: '暂无，快来添加吧！' }
    ]
  },
  methods: {
    handleWatch () {
      // this.$store.commit('user/setUserInfo', this.userInfo)
      // 实时更新 userInfo 数组
      this.userInfo = [
        { label: '用户名', value: this.form.username },
        { label: '性别', value: this.genderText },
        { label: '年龄', value: this.form.age },
        { label: '邮箱', value: this.form.email },
        { label: '电话', value: this.form.number }
      ]
    },
    handleClose (done) {
      this.$confirm('确认关闭？')
        .then(_ => {
          done()
        })
        .catch(_ => { })
    },
    handleSubmit () {
      this.$refs.formRef.validate((valid) => { // 使用正确的 ref
        if (valid) {
          // 更新 userInfo 数组
          this.userInfo = [
            { label: '用户名', value: this.form.username },
            { label: '性别', value: this.genderText },
            { label: '年龄', value: this.form.age },
            { label: '邮箱', value: this.form.email },
            { label: '电话', value: this.form.number }
          ]
          this.dialogVisible = false
        }
      })
    },
    // 提交宠物信息
    submitPetForm () {
      console.log('表单验证kaishi')
      this.$refs.formPetRef.validate((valid) => { // 使用正确的 ref
        if (valid) {
          console.log('表单验证CGONG')
          // 更新 petInfo 数组
          this.petInfo = [
            { label: '宠物名:', value: this.petForm.petName },
            { label: '性别:', value: this.petGenderText },
            { label: '年龄:', value: this.petForm.petAge }
          ]
          this.showPetForm = false
          this.showEmpty = false
          this.showDescriptions = true
        } else {
          console.log('表单验证失败')
        }
      })
    },
    handleRemove (file, fileList) {
      console.log(file, fileList)
    },
    handlePictureCardPreview (file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    handleUploadSuccess (response, file, fileList) {
      console.log('response:', response)
      // 假设响应中包含图片的 URL，根据实际情况修改
      this.uploadedImageUrl = response.data.replace(/^\[|\]$/g, '').trim()
      console.log(this.uploadedImageUrl)
    },
    // 表单验证
    nameValidate (rule, value, callback) {
      if (!value) {
        return callback(new Error('请输入用户名'))
      }
      callback()
    },
    genderValidate (rule, value, callback) {
      if (!value || (value !== '1' && value !== '2')) {
        return callback(new Error('请选择性别'))
      }
      callback()
    },
    numberValidate (rule, value, callback) {
      const phoneRegex = /^1[3-9]\d{9}$/
      if (!value) {
        return callback(new Error('请输入手机号'))
      }
      if (!phoneRegex.test(value)) {
        return callback(new Error('请输入有效的手机号'))
      }
      callback()
    },
    ageValidate (rule, value, callback) {
      if (!value) callback(Error('请输入年龄'))
      const age = Number(value.trim())
      if (!isNaN(age) && Number.isFinite(age)) {
        callback()
      } else {
        callback(new Error('请输入正确的年龄'))
      }
    },
    // 宠物信息表单验证
    petNameValidate (rule, value, callback) {
      if (!value) {
        return callback(new Error('请输入宠物名'))
      }
      callback()
    },
    petGenderValidate (rule, value, callback) {
      if (!value || (value !== '1' && value !== '2')) {
        return callback(new Error('请选择性别'))
      }
      callback()
    },
    petAgeValidate (rule, value, callback) {
      if (!value) callback(new Error('请输入年龄'))
      const age = Number(value.trim())
      if (!isNaN(age) && Number.isFinite(age)) {
        callback()
      } else {
        callback(new Error('请输入正确的年龄'))
      }
    },
    petPictureValidate (rule, value, callback) {
      if (!value) {
        callback()
      } else {
        // 如果 value 不为空，继续执行原有的验证逻辑
        if (!value) {
          return callback(new Error('请输入宠物照片'))
        }
        callback()
      }
    }
  }
}
</script>
<style scoped>
.tip{
  font-size: 20px;
  margin-top: 20px;
}
.value{
  position: absolute;
  font-size: 18px;
  margin-top: 20px;
  margin-left: 100px;
}
.smallBox{
  display: flex;
  flex-direction: row;
  width: 180px;
}
.nameShow {
  display: flex;
  flex-direction: column;
  margin-left: 110px;
  margin-top: 50px;
  width: 400px;
}

.aside {
  position: absolute;
  top: 115px;
  right: -16px;
  width: 200px;
  height: 500px;
}

.img {
  width: 350px;
  height: 500px;
}

.userName {
  margin-left: 123px;
  margin-top: -10px;
  font-size: 30px;
}

.welcome {
  margin-left: 95px;
  font-size: 20px;
  margin-top: 10px;
  font-weight: 400;
}

/* 布局容器 */
.el-main {
  padding: 0;
  width: 100%;
  height: 1200px;
  background-color: rgba(245, 243, 241, 1);
}

.background {
  /* 90%窗口高度 */
  height: 90vh;
  background: url(https://p6.itc.cn/images01/20231224/a1d5cbeed77f44a1af9debb52c83b24e.jpeg);
  background-size: cover;
  /* 覆盖整个元素 */
  display: flex;
  justify-content: center;
  align-items: center;
}

.personal-center {
  width: 100%;
  display: flex;
  /* padding-left: 100px; */
}

.message {
  width: 350px;
  height: 650px;
  background-color: #ffffff;
  margin-left: 150px;
  margin-top: 5%;
  list-style: none;
  flex-direction: column;
  border-radius: 10px;
  /* 圆角 */
  font-weight: bold;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  /* 毛玻璃 边框 阴影*/
  backdrop-filter: blur(3px);
}

.message2 {
  width: 600px;
  height: 650px;
  background-color: #ffffff;
  margin-left: 30px;
  margin-top: 5%;
  list-style: none;
  flex-direction: column;
  border-radius: 10px;
  /* 圆角 */
  font-weight: bold;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  /* 毛玻璃 边框 阴影*/
  backdrop-filter: blur(3px);
}

.pet-message {
  width: 400px;
  height: 650px;
  background-color: #ffffff;
  display: flex;
  border-radius: 10px;
  /* 圆角 */
  font-weight: bold;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  /* 毛玻璃 边框 阴影*/
  backdrop-filter: blur(3px);
  margin-left: 30px;
  margin-top: 5%;
  list-style: none;
  flex-direction: column;
}

h1 {
  margin-left: 40%;
  margin-top: 60px;
}

.avatar {
  width: 350px;
  height: 200px;
  align-items: center;
}

.el-avatar {
  height: 100px;
  width: 100px;
  margin-top: 20%;
  margin-left: 35%;
  border: black 2px solid;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.descriptions {
  margin-left: 110px;
  margin-top: 100px;
  width: 300px;
  height: 300px;
  display: flex;
  flex-wrap: wrap;
}

.petDescriptions {
  margin-left: 10%;
  width: 300px;
  height: 250px;
  display: flex;
  flex-wrap: wrap;
}

/* 分隔线 */
.descriptions .el-descriptions-item {
  border-bottom: 2px dashed #ccc;
  /* 将分隔线改为 2px 虚线，颜色为 #ccc */
}

.descriptions .el-descriptions-item:last-child {
  border-bottom: none;
  /* 去掉最后一个描述项的分隔线 */
}

.editButton {
  margin-left: 40%;
  margin-top: 50px;
  width: 100px;
  height: 40px;
  border-radius: 10px;
  background-color: orange;
  color: #ffffff;
  /* font-weight: bold; */
}

.petImg {
  width: 200px;
  height: 200px;
  margin-left: 10%;
  border-radius: 10px;
}

.divider {
  margin-top: 30px;
  margin: 20px 60px;
}

.item-content {
  width: 300px;
  /* 根据 label-width 计算内容宽度，并提高样式优先级 */
  background: violet;
}

.item-label {
  width: 200px;
}

.petDescriptionsBox {
  display: flex;
  flex-direction: column;
  align-items: center;
  /* flex-wrap: nowrap; */
  /* 防止子元素换行 */
}
.petDescriptionsBox > .nameShow{
  margin-top: 10px;
  margin-left: 200px;
}

::v-deep .el-dialog{
  border-radius:21px;
}
</style>
