<template>
  <el-container style="display: flex;flex-direction: column;">
    <!-- 轮播图 -->
    <el-carousel :interval="2000" type="card" height="60vh" style="margin: 10px;">
        <el-carousel-item v-for="(item,index) in carouselImg" :key="index" style="border-radius: 20px;">
          <img :src="item.imageUrl" alt="" class="imgUrl">
        </el-carousel-item>
    </el-carousel>
    <div  style="display: flex;flex-direction: row;">
      <el-aside width="200px"></el-aside>
    <el-main>
      <!-- 宠物领养板块 -->
      <section class="adopt">
        <div class="header">宠物领养</div>
        <div class="box_container">
          <div class="box">
            <img src="https://img.js.design/assets/img/67a9c0df2385a27571c617d7.png#252a5ffd3ad0fc69fd1c1fb9efb929c6" alt="">
            <p>基本情况</p>
          </div>

          <div class="box">
            <img src="https://img.js.design/assets/img/67a9beaa49f9cc81df33d983.png#8fb464a11606acdc0d10d71116c38e66" alt="">
            <p>近况展示</p>
          </div>

          <div class="box">
            <img src="https://img.js.design/assets/img/67a9bfed19abf04c14af8a84.png#264be2f7372bed85730971fa00a2166a" alt="">
            <p>领养须知</p>
          </div>

          <div class="box">
            <img src="https://img.js.design/assets/img/67a9c1ffb269b2492d696abd.png#69543f37382d07fc075716f7c6366e04" alt="">
            <p>表格填写</p>
          </div>

        </div>
        <div class="intro" style="display: flex; align-items: center">
          <img src="../assets/智能匹配介绍.png" alt="" style="width: 57%; height: auto;">
          <div class="text">
              <p class="title">以领养之名，许毛孩子一个家</p>
              <button class="more" @click="$router.push('/pet')">探索更多 ></button>
              <img src="https://img.js.design/assets/img/67a9c47719abf04c14b0cbe8.png#1944bb9139fd022e4ddddb4a00e46a68" alt="" class="decoration">
              <img style="width: 300px;height: auto;border-radius: 20px;" src="../assets/homedonate.jpg" alt="">
          </div>
        </div>
      </section>

      <!-- 宠物捐赠板块 -->
      <section class="donate">
        <div class="header">宠物捐赠</div>
        <p class="title">或许您想要了解宠物捐赠的相关信息？</p>
        <p class="intro">
          &emsp;&emsp;亲爱的朋友们，当我们享受着生活的温馨与美好时，别忘了那些可爱的小生命正在等待着我们的援助。让我们伸出温暖的双手，用爱去呵护，用真心去捐赠，为那些无家可归的宠物们搭建一个充满爱的避风港。让它们也能感受到人间的温暖，拥有一个永远的家。
          <br>&emsp;&emsp;本平台将根据用户您上传的宠物相关视频以及图片后台使用三维重建算法3D Gaussian Splatting（3DGS）自动生成3d模型
        </p>
        <button class="more" @click="$router.push('/donate')">了解更多 ></button>
        <img src="https://img.js.design/assets/img/67a9c47719abf04c14b0cbe8.png#1944bb9139fd022e4ddddb4a00e46a68" alt="" class="decoration">
      </section>

      <!-- 宠物论坛板块 -->
      <section class="forum">
        <div class="header">宠物论坛</div>
        <div class="box_container">
          <div class="box">
            <img src="https://img.js.design/assets/img/67a9cdf52bd8fa167ed74b40.png#b2bc18be5d58317921f4b7e0602b198" alt="">
            <div class="text">
              <p class="title">我要发帖</p>
              <p class="intro">您可以自由分享您的宠物故事、经验或问题</p>
            </div>
          </div>
          <div class="box">
            <img src="https://img.js.design/assets/img/67a9cf1fb30c45934ae24d7b.png#ce6c2c26a58e2110b0cbb93895e389e2" alt="">
            <div class="text">
              <p class="title">问答专区</p>
              <p class="intro">专门为解决您关于宠物的各种疑惑而设立的，能得到专业和热心的回复</p>
            </div>
          </div>
          <div class="box">
            <img src="https://img.js.design/assets/img/67a9cf546a10bb242b412757.png#fa515ec24912113a2666f988e953161b" alt="">
            <div class="text">
              <p class="title">互动浏览</p>
              <p class="intro">让您轻松查看其他用户的精彩分享和交流内容，从中获取有趣的宠物知识和经验</p>
            </div>
          </div>
        </div>

        <button class="more"  @click="$router.push('/forum')">前往论坛 ></button>

      </section>

      <!-- 智能匹配板块 -->
      <section class="match">
        <div class="header">智能匹配</div>
        <div class="text">
          <p>我们将根据您的日常搜索<span class="keyword">关键词</span>以及<span class="keyword">问题筛查</span>为您<br>智能生成与您适配的宠物</p>
          <p><span class="text_AI">AI</span>结果即将生成...</p>
        </div>
        <img class="dog" src="https://img.js.design/assets/img/67a9d8606a10bb242b421299.png#cd290c63a85cbda687dbe8521276d341" alt="">
        <button class="more"  @click="$router.push('/match')">立即查询 ></button>
        <img src="https://img.js.design/assets/img/67a9c47719abf04c14b0cbe8.png#1944bb9139fd022e4ddddb4a00e46a68" alt="" class="decoration">

      </section>

      <!-- 宠物科普板块 -->
      <section class="knowledge">
        <div class="header">宠物科普</div>
        <div class="intro_container">
          <div class="box">
            <img src="https://img.js.design/assets/img/67a9dabc19abf04c14b409a5.png#07e9258d97929eb3e07b859f1f8d5f9f" alt="">
            <div class="text">
              <p class="title">与智能 AI 宠物医生对话</p>
              <p class="subtitle">即刻解决内心疑惑，收获养宠知识<br>为宠物提供快速、准确诊断和治疗建议的服务</p>
            </div>
          </div>
          <div class="box">
            <img src="https://img.js.design/assets/img/67a9dc9c6a10bb242b425a6c.png#1874adb5f010800cec3478e6fca619ae" alt="">
            <div class="text">
              <p class="title">查看宠物科普</p>
              <p class="subtitle">收获更多宠物小知识，让养宠变简单</p>
            </div>
          </div>
        </div>
        <button class="more"  @click="$router.push('/knowledge')">立即体验 ></button>

      </section>
      <div style="height: 15vh;"></div>
    </el-main>
    <el-aside width="200px"></el-aside>
    </div>
  </el-container>
</template>

<script>
export default {
  data () {
    return {
      // 轮播图的图片的地址数组
      carouselImg: [
        // { imageUrl: 'https://tse2-mm.cn.bing.net/th/id/OIP-C.fENUtMcBa0-sy904OGdKUQHaEK?w=304&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7' },
        // { imageUrl: 'https://tse2-mm.cn.bing.net/th/id/OIP-C.bT78u4CnMzCb9uwVfqy2lwHaFi?w=243&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7' },
        // { imageUrl: 'https://pic.vjshi.com/2022-08-23/10e80fe0dd3b46359c1ebcb211520322/00001.jpg?x-oss-process=style/watermark' }
        { imageUrl: require('@/assets/Image_1.webp') },
        { imageUrl: require('@/assets/Image_2.webp') },
        { imageUrl: require('@/assets/Image_3.webp') },
        { imageUrl: require('@/assets/Image_4.webp') },
        { imageUrl: require('@/assets/Image_5.webp') }

      ]
    }
  }
}
</script>

<style scoped>
  /* 布局容器 */
  .el-main {
    background: #FEFCF8;
    color: rgba(56, 56, 56, 1);
  }

  /* 轮播图 */
  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }
  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
  .el-carousel__item>img{
    height: 100%;
    width: auto;
  }

  /* 宠物领养板块 */
  .adopt{
    background: linear-gradient(180deg, rgba(250, 240, 225, 0.22) 0%, rgba(250, 240, 225, 0) 100%);
    width: 100%;
    height: 90vh;
    display: flex;
    flex-direction: column;
    flex-wrap:nowrap ;
    position: relative;
    box-sizing: border-box;
  }
  section>.header{
    width: 15%;
    font-size: 2vw;
    font-weight: 500;
    color: rgba(56, 56, 56, 1);
    text-align: center;
    padding: 1% 0;
  }
  section>.header::after{
    /* 下划线 */
    content: '';
    width: 10vw;
    height: 10%;
    display: block;
    border-bottom: 4px solid rgba(255, 141, 26, 0.91);
    box-shadow: 0px 5.76px 5.17px  rgba(0, 0, 0, 0.25);
    margin-left: 10%;
  }
  .adopt>.box_container{
    width: 100%;
    height: 35%;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 5%;
  }
  .adopt>.box_container>.box{
    width: 12vw;
    height: 22vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 4.6%;
    border-radius: 10px;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }
  .adopt>.box_container>:nth-child(2n+1){
    background: rgba(231, 250, 246, 0.5);
  }
  .adopt>.box_container>:nth-child(2n){
    background: rgba(255, 255, 255, 0.5);
  }
  .adopt>.box_container>.box>img{
    width: 7.89vw;
    height: 11.6vh;
  }
  .adopt>.box_container>.box>p{
    font-size: 2.02vw;
  }
  .adopt>.intro{
    width: 100%;
    height: 54%;
    font-size: 10px;
    display: flex;
    justify-content: center;
  }
  .adopt>.intro>.text{
    width:40%;
    display: flex;
    flex-direction: column;
    /* align-items: center; */
    gap: 9%;
    box-sizing: border-box;
  }
  .adopt>.intro>.text>.title{
    width:100%;
    font-size: 1.8vw;
  }
  .adopt>.intro>.text>.subtitle{
    color: rgba(56, 56, 56, 0.84);
    font-size: 1.919vw;
    width:100%;
  }
  .adopt>.intro>.text>button{
    align-self: end;
    margin-top: 1%;
  }
  .adopt>.intro>.text>.decoration{
    width: 5.39vw;
    position: absolute;
    top: 45%;
    left: 52%;
  }
  .more{
    right: 0px;
    width: 8vw;
    height: 6.15vh;
    font-size: 1.2vw;
    background: rgba(255, 141, 26, 0.62);
    color: white;
    border: none;
    border-radius: 10px;
    box-shadow: 0px 7.76px 5.17px  rgba(0, 0, 0, 0.25);
    cursor: pointer;
    float: right;
  }
  .adopt>.intro>img{
    height: 25.66vw;
    width: 25.66vw;

  }
  .decoration{
    width: 5.39vw;
    position: absolute;
    top: 48%;
    left: 35%;
  }

  /* 宠物捐赠板块 */
  .donate{
    width: 100%;
    height: 35vh;
    position: relative;
    background: #FEFCF8;
    padding-bottom: 5vh;
  }
  .donate>.title{
    font-size: 2.27vw;
    width: 85%;
    margin-top:1% ;
    box-sizing: border-box;
    padding-left:20% ;
  }
  .donate>.intro{
    color: rgba(56, 56, 56, 0.84);
    font-size: 1.3vw;
    width: 85%;
    box-sizing: border-box;
    padding-left:20% ;
    margin-top: 2.5%;
  }
  .donate>.more{
    position: absolute;
    top: 18%;
  }
  .donate>.decoration {
    top: 20%;
    left: 13%;
  }

  /* 宠物论坛板块 */
  .forum{
    width: 100%;
    height: 46vh;
    position: relative;
    padding-bottom: 5vh;
  }
  .forum>.box_container{
    width: 100%;
    height: 78%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 3.5vw;
    margin-top:2vh ;
  }
  .forum>.box_container>.box{
    width: 22.929vw;
    height: 36.8vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: start;
  }
  .forum>.box_container>.box>.text{
    width: 20.929vw;
    height: 25.486vh;
    border-radius: 10px;
    box-sizing: border-box;
    padding: 3% 3%;
    background: rgba(255, 255, 255, 1);
    border: 2.29px solid rgba(166, 166, 166, 1);
    box-shadow: 0px 5.17px 10.34px  rgba(0, 0, 0, 0.25);
  }
  .forum>.box_container>.box>.text>.title{
    font-size: 2vw;
  }
  .forum>.box_container>.box>.text>.intro{
    font-size: 1.3vw;
    color: rgba(128, 128, 128, 1);
    margin-top: 2%;
    line-height: 150%;
  }
  .forum>.box_container>.box>img{
    height: 30%;
  }
  .forum>.more{
    position: absolute;
    top: 8%;
  }

  /* 智能科普板块 */
  .match{
    width: 100%;
    height:46vh ;
    position: relative;
  }
  .match>.text>:nth-child(1){
    font-size: 1.7726vw;
    width: 100%;
    text-align: center;
  }
  .match>.text>:nth-child(1)>span{
    font-size: 2.2777vw;
    width: 100%;
    text-align: center;
    padding:0 1% ;
  }
  .match>.text>:nth-child(2){
    font-size: 1.525vw;
    width: 100%;
    text-align: center;
    margin-top: 3%;
  }
  .match>.text>:nth-child(2)>span{
    font-size: 3.050vw;
    font-family: Monoton;
    padding-right: 2%;
    color: rgba(255, 141, 26, 1);
  }
  .match>.dog{
    width: 16vw;
    position: absolute;
    top: 40%;
    left: 60%;
  }
  .match>.decoration{
    top: 16%;
    left: 10%;
  }
  .match>.more{
    position: absolute;
    top: 15%;
  }

  /* 宠物科普 */
  .knowledge{
    width: 100%;
    height:55vh ;
    position: relative;
  }
  .knowledge>.intro_container{
    width: 100%;
    height: 80%;
    display: flex;
    flex-direction: column;
  }
  .knowledge>.intro_container>.box{
    width: 100%;
    height: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    left: -10%;
  }
  .knowledge>.intro_container>.box:nth-child(2){
    flex-direction:row-reverse;
    left: 30%;
    width: 70%;
  }
  .knowledge>.intro_container>.box>img{
    width: 7vw;
    position: relative;
    top: -20%;
    left: -7%;
  }
  .knowledge>.intro_container>.box::before{
    /* 圆 */
    content: '';
    display: block;
    width: 10vw;
    height: 10vw;
    border-radius: 50%;
    background: rgba(229, 236, 247, 1);
    position: relative;
    left: 4.5%;
    top: 10%;
  }
  .knowledge>.intro_container>.box:nth-child(2)::before{
    /* 圆 */
    content: '';
    display: block;
    width: 10vw;
    height: 10vw;
    border-radius: 50%;
    background: rgba(254, 246, 203, 1);
    position: relative;
    left: -12.5%;
    top: -5%;
  }
  .knowledge>.intro_container>.box:nth-child(2)>img{
    left: 9%;
    width: 11.25vw;
    top: -25%;
  }
  .knowledge>.intro_container>.box>.text>.title{
    font-size: 2.2726vw;
  }
  .knowledge>.intro_container>.box>.text>.subtitle{
    font-size: 1.419vw;
    margin-top: 3%;
    color: rgba(56, 56, 56, 0.84);
  }
  .knowledge>.intro_container>.box:nth-child(2)>.text>.title{
    text-align: right;
  }
  .knowledge>.more{
    position: absolute;
    top: 5%;
  }
  .imgUrl{
    width: 100% !important;
    height:auto;
    /* overflow : hidden; */
    object-fit: cover;
  }
</style>
