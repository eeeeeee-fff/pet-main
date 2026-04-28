<template>
  <el-main>
    <!-- 标题 -->
    <div class="title" v-show="!forumMode">
      <p><img src="../assets/icon_msg.svg" alt="">论坛<span>介绍宠物知识，开放寻找好友，有问题来论坛！</span></p>
    </div>
    <!-- 左边 -->
    <section class="left" :class="{lettle_margin:post_detail}">
      <!-- 标题 -->
      <div class="title" v-show="post_detail">
        <p><img src="../assets/icon_msg.svg" alt="">论坛<span>介绍宠物知识，开放寻找好友，有问题来论坛！</span></p>
      </div>

      <!-- 论坛入口 -->
      <div class="advertise" v-show="!forumMode">
        <p class="title_p">养宠人互动专区上线</p>
        <p class="subtitle">推荐必看！一起交流养宠经验</p>
        <button @click="enterForum()">点击进入论坛</button>
        <img src="https://img.js.design/assets/img/67a372b3b269b2492debfe6b.png#0b9e6a261c768788f6408359727b3e2a" alt="">
      </div>

      <!-- 发帖 -->
      <div class="post" v-show="!forumMode">
        <div class="btn">
          <div class="title">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27.82501220703125" height="27.405029296875" viewBox="0 0 27.82501220703125 27.405029296875" fill="none">
              <path d="M23.4062 0L8.03906 0C5.38672 0 3.2375 2.14922 3.23476 4.79883L3.23476 21.0301L0.76289 21.0301C0.341797 21.0301 0 21.3719 0 21.7902L0 24.2156C0 26.0559 2.02617 27.4039 4.41328 27.4039L20.1715 27.4039C20.3711 27.4148 20.5652 27.3438 20.7156 27.2125C22.7117 26.6301 24.1719 24.7871 24.1746 22.6023L24.1746 6.37656L27.0621 6.37656C27.2644 6.37656 27.4586 6.29727 27.6008 6.15234C27.743 6.01016 27.825 5.81602 27.825 5.61367L27.825 3.18828C27.8195 1.35078 25.7906 0 23.4062 0ZM19.9035 13.6418L7.92148 13.6418C7.37187 13.6418 6.92617 13.1961 6.92617 12.6438C6.92617 12.0941 7.37187 11.6484 7.92148 11.6484L19.9035 11.6484C20.4531 11.6484 20.9016 12.0941 20.9016 12.6438C20.9016 13.1961 20.4559 13.6418 19.9035 13.6418ZM19.9035 7.63164L7.92148 7.63164C7.37187 7.63164 6.92617 7.18594 6.92617 6.63359C6.92617 6.08399 7.37187 5.63828 7.92148 5.63828L19.9035 5.63828C20.4531 5.63828 20.9016 6.08399 20.9016 6.63359C20.9016 7.18594 20.4559 7.63164 19.9035 7.63164Z"   fill="#FF8D1A" >
              </path>
            </svg>
            我要发帖
          </div>
          <el-upload
            action='http://localhost:8081/head/img'
            :headers="{'pet':$store.state.user.userInfo.token}"
            :show-file-list="false"
            :on-success="handleSuccess"
            :on-progress="handleUploading"
            :on-error="handleError"
            :file-list="fileList">
            <!--这个 file-list 是为了两个 el-upload 的文件预览显示能够同步，
            与宠物图片引用逻辑一致：单张图片
            -->
            <button class="upload">上传图片</button>
          </el-upload>
          <button @click="handlePost()">点击发布</button>
        </div>
        <input type="text" placeholder="点击添加标题" v-model="postTitle">
        <textarea name="" id="" placeholder="点击添加正文" v-model="postContent"></textarea>
        <div class="label">
          <span @click="postTitle+='#宠物健康 '">#宠物健康</span>
          <span @click="postTitle+='#新手养宠大全 '">#新手养宠大全</span>

        </div>
      </div>

      <!-- 帖子列表 -->
      <div class="posts_container" v-show="forumMode && !post_detail">
        <div class="post_box" v-for="item in postsList" :key="item.id">
          <img :src="$imageBaseUrl+item.icon" alt="">
          <p class="post_title" @click="viewPost(item.id)">
            {{ item.title }}
            <svg v-show="index===0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="35" height="35" viewBox="0 0 35 35" fill="none">
              <path d="M25.5956 9.76693C25.5832 9.75398 25.5706 9.74137 25.5576 9.7291C25.5447 9.71679 25.5314 9.70483 25.5178 9.69321C25.5043 9.68159 25.4904 9.67031 25.4762 9.6594C25.4621 9.6485 25.4477 9.63794 25.433 9.62772C25.4184 9.61753 25.4034 9.60772 25.3883 9.59826C25.3731 9.58882 25.3577 9.57977 25.3421 9.57112C25.3264 9.56247 25.3106 9.5542 25.2945 9.54634C25.2785 9.53848 25.2623 9.53102 25.2458 9.52398C25.2294 9.51694 25.2129 9.51031 25.1961 9.50409C25.1793 9.4979 25.1624 9.49213 25.1454 9.48676C25.1283 9.48143 25.1112 9.47651 25.0938 9.47203C25.0765 9.46755 25.0591 9.46349 25.0416 9.4599C25.0241 9.45631 25.0066 9.45313 24.9889 9.45043C24.9712 9.44773 24.9535 9.44547 24.9358 9.44366C24.918 9.44185 24.9002 9.44048 24.8823 9.43956C24.8645 9.43864 24.8466 9.43816 24.8287 9.43816L24.8277 9.43816C24.8097 9.43816 24.7918 9.43864 24.774 9.43956C24.756 9.44048 24.7382 9.44185 24.7203 9.44366C24.7025 9.44551 24.6847 9.4478 24.667 9.4505C24.6492 9.45323 24.6316 9.45641 24.6141 9.46003C24.5965 9.46366 24.579 9.46772 24.5617 9.47224C24.5443 9.47675 24.5271 9.4817 24.51 9.4871C24.4929 9.49247 24.4759 9.49828 24.4591 9.50454C24.4423 9.51079 24.4257 9.51746 24.4092 9.52453C24.3927 9.53161 24.3764 9.53913 24.3603 9.54702C24.3442 9.55495 24.3284 9.56326 24.3127 9.57197C24.297 9.58069 24.2816 9.58981 24.2664 9.59932C24.2512 9.60882 24.2362 9.6187 24.2215 9.62895C24.2068 9.63924 24.1924 9.64987 24.1782 9.66084C24.164 9.67184 24.1502 9.68319 24.1366 9.69488C24.123 9.70657 24.1097 9.7186 24.0967 9.73098C24.0838 9.74335 24.0711 9.75603 24.0587 9.76905C24.0248 9.80511 23.4033 10.4627 22.5241 11.57C19.3773 5.70587 15.1645 1.45815 14.9726 1.26512C14.9603 1.25285 14.9477 1.24089 14.9349 1.22924C14.922 1.21758 14.9088 1.20625 14.8954 1.19525C14.882 1.18424 14.8683 1.17357 14.8544 1.16323C14.8404 1.1529 14.8263 1.14291 14.8118 1.13327C14.7974 1.12363 14.7828 1.11435 14.7678 1.10543C14.753 1.09651 14.7379 1.08796 14.7226 1.07978C14.7073 1.0716 14.6918 1.0638 14.6761 1.05638C14.6604 1.04896 14.6445 1.04193 14.6285 1.03529C14.6125 1.02865 14.5963 1.02241 14.5799 1.01656C14.5636 1.01072 14.5471 1.00528 14.5305 1.00024C14.5139 0.995206 14.4972 0.990579 14.4804 0.986363C14.4635 0.982148 14.4466 0.978347 14.4296 0.974961C14.4126 0.971577 14.3955 0.968611 14.3783 0.966064C14.3611 0.963519 14.3439 0.961396 14.3266 0.959696C14.3094 0.957994 14.2921 0.956718 14.2747 0.955868C14.2574 0.955016 14.24 0.95459 14.2227 0.95459C14.2054 0.95459 14.188 0.955016 14.1707 0.955868C14.1533 0.956718 14.136 0.957994 14.1188 0.959696C14.1015 0.961396 14.0843 0.963519 14.0671 0.966064C14.0499 0.968611 14.0328 0.971577 14.0158 0.974961C13.9988 0.978347 13.9819 0.982148 13.965 0.986363C13.9482 0.990579 13.9315 0.995206 13.9149 1.00024C13.8983 1.00528 13.8818 1.01072 13.8655 1.01656C13.8491 1.02241 13.8329 1.02865 13.8169 1.03529C13.8009 1.04193 13.785 1.04896 13.7693 1.05638C13.7536 1.0638 13.7381 1.0716 13.7228 1.07978C13.7075 1.08796 13.6924 1.09651 13.6775 1.10543C13.6626 1.11435 13.648 1.12363 13.6336 1.13327C13.6191 1.14291 13.605 1.1529 13.591 1.16323C13.5771 1.17357 13.5634 1.18424 13.55 1.19525C13.5365 1.20625 13.5234 1.21758 13.5105 1.22924C13.4977 1.24089 13.4851 1.25285 13.4728 1.26512C13.0274 1.71058 2.55603 12.306 2.55603 23.225C2.55603 29.6565 7.79014 34.8894 14.2227 34.8894L24.8287 34.8894C29.5071 34.8894 33.3125 30.925 33.3125 26.0525C33.3125 17.9442 25.9106 10.0968 25.5956 9.76693Z"   fill="#ED4C4C" >
              </path>
              <path d="M22.1805 31.7016L15.6821 31.7016C13.2798 31.7016 11.1459 29.6982 11.0473 27.2439C10.8988 23.5668 13.6511 19.8324 14.9821 18.25C14.9927 18.2372 15.0037 18.2246 15.015 18.2124C15.0263 18.2002 15.0379 18.1884 15.0499 18.1768C15.0619 18.1652 15.0741 18.154 15.0867 18.1431C15.0993 18.1322 15.1121 18.1216 15.1253 18.1115C15.1385 18.1013 15.1519 18.0915 15.1656 18.082C15.1793 18.0725 15.1932 18.0635 15.2074 18.0548C15.2216 18.0461 15.236 18.0378 15.2507 18.0299C15.2654 18.0221 15.2802 18.0146 15.2953 18.0075C15.3103 18.0004 15.3256 17.9938 15.341 17.9875C15.3564 17.9813 15.372 17.9755 15.3878 17.9701C15.4035 17.9648 15.4194 17.9598 15.4354 17.9553C15.4514 17.9508 15.4676 17.9467 15.4838 17.9431C15.5 17.9395 15.5164 17.9363 15.5328 17.9336C15.5492 17.9309 15.5657 17.9286 15.5822 17.9268C15.5987 17.925 15.6153 17.9236 15.6319 17.9228C15.6486 17.9218 15.6652 17.9214 15.6818 17.9214C15.6985 17.9214 15.7151 17.9219 15.7317 17.9228C15.7483 17.9237 15.7649 17.9251 15.7814 17.927C15.798 17.9288 15.8145 17.9311 15.8309 17.9338C15.8473 17.9366 15.8636 17.9398 15.8798 17.9434C15.8961 17.947 15.9122 17.9511 15.9282 17.9557C15.9442 17.9602 15.9601 17.9652 15.9759 17.9706C15.9916 17.976 16.0072 17.9818 16.0226 17.988C16.038 17.9943 16.0532 18.001 16.0683 18.0081C16.0833 18.0152 16.0982 18.0227 16.1128 18.0306C16.1275 18.0385 16.1419 18.0468 16.156 18.0555C16.1702 18.0642 16.1841 18.0733 16.1979 18.0828C16.2115 18.0922 16.2249 18.1021 16.2381 18.1123C16.2512 18.1225 16.2641 18.133 16.2766 18.144C16.2892 18.1549 16.3014 18.1661 16.3134 18.1777C16.3253 18.1893 16.3369 18.2012 16.3482 18.2135C16.3595 18.2257 16.3705 18.2382 16.3811 18.251C17.2805 19.3233 18.8311 21.383 19.6944 23.7418C19.8219 23.5106 19.9547 23.2824 20.0927 23.0572C20.2307 22.8321 20.3738 22.6103 20.522 22.3917C20.6702 22.1731 20.8233 21.9581 20.9813 21.7465C21.1394 21.535 21.3022 21.3272 21.4698 21.1231C21.4804 21.1099 21.4913 21.097 21.5026 21.0843C21.5139 21.0717 21.5255 21.0594 21.5375 21.0475C21.5495 21.0355 21.5618 21.0238 21.5745 21.0125C21.5871 21.0012 21.6 20.9903 21.6132 20.9798C21.6265 20.9692 21.64 20.959 21.6538 20.9492C21.6676 20.9394 21.6817 20.93 21.696 20.9209C21.7104 20.9119 21.7249 20.9033 21.7397 20.8951C21.7545 20.8869 21.7696 20.8791 21.7849 20.8717C21.8001 20.8643 21.8156 20.8574 21.8312 20.8509C21.8468 20.8443 21.8627 20.8383 21.8786 20.8326C21.8946 20.827 21.9107 20.8218 21.927 20.8171C21.9432 20.8124 21.9596 20.8081 21.9761 20.8043C21.9926 20.8005 22.0092 20.7971 22.0259 20.7942C22.0426 20.7914 22.0594 20.7889 22.0762 20.787C22.093 20.785 22.1099 20.7835 22.1268 20.7825C22.1437 20.7815 22.1607 20.781 22.1776 20.7809C22.1945 20.7809 22.2115 20.7813 22.2284 20.7822C22.2453 20.783 22.2621 20.7844 22.279 20.7862C22.2958 20.788 22.3126 20.7903 22.3293 20.7931C22.3461 20.7959 22.3627 20.7991 22.3792 20.8028C22.3957 20.8065 22.4122 20.8106 22.4285 20.8152C22.4448 20.8198 22.4609 20.8249 22.4769 20.8304C22.493 20.8359 22.5088 20.8419 22.5245 20.8483C22.5402 20.8546 22.5557 20.8615 22.571 20.8687C22.5863 20.876 22.6014 20.8837 22.6162 20.8918C22.6311 20.8999 22.6458 20.9084 22.6602 20.9173C22.6746 20.9262 22.6887 20.9356 22.7026 20.9453C22.7165 20.955 22.7301 20.9651 22.7434 20.9755C22.7567 20.986 22.7697 20.9968 22.7824 21.008C22.7951 21.0192 22.8076 21.0308 22.8196 21.0426C22.8317 21.0545 22.8434 21.0667 22.8548 21.0793C22.8662 21.0918 22.8772 21.1047 22.8879 21.1178C23.9973 22.4722 26.0113 25.3369 25.8883 28.155C25.8024 30.1086 24.0927 31.7016 22.1805 31.7016Z"   fill="#E33030" >
              </path>
            </svg>
          </p>

          <p class="content" @click="viewPost(item.id)">
            {{ item.content }}
          </p>
          <span class="view" @click="viewPost(item.id)">查看全部 ></span>
          <span class="viewed">浏览量：{{item.pageview}}</span>
        </div>

      </div>

      <!-- 帖子详情 -->
      <div class="post_detail" v-show="post_detail">
        <!-- 头部用户信息 -->
        <div class="user">
          <img :src="$imageBaseUrl+postDetail.icon" alt="" @click="toChat(postDetail.userId)">
          <p class="username">{{postDetail.name}}</p>
          <p class="signature">与宠相伴，才是我们今生最好的故事</p>
        </div>

        <!-- 帖子内容 -->
        <div class="post_content">
          <p class="title">
            {{postDetail.title}}
          </p>
          <pre class="content" v-html="postDetail.content"></pre>
          <div class="img_wrapper" v-if="postDetail.imageUrl">
            <img :src="$imageBaseUrl+postDetail.imageUrl" alt="">
          </div>
          <span class="time">
            发布于 {{postDetail.createTime}}
          </span>
          <span class="viewed"><i class="el-icon-view"></i>{{postDetail.pageview}}</span>
          <span class="comment_count"><i class="el-icon-chat-line-round"></i>{{postDetail.commentCount}}</span>
        </div>

        <!-- 帖子评论 -->
        <div class="comment_content">
          <p class="title">
            全部评论 ( {{ postComment.length }} )
          </p>
          <button class="send_comment" @click="dialogVisible=true">点击评论</button>
          <div class="comment_box" v-for="item in postComment" :key="item.id">
            <div class="userinfo">
              <img :src="$imageBaseUrl+item.userInfo" alt="">
              <span class="username">{{item.username}}</span>
            </div>
            <p class="comment">
              {{item.text}}
            </p>
            <span class="time">{{item.createTime}}</span>
          </div>
        </div>
      </div>
    </section>

    <!-- 右边 -->
    <section class="right" v-show="!post_detail">
      <!-- 用户头像一栏 -->
      <div class="personal">
        <img :src="$store.state.user.userInfo.icon?$imageBaseUrl+$store.state.user.userInfo.icon:'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png'" alt="">
        <div class="text">
          <p>你好！{{ $store.state.user.userInfo.username }}</p>
          <p>欢迎来到宠物论坛</p>
        </div>
        <!-- <button class="to_login">去登录</button> -->
        <button class="to_post" v-show="forumMode" @click="postMode=!postMode">{{!postMode?'问答专区':'我要发贴'}}</button>
      </div>

      <!-- 用户账户相关信息 -->
      <div class="personalmsg" v-show="!forumMode">
        <div>
          <p>提问</p>
          <p class="count">{{this.personalInfo?.question??'--'}}</p>
        </div>
        <div>
          <p>文章</p>
          <p class="count">{{this.personalInfo?.forumnum??'--'}}</p>
        </div>
        <div>
          <p>评论</p>
          <p class="count">{{this.personalInfo?.commentnum??'--'}}</p>
        </div>
        <div>
          <p>浏览</p>
          <p class="count">{{this.personalInfo?.viewed??'--'}}</p>
        </div>
      </div>

      <!-- 问答专区 -->
      <div class="ask_bottom" v-show="!postMode">
        <div class="item_title">
          <img src="../assets/icon_msg_2.svg" alt="">
          问答专区
        </div>

        <div class="ask_container">
          <span class="sort">单选题</span>
          <!-- 题目 -->
          <p class="question">{{ questionsList[questionIndex].title }}</p>

          <!-- 四个选项 -->
          <div class="choose"
          @click="handleChoose('A')"
          :class="{
            choose_right:questionsList[questionIndex].hasOwnProperty('userChoose') && questionsList[questionIndex].answer==='A',
            choose_wrong:questionsList[questionIndex].hasOwnProperty('userChoose') && questionsList[questionIndex].userChoose==='A' && questionsList[questionIndex].answer!==questionsList[questionIndex].userChoose
          }">
            A.{{ questionsList[questionIndex].A }}
          </div>

          <div class="choose"
          @click="handleChoose('B')"
          :class="{
              choose_right:questionsList[questionIndex].hasOwnProperty('userChoose') && questionsList[questionIndex].answer==='B',
              choose_wrong:questionsList[questionIndex].hasOwnProperty('userChoose') && questionsList[questionIndex].userChoose==='B' && questionsList[questionIndex].answer!==questionsList[questionIndex].userChoose
            }">
            B.{{ questionsList[questionIndex].B }}
          </div>

          <div class="choose"
           @click="handleChoose('C')"
            :class="{
              choose_right:questionsList[questionIndex].hasOwnProperty('userChoose') && questionsList[questionIndex].answer==='C',
              choose_wrong:questionsList[questionIndex].hasOwnProperty('userChoose') && questionsList[questionIndex].userChoose==='C' && questionsList[questionIndex].answer!==questionsList[questionIndex].userChoose
            }"
           >
           C.{{ questionsList[questionIndex].C }}
          </div>

          <div class="choose"
           @click="handleChoose('D')"
           :class="{
              choose_right:questionsList[questionIndex].hasOwnProperty('userChoose') && questionsList[questionIndex].answer==='D',
              choose_wrong:questionsList[questionIndex].hasOwnProperty('userChoose') && questionsList[questionIndex].userChoose==='D' && questionsList[questionIndex].answer!==$store.state.forum.questionsList[questionIndex].userChoose
            }">
            D.{{ questionsList[questionIndex].D }}
          </div>

          <!-- 按钮 -->
          <button class="last" @click="handleTitle('last')">上一题</button>
          <button class="next" @click="handleTitle('next')">下一题</button>

          <!-- 信息 -->
          <div class="result">
            <span class="right_answer">正确答案：{{ questionsList[questionIndex].hasOwnProperty('userChoose')?questionsList[questionIndex].answer:'' }}</span>
            <span class="user_choose">已选答案：{{ questionsList[questionIndex].userChoose }}</span>
          </div>
        </div>
        <div class="bottom_img">
            <img src="https://img.js.design/assets/img/67ad9da0791458ad14dfd08d.png#6a4ba2d9581f62df5b85ee94eabec792" alt="">
          </div>
      </div>

      <!-- 发帖 -->
      <div class="post" v-show="postMode">
        <p class="title">发布图文</p>
        <input type="text" placeholder="点击添加标题" v-model="postTitle">
        <textarea name="" id="" placeholder="点击添加正文" v-model="postContent"></textarea>
        <div class="label">
          <span @click="postTitle+='#宠物健康 '">#宠物健康</span>
          <span @click="postTitle+='#新手养宠大全 '">#新手养宠大全</span>
        </div>
        <div class="pictures">
          <el-upload
            action='http://localhost:8081/head/img'
            :headers="{'pet':$store.state.user.userInfo.token}"
            list-type="picture-card"
            :on-success="handleSuccess"
            :on-progress="handleUploading"
            :on-error="handleError"
            :file-list="fileList">
            <!-- file-list 是为了两个 el-upload 的文件预览显示能够同步，
            与宠物图片引用逻辑一致：单张图片
            -->
            <i class="el-icon-plus"></i>
          </el-upload>
        </div>
        <button class="to_send" @click="handlePost()">点击发布</button>

      </div>
    </section>

    <!-- 推荐/热门帖子 -->
    <section class="hotpost right" v-show="post_detail">
      <!-- 标题 -->
      <div class="post_title">
        <p class="title">
          <span class="sign">#</span>
          {{hotpost[0]?.title}}
          <span class="hot">爆</span>
        </p>
        <p class="ans">{{hotpost[0]?.commentCount}}条回答</p>
        <p class="viewed">{{hotpost[0]?.pageview}}次浏览</p>
      </div>

      <!-- 推荐帖子 -->
      <div class="post_container">
        <div class="userinfo">
          <img :src="$imageBaseUrl+hotpost[0]?.icon??'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png'" alt="">
          <div class="info">
            <p class="username">
              {{hotpost[0]?.name}}
              <i class="el-icon-check"></i>
            </p>
            <p class="subname">官方认证问答专区首席运营官</p>
          </div>

        </div>
        <div class="content">
          <p class="text" @click="viewPost(hotpost[0]?.id)">
            <span class="totop">置顶</span>
            {{hotpost[0]?.title}}<br>
            {{ hotpost[0]?.content }}
          </p>
          <span class="viewed">
            <i class="el-icon-view"></i>
            {{hotpost[0]?.pageview}}
          </span>
          <span class="comment_count">
            <i class="el-icon-chat-line-round"></i>
            {{hotpost[0]?.commentCount}}
          </span>
        </div>
        <div class="comments">
          <div class="comment" v-for="(comment,index) in hotpost[0]?.comment" :key="index">
            <p>
              <span class="username">{{comment.username}}</span>
              ：{{ comment.text }}
            </p>
          </div>
        </div>

      </div>

      <!-- 论坛主页返回出口 -->
      <div class="advertise">
        <p class="title_p">养宠人互动专区上线</p>
        <p class="subtitle">推荐必看！一起交流养宠经验</p>
        <button @click="forumMode=false; post_detail=false;postMode=false">返回论坛首页</button>
        <img src="https://img.js.design/assets/img/67a372b3b269b2492debfe6b.png#0b9e6a261c768788f6408359727b3e2a" alt="">
      </div>
     </section>

    <!-- 弹窗——发表评论 -->
    <el-dialog
     title="发表评论"
      :visible.sync="dialogVisible"
      width="30%"
      top="10vh">
      请输入评论：
      <el-input type="textarea" v-model="comment"></el-input>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible=false">取 消</el-button>
        <el-button type="primary" @click="submitComment">发表评论</el-button>
      </div>
    </el-dialog>
  </el-main>
</template>

<script>
import { mapState } from 'vuex'
import { publishPost, getPostsList, getPostInfo, getPostComment, getPersonalInfo, postComment } from '@/api/forum.js'
export default {
  data () {
    return {
      forumMode: false, // 当值为true时，论坛列表;为false时，为论坛主页
      postMode: false, // 当值为true时，为发帖模式;为false时，为问答模式
      post_detail: false, // 进入帖子详情
      questionIndex: 0, // 记录用户做到哪一题
      postTitle: '', // 发帖 标题
      postContent: '', // 发帖 内容
      postImageUrl: '', // 上传图片后，后端返回来的图片地址，用于发帖时的请求参数
      postsList: [], // 帖子列表
      hotpost: [], // 热门帖子
      postDetail: [], // 帖子详情
      postComment: [], // 帖子评论
      personalInfo: [], // 个人相关信息
      fileList: [], // upload 组件的文件预览列表
      dialogVisible: false, // 发表评论的弹窗
      comment: '', // 用户输入的评论
      postId: 0 // 当前用户查看的帖子的ID
    }
  },
  methods: {
    // 查看帖子详情
    async viewPost (id) {
      this.postId = id
      this.post_detail = true
      // 请求帖子内容
      try {
        const res = await getPostInfo(id)
        this.postDetail = res.data
        this.postDetail.icon = this.postDetail.icon.replace(/^\[|\]$/g, '').trim()
        if (this.postDetail.imageUrl) {
          this.postDetail.imageUrl = this.postDetail.imageUrl.replace(/^\[|\]$/g, '').trim()
        }
      } catch (error) {
        console.log(error)
      }

      // 请求帖子评论
      try {
        const res = await getPostComment(id)
        this.postComment = res.data
        this.postComment.forEach(item => {
          item.userInfo = item.userInfo.replace(/^\[|\]$/g, '').trim()
        })
      } catch (error) {
        console.log(error)
      }
    },
    // 切换题目
    handleTitle (to) {
      if (to === 'last') {
        // 上一题
        if (this.questionIndex > 0) this.questionIndex--
      } else if (to === 'next') {
        // 下一题
        if (this.questionIndex < this.questionsList.length - 1) {
          this.questionIndex++
        }
      }
    },
    // 用户点击选项
    handleChoose (userChoose) {
      this.$store.commit('forum/setChoose', { index: this.questionIndex, value: userChoose })
      // 强制更新，vuex内容改变后但是页面却没有更新，需切换题目(重新渲染)才能正确，可能性能不好，但尚未找到更好的解决方法
      this.$forceUpdate()
    },
    // 发帖
    async handlePost () {
      if (!this.postComment || !this.postTitle) {
        this.$message.error('请输入内容！')
        return
      }
      if (!this.postImageUrl) {
        this.$message('发帖中，该贴无图片')
      } else {
        this.$message('发帖中，该贴包含图片')
      }

      // 发送请求
      try {
        const res = await publishPost(this.postContent, this.postTitle, this.postImageUrl)
        this.postImageUrl = '' // 清空图片
        this.fileList = []// 清空图片
        this.$message({
          type: 'success',
          message: res.data
        })
      } catch (error) {
        console.log(error)
      }
    },
    // 进入论坛，获取信息
    async enterForum () {
      // 页面切换
      this.forumMode = true

      // 发送请求
      try {
        const res = await getPostsList()
        this.postsList = res.data
        this.postsList.forEach(post => {
          post.icon = post.icon?.replace(/^\[|\]$/g, '').trim()
        })

        // 获取热门帖子
        this.hotpost = this.postsList.filter(post => post.top === 1)
        console.log(1, this.hotpost)
        const comment = await getPostComment(this.hotpost[0].id)
        this.hotpost[0].comment = comment.data

        console.log(this.hotpost)
      } catch (error) {
        console.log(error)
      }
    },
    // 用户点击头像跳转到消息页面
    toChat (userId) {
      this.$router.push(`message/${userId}`)
    },
    // 文件上传成功的钩子
    handleSuccess (res, file) {
      if (res.code === 200) {
        // code为200，成功
        // 与宠物图片引用逻辑一致：保留单张图片URL（去除数组括号）
        this.postImageUrl = res.data.replace(/^\[|\]$/g, '').trim()

        // 同步两个 el-upload 的文件预览显示
        // 不加延时器会有报错
        setTimeout(() => {
          const newFile = {
            name: file.name,
            url: this.$imageBaseUrl + this.postImageUrl,
            status: 'success',
            uid: file.uid
          }
          this.fileList = [newFile]
        }, 2000)

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
    },
    // 用户点击发表评论
    async submitComment () {
      try {
        const res = await postComment(this.postId, this.$store.state.user.userInfo.userId, this.comment)
        this.$message({
          message: res.data,
          type: 'success'
        })
        this.dialogVisible = false
        this.comment = ''
        this.viewPost(this.postId)
      } catch (error) {
        console.log(error)
      }
    }
  },
  computed: {
    ...mapState('forum', ['questionsList', 'resultPost'])
  },
  async created () {
    try {
      const res = await getPersonalInfo()
      this.personalInfo = res.data
      console.log(this.personalInfo)
    } catch (error) {
      console.log(error)
    }
  },
  watch: {
    // 用户搜索
    resultPost () {
      this.postsList = [...this.resultPost]
      this.postsList.forEach(post => {
        post.icon = post.icon.replace(/^\[|\]$/g, '').trim()
      })

      // 页面切换
      this.forumMode = true
      this.post_detail = false
    }
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

  .left,.right{
    width: 47%;
    height: 88vh;
    float: left;
    margin: 2vh 0 0 11%;
  }
  .right{
    width: 29%;
    margin: 2vh 0 0 2%;
  }
  .lettle_margin{
    margin: 2vh 0 0 2%;

  }
  .title{
    height: 7vh;
    width: 75%;
    line-height: 7vh;
    margin: 0 auto;
    background: rgba(255, 255, 255, 1);
    padding-left: 3%;
    border-radius: 14.52px;
  }
  .title>p{
    font-size: 1.414vw;
    font-weight: 400;
    color: rgba(0, 0, 0, 1);
    position: relative;
    text-indent: 2%;
  }
  .title>p>span{
    font-size: 1.01vw;
    font-weight: 400;
    color: rgba(166, 166, 166, 1);
    text-align: left;
    vertical-align: top;
    padding-left: 2%;
  }
  .title>p>img{
    width: 1.757vw;
    height: 1.757vw;
    position: absolute;
    left: -1.5%;
    top: 23%;
  }
  .left>.title{
    height: 7vh;
    width: 97%;
    line-height: 7vh;
    margin: 2% auto;
    background: rgba(255, 255, 255, 1);
    padding-left: 3%;
    border-radius: 14.52px;
  }
  .left>.title>p{
    text-indent: 4%;
  }

  /* 左边 */
  .advertise{
    width: 100%;
    height: 31vh;
    margin-bottom: 2vh;
    border-radius: 30px;
    background: rgba(255, 245, 230, 1);
    position: relative;
  }
  .advertise>.title_p{
    font-size: 2.2726vw;
    font-weight: 900;
    line-height: 65.16px;
    color: rgba(56, 56, 56, 1);
    position: absolute;
    top: 14%;
    left: 10%;
  }
  .advertise>.subtitle{
    font-size: 1.515vw;
    font-weight: 400;
    line-height: 43.44px;
    color: rgba(56, 56, 56, 1);
    position: absolute;
    top: 38%;
    left: 10%;
  }
  .advertise>button{
    width: 31%;
    height: 23%;
    background: rgba(247, 149, 37, 1);
    border-radius: 12.93px;
    font-size: 1.313vw;
    font-weight: 900;
    color: rgba(255, 255, 255, 1);
    text-align: center;
    border: none;
    position: absolute;
    top: 63%;
    left: 18%;
    cursor: pointer;
  }
  .advertise>img{
    width: 27%;
    position: absolute;
    top: 12%;
    left: 63%;
    border-radius: 30px;
  }

  .post{
    width: 100%;
    height: 52vh;
    border-radius: 12.93px;
    background: white;
    position: relative;
  }
  .post>.btn>button{
    width: 20%;
    font-size: 1.313vw;
    font-weight: 900;
    line-height: 200%;
    color: rgba(255, 255, 255, 1);
    text-align: center;
    border: none;
    top: 1vh;
    cursor: pointer;
    border-radius: 10.34px;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }
  .post>.btn>button>svg{
    width:15% ;
    position: absolute;
    left: 5%;
    top: -7%;
  }
  .post>.btn>.title{
    font-size: 1.414vw;
    font-weight: 400;
    color: rgba(0, 0, 0, 1);
    position: absolute;
    top: 3%;
    left: 3%;
  }
  .post>.btn>.title>svg{
    width: 1.414vw;
  }
  .post>.btn .upload{
    width: 20%;
    font-size: 1.313vw;
    line-height: 200%;
    text-align: center;
    border: none;
    cursor: pointer;
    border-radius: 10.34px;
    color: rgba(56, 56, 56, 1);
    background: rgba(100, 162, 232, 0.27);
    font-weight: normal;
    position: absolute;
    top:5%;
    right:30%;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }
  .post>.btn>:nth-child(3){
    color: rgba(255, 255, 255, 1);
    font-weight: normal;
    position: absolute;
    top:5%;
    right:5%;
    background: rgba(247, 149, 37, 1);
  }
  .post>input,.post>textarea,.post>.label{
    width: 92%;
    position: absolute;
    left: 3%;
  }
  .post>input{
    top: 22%;
    height: 10%;
    text-indent: 15px;
    font-size: 1.2121vw;
    color: rgba(153, 153, 153, 1);
    border-radius: 12.93px;
    background: rgba(247, 247, 247, 1);
    outline: none;
    border: none;
    padding: 1.5% 0;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }
  .post>textarea{
    top: 43%;
    height: 30%;
    text-indent: 15px;
    padding: 10px 0;
    font-size: 1.2121vw;
    color: rgba(153, 153, 153, 1);
    border-radius: 12.93px;
    background: rgba(247, 247, 247, 1);
    outline: none;
    border: none;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }
  .post>.label{
    top:85%;
  }
  .post>.label>span{
    background: rgba(250, 240, 225, 0.8);
    margin-right: 2%;
    padding: 3px 5px;
    cursor: pointer;
    font-size: 1.01vw;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }

  .left>.posts_container{
    background: white;
    width: 100%;
    height: 81vh;
    overflow-y: auto;
    border-radius: 12.93px;
  }
  .left>.posts_container>.post_box{
    border-bottom: 1px solid white;
    width: 100%;
    height: 33.2%;
    position: relative;
  }
  .left>.posts_container>.post_box>img{
    border-radius: 50%;
    position: absolute;
    top: 14%;
    left: 2%;
    width: 2.69vw;
    height: 2.69vw;
  }
  .left>.posts_container>.post_box>.post_title{
    position: absolute;
    top: 17%;
    left: 12%;
    color: rgba(56, 56, 56, 1);
    font-weight: 900;
    font-size: 1.616vw;
    cursor: pointer;
    max-width: 72%;
    white-space: nowrap; /* 禁止文本换行 */
    overflow: hidden; /* 隐藏超出容器的部分 */
    text-overflow: ellipsis; /* 用省略号显示被截断的文本 */
  }
  .left>.posts_container>.post_box>.post_title>svg{
    height: 25px;
  }
  .left>.posts_container>.post_box>.content{
    position: absolute;
    left: 12%;
    top: 36%;
    font-weight: 400;
    color: rgba(128, 128, 128, 1);
    font-size: 1.2121vw;
    line-height: 150%;
    cursor: pointer;
    /* 显示限制 */
    max-width:72% ;
    max-height: 45%;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .left>.posts_container>.post_box>.view{
    position: absolute;
    top: 21%;
    right: 2%;
    font-size: 1.2625vw;
    font-weight: 400;
    color: rgba(128, 128, 128, 1);
    cursor: pointer;
  }
  .left>.posts_container>.post_box>.view:hover{
    color: #FFC300;
  }
  .left>.posts_container>.post_box>.viewed{
    position: absolute;
    bottom: 10%;
    right: 2%;
    font-size: 1.2121vw;
    font-weight: 400;
    color: rgba(128, 128, 128, 1);
  }
  .left>.post_detail{
    width: 100%;
    height: 90%;
    background: white;
    position: relative;
  }
  .left>.post_detail>.user{
    position: relative;
    width: 100%;
    height: 10%;
  }
  .left>.post_detail>.user>img{
    border-radius: 50%;
    width: 3.04vw;
    height: 3.04vw;
    position: absolute;
    top: 7%;
    left: 3%;
    cursor: pointer;
  }
  .left>.post_detail>.user>.username{
    position: absolute;
    left: 13%;
    top: 5%;
    color: rgba(56, 56, 56, 1);
    font-size: 1.414vw;
    font-weight: 500;
  }
  .left>.post_detail>.user>.signature{
    position: absolute;
    left: 13%;
    top: 55%;
    color: rgba(128, 128, 128, 1);
    font-size: 1.1617vw;
    font-weight: 500;
  }
  .left>.post_detail>.post_content{
    width: 56%;
    height: 88%;
    position: absolute;
    top: 10%;
    left: 2%;
    background: rgba(250, 240, 225, 0.25);
  }
  .left>.post_detail>.post_content>.title{
    width: 98%;
    font-size: 2.02vw;
    font-weight: 900;
    padding: 2% 0 0 2%;
    white-space: nowrap; /* 禁止文本换行 */
    overflow: hidden; /* 隐藏超出容器的部分 */
    text-overflow: ellipsis; /* 用省略号显示被截断的文本 */
    background: none;
  }
  .left>.post_detail>.post_content>.content{
    width: 94%;
    max-height: 45%;
    font-size: 1.2625vw;
    padding: 0% 3% 0 3%;
    line-height: 120%;
    overflow-y: auto;
    white-space: pre-wrap;
  }
  ::v-deep .left>.post_detail>.post_content>.content img{
    width: 100%;
  }
  .left>.post_detail>.post_content>.img_wrapper{
    width: 94%;
    margin: 2% 3% 0 3%;
    display: flex;
    align-items: flex-start;
    justify-content: flex-start;
  }
  .left>.post_detail>.post_content>.img_wrapper>img{
    max-width: 40%;
    max-height: 22vh;
    object-fit: cover;
    border-radius: 8px;
  }
  .left>.post_detail>.post_content>.time{
    font-size: 1.11vw;
    position: absolute;
    bottom: 2%;
    left: 3%;
    color: rgba(166, 166, 166, 1);
  }
  .left>.post_detail>.post_content>.viewed{
    font-size: 1.11vw;
    position: absolute;
    bottom: 2%;
    right: 20%;
    color: rgba(166, 166, 166, 1);
  }
  .left>.post_detail>.post_content>.comment_count{
    font-size: 1.11vw;
    position: absolute;
    bottom: 2%;
    right: 3%;
    color: rgba(166, 166, 166, 1);
  }

  .left>.post_detail>.comment_content{
    overflow-y: auto; /* 垂直滚动条 */
    width: 38%;
    height: 88%;
    position: absolute;
    top: 10%;
    left: 60%;
    background: rgba(248, 250, 251, 1);
  }
  .left>.post_detail>.comment_content>.title{
    position: absolute;
    top: 2%;
    left: 3%;
    font-size: 1.2625vw;
    font-weight: 500;
    background: none;
    line-height: 150%;
  }
  .left>.post_detail>.comment_content>.send_comment{
    position: absolute;
    top: 2%;
    right: 5%;
    width: 26%;
    height: 5%;
    background: #cbcaca;
    text-align: center;
    border: none;
    cursor: pointer;
    border-radius: 8px;
    color: #333;
  }
  .left>.post_detail>.comment_content>.comment_box{
    width: 100%;
    position: relative;
    top: 10%;
    display: flex;
    flex-direction: column;
    border-bottom: 1px solid rgba(166, 166, 166, 0.44);
    padding-bottom: 3%;
  }
  .left>.post_detail>.comment_content>.comment_box>.userinfo{
    display: flex;
    margin-left: 3%;
  }
  .left>.post_detail>.comment_content>.comment_box>.userinfo>img{
    border-radius: 50%;
    width: 2.03vw;
    height: 2.03vw;
    position: absolute;
    top: 5px;
    border: 1px solid;
    cursor: pointer;
  }
  .left>.post_detail>.comment_content>.comment_box>.userinfo>.username{
    font-size: 1.01vw;
    margin: 5% 0 0 18%;
    color: rgba(128, 128, 128, 1);
  }
  .left>.post_detail>.comment_content>.comment_box>.comment{
    margin: 5% 0 0 20%;
    font-size: 1.1617vw;
    color: rgba(56, 56, 56, 1);
    font-weight: 500;
  }
  .left>.post_detail>.comment_content>.comment_box>.time{
    font-size: 1.01vw;
    margin: 10px 0 0 20%;
    color: rgba(128, 128, 128, 1);
  }

  /* 右边 */
  .right>.personal{
    width: 100%;
    height: 19%;
    background: rgba(255, 255, 255, 1);
    position: relative;
    border-radius: 12.93px;
  }
  .right>.personal::after {
    content: '';
    display: block;
    width: 100%;
    height: 30%;
    position: absolute;
    bottom: -22%;
    background: white;
  }
  .right>.personal>img{
    width: 3.6vw;
    height: 3.6vw;
    position: absolute;
    left: 3%;
    top: 31%;
    border: 1px solid;
    border-radius: 50%;
  }
  .right>.personal>.text{
    position: absolute;
    top: 29%;
    left: 18%;
  }
  .right>.personal>.text>:nth-child(1){
    font-size: 1.616vw;
    font-weight: bold;
    margin-bottom: 10px;
  }
  .right>.personal>.text>:nth-child(2){
    color: rgba(128, 128, 128, 1);
    font-size: 1.414vw;
  }
  .right>.personal>button{
    font-size: 16px;
    background: rgba(204, 204, 204, 0.3);
    color: rgba(255, 141, 26, 1);
    border: none;
    width: 22%;
    height: 29%;
    position: absolute;
    left: 70%;
    top: 35%;
    cursor: pointer;
    border-radius: 10.34px;
  }
  .right>.personal>.to_post{
    color: white;
    background: rgba(247, 149, 37, 1);
    font-weight: bold;
    font-size: 1.414vw;
    left: 4%;
    cursor: pointer;
    top: 86%;
    width: 90%;
    z-index: 1;
  }

  .right>.personalmsg{
    width: 100%;
    height: 16%;
    background: rgba(255, 255, 255, 1);
    position: relative;

  }
  .right>.personalmsg>div{
    position: absolute;
    top: 8%;
    color: rgba(128, 128, 128, 1);
    font-size: 1.414vw;
    text-align: center;
  }
  .right>.personalmsg>:nth-child(1){
    left: 15%;
  }
  .right>.personalmsg>:nth-child(2){
    left: 35%;
  }
  .right>.personalmsg>:nth-child(3){
    left: 55%;
  }
  .right>.personalmsg>:nth-child(4){
    left: 75%;
  }

  /* ask_bottom状态 */
  .right>.ask_bottom{
    width: 100%;
    height: 59%;
    margin-top: 22px;
    background: rgba(255, 255, 255, 1);
    border-radius: 12.93px;
    display: flex;
    flex-direction: column;
    position: relative;
  }
  .right>.ask_bottom>.item_title{
    height: 13%;
    width: 35%;
    color: black;
    margin-left: 20px;
    font-size: 1.414vw;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .right>.ask_bottom>.item_title>img{
    width: 1.4vw;
    margin: 3% 5% 0 -10%;
  }
  .right>.ask_bottom>.ask_container{
    width: 90%;
    min-height: 72%;
    max-height: 72%;
    border-radius: 12.93px;
    background: rgba(255, 245, 230, 0.3);
    box-shadow: 0px 2.59px 10.34px  rgba(0, 0, 0, 0.25);
    position: relative;
    left: 5%;
    top: 1%;
    padding: 5%;
    box-sizing: border-box;
  }
  .right>.ask_bottom>.ask_container>.sort{
    border: 2.59px solid rgba(255, 141, 26, 1);
    color: rgba(255, 141, 26, 1);
    padding: 0% 1.5%;
    font-size: 0.75vw;
  }
  .right>.ask_bottom>.ask_container>.question{
    width: 100%;
    max-height: 23%;
    overflow: hidden;
    margin-top:3% ;
    margin-bottom: 3%;
    color: rgba(56, 56, 56, 1);
    font-size: 1.01vw;
  }
  .right>.ask_bottom>.ask_container>.choose{
    width: 60%;
    height: 10%;
    margin-top: 3%;
    line-height: 150%;
    padding-left: 2%;
    cursor: pointer;
    color: rgba(153, 153, 153, 1);
    background: rgba(166, 166, 166, 0.23);
    font-size: 1.01vw;
  }
  .right>.ask_bottom>.ask_container>.choose_wrong{
    background: rgba(255, 87, 51, 0.15);
    color: rgba(255, 87, 51, 1);
    position: relative;
  }
  .right>.ask_bottom>.ask_container>.choose_wrong::after{
    content: '×';
    position: absolute;
    right: 2%;
  }
  .right>.ask_bottom>.ask_container>.choose_right{
    background: rgba(255, 141, 26, 0.15);
    color: rgba(255, 141, 26, 1);
    position: relative;
  }
  .right>.ask_bottom>.ask_container>.choose_right::after{
    content: '√';
    position: absolute;
    right: 2%;
  }
  .right>.ask_bottom>.ask_container>.result{
    width: 100%;
    display: flex;
    gap: 20%;
    color: rgba(56, 56, 56, 1);
    position: absolute;
    bottom: 3%;
    font-size: 1.01vw;
  }
  .right>.ask_bottom>.ask_container>button{
    width: 21%;
    height: 11%;
    position: absolute;
    right: 5%;
    bottom: 30%;
    border-radius: 25.86px;
    background: rgba(255, 141, 26, 1);
    color: rgba(255, 255, 255, 1);
    border: none;
    cursor: pointer;
    font-size: 0.75vw;
  }
  .right>.ask_bottom>.ask_container>.next{
    bottom: 15%;
  }
  .right>.ask_bottom>.bottom_img{
    width: 100%;
    height: 8%;
    position: absolute;
    bottom: 0%;
    border-radius: 0px 0px, 12.93px, 12.93px;
    background: linear-gradient(180deg, rgba(255, 141, 26, 0.1) 0%, rgba(204, 204, 204, 0) 100%);
  }
  .right>.ask_bottom>.bottom_img>img{
    width: 30%;
    position: absolute;
    right: 6%;
    bottom: -85%;
  }

  .right>.post{
    border: none;
    width: 100%;
    min-height: 73%;
    height: auto;
    background: white;
    border-radius: 0;
    padding-top: 20px;
    border-radius: 12.93px;
  }
  .right>.post *{
    position: static;
  }
  .right>.post>.title{
    font-size: 1.414vw;
    font-weight: bold;
    margin-top: auto;
    margin: 0;
    padding-left: 5%;
  }
  .right>.post>button{
    width: 20%;
    font-size: 1.414vw;
    font-weight: 500;
    line-height: 200%;
    text-align: center;
    border: none;
    cursor: pointer;
  }
  .right>.post>.to_send{
    width: 90%;
    border-radius: 12.93px;
    background: rgba(247, 247, 247, 1);
    color: rgba(247, 149, 37, 1);
    margin-left: 3%;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }
  .right>.post>.to_add{
    background: rgba(100, 162, 232, 0.27);
    color: black;
    cursor:default ;
  }
  .right>.post>button>svg{
    width:15% ;
    position: absolute;
  }
  .right>.post>.pictures{
    width: 94%;
    margin-left: 3%;
    margin-bottom: 3%;
  }
  ::v-deep .pictures .el-upload--picture-card{
    line-height: 100px;
    width: 100px;
    height: 100px;
  }
  ::v-deep .pictures .el-upload-list--picture-card .el-upload-list__item{
    width: 100px;
    height: 100px;
  }
  .right>.post>input,.right>.post>textarea,.post>.label{
    width: 92%;
    margin-left: 3%;
    margin-bottom: 5%;
  }
  .right>.post>input{
    height: 5.9vh;
    text-indent: 15px;
    font-size: 1.2121vw;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }
  .right>.post>textarea{
    height: 12.2vh;
    text-indent: 15px;
    padding: 10px 0;
    font-size: 1.2121vw;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }
  .right>.post>.label>span{
    font-size: 1.01vw;
    background: rgba(250, 240, 225, 0.8);
    margin-right: 2%;
    padding: 3px 5px;
    cursor: pointer;
    box-shadow: 0px 2.59px 5.17px  rgba(0, 0, 0, 0.25);
  }

  .hotpost{
    background: rgba(204, 204, 204, 0);
    width: 47%;
    margin: 2vh 0 0 2%;
  }
  .hotpost>.post_title{
    width: 100%;
    height: 12%;
    border-radius: 30px;
    background: rgba(255, 245, 230, 1);
    position: relative;
  }
  .hotpost>.post_title>.title{
    color: rgba(56, 56, 56, 1);
    font-size: 1.767vw;
    font-weight: 400;
    position: absolute;
    top: 7%;
    left: 3%;
    background: none;
    line-height: 150%;
  }
  .hotpost>.post_title>.title>.sign{
    background: rgba(255, 195, 0, 0.47);
    padding: 0 10px;
    font-size: 2.525vw;
  }
  .hotpost>.post_title>.title>.hot{
    background: rgba(212, 48, 48, 1);
    color: white;
    padding: 2px 8px;
    font-size: 1.616vw;
  }
  .hotpost>.post_title>.ans{
    position: absolute;
    bottom: 5%;
    left: 5%;
    color: rgba(128, 128, 128, 1);
    font-size: 1.515vw;
  }
  .hotpost>.post_title>.viewed{
    position: absolute;
    bottom: 5%;
    left: 25%;
    color: rgba(128, 128, 128, 1);
    font-size: 1.515vw;
  }

  .hotpost>.post_container{
    width: 100%;
    height: 41%;
    background: white;
    margin-top: 2%;
  }
  .hotpost>.post_container>.userinfo{
    width: 100%;
    height: 20%;
    display: flex;
    align-items: center;
  }
  .hotpost>.post_container>.userinfo>img{
    width: 3.55vw;
    height: 3.55vw;
    margin: 0.5% 0 0 3%;
    border-radius: 50%;
  }
  .hotpost>.post_container>.userinfo>.info{
    margin-left: 2%;
  }
  .hotpost>.post_container>.userinfo>.info>.username{
    font-size: 1.515vw;
    font-weight: 900;
    color: rgba(56, 56, 56, 1);
    display: flex;
    align-items: center;
    gap: 5%;
  }
  .hotpost>.post_container>.userinfo>.info>.subname{
    font-size: 1.01vw;
    font-weight: 400;
    color: rgba(56, 56, 56, 1);
  }
  .hotpost>.post_container>.userinfo>.info>.username>.el-icon-check{
    background: rgba(100, 162, 232, 1);
    color: white;
    border-radius: 50%;
    width: 25px;
    height: 25px;
    font-size: 25px;
    display: flex;
    justify-content: center;
    align-items: center;
    /* margin-left:2% ; */
  }
  .hotpost>.post_container>.content{
    padding: 1% 3%;
    width: 94%;
    height: 38%;
    position: relative;
  }
  .hotpost>.post_container>.content>.text{
    color: rgba(56, 56, 56, 1);
    font-weight: 600;
    font-size: 1.515vw;
    line-height: 120%;
    width: 100%;
    height: 75%;
    cursor: pointer;
    /* 文本显示限制 */
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .hotpost>.post_container>.content>.text>.totop{
    background: rgba(212, 48, 48, 1);
    color: white;
    font-weight: 400;
    font-size: 1.2625vw;
    padding: 0 20px;
  }
  .hotpost>.post_container>.content>.viewed{
    position: absolute;
    bottom:8%;
    right: 20%;
    font-size: 1.01vw;
  }
  .hotpost>.post_container>.content>.comment_count{
    position: absolute;
    bottom:8%;
    right: 8%;
    font-size: 1.01vw;
  }
  .hotpost>.post_container>.comments{
    width: 94%;
    height: 38%;
    margin: -1% 0 0 3%;
    border-radius: 8.02px;
    background: rgba(204, 204, 204, 0.4);
    padding: 2% 5%;
    box-sizing:border-box ;
    font-size: 1.01vw;
    overflow: hidden;
  }
  .hotpost>.post_container>.comments>.comment{
    color: rgba(56, 56, 56, 1);
    width: 100%;
    margin-bottom: 1%;
    font-size: 1.2625vw;
  }
  .hotpost>.post_container>.comments>.comment>p{
    white-space: nowrap; /* 禁止文本换行 */
    overflow: hidden; /* 隐藏超出容器的部分 */
    text-overflow: ellipsis; /* 用省略号显示被截断的文本 */
  }
  .hotpost>.post_container>.comments>.comment>.username{
    color: black;
  }

  .hotpost>.advertise{
    width: 100%;
    height: 42%;
    margin-bottom: 2vh;
    border-radius: 30px;
    background: rgba(255, 245, 230, 1);
    position: relative;
    margin-top: 2%;
  }
  .hotpost>.advertise>.title_p{
    font-size: 2.2726vw;
    font-weight: 900;
    color: rgba(56, 56, 56, 1);
    position: absolute;
    top: 14%;
    left: 10%;
  }
  .hotpost>.advertise>.subtitle{
    font-size: 1.515vw;
    font-weight: 400;
    color: rgba(56, 56, 56, 1);
    position: absolute;
    top: 35%;
    left: 10%;
  }
  .hotpost>.advertise>button{
    width: 31%;
    height: 18%;
    background: rgba(247, 149, 37, 1);
    font-size: 1.313vw;
    font-weight: 900;
    line-height: 43.44px;
    color: rgba(255, 255, 255, 1);
    text-align: center;
    border: none;
    position: absolute;
    top: 54%;
    left: 18%;
    cursor: pointer;
  }
  .hotpost>.advertise>img{
    width: 34%;
    position: absolute;
    top: 14%;
    left: 62%;
    border-radius: 30px;
  }

  ::v-deep .el-dialog__wrapper .el-dialog{
    border-radius:21px;
  }
  ::v-deep .el-dialog__wrapper .el-textarea__inner{
    height: 25vh;
    margin-top:20px ;
  }
</style>
