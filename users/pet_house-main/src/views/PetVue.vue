<template>
  <el-main>
    <!-- Hero -->
    <section class="hero">
      <div class="hero-blob hero-blob-1"></div>
      <div class="hero-blob hero-blob-2"></div>
      <div class="hero-content">
        <p class="hero-eyebrow">🐾 Pet Adoption</p>
        <h1 class="hero-title">
          找到你的<span class="accent">下一个家人</span>
        </h1>
        <p class="hero-sub">
          <strong>{{ petsList[0]?.totlepage || 0 }}</strong> 只可爱的小生命，正在等待一个家
        </p>
        <div class="search-bar">
          <i class="el-icon-search search-icon"></i>
          <input
            class="search-input"
            type="text"
            placeholder="搜索姓名 / 品种 / 性格..."
            v-model="search"
            @keyup.enter="getList()"
          />
          <button class="search-btn" @click="getList()">搜索</button>
        </div>
      </div>
    </section>

    <!-- Filters -->
    <section class="filters">
      <div class="filter-row">
        <span class="filter-label">类型</span>
        <button class="chip" :class="{active: catOrDog===''}" @click="catOrDog=''">全部</button>
        <button class="chip" :class="{active: catOrDog==='猫'}" @click="catOrDog='猫'">🐱 猫</button>
        <button class="chip" :class="{active: catOrDog==='狗'}" @click="catOrDog='狗'">🐶 狗</button>
      </div>
      <div class="filter-row">
        <span class="filter-label">年龄</span>
        <button class="chip" :class="{active: age===''}" @click="age=''">全部</button>
        <button class="chip" :class="{active: age==='1'}" @click="age='1'">0-6 个月</button>
        <button class="chip" :class="{active: age==='2'}" @click="age='2'">6-12 个月</button>
        <button class="chip" :class="{active: age==='3'}" @click="age='3'">1-3 岁</button>
        <button class="chip" :class="{active: age==='4'}" @click="age='4'">3-6 岁</button>
        <button class="chip" :class="{active: age==='5'}" @click="age='5'">> 6 岁</button>
      </div>
      <div class="filter-row">
        <span class="filter-label">体型</span>
        <button class="chip" :class="{active: body===''}" @click="body=''">全部</button>
        <button class="chip" :class="{active: body==='小'}" @click="body='小'">小型</button>
        <button class="chip" :class="{active: body==='中'}" @click="body='中'">中型</button>
        <button class="chip" :class="{active: body==='大'}" @click="body='大'">大型</button>
        <button class="chip" :class="{active: body==='超大'}" @click="body='超大'">超大型</button>
      </div>
    </section>

    <!-- Pet Grid -->
    <section class="pet-grid" v-if="petsList.length">
      <article
        class="pet-card"
        v-for="pet in petsList"
        :key="pet.petId"
        @click="toPet(pet.petId)"
      >
        <div class="card-img-wrap">
          <img :src="$imageBaseUrl + pet.imageUrl" :alt="pet.name" />
          <div class="card-badges">
            <span class="badge badge-type">
              {{ pet.catOrDog === '猫' ? '🐱' : '🐶' }} {{ pet.catOrDog }}
            </span>
            <span v-if="pet.vaccination === 1" class="badge badge-vaccine">
              ✓ 已疫苗
            </span>
          </div>
          <div class="card-name-overlay">
            <h2>{{ pet.name }}</h2>
            <p>{{ pet.breed }}</p>
          </div>
        </div>

        <div class="card-body">
          <div class="meta-chips">
            <span class="meta-chip">
              <i class="el-icon-time"></i>{{ pet.age }} 月
            </span>
            <span class="meta-chip">
              <i class="el-icon-data-line"></i>{{ pet.bodytype }}型
            </span>
            <span class="meta-chip">
              <i class="el-icon-star-off"></i>{{ pet.personality }}
            </span>
          </div>
          <p class="adoption-info">{{ pet.adoptionInfo }}</p>
          <button class="adopt-btn">
            我要领养
            <i class="el-icon-arrow-right"></i>
          </button>
        </div>
      </article>
    </section>

    <!-- Empty state -->
    <div class="empty" v-else>
      <div class="empty-icon">🐾</div>
      <p class="empty-title">没有找到匹配的宠物</p>
      <p class="empty-sub">试试调整筛选条件吧</p>
      <button class="empty-btn" @click="resetFilters">清除筛选</button>
    </div>

    <!-- Pagination -->
    <el-pagination
      v-if="petsList.length"
      class="pagination"
      background
      layout="prev, pager, next"
      :page-size="6"
      :total="petsList[0]?.totlepage"
      @current-change="handlePageChange"
    />
  </el-main>
</template>

<script>
import { getPetsInfo } from '@/api/pet.js'
export default {
  data () {
    return {
      catOrDog: '',
      age: '',
      body: '',
      age1: null,
      age2: null,
      page: 0,
      search: null,
      petsList: []
    }
  },
  methods: {
    toPet (id) {
      this.$router.push(`/detail/${id}`)
    },
    async getList () {
      try {
        const res = await getPetsInfo(this.age2, this.page, this.catOrDog, this.age1, this.body, this.search)
        this.petsList = res.data
        this.petsList.forEach(pet => {
          pet.imageUrl = pet.imageUrl.replace(/^\[|\]$/g, '').trim()
        })
      } catch (error) {
        console.log(error)
      }
    },
    handlePageChange (page) {
      this.page = page - 1
      this.getList()
    },
    resetFilters () {
      this.catOrDog = ''
      this.age = ''
      this.body = ''
      this.search = null
      this.page = 0
    }
  },
  watch: {
    catOrDog () {
      this.getList()
    },
    age (newValue) {
      switch (newValue) {
        case '1':
          this.age1 = 0; this.age2 = 6; break
        case '2':
          this.age1 = 6; this.age2 = 12; break
        case '3':
          this.age1 = 12; this.age2 = 36; break
        case '4':
          this.age1 = 36; this.age2 = 72; break
        case '5':
          this.age1 = null; this.age2 = 72; break
        default:
          this.age1 = null; this.age2 = null
      }
      this.getList()
    },
    body () {
      this.getList()
    }
  },
  created () {
    this.getList()
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
  min-height: 100vh;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Microsoft YaHei', sans-serif;
}

/* ----- Hero ----- */
.hero {
  position: relative;
  padding: 70px 7vw 50px;
  background: linear-gradient(135deg, #FFF1E0 0%, #FAFAF7 75%);
  overflow: hidden;
}
.hero-content {
  position: relative;
  z-index: 2;
  max-width: 720px;
}
.hero-eyebrow {
  font-size: 13px;
  font-weight: 600;
  color: #FF8A3D;
  letter-spacing: 1.5px;
  text-transform: uppercase;
  margin-bottom: 14px;
}
.hero-title {
  font-size: 48px;
  font-weight: 800;
  line-height: 1.15;
  letter-spacing: -1px;
  margin-bottom: 14px;
  color: #1A1A1A;
}
.hero-title .accent {
  color: #FF8A3D;
  background: linear-gradient(120deg, #FF8A3D 0%, #FF6B3D 100%);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
}
.hero-sub {
  font-size: 16px;
  color: #6B6B6B;
  margin-bottom: 32px;
}
.hero-sub strong {
  color: #FF8A3D;
  font-weight: 700;
}
.search-bar {
  display: flex;
  align-items: center;
  background: #fff;
  border-radius: 999px;
  padding: 6px 6px 6px 22px;
  box-shadow: 0 8px 28px rgba(255, 138, 61, 0.12);
  max-width: 540px;
  border: 1px solid rgba(255, 138, 61, 0.08);
  transition: box-shadow 0.3s ease;
}
.search-bar:focus-within {
  box-shadow: 0 12px 36px rgba(255, 138, 61, 0.2);
}
.search-icon {
  color: #B8B8B8;
  font-size: 18px;
  margin-right: 12px;
}
.search-input {
  flex: 1;
  border: none;
  outline: none;
  font-size: 15px;
  padding: 14px 0;
  background: transparent;
  font-family: inherit;
}
.search-input::placeholder {
  color: #B8B8B8;
}
.search-btn {
  background: #FF8A3D;
  color: white;
  border: none;
  padding: 12px 30px;
  border-radius: 999px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.2s, transform 0.2s;
  font-family: inherit;
}
.search-btn:hover {
  background: #E67328;
  transform: translateY(-1px);
}
.hero-blob {
  position: absolute;
  border-radius: 50%;
  pointer-events: none;
  z-index: 1;
}
.hero-blob-1 {
  right: -120px;
  top: -120px;
  width: 460px;
  height: 460px;
  background: radial-gradient(circle at 35% 35%, rgba(255, 138, 61, 0.22), transparent 65%);
}
.hero-blob-2 {
  right: 18%;
  bottom: -180px;
  width: 280px;
  height: 280px;
  background: radial-gradient(circle at 50% 50%, rgba(255, 195, 0, 0.18), transparent 65%);
}

/* ----- Filters ----- */
.filters {
  padding: 36px 7vw 28px;
  display: flex;
  flex-direction: column;
  gap: 14px;
}
.filter-row {
  display: flex;
  align-items: center;
  gap: 8px;
  flex-wrap: wrap;
}
.filter-label {
  font-size: 13px;
  font-weight: 600;
  color: #6B6B6B;
  width: 44px;
  letter-spacing: 0.5px;
}
.chip {
  background: #fff;
  border: 1px solid #EAEAEA;
  color: #4A4A4A;
  padding: 8px 16px;
  border-radius: 999px;
  font-size: 13px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease;
  font-family: inherit;
}
.chip:hover {
  border-color: #FF8A3D;
  color: #FF8A3D;
}
.chip.active {
  background: #FF8A3D;
  border-color: #FF8A3D;
  color: #fff;
  font-weight: 600;
  box-shadow: 0 4px 12px rgba(255, 138, 61, 0.28);
}

/* ----- Pet Grid ----- */
.pet-grid {
  padding: 12px 7vw 60px;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 28px;
}

/* ----- Card ----- */
.pet-card {
  background: #fff;
  border-radius: 24px;
  overflow: hidden;
  cursor: pointer;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.04);
  transition: transform 0.4s cubic-bezier(0.2, 0.8, 0.2, 1),
              box-shadow 0.4s cubic-bezier(0.2, 0.8, 0.2, 1);
}
.pet-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 18px 44px rgba(255, 138, 61, 0.18);
}
.card-img-wrap {
  position: relative;
  width: 100%;
  aspect-ratio: 4 / 3;
  overflow: hidden;
  background: #F6F6F2;
}
.card-img-wrap > img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.6s cubic-bezier(0.2, 0.8, 0.2, 1);
}
.pet-card:hover .card-img-wrap > img {
  transform: scale(1.06);
}
.card-badges {
  position: absolute;
  top: 14px;
  left: 14px;
  right: 14px;
  display: flex;
  justify-content: space-between;
  pointer-events: none;
  z-index: 2;
}
.badge {
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  padding: 6px 12px;
  border-radius: 999px;
  font-size: 12px;
  font-weight: 600;
  color: #1A1A1A;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}
.badge-vaccine {
  background: rgba(255, 138, 61, 0.95);
  color: #fff;
}
.card-name-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 32px 18px 16px;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.7) 0%, transparent 100%);
  color: #fff;
  z-index: 2;
}
.card-name-overlay > h2 {
  font-size: 22px;
  font-weight: 700;
  letter-spacing: 0.3px;
  margin-bottom: 2px;
}
.card-name-overlay > p {
  font-size: 13px;
  opacity: 0.92;
  font-weight: 400;
}

.card-body {
  padding: 18px 18px 20px;
}
.meta-chips {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  margin-bottom: 14px;
}
.meta-chip {
  font-size: 12px;
  color: #4A4A4A;
  background: #F6F6F2;
  padding: 5px 10px;
  border-radius: 8px;
  display: inline-flex;
  align-items: center;
  gap: 4px;
}
.meta-chip > i {
  color: #FF8A3D;
  font-size: 12px;
}
.adoption-info {
  font-size: 13px;
  color: #6B6B6B;
  line-height: 1.55;
  margin-bottom: 16px;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  min-height: 40px;
}
.adopt-btn {
  width: 100%;
  background: #FFF4EA;
  color: #FF8A3D;
  border: none;
  padding: 12px;
  border-radius: 12px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.25s ease;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  font-family: inherit;
}
.adopt-btn > i {
  transition: transform 0.25s ease;
}
.pet-card:hover .adopt-btn {
  background: #FF8A3D;
  color: #fff;
}
.pet-card:hover .adopt-btn > i {
  transform: translateX(4px);
}

/* ----- Empty state ----- */
.empty {
  text-align: center;
  padding: 100px 20px;
  color: #6B6B6B;
}
.empty-icon {
  font-size: 56px;
  margin-bottom: 16px;
  opacity: 0.6;
}
.empty-title {
  font-size: 18px;
  font-weight: 600;
  color: #1A1A1A;
  margin-bottom: 6px;
}
.empty-sub {
  font-size: 14px;
  margin-bottom: 24px;
}
.empty-btn {
  background: #FF8A3D;
  color: #fff;
  border: none;
  padding: 10px 28px;
  border-radius: 999px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.2s;
  font-family: inherit;
}
.empty-btn:hover {
  background: #E67328;
}

/* ----- Pagination ----- */
.pagination {
  text-align: center;
  padding: 20px 7vw 60px;
}
::v-deep .el-pagination.is-background .el-pager li:not(.disabled).active {
  background-color: #FF8A3D;
  color: #fff;
}
::v-deep .el-pagination.is-background .el-pager li:not(.disabled):hover {
  color: #FF8A3D;
}
::v-deep .el-pagination.is-background .btn-prev:hover,
::v-deep .el-pagination.is-background .btn-next:hover {
  color: #FF8A3D;
}

/* Responsive */
@media (max-width: 1100px) {
  .pet-grid { grid-template-columns: repeat(2, 1fr); }
}
@media (max-width: 640px) {
  .pet-grid { grid-template-columns: 1fr; }
}
@media (max-width: 768px) {
  .hero { padding: 50px 5vw 40px; }
  .hero-title { font-size: 34px; }
  .filters, .pet-grid, .pagination { padding-left: 5vw; padding-right: 5vw; }
  .search-btn { padding: 10px 20px; }
}
</style>
