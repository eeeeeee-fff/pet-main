<!-- 这个是布局框架，用于布局以及一些页面需要HeaderVue的页面 -->
<template>
  <el-container>
    <el-header style="height: 10vh;width: 99vw;">
      <!-- 登录组件 -->
      <HeaderVue></HeaderVue>
    </el-header>

    <router-view/>

    <el-footer style="height: 14vh;background-color: black; border-radius: 20px;">
      <p>掌灯星屿 声明：本网站所有内容仅供学习使用。</p>
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
    color: rgb(140, 140, 140);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 4px;
    padding: 12px 20px;
  }
  .el-footer > p {
    font-size: 13px;
    line-height: 1.5;
}
</style>
