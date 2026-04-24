import { searchPost } from '@/api/forum'
export default {
  namespaced: true,
  state: {
    // 论坛问答专区的问题库
    questionsList: [
      {
        id: 1,
        title: '养宠时，当宠物出现以下哪种情况，最需要立即带它去看兽医？',
        A: '偶尔打喷嚏',
        B: '一天没怎么吃东西',
        C: '持续呕吐并伴有腹泻',
        D: '比平时更爱睡觉',
        answer: 'C'
      },
      {
        id: 2,
        title: '小狗刚到家，多久可以带它去打疫苗？',
        A: '1 周内',
        B: '观察 1 - 2 周',
        C: '马上',
        D: '3 个月后',
        answer: 'B'
      },
      {
        id: 3,
        title: '给狗狗洗澡的频率一般为？',
        A: '每天',
        B: '每周 3 - 4 次',
        C: '每月 1 - 2 次',
        D: '每 3 个月 1 次',
        answer: 'C'
      },
      {
        id: 4,
        title: '猫咪的正常体温范围是？',
        A: '36 - 37℃',
        B: '37 - 38℃',
        C: '38 - 39.5℃',
        D: '39.5 - 40.5℃',
        answer: 'C'
      },
      {
        id: 5,
        title: '以下哪种食物不能给狗狗吃？',
        A: '鸡肉',
        B: '胡萝卜',
        C: '巧克力',
        D: '米饭',
        answer: 'C'
      },
      {
        id: 6,
        title: '狗狗换牙期一般在什么阶段？',
        A: '1 - 2 个月',
        B: '3 - 6 个月',
        C: '7 - 9 个月',
        D: '10 - 12 个月',
        answer: 'B'
      },
      {
        id: 7,
        title: '猫咪绝育最佳时间是？',
        A: '3 - 5 个月',
        B: '6 - 8 个月',
        C: '10 - 12 个月',
        D: '1 岁以后',
        answer: 'B'
      },
      {
        id: 8,
        title: '宠物出现口臭，可能是什么原因？',
        A: '刷牙太勤',
        B: '口腔疾病',
        C: '吃太多水果',
        D: '喝水太多',
        answer: 'B'
      },
      {
        id: 9,
        title: '给宠物选择哪种牵引绳最安全？',
        A: '项圈式',
        B: '胸背式',
        C: '链条式',
        D: '伸缩式',
        answer: 'B'
      },
      {
        id: 10,
        title: '哪种宠物玩具最适合磨牙？',
        A: '毛绒玩具',
        B: '橡胶球',
        C: '麻绳玩具',
        D: '硅胶咬胶',
        answer: 'D'
      },
      {
        id: 11,
        title: '宠物长时间流眼泪，可能是？',
        A: '太感动',
        B: '眼部感染',
        C: '困了',
        D: '吃得太少',
        answer: 'B'
      },
      {
        id: 12,
        title: '宠物毛发打结严重，应如何处理？',
        A: '强行撕开',
        B: '用剪刀剪掉',
        C: '用护毛素梳理',
        D: '不管它',
        answer: 'C'
      },
      {
        id: 13,
        title: '狗狗的疫苗一般不包括以下哪种？',
        A: '狂犬病疫苗',
        B: '猫三联疫苗',
        C: '犬瘟热疫苗',
        D: '细小病毒疫苗',
        answer: 'B'
      },
      {
        id: 14,
        title: '给宠物驱虫一般多久进行一次？',
        A: '1 周',
        B: '1 个月',
        C: '3 个月',
        D: '半年',
        answer: 'C'
      },
      {
        id: 15,
        title: '宠物出现频繁抓挠身体，可能是？',
        A: '在撒娇',
        B: '有皮肤病或寄生虫',
        C: '想运动',
        D: '吃饱了撑的',
        answer: 'B'
      },
      {
        id: 16,
        title: '以下哪种宠物用品不是必须的？',
        A: '食盆',
        B: '猫砂盆',
        C: '宠物香水',
        D: '窝',
        answer: 'C'
      },
      {
        id: 17,
        title: '狗狗在室内随地大小便，主人应？',
        A: '打骂惩罚',
        B: '耐心引导训练',
        C: '放任不管',
        D: '关禁闭',
        answer: 'B'
      },
      {
        id: 18,
        title: '猫咪掉毛严重，主人应？',
        A: '天天洗澡',
        B: '喂化毛膏',
        C: '吃消炎药',
        D: '换便宜猫粮',
        answer: 'B'
      },
      {
        id: 19,
        title: '宠物中暑的表现不包括？',
        A: '舌头外伸',
        B: '呼吸急促',
        C: '精神亢奋',
        D: '体温升高',
        answer: 'C'
      },
      {
        id: 20,
        title: '新养宠物，应如何让它熟悉环境？',
        A: '把它关在小空间',
        B: '多带它出门',
        C: '给它安静空间适应',
        D: '一直逗它玩',
        answer: 'C'
      },
      {
        id: 21,
        title: '宠物出现咳嗽症状，可能是？',
        A: '嗓子干',
        B: '呼吸道感染',
        C: '吃得太咸',
        D: '太无聊',
        answer: 'B'
      },
      {
        id: 22,
        title: '宠物的食物放置多久后不宜再食用？',
        A: '1 小时',
        B: '4 小时',
        C: '12 小时',
        D: '24 小时',
        answer: 'B'
      },
      {
        id: 23,
        title: '给宠物梳毛的好处不包括？',
        A: '减少掉毛',
        B: '促进血液循环',
        C: '增加宠物体重',
        D: '增进感情',
        answer: 'C'
      },
      {
        id: 24,
        title: '宠物生病时，能否喂人吃的药？',
        A: '能，剂量一样',
        B: '能，减半剂量',
        C: '不能，需宠物专用药',
        D: '看心情喂',
        answer: 'C'
      },
      {
        id: 25,
        title: '狗狗怀孕周期一般是多久？',
        A: '30 天左右',
        B: '60 天左右',
        C: '90 天左右',
        D: '120 天左右',
        answer: 'B'
      },
      {
        id: 26,
        title: '猫咪抓家具，主人应？',
        A: '打它',
        B: '给它猫抓板',
        C: '换贵的家具',
        D: '把它关起来',
        answer: 'B'
      },
      {
        id: 27,
        title: '宠物外出回来，应首先做什么？',
        A: '马上喂食',
        B: '擦脚清洁',
        C: '让它睡觉',
        D: '陪它玩耍',
        answer: 'B'
      },
      {
        id: 28,
        title: '宠物疫苗接种后，可能出现哪种正常反应？',
        A: '发烧 40℃以上',
        B: '精神萎靡一周',
        C: '注射部位轻微红肿',
        D: '便血',
        answer: 'C'
      },
      {
        id: 29,
        title: '给宠物选择猫砂，应优先考虑？',
        A: '颜色',
        B: '价格',
        C: '除臭和结团性',
        D: '品牌知名度',
        answer: 'C'
      },
      {
        id: 30,
        title: '宠物受伤流血，应如何处理？',
        A: '直接包扎',
        B: '用酒精大量冲洗',
        C: '先止血再清洁包扎',
        D: '涂酱油',
        answer: 'C'
      },
      {
        id: 31,
        title: '如何判断宠物是否肥胖？',
        A: '看它是否爱睡觉',
        B: '能否摸到肋骨',
        C: '看眼睛大小',
        D: '听叫声大小',
        answer: 'B'
      }
    ],
    // 用户搜索的帖子
    resultPost: []
  },
  getters: {
  },
  mutations: {
    setChoose (state, info) {
      state.questionsList[info.index].userChoose = info.value
      console.log(state.questionsList[info.index])
    },
    setResultPost (state, info) {
      state.resultPost = info
    }
  },
  actions: {
    async findPosts (context, title) {
      const res = await searchPost(title)
      context.commit('setResultPost', res.data)
    }
  },
  modules: {
  }
}
