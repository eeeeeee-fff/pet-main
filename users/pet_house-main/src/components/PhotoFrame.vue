<!-- 版本4 -->
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

        <h2>
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
        </h2>
      </div>
    </div>

  </div>
</template>

<script>
export default {
  props: ['imgSrc']
}
</script>

<style scoped>
  *{
    /* 初始化 */
    margin: 0;
    padding: 0;
    /* 元素的总宽度和高度包含内边距和边框 */
    box-sizing: border-box;
  }

  .container{
    width: 26.21vw;
    height:59.08vh ;
    position: relative;
  }

  .box{
    width: 100%;
    height: 100%;
    position: absolute;
    overflow: hidden;
    z-index: 0;
    transition: 1s;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }
  .box:hover{
    height:59.08vh ;
    z-index: 1;
  }

  .img-box{
    width: 100%;
    /* height: 29.72vh; */
    height: 50vh;
    transition: 1s;
  }
  .box:hover .img-box{
    height: 28vh;
  }
  .img-box>img{
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .text-box{
    background: rgba(255, 221, 204, 0.66);
  }
  .text-box>h1{
    width: 100%;
    height: 9.16vh;
    font-size: 2.424vw;
    font-weight: 400;
    text-align: center;
    line-height: 9.16vh;
    transition: 0.9s;
    transition-delay: 0.1s;
  }
  .box:hover .text-box>h1{
    font-size: 1.515vw;
    transform: translate(-12%,14%);
  }
  .text-box>h2{
    width: 100%;
    height: 36.45vh;
    font-size: 1.515vw;
    font-weight: 400;
    padding: 2vw;
    line-height: 150%;
    transition: 0.9s;
  }
  .text-box>h2>p{
    margin-bottom:2vh ;
    width: 100%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .text-box>h2>p>i{
    color: rgba(247, 149, 37, 1);
    font-size: 1.2em;
  }
  .box:hover .text-box>h2{
    transform: translateY(-9.16vh);
  }
</style>

<!-- 版本1
<template>
  <div class="frame">
    <img :src="imgSrc" alt="" :width="imgWidth" height="auto">
    <div class="info">
      <p><slot name="info"></slot></p>
    </div>
  </div>
</template>

<script>
export default {
  props: ['imgWidth', 'imgSrc']
}
</script>

<style scoped>
  .frame{
    display: inline-block;
  }
  p{
    text-align: center;
  }

</style> -->

<!-- 版本2 -->
<!-- <template>
  <div class="container">

    <div class="box">
      <div class="img-box">
        <img src="https://loremflickr.com/cache/resized/65535_53305954772_aee39d7d63_z_400_400_nofilter.jpg" alt="">
      </div>

      <div class="text-box">
        <div>
          <h2>
            姓名：<slot name="name"></slot> <br>
            种类：<slot name="species"></slot>
          </h2>
          <p><slot name="info"></slot></p>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
export default {
  props: ['imgSrc']
}
</script>

<style scoped>
  *{
    /* 初始化 */
    margin: 0;
    padding: 0;
    /* 元素的总宽度和高度包含内边距和边框 */
    box-sizing: border-box;
  }
  .container{
    /* 相对定位 */
    position: relative;
    /* 弹性布局 横向排列 允许换行 */
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    margin: 20px  ;
  }
  .container .box{
    position: relative;
    width: 300px;
    height: 300px;
    /* 溢出隐藏 */
    overflow: hidden;
    /* 动画过渡 */
    transition: 0.5s;
  }
  /* 鼠标移入，盒子变大 */
  .container .box:hover{
    transform: scale(1.25);
    box-shadow: 0 25px 40px rgba(0,0,0,0.5);
    z-index: 1;
    cursor: pointer;
  }
  .container .box .img-box{
    /* 绝对定位 */
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
  }
  /* 渐变遮罩（黑色——透明） 默认隐藏 */
  .container .box .img-box::before{
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to top,#222,transparent);
    z-index: 1;
    opacity: 0;
    transition: 0.5s;
  } */
  /* 鼠标移入，渐变遮罩显示 */
  /* .container .box:hover .img-box::before{
    opacity: 1;
  }
  .container .box .img-box img{
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    /* 保持原有尺寸比例，裁切长边 */
    object-fit: cover;
  }
  .container .box .text-box{
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    padding: 20px;
    /* 弹性布局 元素位于容器的结尾 */
    display: flex;
    align-items: flex-end;
    color: #fff;
    z-index: 2;
  }
  .container .box .text-box h2{
    font-size: 20px;
    margin-bottom: 10px;
    /* 默认在图片下方 */
    transform: translateY(90px);
    transition: 0.5s;
  }
  .container .box:hover .text-box h2{
    /* 鼠标移入，移入可视范围 */
    transform: translateY(0);
    /* 设置动画延迟时间 */
    transition-delay: 0.3s;
  }
  .container .box .text-box p{
    font-size: 13px;
    line-height: 20px;
    /* 默认移出可视范围 */
    transform: translateY(200px);
    transition: 0.5s;
  }
  .container .box:hover .text-box p{
    /* 鼠标移入，移入可视范围 */
    transform: translateY(0);
    /* 设置动画延迟时间 */
    transition-delay: 0.4s;
  }
</style> -->

<!-- 版本3 -->
<!-- <template>

  <div class="box">
    <div class="img-box">
      <img :src="imgSrc" alt="">
    </div>
  </div>

</template>

<script>
export default {
  props: ['imgSrc']
}
</script>

<style scoped>
  *{
    /* 初始化 */
    margin: 0;
    padding: 0;
    /* 元素的总宽度和高度包含内边距和边框 */
    box-sizing: border-box;
  }
  .box{
    position: relative;
    width: 20vw;
    height: 23vh;
    overflow: hidden;
    transition: 0.5s;
    /* 溢出隐藏 */
    overflow: hidden;
    /* 动画过渡 */
    transition: 0.5s;
    border-radius: 12.93px;
  }
  /* 鼠标移入，盒子变大 */
  .box:hover{
    transform: scale(1.25);
    box-shadow: 0 25px 40px rgba(0,0,0,0.5);
    z-index: 1;
  }
  .box .img-box{
    /* 绝对定位 */
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    border-radius: 12.93px;
  }
  .box .img-box img{
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    border-radius: 12.93px;
    /* 保持原有尺寸比例，裁切长边 */
    object-fit: cover;
  }
</style> -->
