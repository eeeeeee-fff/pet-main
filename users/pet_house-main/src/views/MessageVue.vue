<template>
  <el-main class="msg">
    <!-- 消息 -->
    <section class="msg_left">
      <div class="msg_list">
        <span class="title">消息</span>
        <input type="text" placeholder="所有消息">
        <div class="list_container">
          <div class="msg_box" :class="{toTop:item===1}" v-for="item in 6" :key="item">
            <img src="../assets/1.jpeg" alt="">
            <p class="id">王小花</p>
            <p class="msg_content">您好，想咨询您新手养狗相关事宜。我想养条小狗，感觉小狗特别活泼，能陪着我玩。</p>
            <p class="time">2025-2-2</p>
            <i class="el-icon-collection-tag" title="置顶" @click="toTop(item)"></i>
          </div>
        </div>
      </div>
    </section>

    <section class="msg_right">

      <div class="msg_container">

        <div class="dialogue_box otherUser"> <!-- otherUser类名是对方的消息 -->
          <div class="top">
            <img src="../assets/1.jpeg" alt="">
            <p class="id">王小花</p>
            <p class="time">2025-2-2 18:26</p>
          </div>
          <p class="msg_content">您好，想咨询您新手养狗相关事宜。我想养条小狗，感觉小狗特别活泼，能陪着我玩。</p>
        </div>

        <div class="dialogue_box currentUser"><!-- currentUser类名是本人的消息 -->
          <div class="top">
            <img src="../assets/1.jpeg" alt="">
            <p class="time">2025-2-2 19:26</p>
          </div>
          <p class="msg_content">养狗确实很有意思！首先得给它准备一个狗窝，要是小型犬，弄个小垫子放角落就行；大型犬的话，得准备个大一点、结实的狗窝。食盆和水盆也不能少，材质最好选不容易打翻的。</p>
        </div>

      </div>

      <div class="input_area">
        <div class="send_pic">
          <el-upload
            action="http://127.0.0.1:4523/m1/5774102-5458029-default/head/img"
            multiple
            :show-file-list="false"
            :on-success="handleSuccess"
            :on-progress="handleUploading">
            <i class="el-icon-picture-outline"></i>
          </el-upload>
        </div>
        <textarea name="" id=""></textarea>
        <button class="send">发送</button>
      </div>
    </section>
  </el-main>
</template>

<script>
export default {
  data () {
    return {

    }
  },
  methods: {
    // 文件上传成功的钩子
    handleSuccess (res, file) {
      console.log(res)
      if (res.code) {
        // code为1，成功

        this.$message({
          message: `${file.name}发送成功！`,
          type: 'success'
        })
      } else {
        // code非1，失败
        this.$message.error('失败，请重试！')
      }
    },
    // 文件上传中的钩子
    handleUploading (res, file) {
      this.$message(`${file.name}发送中`)
    }
  },
  created () {
    console.log(this.$route.params.userId)
  }
}
</script>

<style scoped>
 *{
  margin: 0;
  padding: 0;
 }
  .el-main {
    background: rgba(204, 204, 204, 0.22);
    color: #333;
  }
  /* 消息页面 */
  .msg{
    display: flex;
    flex-wrap: nowrap;
    gap: 30px;
  }
  .msg_left{
    height: 86vh;
    width: 28vw;
  }
  .msg_right{
    height: 86vh;
    width: 66vw;
  }
  .msg_list,.msg_container,.input_area{
    background: white;
  }
  .msg_list{
    height: 100%;
    width: 100%;
    position: relative;
    display: flex;
    flex-direction: column;
    border-radius: 30px 0 0 0;
  }
  .msg_list>.title{
    font-size: 1.515vw;
    font-weight: 500;
    color: rgba(56, 56, 56, 1);
    padding: 3% 0 3% 6%;
  }
  .msg_list>input{
    width: 90%;
    height: 5%;
    font-size: 1.2625vw;
    margin:0 0 5% 3% ;
    padding-left: 2%;
  }
  .msg_list>.list_container{
    width: 100%;
    height: 85%;
    overflow-y: auto; /* 添加垂直滚动条 */
  }
  .msg_list>.list_container>.msg_box{
    background: white;
    width: 100%;
    height: 20%;
    position: relative;
    border-bottom: 1px solid rgba(166, 166, 166, 0.44);
    cursor: pointer;
  }
  .msg_list>.list_container>.toTop{
    background: rgb(237 237 237);
  }

  .msg_list>.list_container>.msg_box>img{
    border-radius: 50%;
    width: 10%;
    position: absolute;
    top: 10%;
    left: 3%;
  }
  .msg_list>.list_container>.msg_box>.id{
    position: absolute;
    top: 10%;
    left: 15%;
    color: rgba(56, 56, 56, 1);
    font-size: 1.2624vw;
  }
  .msg_list>.list_container>.msg_box>.msg_content{
    width: 80%;
    position: absolute;
    top: 40%;
    left: 15%;
    color: rgba(56, 56, 56, 1);
    font-size: 1.414vw;
    white-space: nowrap; /* 禁止文本换行 */
    overflow: hidden; /* 隐藏超出容器的部分 */
    text-overflow: ellipsis; /* 用省略号显示被截断的文本 */
  }
  .msg_list>.list_container>.msg_box>.time{
    position: absolute;
    top: 10%;
    right: 5%;
    color: rgba(128, 128, 128, 1);
    font-size: 1.01vw;
  }
  .msg_list>.list_container>.msg_box>.el-icon-collection-tag{
    position: absolute;
    bottom: 10%;
    right: 5%;
    cursor: pointer;
  }

  .msg_container{
    height: 78%;
    width: 100%;
    border-radius: 30px 30px 0 0;
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    overflow-y: auto; /* 添加垂直滚动条 */
  }
  .msg_container>.dialogue_box{
    width: 100%;
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
  }
  .msg_container>.dialogue_box>.top{
    display: flex;
    flex-wrap:nowrap ;
  }
  .msg_container>.dialogue_box>.top>img{
    width: 6%;
    border-radius: 50%;
    margin:2% 0 0 3%;
  }
  .msg_container>.dialogue_box>.top>.id{
    color: rgba(56, 56, 56, 1);
    font-size: 1.2624vw;
    margin:3% 0 0 1% ;
    font-weight: 500;
  }
  .msg_container>.dialogue_box>.top>.time{
    color: rgba(128, 128, 128, 1);
    font-size: 1.2625vw;
    margin:3.25% 0 0 1% ;
  }
  .msg_container>.dialogue_box>.msg_content{
    width: 50%;
    padding: 1.1vw 1.6vw;
    border-radius: 20px;
    position: relative;
    line-height: 150%;
    font-size: 1.414vw;
    font-weight: 400;
  }
  .msg_container>.otherUser>.msg_content{
    margin-left:10% ;
    background: rgba(248, 248, 248, 1);
    color: rgba(56, 56, 56, 1);
    top: -5%;
  }
  .msg_container>.currentUser>.msg_content{
    margin-right:10% ;
    background: rgba(255, 141, 26, 1);
    color: rgba(255, 255, 255, 1);
  }
  .msg_container>.currentUser{
    align-items: end;
  }
  .msg_container>.currentUser>.top{
    justify-content: end;
    flex-direction: row-reverse;
  }
  .msg_container>.currentUser>.top>img{
    width: 9%;
    margin:2% 3% 0 0 ;
  }
  .msg_container>.currentUser>.top>.time{
    margin-right: 1% ;
  }

  .input_area{
    height: 22%;
    width: 100%;
    border-radius: 0 0 30px 30px;
    position: relative;
    box-sizing: border-box;
    border-top:1px solid rgba(166, 166, 166, 0.79) ;
  }
  .input_area>.send_pic{
    width: 100%;
    height: 20%;
  }
  .input_area>.send_pic .el-icon-picture-outline{
    font-size: 1.8vw;
    margin: 3px 0 0 10px;
    cursor: pointer;
  }
  .input_area>textarea{
    width: 100%;
    height: 50%;
    border: none;
    font-size: 22px;
    padding: 1% 1% 0 1%;
    box-sizing: border-box;
    outline: none;
  }
  .input_area>.send{
    width: 8%;
    height: 20%;
    background: rgba(255, 141, 26, 1);
    color: white;
    position: absolute;
    right: 3%;
    bottom: 8%;
    border: none;
    border-radius: 5px;
    font-size: 1.01vw;
  }
</style>
