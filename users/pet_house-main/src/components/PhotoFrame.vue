<template>
  <div class="container">
    <div class="box">
      <div class="img-box">
        <img :src="imgSrc" alt="">
      </div>

      <div class="text-box">
        <h1>
          <slot name="name"></slot>
        </h1>

        <div class="detail-box">
          <p>
            <i class="el-icon-s-custom"></i>
            姓名：
          </p>
          <p>
            <i class="el-icon-menu"></i>
            种类：<slot name="species"></slot>
          </p>
          <p>
            <i class="el-icon-notebook-2"></i>
            领养须知：<slot name="info"></slot>
          </p>
          <slot name="button"></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    imgSrc: {
      type: String,
      default: ''
    }
  }
}
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.container {
  width: 26.21vw;
  height: 59.08vh;
  position: relative;
}

.box {
  width: 100%;
  height: 100%;
  position: absolute;
  overflow: hidden;
  z-index: 0;
  transition: 0.8s ease;
  box-shadow: 0 2.59px 5.17px rgba(0, 0, 0, 0.25);
  border-radius: 16px;
  background: #fff;
}

.box:hover {
  z-index: 1;
}

.img-box {
  width: 100%;
  height: 50vh;
  transition: height 0.8s ease;
  background: #fff7f0;
}

.box:hover .img-box {
  height: 28vh;
}

.img-box > img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center center;
  transition: transform 0.8s ease, object-fit 0.8s ease;
}

.box:hover .img-box > img {
  object-fit: contain;
  transform: scale(0.92);
}

.text-box {
  height: calc(100% - 50vh);
  background: rgba(255, 221, 204, 0.66);
  transition: height 0.8s ease;
}

.box:hover .text-box {
  height: calc(100% - 28vh);
}

.text-box > h1 {
  width: 100%;
  height: 9.16vh;
  font-size: 2.424vw;
  font-weight: 400;
  text-align: center;
  line-height: 9.16vh;
  transition: 0.8s ease;
}

.box:hover .text-box > h1 {
  font-size: 1.515vw;
  transform: translate(-12%, 14%);
}

.detail-box {
  width: 100%;
  height: 36.45vh;
  font-size: 1.515vw;
  font-weight: 400;
  padding: 2vw;
  line-height: 150%;
  transition: 0.8s ease;
}

.detail-box > p {
  margin-bottom: 2vh;
  width: 100%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  font-size: 0.95vw;
  color: rgba(86, 86, 86, 1);
}

.detail-box > p > i {
  color: rgba(247, 149, 37, 1);
  font-size: 1.2em;
}

.box:hover .detail-box {
  transform: translateY(-9.16vh);
}
</style>
