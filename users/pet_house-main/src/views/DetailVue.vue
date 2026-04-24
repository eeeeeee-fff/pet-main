<template>
  <el-main>
    <div class="img">
      <img :src="$imageBaseUrl+petInfo.imageUrl" alt="" v-show="showMode === '2D'">
      <div v-loading="loading" element-loading-text="3D模型加载中">
        <div id="three-container" v-show="showMode === '3D'" ></div>
      </div>
    </div>
    <div class="info">

      <p class="name">{{this.petInfo.name}}</p>

      <div class="info_container">
        <p>有关于它：</p>

        <div class="row">
          <p>
            <span>性别：</span>
            {{this.petInfo.gender===1?'公':'母'}}
          </p>
          <p>
            <span>年龄：</span>
            {{this.petInfo.age}}
          </p>
        </div>

        <div class="row">
          <p>
            <span>体格：</span>
            {{this.petInfo.bodytype}}型
          </p>
          <p>
            <span>品种：</span>
            {{this.petInfo.breed}}
          </p>
        </div>

        <div class="row">
          <p>
            <span>性格：</span>
            {{this.petInfo.personality}}
          </p>
          <p>
            <span>是否接种疫苗：</span>
            {{this.petInfo.vaccination===1?'已接种':'未接种'}}
          </p>
        </div>

        <div class="row">
          <p class="adoptionInfo">
            <span>领养须知：</span>
            {{this.petInfo.adoptionInfo}}
          </p>
        </div>

        <button class="adopt" @click="dialogVisible = true">我要领养</button>
        <button class="show" @click="handleTurn" v-if="has3DModel">{{showMode==='3D'?'2D':'3D'}}展示</button>
        <img src="https://img.js.design/assets/img/67ae0a67791458ad14eea8f2.png#fb4a916214b7e6a1cd85118254df1ec0" alt="">
      </div>
    </div>

    <!-- 宠物申请表 -->
    <el-dialog
     title="宠物申请"
      :visible.sync="dialogVisible"
      width="30%"
      top="10vh">
      <el-form :model="applicationForm" :rules="rules" ref="form" status-icon>
        <el-form-item label="真实姓名：" prop="name">
          <el-input type="text" v-model="applicationForm.name"></el-input>
        </el-form-item>
        <el-form-item label="手机号：" prop="number">
          <el-input type="text" v-model="applicationForm.number"></el-input>
        </el-form-item>
        <el-form-item label="地址：" prop="address">
          <el-input type="text" v-model="applicationForm.address"></el-input>
        </el-form-item>
        <el-form-item label="年龄：" prop="age">
          <el-input type="text" v-model="applicationForm.age"></el-input>
        </el-form-item>
        <el-form-item label="自我描述">
          <el-input type="textarea" v-model="applicationForm.describe"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible=false">取 消</el-button>
        <el-button type="primary" @click="applyForm">确定申请</el-button>
      </div>
    </el-dialog>
  </el-main>
</template>

<script>
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import { getPetInfo, sendDdopt } from '@/api/pet'
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js'

export default {
  data () {
    const nameValidate = (rule, value, callback) => {
      if (!value) return callback(Error('请输入姓名'))
      callback()
    }
    const numberValidate = (rule, value, callback) => {
      const phoneRegex = /^1[3-9]\d{9}$/
      if (!value) return callback(Error('请输入手机号'))
      if (!phoneRegex.test(value)) return callback(Error('请输入有效的手机号'))
      callback()
    }
    const ageValidate = (rule, value, callback) => {
      if (!value) return callback(Error('请输入年龄'))
      const age = Number(value.trim())
      if (!isNaN(age) && Number.isFinite(age)) callback()
      else callback(Error('请输入正确的年龄'))
    }
    return {
      showMode: '2D',
      dialogVisible: false,
      model: [
        { url: '/model/wienerDog2.glb' },
        { url: '/model/whiteCat2.glb' },
        { url: '/model/juicyCat2.glb' },
        { url: '/model/leopardCat3.glb' },
        { url: '/model/wienerDog2.glb' },
        { url: '/model/whiteCat2.glb' }
      ],
      rules: {
        name: { required: true, validator: nameValidate, trigger: 'blur' },
        number: { required: true, validator: numberValidate, trigger: 'blur' },
        age: { required: true, validator: ageValidate, trigger: 'blur' },
        address: { required: true, message: '请输入地址' }
      },
      applicationForm: { name: '', number: '', address: '', describe: '', age: '' },
      petInfo: {},
      loading: true
    }
  },
  computed: {
    has3DModel () {
      const id = Number(this.$route.params.id)
      return id >= 1 && id <= 6
    }
  },
  methods: {
    applyForm () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          sendDdopt(this.applicationForm.address, this.applicationForm.age, this.applicationForm.number, this.applicationForm.name, this.$route.params.id)
            .then(res => {
              if (res.code === 200) {
                this.$message({ message: res.data, type: 'success' })
                this.dialogVisible = false
              }
            }).catch(err => { console.log(err) })
        }
      })
    },
    handleTurn () {
      this.showMode = this.showMode === '3D' ? '2D' : '3D'
    }
  },
  async created () {
    try {
      const res = await getPetInfo(Number(this.$route.params.id))
      this.petInfo = res.data
      this.petInfo.imageUrl = this.petInfo.imageUrl.replace(/^\[|\]$/g, '').trim()
    } catch (error) {
      console.log(error)
    }
  },
  mounted () {
    if (!this.has3DModel) {
      this.loading = false
      return
    }

    const container = this.$el.querySelector('#three-container')
    const width = window.innerWidth * 0.45
    const height = window.innerHeight * 0.9

    const scene = new THREE.Scene()
    this.threeScene = scene

    const camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000)
    camera.position.set(20, 50, -60)
    camera.lookAt(10, 10, 10)
    this.threeCamera = camera

    const renderer = new THREE.WebGLRenderer({ alpha: true })
    renderer.setClearColor(0xffffff, 0.8)
    renderer.setSize(width, height)
    container.appendChild(renderer.domElement)
    this.threeRenderer = renderer

    const controls = new OrbitControls(camera, renderer.domElement)
    this.threeControls = controls

    scene.add(new THREE.AmbientLight(0xffffff, 0.5))
    const dirLight = new THREE.DirectionalLight(0xffffff, 0.5)
    dirLight.position.set(1, 1, 1)
    scene.add(dirLight)

    const animate = () => {
      this.animationFrameId = requestAnimationFrame(animate)
      controls.update()
      renderer.render(scene, camera)
    }
    animate()

    this.onResize = () => {
      const w = window.innerWidth * 0.45
      const h = window.innerHeight * 0.9
      renderer.setSize(w, h)
      camera.aspect = w / h
      camera.updateProjectionMatrix()
    }
    window.addEventListener('resize', this.onResize)

    const modelUrl = this.model[Number(this.$route.params.id) - 1].url
    new GLTFLoader().load(modelUrl, (gltf) => {
      const model = gltf.scene
      model.scale.set(8, 8, 8)
      model.rotation.y = Math.PI
      model.position.set(1, 6, 0)
      scene.add(model)
      this.loading = false
    }, undefined, (error) => {
      console.error('加载模型时出错:', error)
      this.loading = false
      this.$message.error('3D模型加载失败')
    })
  },
  beforeDestroy () {
    cancelAnimationFrame(this.animationFrameId)
    window.removeEventListener('resize', this.onResize)
    if (this.threeScene) {
      this.threeScene.traverse((child) => {
        if (child.isMesh) {
          child.geometry.dispose()
          const mat = child.material
          if (Array.isArray(mat)) mat.forEach(m => m.dispose())
          else mat.dispose()
        }
      })
    }
    if (this.threeRenderer) {
      this.threeRenderer.dispose()
      this.threeRenderer.domElement.remove()
    }
    if (this.threeControls) this.threeControls.dispose()
  }
}
</script>

<style scoped>
*{
  margin: 0;
  padding: 0;
}
.el-main {
  background: rgba(255, 255, 255, 0.2);
  color: rgba(56, 56, 56, 1);
  height: 100vh;
  position: relative;
}

.img,.info{
  /* border: 1px solid black; */
  height: 88%;
  position: absolute;
}
.img{
  width: 45%;
  left: 2vw;
  z-index: 0;
}
img{
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 38.79px;
}

/* 宠物信息 */
.info{
  left:45%;
  /* border: 1px solid black; */
  width: 53%;
  z-index: 1;
}
.info>.name{
  background: url(../assets/name_board.png);
  background-repeat: no-repeat;
  box-shadow: 0px 10.34px 15.52px  rgba(0, 0, 0, 0.25);
  width: 59%;
  height: 20%;
  border-radius: 95px;
  margin-top: 5%;
  background-size: 107%;
  line-height: 150%;
  font-size: 80px;
  text-align: center;
  color: #8360B9;
  letter-spacing: 10px;
}
.info>.info_container{
  width: 100%;
  height: 73%;
  border-radius: 77.02px;
  background: rgba(255, 245, 230, 0.4);
  border: 5.17px solid rgba(166, 166, 166, 1);
  box-shadow: 0px 15.52px 15.52px  rgba(0, 0, 0, 0.25);
  padding: 3% 5%;
  box-sizing: border-box;
  position: relative;
}
.info>.info_container>p{
  font-size: 2.02vw;
  font-weight: 500;
  color: rgba(56, 56, 56, 1);
}
.info>.info_container>p:nth-child(1){
  margin-bottom: 5%;
}
.info>.info_container>.row{
  display: flex;
  flex-wrap: nowrap;
  font-size: 1.7vw;
  margin-bottom:3% ;
}
.info>.info_container>.row>p{
  width: 50%;
}
.info>.info_container>.row .adoptionInfo{
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 4;
  overflow: hidden;
  text-overflow: ellipsis;
}
.info>.info_container>img{
  width: 30%;
  height: 83%;
  position: absolute;
  right: 5%;
  bottom: 0%;
  object-fit: cover;
}
.info>.info_container>button{
  position: absolute;
  bottom: 5%;
  border-radius: 15px;
  background: rgba(255, 141, 26, 1);
  color: rgba(255, 255, 255, 1);
  border: none;
  width: 21%;
  height: 11%;
  cursor: pointer;
  font-size: 1.3vw;
  letter-spacing: 5px;
}
.info>.info_container>.show{
  left: 30%;
}

::v-deep .el-dialog{
  border-radius:21px;
}
</style>
