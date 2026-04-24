<template>
  <el-main>
    <div class="background">
      <h1 class="font1">Donate</h1>
      <img src="../assets/foodBackground.png" alt="" class="foodBackground">
      <div class="fitlter">
        <div class="box">
          <ul class="form">
            <li v-for="(item, index) in inputItems" :key="index">
              <div class="prefix">{{ item.label }}</div>
              <div class="input-container">
                <!-- <template v-if="item.type==='text'"> -->
                  <input type="text" :id="item.inputId" required="" v-model="item.value">
                <!-- </template> -->
                <div class="underline"></div>
              </div>
            </li>
            <li>
              <div class="prefixGender">{{ catOrDog.label }}</div>
              <el-radio-group v-model="catOrDog.value" >
                <el-radio-button label="狗">狗</el-radio-button>
                <el-radio-button label="猫">猫</el-radio-button>
              </el-radio-group>
            </li>
            <li>
              <div class="prefixGender">{{ gender.label }}</div>
              <el-radio-group v-model="gender.value" :fill="sex === '雄性' ? 'skyblue' : 'pink'">
                <el-radio-button label="雄性"><i class="el-icon-male"></i></el-radio-button>
                <el-radio-button label="雌性"><i class="el-icon-female"></i></el-radio-button>
              </el-radio-group>
            </li>
            <li>
              <div class="prefixGender">{{ vaccination.label }}</div>
              <el-radio-group v-model="vaccination.value" :fill="vaccination === '是' ? '' : ''">
                <el-radio-button label="是">是</el-radio-button>
                <el-radio-button label="否">否</el-radio-button>
              </el-radio-group>
            </li>
            <li style="width: 450px;">
              <div class="prefixShow">萌宠展示：</div>
              <el-upload action="http://localhost:8081/head/img" :file-list="fileList"
              :on-preview="handlePictureCardPreview" :on-remove="handleRemove" :on-success="handleUploadSuccess" :headers="{'pet':$store.state.user.userInfo.token}">
                <el-button size="large" type="default" plain class="upload">点击上传</el-button>
              </el-upload>
              <input type="file" id="uploadImg" hidden>
            </li>
            <button class="donateButton" @click="sendDonateList()">捐赠</button>
          </ul>
          <img src="../assets/donate.webp" alt="" class="dog">
        </div>
        <div class="buttonBox">
          <div class="buttonBox2">
            <!-- 领养须知 -->
            <el-button class="downButton1" @click="downButton1">
              <i class="fa-solid fa-book" style="font-size: 30px;color: aliceblue;"></i>
              <p style="margin-top: 20px;color: aliceblue;">领养须知</p>
            </el-button>
            <!-- 捐赠历史 -->
            <el-button class="downButton2" @click="downButton2">
              <i class="fa-solid fa-book" style="font-size: 30px;color: aliceblue;"></i>
              <p style="margin-top: 20px;color: aliceblue;">捐赠历史</p>
            </el-button>
            <!-- 领养时间 -->
            <el-button class="downButton3" @click="downButton3">
              <i class="fa-solid fa-book" style="font-size: 30px;color: aliceblue;"></i>
              <p style="margin-top: 20px;color: aliceblue;">领养时间</p>
            </el-button>
          </div>
        </div>
        <el-dialog title="领养须知" :visible.sync="adoptDialogVisible" append-to-body="false" :before-close="handleClose"
          lock-scroll :modal-append-to-body="false" center>
          <span class="textKnow" style="margin-top: 0px;">
            感谢您对领养宠物的关注！为了确保您和宠物能够和谐相处，请您仔细阅读以下领养须知：
            <br>
            责任与承诺<br>
            领养宠物是一项长期的责任，请确保您有足够的时间、精力和经济能力来照顾宠物的日常生活和健康需求。
            <br>
            家庭环境<br>
            请确保您的家庭环境适合宠物生活，例如有足够的活动空间、安全的居住条件，并且所有家庭成员都同意领养。
            <br>
            宠物健康<br>
            领养前，请了解宠物的健康状况（如疫苗接种、驱虫情况等），并承诺定期带宠物进行健康检查和疫苗接种。
            <br>
            饮食与护理<br>
            请为宠物提供适合的饮食，并定期为其梳理毛发、修剪指甲、清洁耳朵等，保持宠物的卫生和健康。
            <br>
            陪伴与训练<br>
            宠物需要主人的陪伴和关爱，请每天抽出时间与宠物互动。对于幼宠，建议进行基础训练，帮助其养成良好的行为习惯。
            <br>
            不可弃养<br>
            领养后，请勿随意弃养宠物。如果因特殊原因无法继续照顾宠物，请及时联系领养机构或为其寻找合适的领养家庭。
            <br>
            领养流程<br>
            领养需填写申请表并通过审核，我们可能会进行家访或电话回访，以确保宠物能够适应新环境。
            <br>
            <el-divider></el-divider>
            温馨提示：领养宠物不仅是对生命的尊重，更是一份爱的承诺。希望您能与宠物共同度过美好的时光！
          </span>
          <span slot="footer" class="dialog-footer">
            <el-button @click="adoptDialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="adoptDialogVisible = false">确 定</el-button>
          </span>
        </el-dialog>
        <el-dialog title="捐赠历史" :visible.sync="adoptDialogVisible2" :append-to-body="false" :before-close="handleClose"
          lock-scroll :modal-append-to-body="false" class="elDialog">
          <el-table :data="tableData">
            <el-table-column property="date" label="日期" width="150"></el-table-column>
            <el-table-column property="name" label="宠物姓名" width="200"></el-table-column>
            <el-table-column property="address" label="宠物品种"></el-table-column>
          </el-table>
          <span slot="footer" class="dialog-footer">
            <el-button @click="adoptDialogVisible2 = false">取 消</el-button>
            <el-button type="primary" @click="adoptDialogVisible2 = false">确 定</el-button>
          </span>
        </el-dialog>
        <el-dialog title="领养时间" :visible.sync="adoptDialogVisible3" append-to-body="false" :before-close="handleClose"
          lock-scroll :modal-append-to-body="false" class="elDialog">
          <el-table :data="gridData">
            <el-table-column property="date" label="捐赠日期" width="150"></el-table-column>
            <el-table-column property="name" label="姓名" width="200"></el-table-column>
            <el-table-column property="address" label="宠物品种"></el-table-column>
          </el-table>
          <span slot="footer" class="dialog-footer">
            <el-button @click="adoptDialogVisible3 = false">取 消</el-button>
            <el-button type="primary" @click="adoptDialogVisible3 = false">确 定</el-button>
          </span>
        </el-dialog>
      </div>
    </div>
  </el-main>
</template>

<script>
import { submitDonation } from '@/api/donate.js'
export default {
  data () {
    return {
      inputItems: [
        { label: '宠物姓名：', inputId: 'name', value: '' },
        { label: '年龄：', inputId: 'age', value: '' },
        { label: '宠物性格：', inputId: 'personality', value: '' },
        { label: '联系方式：', inputId: 'donorContact', value: '' }
      ],
      catOrDog: { label: '宠物品种：', inputId: 'breed', value: '' },
      gender: { label: '宠物性别', inputId: 'gender', value: '雄性' },
      vaccination: { label: '是否疫苗', inputId: 'vaccination', value: '是' },
      imageUrl: { label: '照片', inputId: 'imageUrl', value: '' },
      adoptDialogVisible: false,
      adoptDialogVisible2: false,
      adoptDialogVisible3: false,
      fileList: '', // 用于存储上传的图片信息
      tableData: [
        { date: '2025-04-01', name: 'Tom', address: '猫' },
        { date: '2025-04-02', name: 'Jerry', address: '狗' },
        { date: '', name: '', address: '' }
      ],
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
  computed: {
    genderComputed () {
      return this.gender.value === '雄性' ? 1 : 0
    },
    vaccinationComputed () {
      return this.vaccination.value === '是' ? 1 : 0
    }
  },
  methods: {
    downButton1 () {
      this.adoptDialogVisible = true
    },
    downButton2 () {
      this.adoptDialogVisible2 = true
    },
    downButton3 () {
      this.adoptDialogVisible3 = true
    },
    // handleClose (done) {
    //   this.$confirm('确认关闭？')
    //     .then(_ => {
    //       done()
    //     })
    //     .catch(_ => { })
    // },
    sendDonateList () {
      // 将数据转换为对象
      const data = {
        name: this.inputItems.find(item => item.inputId === 'name')?.value,
        gender: Number(this.genderComputed),
        age: Number(this.inputItems.find(item => item.inputId === 'age')?.value),
        personality: this.inputItems.find(item => item.inputId === 'personality')?.value,
        breed: this.catOrDog.value,
        catOrDog: this.catOrDog.value,
        imageUrl: this.fileList,
        vaccination: Number(this.vaccinationComputed),
        adoptionInfo: this.inputItems.find(item => item.inputId === 'personality')?.value,
        donorName: this.$store.state.user.userInfo.username,
        donorContact: this.inputItems.find(item => item.inputId === 'donorContact')?.value,
        status: 1
      }
      console.log(data)
      // const jsonData = JSON.stringify(data)
      submitDonation(data.name,
        data.gender,
        data.age,
        data.personality,
        data.breed,
        data.catOrDog,
        data.imageUrl,
        data.vaccination,
        data.adoptionInfo,
        data.donorName,
        data.donorContact,
        data.status).then(res => {
        res.data = data
        // this.inputItems = res.data.data
        this.$message({
          message: '捐赠成功，待审核',
          type: 'success'
        })
        const date = new Date()
        const year = date.getFullYear()
        const month = String(date.getMonth() + 1).padStart(2, '0')
        const day = String(date.getDate()).padStart(2, '0')
        this.todayDate = `${year}-${month}-${day}`
        this.tableData[2].date = this.todayDate
        this.tableData[2].name = this.inputItems.find(item => item.inputId === 'name')?.value
        this.tableData[2].address = this.catOrDog.value
      }).catch(err => {
      // 发送请求失败
        console.log(err)
      })
    },
    handleUploadSuccess (response, file, fileList) {
      console.log('response:', response)
      this.fileList = response.data
      console.log(this.fileList)
    }
  },
  created () {
  }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap');

.textKnow {
  text-align: left;
  font-size: 18px;
}

.elDialog {
  text-align: center;
}

.upload {
  border-radius: 8px;
}

el-radio-group {
  width: 100px;
  display: flex;
  flex-direction: column;
}

* {
  /* 初始化 */
  margin: 0;
  padding: 0;
  font-family: 'Inter', sans-serif;
}

.font1 {
  position: absolute;
  font-size: 130px;
  letter-spacing: 20px;
  /* 初始状态 */
  transform: translateY(0);
  margin-top: 150px;
  margin-left: 30%;
  background: linear-gradient(to right, #ffbc58, #ffb13db9);
  /* 定义渐变背景 */
  -webkit-background-clip: text;
  /* WebKit 内核浏览器支持的背景裁剪到文本 */
  background-clip: text;
  /* 标准语法，将背景裁剪到文本 */
  -webkit-text-fill-color: transparent;
  font-weight: bold;
  /* animation: topIn 0.8s ease-out forwards; */
  /* 应用动画 */
}

.font2 {
  position: absolute;
  font-size: 130px;
  /* color: #C09258; */
  color: #ffbc58;
  /* font-weight: 00; */
  letter-spacing: 20px;
  margin-top: 150px;
  margin-left: 30%;
}

.font3 {
  position: absolute;
  font-size: 130px;
  /* color: #C09258; */
  color: #ffbc58;
  /* font-weight: 00; */
  letter-spacing: 20px;
  margin-top: 150px;
  margin-left: 48%;
}

h3 {
  position: absolute;
  color: black;
  margin-top: 200px;
  margin-left: 20%;
  margin-right: 20%;
  font-size: 30px;
}

.foodBackground {
  position: absolute;
  height: 700px;
  margin-left: 250px;
  justify-content: center;
  align-items: center;
  /* 让背景图片固定不动 */
  background-attachment: fixed;
}

.background {
  /* position: relative; */
  height: 1200px;
  background-size: cover;
  justify-content: center;
  align-items: center;
  backdrop-filter: blur(10px);
  /* 设置背景模糊效果 */
  background-attachment: fixed;
  /* 混合背景图片和背景颜色 */
  background-image: linear-gradient(to bottom, #EBDFD1, white);
}

.el-main {
  padding: 0;
  height: 1200px;
}

.fitlter {
  width: 100%;
  height: 1200px;
  display: flex;
  flex-direction: column;
  position: relative;
}

.box {
  /* position: relative; */
  width: 55%;
  height: 600px;
  margin-left: 22%;
  margin-top: 330px;
  list-style: none;
  /* background-color: #ffffff; */
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  /* align-items: center; 垂直对齐*/
  /* font-weight: bold; */
  backdrop-filter: blur(3px);
  /* 毛玻璃 边框 阴影*/
  border: 1px solid rgba(255, 255, 255, .5);
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.5);
  border-radius: 100px;
  background: linear-gradient(to right, white 70%, #ff9900 20%);
}

.dog {
  position: absolute;
  height: 880px;
  width: 1500px;
  right: 0px;
  bottom: -100px;
  width: 45%;
  object-fit: contain;
}

.form {
  width: 500px;
  height: 100%;
  margin: 50px;
  margin-left: 180px;
  margin-top: 30px;
  /* margin-top: 10px; */
}

li {
  width: 300px;
  list-style-type: none;
  display: flex;
  flex-direction: row;
  margin-bottom: 10px;
}

.el-input__inner {
  width: 10%;
  border: 1px solid black;
  border-radius: 50px;
}

input:focus,
textarea:focus {
  outline: none;
}

.upload_label {
  /* width: 70%; */
  /* border: 1px solid black; */
  text-align: center;
  cursor: pointer;
}

.donateButton {
  width: 250px;
  background-color: #C09258;
  margin-left: 50px;
  margin-top: 10px;
  outline: none;
  border-radius: 8px;
  padding: 13px;
  color: #fff;
  letter-spacing: 2px;
  border: none;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
  transition: box-shadow 0.5s ease, color 0.5s ease;
}

.donateButton:hover {
  color: #f6f6f6;
  box-shadow: 0 2px 12px -4px rgba(0, 0, 0, 0.5);
  cursor: pointer;
  transition: box-shadow 0.5s ease, color 0.5s ease;
}

.prefixGender {
  width: 150px;
  display: flex;
  flex-direction: row;
  align-items: center;
}

.prefixShow{
  width: 150px !important;
  display: flex;
  flex-direction: row;
  align-items: center;
}

.prefix {
  width: 200px;
  display: flex;
  flex-direction: row;
  align-items: center;
}

.el-input-group__prepend {
  display: block !important;
  opacity: 1 !important;
  z-index: auto !important;
}

/* From Uiverse.io by Satwinder04 */
.input-container {
  position: relative;
  margin-left: 0px;
  width: 300px;
}

.input-container input[type="text"] {
  font-size: 20px;
  width: 100%;
  border: none;
  border-bottom: 2px solid #ccc;
  padding: 5px 0;
  background-color: transparent;
  outline: none;
}

.input-container .label {
  position: absolute;
  top: 0;
  left: 0;
  color: #ccc;
  transition: all 0.3s ease;
  pointer-events: none;
}

.input-container input[type="text"]:focus~.label,
.input-container input[type="text"]:valid~.label {
  top: -20px;
  font-size: 16px;
  color: #333;
}

.input-container .underline {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 2px;
  width: 100%;
  background-color: #997546;
  transform: scaleX(0);
  transition: all 0.3s ease;
}

.input-container input[type="text"]:focus~.underline,
.input-container input[type="text"]:valid~.underline {
  transform: scaleX(1);
}

.uploadImg {
  margin-left: 50px;
}

.buttonBox {
  height: 200px;
  display: flex;
  position: relative;
  margin-top: 180px;
  border-top-left-radius: 50px;
  /* 左上角圆角半径 */
  border-top-right-radius: 50px;
  /* 右上角圆角半径 */
}

.buttonBox2 {
  position: absolute;
  margin-top: -120px;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
  /* border: 3px solid black; */
}

.downButton1,
.downButton2,
.downButton3 {
  margin-left: 200px;
  border: none;
  margin-right: 75px;
  margin-top: 50px;
  width: 400px;
  height: 150px;
  /* border: 3px solid ; */
  border-radius: 15px;
  transition: all 0.3s;
  cursor: pointer;
  background: white;
  font-size: 1.2em;
  font-weight: 550;
}

.downButton1 {
  background-color: #967E76;
}

.downButton2 {
  background-color: #D0B8A8;
}

.downButton3 {
  background-color: #4F3824;
}

.downButton1:hover {
  background: #fcbc5d;
  color: white;
  font-size: 1.5em;
}

.downButton2:hover {
  background: #fcbc5d;
  color: white;
  font-size: 1.5em;
}

.downButton3:hover {
  background: #fcbc5d;
  color: white;
  font-size: 1.5em;
}

@keyframes topIn {
  from {
    transform: translateY(-150px);
  }

  to {
    transform: translateY(0);
    opacity: 1;
  }
}
</style>
