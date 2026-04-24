<template>
  <el-main>
    <!-- 侧边栏 -->
    <section class="sideBox">
      <p class="sideTitle">分类筛选</p>

      <!-- 搜索框 -->
      <div class="search">
        <input type="text"
         class="search__input"
         placeholder="姓名/品种/生活习性"
         v-model="search"
         @keyup.enter="getList()">
        <button class="search__button" @click="getList()">
          <svg class="search__icon" aria-hidden="true" viewBox="0 0 24 24">
            <g>
              <path
                d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z">
              </path>
            </g>
          </svg>
        </button>
      </div>

      <!-- 筛选框 -->
      <div class="isolateBox">
        <el-collapse >
          <el-collapse-item title="宠物种类" name="1" class="singleBox">
            <div class="radio">
              <el-radio v-model="catOrDog" label="">全部</el-radio>
              <el-radio v-model="catOrDog" label="猫">猫</el-radio>
              <el-radio v-model="catOrDog" label="狗">狗</el-radio>
            </div>
          </el-collapse-item>
          <el-collapse-item title="宠物年龄" name="2" class="singleBox">
            <div class="radio2">
              <el-radio v-model="age" label="">全部</el-radio>
              <el-radio v-model="age" label="1">0-6个月</el-radio>
              <el-radio v-model="age" label="2">6-12个月</el-radio>
              <el-radio v-model="age" label="3">1-3岁</el-radio>
              <el-radio v-model="age" label="4">3-6岁</el-radio>
              <el-radio v-model="age" label="5">>6岁</el-radio>
            </div>
          </el-collapse-item>
          <el-collapse-item title="宠物体型" name="3" class="singleBox">
            <div class="radio3">
              <el-radio v-model="body" label="">全部</el-radio>
              <el-radio v-model="body" label="小">小型（0-25磅）</el-radio>
              <el-radio v-model="body" label="中">中型（26-50磅）</el-radio>
              <el-radio v-model="body" label="大">大型（51-100磅）</el-radio>
              <el-radio v-model="body" label="超大">超大（>100磅）</el-radio>
            </div>
          </el-collapse-item>
        </el-collapse>
      </div>
    </section>

    <!-- 宠物列表 -->
    <section class="petContainer">
      <PhotoFrame  v-for="pet in petsList" :key="pet.petId" :imgSrc="$imageBaseUrl+pet.imageUrl">
        <template v-slot:name>{{ pet.name }}</template>
        <template v-slot:species>{{ pet.breed }}</template>
        <template v-slot:info>{{ pet.adoptionInfo }}</template>
        <template v-slot:button>
          <button @click="toPet(pet.petId)">
            <i class="el-icon-thumb"></i>
            我要领养
          </button>
        </template>
      </PhotoFrame>

      <!-- <div class="wrapper" v-for="pet in petsList" :key="pet.petId" >
        <div class="infoBox">
          <PhotoFrame :imgSrc="pet.imageUrl"></PhotoFrame>
          <p class="name">
            <i class="el-icon-s-custom"></i>
            姓名：{{ pet.name }}
          </p>
          <p class="species">
            <i class="el-icon-menu"></i>
            种类：{{ pet.breed }}
          </p>
          <p class="info">
            <i class="el-icon-notebook-2"></i>
            领养须知：{{ pet.adoptionInfo }}
          </p>
        </div>
        <button @click="toPet(pet.petId)">
          <i class="el-icon-thumb"></i>
          我要领养
        </button>
      </div> -->
    </section>

    <!-- 页码 -->
    <el-pagination
      background
      layout="total,prev, pager, next"
      :page-size="6"
      :total="this.petsList[0]?.totlepage"
      @current-change="handlePageChange">
    </el-pagination>
  </el-main>
</template>

<script>
import PhotoFrame from '@/components/PhotoFrame.vue'
import { getPetsInfo } from '@/api/pet.js'
export default {
  components: {
    PhotoFrame
  },
  data () {
    return {
      catOrDog: '', // 绑定单选框
      age: '', // 绑定单选框
      body: '', // 绑定单选框
      age1: null, // 用于发请求的参数
      age2: null, // 用于发请求的参数
      page: 0, // 当前第几页,从0开始
      search: null, // 搜索框的内容
      petsList: [] // 渲染的列表
    }
  },
  methods: {
    // 跳转到宠物的详情页
    toPet (id) {
      this.$router.push(`/detail/${id}`)
    },
    // 请求符合条件的宠物
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
    // 用户切换页码
    handlePageChange (page) {
      this.page = page - 1
      this.getList()
    }
  },
  watch: {
    catOrDog (newValue) {
      this.getList()
    },
    age (newValue) {
      switch (newValue) {
        case '1':
          this.age1 = 0
          this.age2 = 6
          this.getList()
          break
        case '2':
          this.age1 = 6
          this.age2 = 12
          this.getList()
          break
        case '3':
          this.age1 = 12
          this.age2 = 36
          this.getList()
          break
        case '4':
          this.age1 = 36
          this.age2 = 72
          this.getList()
          break
        case '5':
          this.age1 = null
          this.age2 = 72
          this.getList()
          break
        default:
          this.age1 = null
          this.age2 = null
          this.getList()
          break
      }
    },
    body (newValue) {
      this.getList()
    }
  },
  created () {
    this.getList()
  }
}

</script>

<style scoped>
  .el-main {
    background: rgba(255, 255, 255, 0.2);
    color: rgba(56, 56, 56, 1);
    display: flex;
    padding: 0;
    height: 140vh;
    position: relative;
  }

  /* 侧边栏 */
  .sideBox{
    width: 13%;
    height: 140vh;
    background: rgba(255, 245, 230, 1);
  }
  .sideTitle {
    font-size: 1.414vw;
    height: 50px;
    font-weight: bold;
    margin-top: 30px;
    text-align: center;
  }
  .search {
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    height: 65px;
    padding-top: 1.736vh;
  }
  .search__input {
    font-family: inherit;
    font-size: inherit;
    background-color: #ffffffa2;
    border: 1px solid #b1b1b1;
    color: #646464;
    padding: 0.7rem 1rem;
    border-radius: 20px;
    width: 75%;
    transition: all ease-in-out 0.5s;
    margin-right: -2rem;
    margin-left: 5.5%;
    font-size: 0.7070vw;
  }
  .search__input:hover,
  .search__input:focus {
    box-shadow: 0 0 1em #00000013;
  }
  .search__input:focus {
    outline: none;
    background-color: #f0eeee;
  }
  .search__input::-webkit-input-placeholder {
    font-weight: 100;
    color: #ccc;
  }
  .search__input:focus + .search__button {
    background-color: #f0eeee;
  }
  .search__button {
    border: none;
    background-color: #ececec44;
    margin-top: 0.1em;
  }
  .search__button:hover {
    cursor: pointer;
  }
  .search__icon {
    height: 1.3em;
    width: 1.3em;
    fill: #b4b4b4;
    background-color: #f4f2f2;
  }
  .el-radio{
    display: flex;
    flex-direction: row;
    height: 30px;
    margin-top: 15px;
  }
  .radio{
    display: flex;
    flex-direction: column;
    height: 85px;
    font-size: 50px;
  }
  .radio2{
    display: flex;
    flex-direction: column;
    height: 200px;
    font-size: 50px;
  }
  .radio3{
    display: flex;
    flex-direction: column;
    height: 150px;
    font-size: 50px;
  }
  .singleBox {
    display: flex;
    padding-left: 20px;
    flex-direction: column;
    background-color: white;
    width: 80%;
    margin-top: 10%;
    margin-left: 6%;
  }
  ::v-deep .el-collapse-item__header,::v-deep .el-radio__label{
    font-size: 0.707vw;
  }
  /* 宠物列表 */
  .petContainer{
    width: 87%;
    height: 130vh;
    box-sizing: border-box;
    padding: 1%;
    display: flex;
    flex-wrap: wrap;
    gap: 2%;
  }
  /* .petContainer>.wrapper{
    width: 31%;
    height: 61vh;
    border-radius: 12.1px;
    background: rgba(255, 245, 230, 1);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 3%;
    margin-bottom: 2%;
  }
  .petContainer>.wrapper>.infoBox{
    width: 90%;
    height: 80%;
    border-radius: 12.93px;
    background: rgba(255, 255, 255, 1);
    display: flex;
    flex-direction: column;
    align-items: start;
    justify-content: center;
    gap: 5%;
  }
  .petContainer>.wrapper>.infoBox>p>i{
    color: rgba(247, 149, 37, 1);
    font-size: 1.2em;
  }
  .petContainer>.wrapper>.infoBox>*{
    margin-left: 5%;
  }
  .petContainer>.wrapper>.infoBox>.petImg{
    width: 90%;
    height: 51%;
    border-radius: 12.93px;
  }
  .petContainer>.wrapper>.infoBox>p{
    font-size: 1.515vw;
    width: 90%;
    box-sizing: border-box;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .petContainer>.wrapper>button{
    width: 60%;
    height: 10%;
    border-radius: 12.93px;
    background: rgba(247, 149, 37, 1);
    border: none;
    color: rgba(255, 255, 255, 1);
    font-size: 1.414vw;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 3%;
    cursor: pointer;
  }
  .petContainer>.wrapper>button>i{
    font-size: 1.3em;
  } */

  .petContainer button{
    width: 60%;
    height: 20%;
    border-radius: 12.93px;
    background: rgba(247, 149, 37, 1);
    border: none;
    color: rgba(255, 255, 255, 1);
    font-size: 1.414vw;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 3%;
    cursor: pointer;
    margin: 0 auto;
  }
  .el-pagination{
    position: absolute;
    bottom: 2%;
    right: 5%;
  }
</style>
