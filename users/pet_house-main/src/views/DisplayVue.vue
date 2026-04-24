<template>
  <div>
    <el-container>
      <!-- <el-header>
        <HeaderVue></HeaderVue>
      </el-header> -->
      <!-- 图片 -->
      <div class="content">
        <img src="../assets/displayBackground.jpg" alt="background">
        <!-- <img src="../assets/displayEat.png" alt="background"> -->
        <div class="title">
          <h1>The Pet Station</h1>
        </div>
        <img src="../assets/displayDog.png" alt="back-1">
        <img src="../assets/displayEat.png" alt="back-2">
        <div class="info-wrap">
          <p>
          Welcome to the official website of Pet Station! It's designed in warm colors, creating a cozy atmosphere. On
          the homepage, there's a large picture that changes as you move the mouse. The main page has a carousel of pet
          photos and detailed function introductions. It offers pet display and adoption, shopping, AI vet services and
          more. Come and explore!
        </p>
        </div>
        <!-- 点击进入更多 -->
        <div class="more">
          <button @click="navigateToHome">
            Explore More
            <i class="el-icon-arrow-right" />
          </button>
        </div>
        <!-- 左右箭头（不知道有没有必要 -->
        <!-- <div class="slider">
          <i class="el-icon-arrow-left"></i>
          <i class="el-icon-arrow-right"></i>
        </div> -->
      </div>
    </el-container>
  </div>
</template>

<script>
export default {
  methods: {
    navigateToHome () {
      this.$router.push('/home', () => { })
    }
  }
}
</script>

<style scoped>
/* 直接引入 Font Awesome(图标) font-Google(字体) 的 CSS 文件 */
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css');
@import url('https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap');

* {
  padding: 0;
  margin: 0;
  border: none;
  outline: none;
  font-family: "Inter", sans-serif;
}
.el-header {
  color: #333;
  line-height: 90px;
}
body {
  background-image: url(../assets/displayBackground.jpg);
  background-size: cover;
  background-position: top;
  background-repeat: no-repeat;
  overflow: hidden;
}
body::after {
  content: '';
  position: absolute;
  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
  background: linear-gradient(transparent 50%, rgb(0, 0, 0));
}
.content img {
  position: absolute;
  top: 0%;
  width: 100%;
  /* bottom: -12%; */
}
header {
  position: absolute;
  top: 0;
  z-index: 1;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.title {
  position: absolute;
  top: 40%;
  right: 50%;
  transform: translate(50%, -50%);
}
.title h1 {
  z-index: 100;
  font-size: 15rem;
  font-weight: 800;
  letter-spacing: 50px;
  text-transform: uppercase;
  color: #FFBF66;
  text-align: center;
  margin: -20px 0;
}
.info-wrap {
  width: 100%;
  display: flex;
  justify-content: center;
  position: absolute;
  bottom: 18%;
  z-index: 1;
}
p {
  font-size: 14px;
  font-weight: 30;
  letter-spacing: 1px;
  line-height: 1.8;
  color: rgba(255, 255, 255, 0.7);
  width: 70%;
  text-align: center;
  text-shadow: 0 1px 5px rgba(0, 0, 0, 0.2);
}

.more {
  position: absolute;
  bottom: 8%;
  display: flex;
  justify-content: center;
  width: 100%;
  z-index: 1;
}

.more button {
  font-size: 18px;
  font-weight: 400;
  letter-spacing: 3px;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.8);
  background-color: transparent;
  border: 1px solid rgba(255, 255, 255, 0.8);
  border-radius: 50px;
  height: 50px;
  width: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  transition: all 0.2s;
  cursor: pointer;
}

.more button:hover {
  background-color: rgba(255, 255, 255, 0.8);
  color:rgb(53, 53, 53);
}
.slider {
  position: absolute;
  top: 50%;
  width: 100%;
  display: flex;
  justify-content: space-between;
}
.slider i {
  padding: 0 5%;
  font-size: 36px;
  color: rgba(255, 255, 255, 0.4);
}

/* 动画 */
@keyframes bottomInText {
  from {
    transform: translateY(500px);
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}
.back-1 {
  animation: bottomIn 1s ease-out forwards;
}
h1 {
  animation: bottomInText 1.2s ease-out forwards;
}

p {
  animation: bottomInText 1.2s ease-out forwards;
  animation-delay: 0.2s;
  opacity: 0;
}

button {
  animation: bottomInText 1.2s ease-out forwards;
  animation-delay: 0.3s;
  opacity: 0;
}
@keyframes backgroundImage {
  from {
    background-position: top;
  }
  to {
    background-position: 50% 14%;
  }
}

body {
  animation: backgroundImage 1.6s ease-out forwards;
}

@keyframes topIn {
  from {
    transform: translateY(-100%);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes zoomOut{
  from {
    transform: scale(1.5);
    opacity: 0;
  }
  to {
    transform: scale(1);
    opacity: 1;
  }
}

.slider {
  animation: zoomOut 1.2s ease-out forwards;
}
</style>
