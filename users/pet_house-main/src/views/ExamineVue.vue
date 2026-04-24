<template>
  <el-main>

    <div id="tab">
      <h1>审核中心</h1>
      <p :class="{active:page==='我的捐赠'}" @click="handleToggle('我的捐赠')">
        我的捐赠
      </p>
      <p :class="{active:page==='我的申请'}" @click="handleToggle('我的申请')">
        我的申请
      </p>
    </div>

    <div id="container">
      <div class="box" v-for="item in page==='我的捐赠'?this.donateList:this.adoptList" :key="item.petId">
        <img :src="$imageBaseUrl+item.imageUrl" alt="">
        <div class="text" :style="{height:page!=='我的申请'?'50%':'38%'}">
          <p><i class="el-icon-s-custom"></i> 姓名：{{item.name}}</p>
          <p><i class="el-icon-time"></i> {{page==='我的捐赠'?'捐赠':'申请'}}时间：{{item.donationDate??item.applicationDate}}</p>
          <p><i class="el-icon-time"></i> 通过时间：{{item.passDate}}</p>
          <p><i class="el-icon-s-check"></i> 审核状态：{{ status[item.status-1] }}</p>
        </div>
        <button v-show="page==='我的申请'" @click="handleBack(item.petId)" :class="{disabled:item.status !== 2}" :disabled="item.status !== 2">反馈宠物近况</button>

      </div>

    </div>

    <el-dialog
      title="宠物近况反馈"
      :visible.sync="dialogVisible"
      width="30%"
      top="10vh">
      <el-form :model="form">
        <el-form-item label="饮食状况：">
          <el-input type="text" v-model="form.feed"></el-input>
        </el-form-item>
        <el-form-item label="排便状况：">
          <el-input type="text" v-model="form.defecation"></el-input>
        </el-form-item>
        <el-form-item label="情绪状况：">
          <el-input type="text" v-model="form.emo"></el-input>
        </el-form-item>
        <el-form-item label="体温状况：">
          <el-input type="text" v-model="form.temperature"></el-input>
        </el-form-item>
        <el-form-item label="近期图片：">
          <el-upload
            action='http://localhost:8081/head/img'
            :headers="{'pet':$store.state.user.userInfo.token}"
            multiple
            :on-success="handleSuccess"
            :on-progress="handleUploading"
            :on-error="handleError"
            list-type="picture-card">
            <i class="el-icon-plus"></i>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible=false">取消</el-button>
        <el-button type="primary" @click="applyForm">确定提交</el-button>
      </div>
    </el-dialog>
  </el-main>
</template>

<script>
import { getDonateList, getExamineList } from '@/api/examine.js'
export default {
  data () {
    return {
      page: '我的捐赠', // 用于记录用户正在浏览的页面是 “我的捐赠” or “我的申请”
      status: ['审核中', '通过', '未通过'], //  辅助渲染审核状态
      donateList: [], // 渲染的捐赠列表
      adoptList: [], // 渲染的领养列表
      dialogVisible: false, // 反馈表的显示
      form: { // 反馈表数据
        feed: '',
        defecation: '',
        emo: '',
        temperature: '',
        imageUrl: ''
      }
    }
  },
  async created () {
    try {
      const res = await getDonateList()
      this.donateList = res.data
      this.donateList.forEach(item => {
        item.imageUrl = item.imageUrl.replace(/^\[|\]$/g, '').trim()
      })
    } catch (error) {
      console.log(error)
    }
  },
  methods: {
    // 用户切换页面
    async handleToggle (to) {
      if (to === '我的捐赠') {
        // 用户申请到 我的捐赠 页面

        // 发送请求
        try {
          const res = await getDonateList()
          this.donateList = res.data
          this.donateList.forEach(item => {
            item.imageUrl = item.imageUrl.replace(/^\[|\]$/g, '').trim()
          })
        } catch (error) {
          console.log(error)
        }

        // 切换页面
        this.page = '我的捐赠'
      } else if (to === '我的申请') {
        // 用户切换到 我的申请 页面

        // 发送请求
        try {
          const res = await getExamineList()
          this.adoptList = res.data
          this.adoptList.forEach(item => {
            item.imageUrl = item.imageUrl.replace(/^\[|\]$/g, '').trim()
          })
        } catch (error) {
          console.log(error)
        }

        // 切换页面
        this.page = '我的申请'
      }
    },
    // 打开反馈表
    handleBack (petId) {
      this.dialogVisible = true
    },
    // 提交反馈表
    applyForm () {
      this.dialogVisible = false
      this.$message({
        message: '反馈提交成功',
        type: 'success'
      })
    },
    // 文件上传成功的钩子
    handleSuccess (res, file) {
      if (res.code === 200) {
        // code为200，成功
        // 这部分是处理返回的数据，与之前的数据进行整合（用户可能发送多张图片）
        this.form.imageUrl = res.data
        // 提示信息
        this.$message({
          message: `${file.name}上传成功！`,
          type: 'success'
        })
      } else {
        // code非200，失败
        this.$message.error(`${res?.msg},失败，请重试！`)
      }
    },
    // 文件上传中的钩子
    handleUploading (res, file) {
      this.$message(`${file?.name}上传中`)
    },
    // 文件上传失败的钩子
    handleError (err, file) {
      console.log(err, file)
      this.$message.error(`${file?.name}上传失败！`)
    }
  }

}
</script>

<style scoped>
  .el-main {
    background: rgba(204, 204, 204, 0.2);
    color: rgba(56, 56, 56, 1);
    display: flex;
    padding-top: 0;
    min-height: 90vh;
    gap: 2%;
  }

  /* tab 栏 */
  #tab{
    width: 11%;
    min-height: 100%;
    display: flex;
    flex-direction: column;
    background: white;
  }
  #tab>h1{
    text-align: center;
    font-size: 1.414vw;
    font-weight: 500;
    line-height: 12vh;
  }
  #tab>p{
    width: 100%;
    height: 8vh;
    letter-spacing: 5px;
    font-size: 1.2121vw;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    box-sizing: border-box;
    color: black;
    cursor: pointer;
  }
  #tab>.active{
    background: linear-gradient(to left, rgba(247, 149, 37, 0.7), rgba(247, 149, 37, 0.1));
    border-right:5px solid rgba(247, 149, 37);
    color: black;
  }

  /* 内容 */
  #container{
    width: 80%;
    min-height: 100%;
    display: flex;
    flex-wrap: wrap;
    gap: 3%;
    box-sizing: border-box;
    padding-top: 5vh;
  }
  .box{
    width: 23vw;
    height: 62vh;
    border-radius: 12.93px;
    background: rgba(255, 255, 255, 1);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 3%;
    margin-bottom: 3vh;
  }
  .box>img{
    width: 84%;
    height: 40%;
    border-radius: 12.93px;
  }
  .box>.text{
    width: 100%;
    box-sizing: border-box;
    padding: 0% 7%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 3.5vh;
  }
  .box>.text>p{
    /** 文本1 */
    font-size: 1.1vw;
    font-weight: 400;
    color: rgba(56, 56, 56, 1);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .box>.text>p>i{
    border-radius: 50%;
    padding: 5px;
    background: rgba(247, 149, 37, 1);
    color: white;
  }

  .box>button{
    width: 50%;
    height: 8%;
    border-radius: 12.93px;
    background: rgba(247, 149, 37, 1);
    border: none;
    color: rgba(255, 255, 255, 1);
    font-size: 1.1vw;
    cursor:pointer;
  }
  .box>button.disabled{
    background:rgba(255, 255, 255, 1);
    border:1px solid grey;
    color: rgba(56, 56, 56, 1);
    cursor: not-allowed;
  }
  ::v-deep .el-dialog{
    border-radius:21px;
  }
  ::v-deep .el-upload--picture-card{
    line-height: 100px;
    width: 100px;
    height: 100px;
  }
  ::v-deep .el-upload-list--picture-card .el-upload-list__item{
    width: 100px;
    height: 100px;
  }
</style>
