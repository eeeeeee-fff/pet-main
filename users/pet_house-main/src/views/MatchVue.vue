<template>
  <el-main>
    <div class="mainBox">
      <!-- 左边 -->
      <div class="box1">
        <!-- 标题 -->
        <div class="houseContent">
          <div style="display: flex; background-color: inherit;">
            <p class="houseFont" style="background-color: inherit;">智能匹配屋</p>
            <img class="imgFont" src="https://img.js.design/assets/img/67a4ba5949f9cc81dfcf1cc9.png#51ac1dbb553acd4fdabe73d33bac3c93" alt=""
            style="background-color: inherit;">
          </div>
          <p class="houseFont2">Intelligent Matching</p>
        </div>
        <!-- 问答区 -->
        <div class="main" v-if="content">
          <div class="inputBox" style="background-color: inherit;">
            <!-- 问候 -->
            <div class="introduce" style="background-color: inherit;">
              <div class="loader" style="background-color: inherit;">
                <div class="loader_cube loader_cube--color"></div>
              </div>
              <p class="introduce-p" style="background-color: inherit;" v-if="pContent">
                HI,{{ greeting() }}，我是您的专属AI伙伴
              </p>
            </div>
            <!-- 题目盒子 -->
            <div class="searchContent" >
              <p class="related-font">请填写以下问题以便我们了解您的偏好</p>
              <!-- 5个题目 -->
              <!-- 左边题目 -->
              <div class="leftQuestions">
                <!-- 问题1 -->
                <div class="question1">
                <img class="questionImg" src="https://img.js.design/assets/img/67b8903f030a5d40c57929a7.png#d7fe93282e4e18612fbbc42cb3f274f9" alt="">
                <div class="questionBox">
                  <div class="genderQuestion">您对宠物性别的偏爱？</div>
                  <el-radio-group class="radioGroup" v-model="genderRadio">
                    <el-radio :label="1" class="radioTextGender">公</el-radio>
                    <el-radio :label="2" class="radioTextGender">母</el-radio>
                  </el-radio-group>
                </div>
                </div>
                <!-- 问题2 -->
                <div class="question1">
                <img class="questionImg" src="https://img.js.design/assets/img/67b8903f030a5d40c57929a7.png#d7fe93282e4e18612fbbc42cb3f274f9" alt="">
                <div class="questionBox">
                  <div class="genderQuestion">您对宠物体型的偏爱？</div>
                  <el-radio-group class="radioGroup" v-model="formRadio">
                    <el-radio :label="1" class="radioText">小</el-radio>
                    <el-radio :label="2" class="radioText">中</el-radio>
                    <el-radio :label="3" class="radioText">大</el-radio>
                    <el-radio :label="4" class="radioText">超大</el-radio>
                  </el-radio-group>
                </div>
                </div>
                <!-- 问题3 -->
                <div class="question1">
                <img class="questionImg" src="https://img.js.design/assets/img/67b8903f030a5d40c57929a7.png#d7fe93282e4e18612fbbc42cb3f274f9" alt="">
                <div class="questionBox">
                  <div class="cleanQuestion">您在一个月内给宠物的清洁频率？</div>
                  <el-radio-group class="radioGroup" v-model="cleanRadio">
                    <el-radio :label="1" class="radioText">较少</el-radio>
                    <el-radio :label="2" class="radioText">偶尔</el-radio>
                    <el-radio :label="3" class="radioText">经常</el-radio>
                  </el-radio-group>
                </div>
                </div>
                <!-- 问题4 -->
                <div class="question1">
                <img class="questionImg" src="https://img.js.design/assets/img/67b8903f030a5d40c57929a7.png#d7fe93282e4e18612fbbc42cb3f274f9" alt="">
                <div class="questionBox">
                  <div class="genderQuestion">您的居住地是否有后院？</div>
                  <el-radio-group class="radioGroup" v-model="houseRadio">
                    <el-radio :label="1" class="radioText">有</el-radio>
                    <el-radio :label="2" class="radioText">无</el-radio>
                  </el-radio-group>
                </div>
                </div>
              </div>
                <!-- 右边题目 -->
              <div class="rightQuestions">

                <!-- 问题5 -->
                <div class="question1">
                <img class="questionImg" src="https://img.js.design/assets/img/67b8903f030a5d40c57929a7.png#d7fe93282e4e18612fbbc42cb3f274f9" alt="">
                <div class="questionBox">
                  <div class="genderQuestion">您一周可以陪伴宠物的时间？</div>
                  <el-radio-group class="radioGroup2" v-model="weekTime">
                    <el-radio :label="1" class="radioText">少于两天</el-radio>
                    <el-radio :label="2" class="radioText">两到四天</el-radio>
                    <el-radio :label="3" class="radioText">四到六天</el-radio>
                    <el-radio :label="4" class="radioText">六天以上</el-radio>
                  </el-radio-group>
                </div>
                </div>
                <!-- 问题6 -->
                <div class="question1" style="padding-top: 104px;">
                  <img class="questionImg" src="https://img.js.design/assets/img/67b8903f030a5d40c57929a7.png#d7fe93282e4e18612fbbc42cb3f274f9" alt="">
                  <div class="questionBox">
                    <div class="genderQuestion">您的性格如何？</div>
                    <el-radio-group class="radioGroup2" v-model="personality">
                      <el-radio :label="'内向'" class="radioText">内向</el-radio>
                      <el-radio :label="'活泼'" class="radioText">活泼</el-radio>
                      <el-radio :label="'沉稳'" class="radioText">沉稳</el-radio>
                      <el-radio :label="'外向'" class="radioText">外向</el-radio>
                    </el-radio-group>
                  </div>
                </div>
                <button class="pushButton" @click="matchResult()">提交</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--匹配宠物页面 -->
      <div class="box3" v-if="petContent">
        <div class="petContent2">
          <!-- 动态圆图 -->
          <div class="loader" style="background-color: inherit;">
            <div class="loader_cube loader_cube--color"></div>
          </div>
          <div class="rematchContent" style="background-color: inherit;">
            <p class="introduce-p2" style="background-color: inherit;">根据您的选择，我们为您推荐以下宠物！</p>
            <button class="rematchButton" @click="rematchButton()">重新匹配</button>
          </div>
        </div>
        <!-- 对应宠物生成卡片 -->
        <div class="petCard">
          <div v-for="(card, index) in cardList" :key="index" :class="['card',card.cardName]"  @click="$router.push(`/detail/${card.petId}`)">
            <img :src="$imageBaseUrl+card.imageUrl" alt="" class="cardImg">
            <div class="cardText">
              <p>匹配度:{{ card.score }}</p>
              <p>姓名：{{ card.name }}</p>
              <p>品种：{{ card.breed }}</p>
              <p>性格：{{ card.personality }}</p>
            </div>
          </div>
        </div>
      </div>
      <!-- 右侧生成圆 -->
      <div class="box2" v-if="content2">
        <p class="searchFont">您的日常搜索</p>
        <div class="circle-container" v-loading.fullscreen.Lock="fullscreenLoading">
          <div v-for="(circle, index) in circleList" :key="index" :class="['circle', circle.className]" @click="jumpSubpage">
            {{ circle.text }}
          </div>
        </div>
      </div>
    </div>
  </el-main>
</template>

<script>
import { addUserInfo, matchPetForUser } from '@/api/match.js'
export default {
  data () {
    return {
      // 五个问答数据
      genderRadio: '',
      weekTime: '',
      formRadio: '',
      houseRadio: '',
      cleanRadio: '',
      personality: '',
      // loading加载
      fullscreenLoading: false,
      loading: false,
      isVisible: false,
      // 隐藏
      content: true,
      content2: true,
      pContent: true,
      petContent: false,
      showChildContent2: false, // 智能匹配宠物card页
      Carousel: true, // 轮播图
      relatedKeywords1: [
        '猫', '狗', '萨摩耶', '萨摩耶',
        '萨摩耶', '萨摩耶', '萨摩耶', '萨摩耶'
      ],
      circleList: [
        { className: 'circle1', text: '狗' },
        { className: 'circle2', text: '猫' },
        { className: 'circle3', text: '金渐层' },
        { className: 'circle4', text: '橘猫' },
        { className: 'circle5', text: '萨摩耶' },
        { className: 'circle6', text: '萨摩耶' },
        { className: 'circle7', text: '萨摩耶' }
      ],
      cardList: [
        { cardName: 'card1', score: '', name: '', breed: '', personality: '', imageUrl: '' },
        { cardName: 'card2', score: '', name: '', breed: '', personality: '', imageUrl: '' },
        { cardName: 'card3', score: '', name: '', breed: '', personality: '', imageUrl: '' }
      ]
    }
  },
  mounted () {
    // const slides = document.getElementsByClassName('radioTextGender el-radio__original')
    // for (const slide of slides) {
    //   // 先打印每个标签看是否存在【aria-hidden】属性，若存在移除该属性
    //   console.log(slide)
    //   // 执行下行后控制台标签不再有【aria-hidden】
    //   slide.removeAttribute('aria-hidden')
    //   console.log(1)
    // }
    const circles = document.querySelectorAll('.circle')
    const circleSmall = document.querySelectorAll('.circle3, .circle4, .circle5, .circle6, .circle7')
    // 随机圆放大按逻辑
    const randomInterval = setInterval(() => {
      const randomIndex = Math.floor(Math.random() * circles.length)// 任意圆的索引
      const circleRandom = circles[randomIndex]// 任意圆
      circles.forEach(circle => {
      // 记录每个圆的初始 z-index 值
        const initialZIndex = circle.style.zIndex || 'auto'
        circle.style.transform = 'scale(1)'
        circle.style.filter = 'brightness(1)'
        circle.style.zIndex = initialZIndex
        circle.classList.remove('scaling')
        // circle.classList.remove('brightening')
      })
      circleRandom.classList.add('scaling')
      // circleRandom.classList.add('brightening')
    }, 5000)
    // 鼠标进入任意圆时停止随机放大动画
    circles.forEach(circle => {
      circle.addEventListener('mouseenter', () => {
        clearInterval(randomInterval)
        circle.classList.remove('scaling')
        // circle.classList.remove('brightening')
      })
    })
    // 放大圆
    circles.forEach(circle => {
      // 记录每个圆的初始 z-index 值
      const initialZIndex = circle.style.zIndex || 'auto'
      // 鼠标进入任意圆放大的动画
      circle.addEventListener('mouseenter', () => {
        // 获取圆的大小信息
        const rect = circle.getBoundingClientRect()
        // 判断圆的宽度或高度是否大于 250
        const scaleValue = rect.width > 250 || rect.height > 250 ? 1.05 : 1.1
        circle.style.transform = `scale(${scaleValue})`
        circle.style.filter = 'brightness(1.08)'
      })
      // 鼠标离开圆恢复初始状态
      circle.addEventListener('mouseleave', () => {
        circle.style.transform = 'scale(1)'
        circle.style.filter = 'brightness(1)'
        circle.style.zIndex = initialZIndex
      })
    })
    // 实现圆34567的zindex最大
    circleSmall.forEach(circle => {
    // 记录每个圆的初始 z-index 值
      const initialZIndex = circle.style.zIndex || 'auto'
      circle.addEventListener('mouseenter', () => {
        // 获取圆的大小信息
        const rect = circle.getBoundingClientRect()
        // 判断圆的宽度或高度是否大于 250
        const scaleValue = rect.width > 250 || rect.height > 250 ? 1.05 : 1.1
        circle.style.transform = `scale(${scaleValue})`
        circle.style.filter = 'brightness(1.08)'
        circle.style.zIndex = '100'
      })
      // 鼠标离开圆恢复初始状态
      circle.addEventListener('mouseleave', () => {
        circle.style.transform = 'scale(1)'
        circle.style.filter = 'brightness(1)'
        circle.style.zIndex = initialZIndex
      })
    })
    // 关键词
    const relatedKeywords = document.querySelectorAll('.related-keyword')
    relatedKeywords.forEach(keyword => {
      // 记录初始的 transform 和 filter 样式
      const initialTransform = keyword.style.transform || 'scale(1)'
      const initialFilter = keyword.style.filter || 'brightness(1)'
      const initialZIndex = keyword.style.zIndex || 'auto'
      // 设置过渡效果，将持续时间调整为 0.8 秒，让变化变慢
      keyword.style.transition = 'transform 0.8s ease, filter 0.8s ease, z-index 0.8s ease'
      keyword.addEventListener('mouseenter', () => {
        // 固定放大比例为 1.1
        keyword.style.transform = 'scale(1.1)'
        keyword.style.filter = 'brightness(1.08)'
        keyword.style.zIndex = '100'
      })
      keyword.addEventListener('mouseleave', () => {
        keyword.style.transform = initialTransform
        keyword.style.filter = initialFilter
        keyword.style.zIndex = initialZIndex
      })
    })
  },
  methods: {
    async matchResult () {
      // 检查选择框是否都有值
      if (!this.genderRadio || !this.weekTime || !this.formRadio || !this.houseRadio || !this.cleanRadio) {
        this.$message({
          message: '请填写所有问题的答案',
          type: 'warning'
        })
        return // 阻止提交
      }
      try {
        this.fullscreenLoading = true

        await addUserInfo(this.genderRadio, this.weekTime, this.houseRadio, this.formRadio, this.cleanRadio, this.personality)
        this.$message({
          message: '信息提交成功，请稍等！',
          type: 'success'
        })

        const resName = await matchPetForUser()
        // 检查 resName.data 是否为数组且数组长度大于 0
        if (Array.isArray(resName.data)) {
          resName.data.forEach((pet, index) => {
            if (this.circleList[index]) {
              this.circleList[index].text = pet.breed
            }
          })
        } else this.$message.error('未获取到有效的宠物数据')

        const searchFont = document.querySelector('.searchFont')
        searchFont.innerHTML = '点击气泡框查看为您匹配的宠物！'
        this.fullscreenLoading = false
        this.$notify({
          title: '已为您匹配到宠物，请进行下一步查看',
          message: '请点击上方气泡框查看为你匹配的宠物！',
          position: 'bottom-right',
          type: 'success',
          duration: 0,
          offset: 30
        })
      } catch (err) {
        console.log(err)
      }
    },
    // 点击关键词条展示智能匹配页
    async jumpSubpage () {
      this.content = false
      this.content2 = false
      this.pContent = false
      this.petContent = true
      const res = await matchPetForUser()
      // console.log('as', res)

      this.cardList = res.data
      this.cardList.forEach(pet => {
        pet.imageUrl = pet.imageUrl.replace(/^\[|\]$/g, '').trim()
      })
    },
    rematchButton () {
      location.reload()
    },
    // 问候
    greeting () {
      const time1 = new Date()
      if (time1.getHours() < 12) return '早上好'
      else if (time1.getHours() < 18) return '下午好'
      else return '晚上好'
    }
  }
}

</script>

<style scoped>
* {
  background-color: #fcfcfc;
  margin: 0;
  padding: 0;
}

html {
  height: 100%;
  overflow: hidden;
  margin: 0px;
  padding: 0px;

}

.el-main{
  margin: 0px;
  padding: 0px;
  height: 100%;
}

.cardText p{
  background-color: initial;
}

.cardText{
  font-size: 20px;
  margin-right: 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 8%;
  background-color: initial;
  height: 100%;
}

.card.card1 .cardText{
  width: 200px;
  height: 200px;
}

.card.card3 .cardText{
  width: 200px;
  height: 200px;
}
.card.card2 .cardText{
  width: 400px;
  height: 250px;
  font-size: 25px;

}
.cardImg{
  padding-left: 20px;
  background-color: initial;
}

.card.card1 .cardImg{
  width: 200px;
  height: 200px;
}
.card.card3 .cardImg{
  width: 200px;
  height: 200px;
}

.card.card1 {
  width: 400px;
  height: 350px;
  display: flex;
  flex-direction: row;
}
.card:nth-child(3) {
  width: 400px;
  height: 350px;

}

.cardImg{
  width: 300px;
  height: 250px;
}
.petCard{
  padding-top: 20px;
  height: 500px;
  background-color: initial;
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
.card {
  box-sizing: border-box;
  width: 600px;
  height: 404px;
  background: rgba(255, 240, 245, 0.4);
  border: 1px solid white;
  box-shadow: 12px 17px 51px rgba(0, 0, 0, 0.22);
  backdrop-filter: blur(6px);
  border-radius: 17px;
  text-align: center;
  cursor: pointer;
  transition: all 0.5s;
  display: flex;
  align-items: center;
  justify-content: center;
  user-select: none;
  font-weight: bolder;
  color: black;
  gap: 15px;
}

.card:hover {
  border: 1px solid black;
  transform: scale(1.05);
}

.card:active {
  transform: scale(0.95) rotateZ(1.7deg);
}
.box1 {
  margin: 0;
  padding-top: 50px;
  padding-left: 80px;
  display: flex;
  width: 900px;
  flex-direction: column;
  background-color: inherit;
}

.mainBox {
  color: #333;
  height: 1000px;
  padding: 0%;
  display: flex;
  /* flex-direction: column; */
  background-color: rgb(235, 214, 191);
}

.box3{
  position: absolute;
  display: flex;
  background-color: initial;
  flex-direction: column;
  top: 360px;
  width: 100%;
  height: 500px;
}
.petContent2{
  /* position: absolute; */
  display: flex;
  flex-direction: row;
  /* top: 370px; */
  width: 1500px;
  height: 80px;
  padding-left: 80px;
  background-color: inherit;
}
.question {
  width: 100px;
}
::v-deep .radioGroup .el-radio__label {
  font-size: 15px; /* 你可以根据需要修改字体大小 */
  font-weight: 500;
  color: #1d1d1d83;
}
::v-deep .radioGroup2 .el-radio__label {
  font-size: 15px; /* 你可以根据需要修改字体大小 */
  font-weight: 500;
  color: #1d1d1d83;
}
.radioGroup2{
  display: flex;
  flex-direction: column;
  width: 300px;
  padding-top: 10px;
  background-color: initial;

}
.radioGroup{
  padding-top: 10px;
  /* font-size: 30px; */
  background-color: initial;

}
.radioTextGender{
  font-size: 25px;
  font-weight: 500;
  background-color: initial;
}
.radioText{
  font-size: 25px;
  font-weight: 500;
  background-color: initial;
}
.cleanQuestion {
  font-size: 20px;
  width: 300px;
  font-weight: 500;
  background-color: initial;
  color: #1d1d1d83;
}
.genderQuestion {
  font-size: 20px;
  font-weight: 500;
  /* margin-top: 30px; */
  /* margin-left: 43px; */
  background-color: initial;
  color: #1d1d1d83;
  /* color: rgb(255, 254, 254); */
  /* -webkit-text-stroke: 0.5px #1d1d1d83; */
  /* font-family: 'AlibabaPuHuiTi'; */
}
.question1 {
  display: flex;
  flex-direction: row;
  width: 350px;
  padding-top: 30px;
  font-size: 25px;
  height: 80px;
  background-color: initial;

}
.questionBox {
  display: flex;
  flex-direction: column;
  width: 300px;
  padding-left: 10px;
  background-color: initial;

}
.questionImg{
  width: 60px;
  height: 60px;
  margin-top: -20px;
  background-color: initial;
}
.el-container {
  height: 100%;
  background-color: #fcfcfc;
}

.carouselContainer {
  width: 100%;
}

.el-carousel-item {
  width: 500px;
}

.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

.Carousel {
  height: 600px;
  width: 100%;
  background-color: #fcfcfc;
}

.el-aside {
  height: 600px;
  background-color: #fcfcfc;
}

.box {
  display: flex;
  width: 100%;
}

/* 侧边栏 */
.aside {
  z-index: 10;
  position: fixed;
  right: 0;
  border: 1px solid #ccc;
  top: 500px;
  border-radius: 10px;
}

el-menu-item {
  background-color: #fcfcfc;
  padding: 0;
}

#floatImg {
  height: auto;
  width: 120px;
  position: fixed;
  top: 600px;
  left: 30px;
  mix-blend-mode: multiply;
  /* 去图片颜色白底 */
}

.donateButton {
  height: 50px;
  width: 150px;
  /* margin-top: 700px; */
  margin-left: 650px;
  background-color: #C09258;
  outline: none;
  border-radius: 8px;
  padding: 13px;
  color: #fff;
  letter-spacing: 2px;
  border: none;
  cursor: pointer;
  /* 鼠标指针变成手指形状 */
  transition: box-shadow 0.5s ease, color 0.5s ease;
}

.reLoadButton {
  width: 150px;
  height: 50px;
  background-color: #C09258;
  /* margin-left: 220px; */
  /* margin-top: 90px; */
  outline: none;
  border-radius: 8px;
  /* padding: 13px; */
  color: #fff;
  letter-spacing: 2px;
  border: none;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
  transition: box-shadow 0.5s ease, color 0.5s ease;
}

.reLoadButton:hover {
  color: #f6f6f6;
  box-shadow: 0 2px 12px -4px rgba(0, 0, 0, 0.5);
  cursor: pointer;
  transition: box-shadow 0.5s ease, color 0.5s ease;
}
.pushButton {
  width: 150px;
  background-color: #C09258;
  margin-left: 140px;
  margin-top: 100px;
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

.pushButton:hover {
  color: #f6f6f6;
  box-shadow: 0 2px 12px -4px rgba(0, 0, 0, 0.5);
  cursor: pointer;
  transition: box-shadow 0.5s ease, color 0.5s ease;
}
.include {
  width: 1100px;
  text-align: center;
  /* 水平居中 */
  padding-left: 250px;
}

.matchBlack2 {
  padding: 50px 200px 50px 200px;
  background-color: #1d1d1d;
  /* width: 500px; */
  width: 100%;
  height: 100%;
}

.donateButton {
  width: 20%;
  margin-top: 30px;
  background-color: #C09258;
  outline: none;
  border-radius: 8px;
  padding-top: px;
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

.houseContent {
  height: 230px;
  width: 900px;
  display: flex;
  padding-left: 50px;
  flex-direction: column;
  /* justify-content: center; */
  /* align-items: center; */
  background-color: inherit;
}
.imgFont {
  height: 150px;
  width: auto;
}

.houseFont {
  top: 123px;
  width: 550px;
  height: 134px;
  opacity: 1;
  /* background: url(https://img.js.design/assets/img/67a4b92cb30c45934a7a012a.png#e13f0d7ecbbca92f485d4eefd24c3e01); */
  /* border: 1px solid rgba(0, 0, 0, 1); */
  text-shadow: 0px 8px 4px  rgba(0, 0, 0, 0.25);
  font-size: 110px;
  font-weight: 400;
  letter-spacing: 0px;
  line-height: 156px;
  color: rgba(191, 39, 35, 1);
  text-align: left;
  vertical-align: top;
  font-family: 'AlibabaPuHuiTi';
}

.houseFont2 {
  font-size: 60px;
  height: 80px;
  width: 800px;
  font-weight: 500;
  font-family: Monoton;
  /* padding-left: 30px; */
  color: white;
  background-color: inherit;
}

.box2 {
  width: 1000px;
  height: 500px;
  display: flex;
  flex-direction: row;
}

.box2 {
  height: 600px;
  width: 600px;
  display: flex;
  margin-top: 250px;
  /* margin-left: 50px; */
  flex-direction: column;
  background-color: inherit;
}

.searchFont {
  font-size: 35px;
  font-weight: 500;
  margin-left: 10px;
  color: #1d1d1d83;
  font-family: 'AlibabaPuHuiTi';
  background-color: inherit;
}

.circle-container {
  position: relative;
  width: 600px;
  height: 800px;
  margin-top: 150px;
  margin-left: -50px;
  background-color: inherit;

}

.circle {
  position: absolute;
  border-radius: 50%;
  width: 200px;
  height: 200px;
  /* filter: brightness(1) saturate(0.8); 降低亮度为原来的 70%，饱和度为原来的 50% */
  transition: all 1s ease;
  transition: transform 1s ease, filter 1s ease, z - index 2s ease;
  /* 设置圆内文本的样式 */
  color: rgba(90, 90, 90, 0.705);
  /* 文本颜色 */
  text-shadow: 0.5em 2px 6em rgb(0, 0, 0);
  font-size: 40px;
  /* 字体大小 */
  font-family: 'AlibabaPuHuiTi';
  text-align: center;
  /* 文本居中 */
  display: flex;
  /* 使用 flex 布局 */
  justify-content: center;
  /* 水平居中 */
  align-items: center;
  /* 垂直居中 */
  cursor: pointer;
}

.circle1 {
  background: linear-gradient(to right, #f79595, #fac8b5);
  top: -145px;
  left: 350px;
  width:250px;
  height:250px;
}

.circle5 {
  background: linear-gradient(to bottom, #ff9966, #ff5e62);
  top: 180px;
  left: 100px;
  font-size: 25px;
  width: 140px;
  height: 140px;
}

.circle3 {
  background: linear-gradient(to left, #98fb98, #28c287);
  top: 280px;
  left: 195px;
  width: 120px;
  height: 120px;
  font-size: 25px;
}

.circle4 {
  background: linear-gradient(to left, #ffac4d, #FF7366);
  top: 100px;
  left: 400px;
}

.circle2 {
  background: linear-gradient(to bottom, #FFD700, #FF8C00);
  top: -40px;
  left: 140px;
  width: 350px;
  height: 350px;
}

.circle6 {
  background: linear-gradient(to left, #9df3c4, #1fab89);
  font-size: 40px;
  top: 250px;
  left: 300px;
  width: 200px;
  height: 200px;
}
.circle7 {
  background: linear-gradient(to left, #a689ff, #b7d7ff);
  font-size: 35px;
  top: -5px;
  left: 0px;
  width: 200px;
  height: 200px;
}
/* From Uiverse.io by joe-watson-sbf */
.search {
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  height: 65px;
  padding-top: 20px;
}

.search__input {
  font-family: inherit;
  font-size: inherit;
  /* background-color: #f4f2f2; */
  background-color: #ececec44;
  border: 1px solid #b1b1b1;
  color: #646464;
  padding: 0.7rem 1rem;
  border-radius: 20px;
  width: 500px;
  transition: all ease-in-out .5s;
  margin-right: -2rem;
  margin-left: 15px;
}

.search__input:hover,
.search__input:focus {
  box-shadow: 0 0 1em #00000013;
  /* box-shadow: 0 0 1em #00000013; */
  /* background-color: #ececec44; */

}

.search__input:focus {
  outline: none;
  background-color: #f0eeee;
}

.search__input::-webkit-input-placeholder {
  font-weight: 100;
  color: #ccc;
}

.search__input:focus+.search__button {
  background-color: #f0eeee;
}

.search__button {
  border: none;
  /* background-color: #f4f2f2; */
  background-color: #ececec44;
  margin-top: .1em;
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

/* 自己加的 */
.searchContent {
  position: relative;
  display: flex;
  flex-direction: row;
  height: 610px;
  width: 750px;
  margin-top: 10px;
  margin-left: 20px;
  border: 1px solid #ccc;
  border-radius: 20px;
  background-color: #faefe5;
}

.leftQuestions {
  display: flex;
  flex-direction: column;
  padding-top: 50px;
  background-color: initial;
  padding-left: 30px;
}
.rightQuestions{
  display: flex;
  height: 470px;
  flex-direction: column;
  padding-top: 50px;
  padding-left: 20px;
  background-color: initial;
}
.searchContent {
  background-color: #fdefe2;
  /* margin-left: -50px; */
  width: 800px;
}
.main{
  background-color: initial;
}
.inputBox {
  display: flex;
  flex-direction: column;
  height: 500px;
  width: 100%;
}

.input {
  width: 300px;
  height: 50px;
  margin-top: 100px;
}

.related-font {
  position: absolute;
  font-size: 30px;
  font-weight: 500;
  margin-top: 30px;
  margin-left: 43px;
  background-color: initial;
  color: #1d1d1d83;
  font-family: 'AlibabaPuHuiTi';
}

.related-box {
  top: 500px;
  left: 10px;
  width: 750px;
  height: 150px;
  background-color: initial;
  border-radius: 20px;
  z-index: 1;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-template-rows: repeat(2, auto);
  gap: 10px;
  margin: 10px;
}

.related-keyword {
  width: 80%;
  /* 四列布局，每个小盒子宽度为大盒子的 25% */
  box-sizing: border-box;
  /* 确保内边距和边框包含在宽度内 */
  border: 1px solid #ccc;
  /* 为小盒子添加边框，方便查看布局 */
  padding: 10px;
  /* 为小盒子添加内边距 */
  border: 1px solid #ccc;
  border-radius: 20px;
  height: 48px;
  margin-top: 20px;
  margin-left: 10px;
  text-align: center;
  justify-content: center;
  background-color: #fff;
  align-content: center;
  /* 设置过渡效果，将持续时间调整为 0.5 秒，让变化变慢 */
  transition: transform 0.5s ease, filter 0.5s ease;
  cursor: pointer;

}

.related-keyword:hover {
  transform: scale(1.1);
  /* 鼠标悬停时放大到原来的 1.1 倍，可以根据需要调整倍数 */
}

.introduce {
  width: 100%;
  display: flex;
  flex-direction: row;
  text-align: center;
  margin-left: 30px;
  /* margin-top: 60px; */
}

.petContent{
  width: 900px;
  height: 200px;
  background-color: inherit;
}

.rematchButton {
  width: 100px;
  height: 50px;
  background-color: #C09258;
  /* margin-left: 220px; */
  /* margin-top: 90px; */
  outline: none;
  margin-top: 10px;
  border-radius: 8px;
  /* padding-top: 13px; */
  color: #fff;
  letter-spacing: 2px;
  border: none;
  /* 鼠标指针变成手指形状 */
  cursor: pointer;
  transition: box-shadow 0.5s ease, color 0.5s ease;
}

.rematchButton:hover {
  color: #f6f6f6;
  box-shadow: 0 2px 12px -4px rgba(0, 0, 0, 0.5);
  cursor: pointer;
  transition: box-shadow 0.5s ease, color 0.5s ease;
}

.rematchContent{
  width: 1500px;
  display: flex;
  flex-direction: row;
}
.introduce-p2 {
  display: flex;
  flex-direction: row;
  font-weight: 1000;
  margin-left: 10px;
  color: white;
  font-family: 'AlibabaPuHuiTi';
  left: 221px;
  top: 411px;
  /* width: 804px; */
  height: 78px;
  opacity: 1;
  text-shadow: 0px 4px 4px  rgba(0, 0, 0, 0.25);
  font-size: 40px;
  font-weight: 900;
  letter-spacing: 0px;
  line-height: 72.4px;
  color: rgba(255, 255, 255, 1);
  text-align: left;
  vertical-align: top;
  background-color: initial;
}
.introduce-p {
  font-weight: 1000;
  margin-left: 10px;
  color: white;
  font-family: 'AlibabaPuHuiTi';
  left: 221px;
  top: 411px;
  width: 894px;
  height: 78px;
  opacity: 1;
  text-shadow: 0px 4px 4px  rgba(0, 0, 0, 0.25);
  font-size: 40px;
  font-weight: 900;
  letter-spacing: 0px;
  line-height: 72.4px;
  color: rgba(255, 255, 255, 1);
  text-align: left;
  vertical-align: top;
  background-color: initial;
}

/* From Uiverse.io by mobinkakei */
.loader {
  width: 80px;
  height: 80px;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
}

.loader_cube {
  position: absolute;
  width: 75px;
  height: 75px;
  border-radius: 30px;
}

.loader_cube--glowing {
  z-index: 2;
  width: 60%;
  height: 60%;
  background-color: rgba(255, 255, 255, 0.2);
  border: 2px solid rgba(255, 255, 255, 0.3);
}

.loader_cube--color {
  z-index: 1;
  filter: blur(2px);
  width: 80%;
  height: 80%;
  background: linear-gradient(135deg, #1afbf0, #da00ff);
  animation: loadtwo 2.5s ease-in-out infinite;
}

@keyframes loadtwo {
  50% {
    transform: rotate(-80deg);
  }
}
@keyframes autoScale {
  0% {
    transform: scale(1);
  }

  50% {
    transform: scale(1.15);
  }

  100% {
    transform: scale(1);
  }
}
@keyframes brightnessAuto {
  0% {
    filter: brightness(1);
  }

  50% {
    filter: brightness(1.08);
  }
  100% {
    filter: brightness(1);
  }
}
.scaling{
  animation: autoScale 5s infinite;
}
.brightening{
  animation: brightnessAuto 5s infinite;
}
</style>
