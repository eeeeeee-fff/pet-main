<template>
  <el-main>
    <!-- Top bar -->
    <div class="topbar">
      <button class="back-btn" @click="$router.back()">
        <i class="el-icon-arrow-left"></i>
        返回列表
      </button>
    </div>

    <div class="layout">
      <!-- Left: image / 3D -->
      <div class="img-section">
        <div class="img-frame">
          <img :src="$imageBaseUrl+petInfo.imageUrl" :alt="petInfo.name" v-show="showMode === '2D'">
          <div v-show="showMode === '3D'" v-loading="loading" element-loading-text="3D 模型加载中..." class="three-wrap">
            <div id="three-container"></div>
          </div>
          <button class="mode-toggle" @click="handleTurn" v-if="has3DModel">
            <i :class="showMode === '3D' ? 'el-icon-picture-outline' : 'el-icon-aim'"></i>
            {{ showMode === '3D' ? '查看 2D 照片' : '3D 立体展示' }}
          </button>
        </div>
      </div>

      <!-- Right: info -->
      <div class="info-section">
        <p class="eyebrow">
          {{ petInfo.breed }} · {{ petInfo.age }} 月龄
        </p>
        <h1 class="pet-name">{{ petInfo.name }}</h1>

        <!-- Quick attribute chips -->
        <div class="attr-chips">
          <span class="attr-chip">{{ petInfo.gender === 1 ? '公' : '母' }}</span>
          <span class="attr-chip">{{ petInfo.bodytype }}型</span>
          <span class="attr-chip" :class="{ accent: petInfo.vaccination === 1 }">
            {{ petInfo.vaccination === 1 ? '已接种疫苗' : '未接种疫苗' }}
          </span>
          <span class="attr-chip" v-if="petInfo.personality">{{ petInfo.personality }}</span>
        </div>

        <!-- About -->
        <div class="info-card">
          <h3 class="section-title">关于领养</h3>
          <p class="about-text">{{ petInfo.adoptionInfo || '暂无领养须知' }}</p>
        </div>

        <!-- Specs grid -->
        <div class="info-card" v-if="hasSpecs">
          <h3 class="section-title">更多信息</h3>
          <div class="specs-grid">
            <div class="spec" v-if="petInfo.monthMoney">
              <p class="spec-label">月花销</p>
              <p class="spec-value">Lv.{{ petInfo.monthMoney }}</p>
            </div>
            <div class="spec" v-if="petInfo.cleanwithpet">
              <p class="spec-label">清洁度</p>
              <p class="spec-value">{{ petInfo.cleanwithpet }}</p>
            </div>
            <div class="spec" v-if="petInfo.environment">
              <p class="spec-label">环境需求</p>
              <p class="spec-value">{{ petInfo.environment }}</p>
            </div>
            <div class="spec" v-if="petInfo.energy">
              <p class="spec-label">精力</p>
              <div class="dots">
                <i v-for="n in 5" :key="`e${n}`" :class="{ active: n <= petInfo.energy }"></i>
              </div>
            </div>
            <div class="spec" v-if="petInfo.hair">
              <p class="spec-label">掉毛程度</p>
              <div class="dots">
                <i v-for="n in 5" :key="`h${n}`" :class="{ active: n <= petInfo.hair }"></i>
              </div>
            </div>
          </div>
        </div>

        <!-- CTA -->
        <button class="adopt-cta" @click="dialogVisible = true">
          <i class="el-icon-thumb"></i>
          我要领养 {{ petInfo.name }}
        </button>
      </div>
    </div>

    <!-- Application Dialog -->
    <el-dialog
      :visible.sync="dialogVisible"
      width="480px"
      top="8vh"
      custom-class="adopt-dialog"
      :show-close="true">
      <div slot="title" class="dialog-header">
        <h2>申请领养 {{ petInfo.name }}</h2>
        <p>请填写真实信息，我们会在 1-3 个工作日内联系你</p>
      </div>
      <el-form :model="applicationForm" :rules="rules" ref="form" label-position="top">
        <el-form-item label="真实姓名" prop="name">
          <el-input type="text" v-model="applicationForm.name" placeholder="请输入您的真实姓名"></el-input>
        </el-form-item>
        <el-form-item label="手机号" prop="number">
          <el-input type="text" v-model="applicationForm.number" placeholder="11 位手机号"></el-input>
        </el-form-item>
        <el-form-item label="居住地址" prop="address">
          <el-input type="text" v-model="applicationForm.address" placeholder="详细到门牌号"></el-input>
        </el-form-item>
        <el-form-item label="您的年龄" prop="age">
          <el-input type="text" v-model="applicationForm.age"></el-input>
        </el-form-item>
        <el-form-item label="自我介绍">
          <el-input type="textarea" :rows="3" v-model="applicationForm.describe"
            placeholder="说说你为什么想领养它，居住环境如何..."></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible=false" class="btn-cancel">取消</el-button>
        <el-button type="primary" @click="applyForm" class="btn-submit">提交申请</el-button>
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
    },
    hasSpecs () {
      const p = this.petInfo
      return p.monthMoney || p.cleanwithpet || p.environment || p.energy || p.hair
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
    },
    getThreeSize () {
      const frame = this.$el.querySelector('.img-frame')
      if (frame) {
        const rect = frame.getBoundingClientRect()
        return { width: rect.width, height: rect.height }
      }
      return { width: window.innerWidth * 0.45, height: window.innerHeight * 0.9 }
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
    let { width, height } = this.getThreeSize()
    if (!width || !height) {
      width = window.innerWidth * 0.45
      height = window.innerHeight * 0.9
    }

    const scene = new THREE.Scene()
    this.threeScene = scene

    const camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000)
    camera.position.set(20, 50, -60)
    camera.lookAt(10, 10, 10)
    this.threeCamera = camera

    const renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true })
    renderer.setClearColor(0xffffff, 0)
    renderer.setSize(width, height)
    container.appendChild(renderer.domElement)
    this.threeRenderer = renderer

    const controls = new OrbitControls(camera, renderer.domElement)
    this.threeControls = controls

    scene.add(new THREE.AmbientLight(0xffffff, 0.6))
    const dirLight = new THREE.DirectionalLight(0xffffff, 0.6)
    dirLight.position.set(1, 1, 1)
    scene.add(dirLight)

    const animate = () => {
      this.animationFrameId = requestAnimationFrame(animate)
      controls.update()
      renderer.render(scene, camera)
    }
    animate()

    this.onResize = () => {
      const size = this.getThreeSize()
      const w = size.width || window.innerWidth * 0.45
      const h = size.height || window.innerHeight * 0.9
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
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.el-main {
  background: #FAFAF7;
  color: #1A1A1A;
  padding: 0;
  height: 100vh;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Microsoft YaHei', sans-serif;
}

/* Top bar */
.topbar {
  flex-shrink: 0;
  padding: 16px 5vw 4px;
}
.back-btn {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: #fff;
  border: 1px solid #EAEAEA;
  color: #4A4A4A;
  padding: 9px 18px;
  border-radius: 999px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease;
  font-family: inherit;
}
.back-btn:hover {
  border-color: #FF8A3D;
  color: #FF8A3D;
  transform: translateX(-2px);
}

/* Layout */
.layout {
  flex: 1;
  display: grid;
  grid-template-columns: minmax(0, 0.92fr) minmax(0, 1.08fr);
  gap: 40px;
  padding: 12px 5vw 24px;
  min-height: 0;
  align-items: stretch;
}

/* Image section */
.img-section {
  height: 100%;
  min-height: 0;
}
.img-frame {
  position: relative;
  border-radius: 28px;
  overflow: hidden;
  background: linear-gradient(135deg, #FFF1E0, #F0EBE3);
  height: 100%;
  box-shadow: 0 16px 48px rgba(0, 0, 0, 0.1);
}
.img-frame > img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.three-wrap,
#three-container {
  width: 100%;
  height: 100%;
}
.three-wrap {
  position: absolute;
  inset: 0;
}
.mode-toggle {
  position: absolute;
  top: 18px;
  right: 18px;
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(14px);
  -webkit-backdrop-filter: blur(14px);
  border: 1px solid rgba(255, 255, 255, 0.7);
  color: #1A1A1A;
  padding: 12px 22px;
  border-radius: 999px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  box-shadow: 0 8px 28px rgba(0, 0, 0, 0.18);
  transition: all 0.25s ease;
  font-family: inherit;
  z-index: 5;
}
.mode-toggle > i {
  font-size: 16px;
}
.mode-toggle:hover {
  background: #FF8A3D;
  color: #fff;
  border-color: #FF8A3D;
  transform: translateY(-2px);
  box-shadow: 0 12px 32px rgba(255, 138, 61, 0.4);
}

/* Info section */
.info-section {
  height: 100%;
  overflow-y: auto;
  overflow-x: hidden;
  padding-right: 6px;
  padding-bottom: 4px;
  scrollbar-width: thin;
  scrollbar-color: #EAEAEA transparent;
}
.info-section::-webkit-scrollbar {
  width: 6px;
}
.info-section::-webkit-scrollbar-thumb {
  background: #E0E0E0;
  border-radius: 3px;
}
.info-section::-webkit-scrollbar-track {
  background: transparent;
}
.eyebrow {
  font-size: 13px;
  color: #FF8A3D;
  font-weight: 600;
  letter-spacing: 0.3px;
  margin-bottom: 8px;
}
.pet-name {
  font-size: 42px;
  font-weight: 800;
  letter-spacing: -1.2px;
  line-height: 1;
  margin-bottom: 18px;
  color: #1A1A1A;
}

/* Attribute chips */
.attr-chips {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 16px;
}
.attr-chip {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: #fff;
  border: 1px solid #EAEAEA;
  color: #4A4A4A;
  padding: 7px 12px;
  border-radius: 10px;
  font-size: 13px;
  font-weight: 500;
}
.attr-chip > .icon {
  font-size: 15px;
}
.attr-chip.accent {
  background: #FFF4EA;
  border-color: #FFD4B0;
  color: #FF8A3D;
  font-weight: 600;
}

/* Info cards */
.info-card {
  background: #fff;
  border-radius: 16px;
  padding: 16px 18px;
  margin-bottom: 12px;
  box-shadow: 0 2px 14px rgba(0, 0, 0, 0.04);
}
.section-title {
  font-size: 14px;
  font-weight: 700;
  margin-bottom: 10px;
  color: #1A1A1A;
  letter-spacing: 0.3px;
}
.about-text {
  font-size: 14px;
  line-height: 1.6;
  color: #4A4A4A;
  white-space: pre-wrap;
}

/* Specs grid */
.specs-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
  gap: 8px;
}
.spec {
  background: #FAFAF7;
  padding: 10px 12px;
  border-radius: 10px;
}
.spec-label {
  font-size: 12px;
  color: #8A8A8A;
  margin-bottom: 4px;
  letter-spacing: 0.2px;
}
.spec-value {
  font-size: 14px;
  font-weight: 600;
  color: #1A1A1A;
}
.dots {
  display: flex;
  gap: 4px;
  margin-top: 2px;
}
.dots > i {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #E5E5E5;
  display: inline-block;
}
.dots > i.active {
  background: #FF8A3D;
}

/* CTA */
.adopt-cta {
  width: 100%;
  background: linear-gradient(135deg, #FF8A3D, #FF6B3D);
  color: #fff;
  border: none;
  padding: 14px;
  border-radius: 14px;
  font-size: 16px;
  font-weight: 700;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  box-shadow: 0 10px 28px rgba(255, 138, 61, 0.35);
  transition: all 0.25s ease;
  font-family: inherit;
  letter-spacing: 0.5px;
  margin-top: 8px;
}
.adopt-cta > i {
  font-size: 18px;
}
.adopt-cta:hover {
  transform: translateY(-2px);
  box-shadow: 0 14px 36px rgba(255, 138, 61, 0.45);
}
.adopt-cta:active {
  transform: translateY(0);
}

/* Dialog overrides */
::v-deep .adopt-dialog {
  border-radius: 20px;
  overflow: hidden;
  box-shadow: 0 24px 80px rgba(0, 0, 0, 0.18);
}
::v-deep .adopt-dialog .el-dialog__header {
  padding: 28px 28px 8px;
  border-bottom: none;
}
::v-deep .adopt-dialog .el-dialog__body {
  padding: 12px 28px 8px;
}
::v-deep .adopt-dialog .el-dialog__footer {
  padding: 16px 28px 24px;
  border-top: none;
}
.dialog-header > h2 {
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 6px;
  color: #1A1A1A;
}
.dialog-header > p {
  font-size: 13px;
  color: #8A8A8A;
}
::v-deep .adopt-dialog .el-form-item {
  margin-bottom: 16px;
}
::v-deep .adopt-dialog .el-form-item__label {
  padding-bottom: 6px;
  font-size: 13px;
  color: #4A4A4A;
  font-weight: 500;
  line-height: 1.4;
}
::v-deep .adopt-dialog .el-input__inner,
::v-deep .adopt-dialog .el-textarea__inner {
  border-radius: 10px;
  border: 1.5px solid #EAEAEA;
  font-size: 14px;
  padding: 10px 14px;
  transition: border-color 0.2s, box-shadow 0.2s;
  font-family: inherit;
}
::v-deep .adopt-dialog .el-input__inner:focus,
::v-deep .adopt-dialog .el-textarea__inner:focus {
  border-color: #FF8A3D;
  box-shadow: 0 0 0 3px rgba(255, 138, 61, 0.12);
}
.btn-cancel {
  border-radius: 10px;
  padding: 10px 22px;
  font-weight: 500;
}
.btn-submit {
  background: #FF8A3D !important;
  border-color: #FF8A3D !important;
  border-radius: 10px;
  padding: 10px 22px;
  font-weight: 600;
}
.btn-submit:hover {
  background: #E67328 !important;
  border-color: #E67328 !important;
}

/* Responsive — 小屏回退到纵向滚动 */
@media (max-width: 980px) {
  .el-main {
    height: auto;
    min-height: 100vh;
    overflow: visible;
    display: block;
  }
  .layout {
    grid-template-columns: 1fr;
    gap: 24px;
    padding: 12px 5vw 40px;
  }
  .img-section {
    height: auto;
  }
  .img-frame {
    height: auto;
    aspect-ratio: 4 / 5;
  }
  .info-section {
    height: auto;
    overflow: visible;
    padding-right: 0;
  }
  .pet-name {
    font-size: 36px;
  }
}
</style>
