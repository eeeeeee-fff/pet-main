<!-- 这个是布局框架，用于布局以及一些页面需要HeaderVue的页面 -->
<template>
  <el-container>
    <el-header style="height: 10vh;width: 99vw;">
      <!-- 登录组件 -->
      <HeaderVue></HeaderVue>
    </el-header>

    <router-view/>

    <el-footer style="height: 35vh;background-color: black; border-radius: 20px;">
      <p>掌灯星屿 声明：本网站所有内容版权归 掌灯星屿所有，未经授权禁止转载。</p>
      <p>如侵权或涉及违法，请联系我们删除</p>
      <p>联系我们：958798069@qq.com</p>
      <p>本网站为纯公益网站</p>
    </el-footer>
  </el-container>
</template>

<script>
export default {

}
</script>

<style scoped>
  /* 布局容器 */
  .el-header {
    color: #333;
    line-height: 10vh;
  }
  .el-main {
    background-color: #333;
    color: #333;
  }
  .el-footer {
    color: rgb(74, 73, 73);
    /* line-height: 60px; */
    font-size: 1.919vw;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 1vh;
  }
  .el-footer > p {
    font-size: 25px;
}
</style>
