/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.36 : Database - pet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pet` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pet`;

/*Table structure for table `adoption_applications` */

DROP TABLE IF EXISTS `adoption_applications`;

CREATE TABLE `adoption_applications` (
  `application_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pet_id` int DEFAULT NULL COMMENT '宠物id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `applicant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '申请人姓名',
  `applicant_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '申请人联系方式',
  `applicant_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '申请人居住地址',
  `applicant_age` int NOT NULL COMMENT '申请人年纪',
  `application_date` datetime NOT NULL COMMENT '申请日期',
  `pass_date` datetime DEFAULT NULL COMMENT '通过日期',
  `status` int NOT NULL COMMENT '状态',
  PRIMARY KEY (`application_id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `adoption_applications_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20260411711065948 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `adoption_applications` */

insert  into `adoption_applications`(`application_id`,`pet_id`,`user_id`,`applicant_name`,`applicant_contact`,`applicant_address`,`applicant_age`,`application_date`,`pass_date`,`status`) values 
(2025025713461444,15,1,'张涛','19321381838','湖北省韶关市盐池县xxxxxx',12,'2025-02-26 00:00:00',NULL,2),
(2025025713461445,16,2,'肖华成','14717321712','江苏省南京市钟楼区xxxxxx',18,'2025-03-26 00:17:29',NULL,3),
(20260411709582299,1,122,'API Tester','13800138000','Shanghai',26,'2026-04-27 09:58:22',NULL,0),
(20260411709594076,1,125,'API Tester','13800138000','Shanghai',26,'2026-04-27 09:59:41',NULL,0),
(20260411710161086,1,128,'API Tester','13800138000','Shanghai',26,'2026-04-27 10:16:11',NULL,0),
(20260411710203353,1,131,'API Tester','13800138000','Shanghai',26,'2026-04-27 10:20:34',NULL,0),
(20260411710315024,1,134,'API Tester','13800138000','Shanghai',26,'2026-04-27 10:31:50',NULL,0),
(20260411710562710,1,137,'API Tester','13800138000','Shanghai',26,'2026-04-27 10:56:28',NULL,0),
(20260411711065947,1,140,'API Tester','13800138000','Shanghai',26,'2026-04-27 11:07:00',NULL,0);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `forum_id` int NOT NULL COMMENT '论坛id',
  `user_id` int NOT NULL COMMENT '用户id',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `comment` */

insert  into `comment`(`id`,`forum_id`,`user_id`,`text`,`create_time`) values 
(1,1,17,'我家猫也这样！后来我是把零食彻底断掉一周，才勉强肯吃猫粮了，真的很煎熬','2025-10-05 10:22:11'),
(2,1,42,'可以试试在猫粮上撒点冻干，慢慢减少冻干的比例，过渡会顺畅一些','2025-10-05 13:45:32'),
(3,1,6,'猫会不会是肠胃不舒服？挑食有时候是身体问题，建议先检查一下','2025-10-06 09:11:04'),
(4,1,29,'哈哈我家橘猫也是，就喜欢吃罐头，干粮看都不看一眼','2025-10-06 16:30:57'),
(5,1,51,'我的方法是换一个陌生品牌，猫好像对新奇的东西比较感兴趣','2025-10-07 08:05:43'),
(6,1,14,'饿一顿其实没关系，健康猫饿一两顿不会有问题，但不能超过24小时','2025-10-07 20:18:29'),
(7,1,63,'建议去宠物医院做个血常规，有时候猫突然挑食是甲亢或者肾脏问题的前兆','2025-10-08 11:47:15'),
(8,2,5,'训练记录得很详细！我家拉布拉多也是这样训练的，确实有效','2025-10-09 08:33:21'),
(9,2,38,'坐下真的是最容易的，我家柴犬两岁了还是只会这个哈哈','2025-10-09 12:50:44'),
(10,2,22,'有没有推荐的零食当奖励？我家狗对普通零食不太感兴趣，不知道用什么效果好','2025-10-09 18:07:36'),
(11,2,67,'体罚这点太重要了！我小时候养的狗就是被打怕了，后来见人就躲，很心酸','2025-10-10 10:24:18'),
(12,2,11,'金毛真的是很聪明的狗，好好训练以后很好带，加油','2025-10-10 15:41:52'),
(13,2,44,'我想问一下趴下怎么教？我家狗这个一直学不会，每次教完就忘了','2025-10-11 09:15:07'),
(14,2,79,'建议报一个宠物训练课，专业教练会更系统，价格也不算很贵','2025-10-11 21:38:43'),
(15,3,25,'哈哈哈我家猫洗澡的时候也是这个状态，真的吓到了','2025-10-13 09:05:22'),
(16,3,58,'可以先让猫习惯水声，把它带进浴室不放水，让它在里面玩一会儿，慢慢适应','2025-10-13 14:27:56'),
(17,3,7,'防抓手套一定要买质量好的，便宜的真的防不住猫爪子','2025-10-13 19:43:11'),
(18,3,34,'建议去宠物店洗，专业人员有经验，而且猫不认识那里，应激反应反而小一些','2025-10-14 08:12:38'),
(19,3,16,'我家猫现在洗澡只是会低声叫，不挣扎了，关键是从小就开始洗，习惯了','2025-10-14 15:55:44'),
(20,3,49,'可以在洗澡前把猫的指甲剪了，这样被抓伤的概率小很多','2025-10-14 22:30:17'),
(21,3,82,'胳膊上五道血痕……我也有过，猫洗澡真是一场战争','2025-10-15 10:08:59'),
(22,4,2,'太有共鸣了，我也被过度检查坑过，600多块检查费，最后医生说没什么问题','2025-10-15 13:22:47'),
(23,4,36,'建议找一个固定的口碑好的宠物医院，多次就诊后医生会了解你家宠物的情况','2025-10-15 17:40:33'),
(24,4,60,'那种第一次来就推销各种套餐的宠物医院要小心，大概率是坑钱的','2025-10-16 09:14:25'),
(25,4,21,'我一般先去小红书搜宠物医院评价，踩雷率低很多','2025-10-16 14:58:12'),
(26,4,47,'换粮要慢慢过渡，新旧混合7天左右，很多肠胃问题都是这个引起的','2025-10-17 08:35:46'),
(27,4,13,'能分享一下是哪个城市吗？我也想找好的宠物医院推荐','2025-10-17 16:20:08'),
(28,4,75,'我家附近有家宠物医院口碑一直不错，关键是不乱检查，有什么说什么','2025-10-18 11:44:51'),
(29,5,10,'躲在床底不出来是正常的，叫做应激期，一般需要3到7天，给它安静的空间就好','2025-10-18 20:15:33'),
(30,5,31,'两只猫见面建议先隔离，用味道交换法，把各自用过的毛巾互换，让它们先适应气味','2025-10-19 10:42:17'),
(31,5,64,'建议先把原来的猫关在一个房间，让新猫先熟悉整个环境，这样冲突会少很多','2025-10-19 18:27:46'),
(32,5,26,'感谢你收留它，流浪猫真的很需要一个温暖的家','2025-10-20 09:08:34'),
(33,5,53,'不吃东西很正常，应激期猫会拒食，只要保证有水喝就好，别强迫它吃','2025-10-20 15:33:19'),
(34,5,4,'两只猫打架是一定会有的，但只要不见血就正常，让它们自己磨合','2025-10-21 08:51:42'),
(35,5,86,'记得之后做FIV和FeLV检测，流浪猫这两项很重要，为原来的猫考虑','2025-10-21 20:04:57'),
(36,6,39,'从症状描述来看更像耳道发炎，耳螨一般是棕褐色分泌物，黑色更像是继发感染','2025-10-21 10:33:18'),
(37,6,18,'建议去医院让医生用耳镜看一下，耳螨在耳镜下能直接看到，很好判断','2025-10-21 14:22:47'),
(38,6,62,'我家柯基之前也这样，最后确诊是耳道炎，用滴耳液滴了两周好了','2025-10-22 09:05:36'),
(39,6,43,'平时要定期清洁狗狗耳朵，特别是垂耳狗，耳道不通风很容易发炎','2025-10-22 16:48:12'),
(40,6,77,'耳螨会传染的，如果家里有多只宠物记得一起检查','2025-10-23 08:17:29'),
(41,6,9,'告诉你一个判断方法：用棉签轻轻擦耳道内壁，如果分泌物是棕黑色油脂状，更可能是炎症','2025-10-23 15:40:55'),
(42,6,30,'去医院告诉医生你已经网上了解过，他们一般不会随便乱开检查','2025-10-24 10:22:37'),
(43,7,1,'买猫粮之前一定要看成分表，蛋白含量和肉源排在前面才靠谱','2025-10-24 17:08:24'),
(44,7,55,'水解蛋白不一定是坏东西，对有食物过敏的猫反而更好消化，主要看用途','2025-10-25 09:33:41'),
(45,7,28,'能说一下你现在用的是哪个国产品牌吗？我也在找靠谱的','2025-10-25 14:57:18'),
(46,7,70,'我家猫用了两年进口粮，换国产之后尿味明显小了，蛋白质利用率更高','2025-10-25 21:20:53'),
(47,7,15,'注意别一次囤太多猫粮，很多品牌配方会不定期调整，猫对配方变化很敏感','2025-10-26 10:44:17'),
(48,7,48,'冻干生骨肉可以考虑，营养比较全面，但价格确实不便宜','2025-10-26 18:29:04'),
(49,7,90,'测评很有参考价值，收藏了，准备换粮的时候来对照一下','2025-10-27 09:13:38'),
(50,8,61,'希望它快点完全康复，边牧生病了真的很心疼，平时那么活泼的狗','2025-10-28 09:15:46'),
(51,8,23,'肠胃炎真的要注意，很多时候是吃了不干净的东西，出去遛狗要看住它','2025-10-28 15:38:22'),
(52,8,41,'建议给狗狗买一个宠物医疗保险，现在有几家公司在做，生病了能报销一部分','2025-10-29 08:04:57'),
(53,8,68,'住院期间狗狗最需要主人陪伴，你每天去看它真的很负责任','2025-10-29 14:22:31'),
(54,8,16,'急性肠胃炎以后饮食要注意，建议配一些肠道保护的益生菌，定期喂','2025-10-30 09:47:14'),
(55,8,37,'1800确实不便宜，我们家狗生病的时候花了两千多，真的要有备用金','2025-10-30 16:05:48'),
(56,8,52,'边牧太聪明了，生病的时候感觉它自己也知道，会特别安静地配合','2025-10-31 10:33:26'),
(57,9,20,'猫抓东西是本能，根治很难，但可以在沙发角贴双面胶，猫不喜欢粘脚的感觉','2025-11-03 09:28:15'),
(58,9,57,'猫抓板的材质很重要，我家猫只用剑麻材质的，纸板和麻绳都不理睬','2025-11-03 15:44:32'),
(59,9,40,'皮质沙发的话猫爪子是可以划破的，而且皮质修复很贵，不太建议','2025-11-04 08:17:48'),
(60,9,76,'可以在猫抓板旁边喷一点猫薄荷，能吸引猫过去用，慢慢培养习惯','2025-11-04 16:50:23'),
(61,9,34,'我家最终的解决方案是把沙发角贴了防抓保护膜，便宜好用，完美解决','2025-11-05 09:23:57'),
(62,9,65,'暹罗猫特别聪明，也特别执拗，换成绒面或者麻面沙发可能更适合','2025-11-05 17:39:14'),
(63,9,83,'定期帮猫修剪指甲也能减轻破坏程度，我家猫每两周剪一次，沙发好多了','2025-11-06 10:55:41'),
(64,10,2,'看完好羡慕，我家猫完全不撒娇，只有到饭点才搭理我','2025-11-05 21:18:47'),
(65,10,73,'在门口等你这个细节太感动了，猫其实比我们想象中更依赖主人','2025-11-06 09:33:24'),
(66,10,59,'养猫之后感觉幸福感提升了很多，它不说话但能感受到你的情绪','2025-11-06 15:47:38'),
(67,10,46,'我家猫也喜欢趴键盘，每次开会发言它就来捣乱，尴尬又好笑','2025-11-07 08:14:52'),
(68,10,24,'分享一个：我家猫会在我哭的时候过来蹭我，不知道是不是真的能感知','2025-11-07 16:28:16'),
(69,10,91,'压力大的时候有猫真的很重要，软软的毛摸着就什么烦恼都没了','2025-11-08 09:05:33'),
(70,10,35,'我准备明年养一只，这条帖子彻底坚定了我的决心','2025-11-08 18:42:07'),
(71,15,125,'api comment','2026-04-27 09:59:41'),
(72,16,128,'api comment','2026-04-27 10:16:11'),
(73,17,131,'api comment','2026-04-27 10:20:35'),
(74,18,134,'api comment','2026-04-27 10:31:51'),
(75,19,137,'api comment','2026-04-27 10:56:29'),
(76,20,140,'api comment','2026-04-27 11:07:01');

/*Table structure for table `donations` */

DROP TABLE IF EXISTS `donations`;

CREATE TABLE `donations` (
  `donation_id` bigint NOT NULL COMMENT 'id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宠物名称',
  `gender` int NOT NULL COMMENT '性别',
  `age` int NOT NULL COMMENT '年纪',
  `personality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '性格',
  `breed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '品种',
  `cat_or_dog` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '猫还是狗',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片链接',
  `vaccination` tinyint(1) NOT NULL COMMENT '接种疫苗',
  `adoption_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '领养备注',
  `donor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '捐赠人真实姓名',
  `donor_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '捐赠人手机号',
  `donation_date` datetime NOT NULL COMMENT '捐赠日期',
  `pass_date` datetime DEFAULT NULL COMMENT '审核通过时间',
  `status` int NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`donation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `donations` */

insert  into `donations`(`donation_id`,`user_id`,`name`,`gender`,`age`,`personality`,`breed`,`cat_or_dog`,`image_url`,`vaccination`,`adoption_info`,`donor_name`,`donor_contact`,`donation_date`,`pass_date`,`status`) values 
(2025023911110454,1,'小白',0,2,'活泼','拉布拉多',NULL,'http://dummyimage.com/400x400/ffcc00/ffffff',1,'喜欢散步','ck','852963741','2025-02-08 11:11:05',NULL,3),
(2025023911110458,5,'小白兔',0,2,'沉稳','兔子',NULL,'http://dummyimage.com/400x400/ffffcc/000000',1,'很温顺','mj','159357258','2025-02-08 11:11:05',NULL,3),
(2025023911110459,6,'小橙',1,4,'活泼','金毛',NULL,'http://dummyimage.com/400x400/ff6600/ffffff',1,'喜欢游泳','rw','369258147','2025-02-08 11:11:05',NULL,2),
(2025023911110460,7,'豆豆',1,3,'懒惰','法斗',NULL,'http://dummyimage.com/400x400/ff9999/ffffff',2,'喜欢晒太阳','kj','852741369','2025-02-08 11:11:05',NULL,2),
(2025023911110461,8,'小雪',0,5,'内向','哈士奇',NULL,'http://dummyimage.com/400x400/0000ff/ffffff',1,'需要安静的环境','xg','753159846','2025-02-08 11:11:05',NULL,1),
(2025023911110462,9,'小花',1,2,'活泼','边境牧羊犬',NULL,'http://dummyimage.com/400x400/ffcc33/ffffff',1,'非常善于交际','mb','951753852','2025-02-08 11:11:05',NULL,1),
(2025023911110463,10,'胖胖',1,4,'沉稳','萨摩耶',NULL,'http://dummyimage.com/400x400/ffcc66/000000',2,'很听话','mj','159357258','2025-02-08 11:11:05',NULL,1),
(2025023911110464,11,'小兔',0,3,'懒惰','迷你金毛',NULL,'http://dummyimage.com/400x400/ffcc99/ffffff',1,'喜欢待在家里','ck','852963741','2025-02-08 11:11:05',NULL,1),
(2025023911110465,12,'小黑狗',1,2,'活泼','德国牧羊犬',NULL,'http://dummyimage.com/400x400/000000/ffffff',1,'需要户外活动','xg','753159846','2025-02-08 11:11:05',NULL,1),
(2025023911110466,13,'小狐狸',0,5,'内向','阿拉斯加',NULL,'http://dummyimage.com/400x400/cc6600/ffffff',1,'需要时间适应','kj','654123789','2025-02-08 11:11:05',NULL,1),
(2025023911110467,14,'小加坡',1,3,'懒惰','比特犬',NULL,'http://dummyimage.com/400x400/ff9933/ffffff',2,'喜欢安静的环境','mb','951753852','2025-02-08 11:11:05',NULL,1),
(2025023911110468,15,'小胖',0,4,'活泼','西高地',NULL,'http://dummyimage.com/400x400/ffcc00/ffffff',1,'活泼好动','mnb','456789123','2025-02-08 11:11:05',NULL,1),
(2025023911110469,16,'小米',0,1,'沉稳','英短',NULL,'http://dummyimage.com/400x400/ffccff/000000',2,'当个好伴侣','mj','159357258','2025-02-08 11:11:05',NULL,1),
(2025023911110470,17,'小闪',1,3,'懒惰','英国短毛猫',NULL,'http://dummyimage.com/400x400/ccccff/ffffff',1,'喜欢安静的地方','ck','852963741','2025-02-08 11:11:05',NULL,1),
(2025023911110471,18,'小黑子',1,2,'活泼','拉布拉多',NULL,'http://dummyimage.com/400x400/ff6600/ffffff',1,'适合家庭','gh','159357258','2025-02-08 11:11:05',NULL,1),
(2025023911110472,19,'小白猫',0,4,'内向','俄罗斯蓝猫',NULL,'http://dummyimage.com/400x400/00ccff/ffffff',2,'喜欢静静待着','mb','951753852','2025-02-08 11:11:05',NULL,1),
(2025023911110473,20,'小鸭',0,2,'懒惰','可卡犬',NULL,'http://dummyimage.com/400x400/ffcc66/ffffff',1,'爱待在家','xg','753159846','2025-02-08 11:11:05',NULL,1),
(2025023911110474,21,'小葡萄',1,4,'活泼','柯基犬',NULL,'http://dummyimage.com/400x400/ff3399/ffffff',1,'喜欢跟人玩','je','159753456','2025-02-08 11:11:05',NULL,1),
(2025023911110475,22,'小米粒',1,3,'沉稳','波士顿犬',NULL,'http://dummyimage.com/400x400/ccc111/ffffff',1,'性格温和','lv','147852369','2025-02-08 11:11:05',NULL,1),
(2025023911110476,23,'小可乐',0,1,'活泼','杜宾犬',NULL,'http://dummyimage.com/400x400/66cc99/ffffff',1,'喜欢和人互动','pm','258963147','2025-02-08 11:11:05',NULL,1),
(2025023911110477,24,'小惊喜',1,2,'沉稳','雪纳瑞',NULL,'http://dummyimage.com/400x400/ff6699/ffffff',1,'喜欢安静','rt','654789321','2025-02-08 11:11:05',NULL,1),
(2025023911110478,25,'小甜甜',1,5,'内向','哈士奇',NULL,'http://dummyimage.com/400x400/ffcc00/000000',1,'喜欢独处','jhg','963852741','2025-02-08 11:11:05',NULL,1),
(2025023911110479,26,'小龙',0,3,'活泼','狗狗',NULL,'http://dummyimage.com/400x400/00cc00/ffffff',1,'喜欢冒险','mv','258963579','2025-02-08 11:11:05',NULL,1),
(2025023911110480,27,'小酷',1,4,'懒惰','贵宾犬',NULL,'http://dummyimage.com/400x400/ffcc33/ffffff',2,'喜欢待在家中','hgf','654123456','2025-02-08 11:11:05',NULL,1),
(2025023911110481,28,'小兔子',0,2,'活泼','博美',NULL,'http://dummyimage.com/400x400/ffcc99/000000',1,'喜欢欢腾','nm','951753126','2025-02-08 11:11:05',NULL,1),
(2025023911110482,29,'小聪明',1,3,'沉稳','金毛',NULL,'http://dummyimage.com/400x400/cc9933/ffffff',2,'喜欢静谧的环境','hj','258963741','2025-02-08 11:11:05',NULL,1),
(2025023911110483,30,'小小',1,1,'活泼','柯基犬',NULL,'http://dummyimage.com/400x400/99ffcc/ffffff',1,'活泼可爱','gn','741852963','2025-02-08 11:11:05',NULL,1),
(2025023911110484,31,'小灯',1,4,'懒惰','波士顿',NULL,'http://dummyimage.com/400x400/cc6600/ffffff',1,'喜欢安静的生活','ft','456123789','2025-02-08 11:11:05',NULL,1),
(2025023911110485,32,'小草',0,2,'内向','纽芬兰犬',NULL,'http://dummyimage.com/400x400/66ffcc/ffffff',2,'适合静静的地方','rt','852147369','2025-02-08 11:11:05',NULL,1),
(2025023911110486,33,'小橘',1,4,'活泼','中华田园猫',NULL,'http://dummyimage.com/400x400/ff6600/ffffff',1,'喜欢冒险','py','963258741','2025-02-08 11:11:05',NULL,1),
(2025023911110487,34,'小乖',1,2,'沉稳','日本猫',NULL,'http://dummyimage.com/400x400/cc9933/ffffff',1,'需要关爱','vm','369258147','2025-02-08 11:11:05',NULL,1),
(2025023911110488,35,'小飞',1,3,'活泼','金毛寻回犬',NULL,'http://dummyimage.com/400x400/66ffff/ffffff',1,'对人热情','jx','258369147','2025-02-08 11:11:05',NULL,1),
(2025023911110489,36,'小蓝',0,5,'懒惰','挪威森林猫',NULL,'http://dummyimage.com/400x400/0099ff/ffffff',2,'喜欢安静的角落','kj','654789123','2025-02-08 11:11:05',NULL,1),
(2025023911110490,37,'小食',0,1,'沉稳','英爱犬',NULL,'http://dummyimage.com/400x400/ffcc33/000000',1,'温顺','lm','369852147','2025-02-08 11:11:05',NULL,1),
(2025023911110491,38,'小溪',1,2,'内向','德牧',NULL,'http://dummyimage.com/400x400/66cc33/ffffff',2,'需要关爱','hg','852147963','2025-02-08 11:11:05',NULL,1),
(2025023911110492,39,'小旺',0,3,'活泼','柯基犬',NULL,'http://dummyimage.com/400x400/ff6600/ffffff',1,'特别友善','ty','963741852','2025-02-08 11:11:05',NULL,1),
(2025023911110493,40,'小黑米',1,5,'沉稳','平胸犬',NULL,'http://dummyimage.com/400x400/33ccff/ffffff',2,'温顺','yui','753159852','2025-02-08 11:11:05',NULL,1),
(2025023911110494,41,'小白花',0,2,'活泼','阿拉斯加',NULL,'http://dummyimage.com/400x400/cc6699/ffffff',1,'热情好客','hm','258963417','2025-02-08 11:11:05',NULL,1),
(2025023911110495,42,'小月亮',1,3,'沉稳','吉娃娃',NULL,'http://dummyimage.com/400x400/00cccc/ffffff',1,'喜欢独处','ty','987654321','2025-02-08 11:11:05',NULL,1),
(2025023911110496,43,'小茶',0,5,'懒惰','哈士奇',NULL,'http://dummyimage.com/400x400/990099/ffffff',1,'温柔友好','jhk','963258789','2025-02-08 11:11:05',NULL,1),
(2025023911110497,44,'小米妮',1,2,'活泼','混血犬',NULL,'http://dummyimage.com/400x400/00ff00/ffffff',1,'很爱玩','cn','258963147','2025-02-08 11:11:05',NULL,1),
(2025023911110498,45,'小心心',1,4,'内向','西高地',NULL,'http://dummyimage.com/400x400/ffcc99/000000',2,'喜欢居家','jh','456789123','2025-02-08 11:11:05',NULL,1),
(2025023911110499,46,'小彩虹',0,3,'活泼','拉布拉多',NULL,'http://dummyimage.com/400x400/33ffcc/ffffff',1,'喜欢户外','gn','258963147','2025-02-08 11:11:05',NULL,1),
(2025023911110500,47,'小小猫',1,5,'沉稳','波斯猫',NULL,'http://dummyimage.com/400x400/6666ff/ffffff',1,'非常温顺','ty','852963789','2025-02-08 11:11:05',NULL,1),
(2025023911110501,48,'小幻想',0,2,'懒惰','中华田园猫',NULL,'http://dummyimage.com/400x400/ddssff/ffffff',1,'喜欢蜷缩','hn','258963456','2025-02-08 11:11:05',NULL,1),
(2025023911110502,49,'小美',1,3,'内向','苏格兰折耳猫',NULL,'http://dummyimage.com/400x400/66cc99/ffffff',1,'需要温暖','gj','852963147','2025-02-08 11:11:05',NULL,1),
(2025023911110503,50,'小乖乖',0,4,'沉稳','巧克力犬',NULL,'http://dummyimage.com/400x400/aa11aa/ffffff',1,'喜欢静静呆着','jb','963258741','2025-02-08 11:11:05',NULL,1),
(2025023911110504,51,'小糯米',1,5,'活泼','贵宾犬',NULL,'http://dummyimage.com/400x400/cc9966/ffffff',1,'总是欢笑','op','852147963','2025-02-08 11:11:05',NULL,1),
(2025023911110505,52,'小豆豆',0,2,'懒惰','泰迪犬',NULL,'http://dummyimage.com/400x400/ddffdd/ffffff',1,'喜欢安静的环境','js','254789321','2025-02-08 11:11:05',NULL,1),
(2025023911110506,53,'小胖子',1,4,'内向','柴犬',NULL,'http://dummyimage.com/400x400/660066/ffffff',1,'喜欢独自呆着','xb','852963463','2025-02-08 11:11:05',NULL,1),
(2025023911110507,54,'小星星',0,1,'活泼','萨摩耶',NULL,'http://dummyimage.com/400x400/cc9966/ffffff',1,'活泼可爱','xy','258963128','2025-02-08 11:11:05',NULL,1),
(2025023911110508,55,'小露',1,3,'沉稳','西高地',NULL,'http://dummyimage.com/400x400/ffccff/000000',1,'安静而乖巧','gh','963852159','2025-02-08 11:11:05',NULL,1),
(2025023911110509,56,'小花花',0,5,'懒惰','橘猫',NULL,'http://dummyimage.com/400x400/a1a1a1/ffffff',1,'喜欢待在酒窝','iu','258963741','2025-02-08 11:11:05',NULL,1),
(2025023911110510,57,'小肥',1,2,'内向','拉布拉多',NULL,'http://dummyimage.com/400x400/ffcc00/ffffff',1,'需要温暖','ak','555809754','2025-02-08 11:11:05',NULL,1),
(2025023911110511,58,'小馒头',0,4,'懒惰','金毛',NULL,'http://dummyimage.com/400x400/66ff66/ffffff',1,'适合家庭养','bx','963258147','2025-02-08 11:11:05',NULL,1),
(2025023911110512,59,'小旋风',1,3,'活泼','可卡犬',NULL,'http://dummyimage.com/400x400/bc43ab/ffffff',1,'非常好动','ty','965247852','2025-02-08 11:11:05',NULL,1),
(2025023911110513,60,'小花椒',0,2,'沉稳','茶杯犬',NULL,'http://dummyimage.com/400x400/999999/ffffff',1,'安静的伴侣','gh','168157452','2025-02-08 11:11:05','2026-04-22 11:37:52',1),
(2025023911110514,61,'小貂',1,1,'活泼','土耳其安哥拉',NULL,'http://dummyimage.com/400x400/225499/ffffff',1,'富有活力','fr','285624139','2025-02-08 11:11:05',NULL,1),
(2025023911110515,62,'小奶茶',0,4,'内向','金藏犬',NULL,'http://dummyimage.com/400x400/093359/ffffff',1,'温顺含蓄','ty','963258741','2025-02-08 11:11:05',NULL,1),
(2025023911110516,63,'小心泉',0,1,'活泼','混血',NULL,'http://dummyimage.com/400x400/be5a89/ffffff',1,'充满活力','fs','482613759','2025-02-08 11:11:05',NULL,1),
(2025023911110517,64,'小火火',1,3,'沉稳','博美',NULL,'http://dummyimage.com/400x400/ffff99/ffffff',1,'温柔如水','ty','185642793','2025-02-08 11:11:05',NULL,1),
(2025023911110518,65,'小瓜',1,5,'内向','边境牧羊犬',NULL,'http://dummyimage.com/400x400/008888/ffffff',1,'喜欢独立','gh','789256125','2025-02-08 11:11:05',NULL,1),
(2025023911110519,66,'小乖乖',1,2,'活泼','阿拉斯加',NULL,'http://dummyimage.com/400x400/f09cc5/ffffff',1,'对人温柔','hxg','908167421','2025-02-08 11:11:05',NULL,1),
(2025023911110520,67,'小班',0,3,'沉稳','拉布拉多',NULL,'http://dummyimage.com/400x400/b89999/ffffff',1,'安静温柔','jx','123145746','2025-02-08 11:11:05',NULL,1),
(2025023911110521,68,'小飞鱼',1,2,'活泼','巴黎犬',NULL,'http://dummyimage.com/400x400/9999cc/ffffff',1,'活泼可爱','yt','895632724','2025-02-08 11:11:05',NULL,1),
(2025023911110522,69,'小小星',1,3,'内向','巴哥犬',NULL,'http://dummyimage.com/400x400/ffccff/000000',2,'偏向独处','vnm','546982317','2025-02-08 11:11:05',NULL,1),
(2025023911110523,70,'小乐乐',0,5,'沉稳','西高地',NULL,'http://dummyimage.com/400x400/ff6666/ffffff',2,'喜欢陪伴','mxn','587631452','2025-02-08 11:11:05',NULL,1),
(2025023911110524,71,'小米仁',1,4,'活泼','金毛',NULL,'http://dummyimage.com/400x400/ff6666/ffffff',1,'喜欢户外活动','yu','457189623','2025-02-08 11:11:05',NULL,1),
(2025023911110525,72,'小云朵',1,2,'懒惰','迷你边牧',NULL,'http://dummyimage.com/400x400/dedede/ffffff',1,'喜欢宅在家','ty','395248766','2025-02-08 11:11:05',NULL,1),
(2025023911110526,73,'小奶酪',0,3,'沉稳','拉丁斗牛犬',NULL,'http://dummyimage.com/400x400/ffcc00/ffffff',1,'温顺乖巧','gf','258912345','2025-02-08 11:11:05',NULL,1),
(2025023911110527,74,'小聪',1,4,'内向','土耳其安哥拉猫',NULL,'http://dummyimage.com/400x400/cc00ff/ffffff',2,'需要安静的环境','pl','478958126','2025-02-08 11:11:05',NULL,1),
(2025023911110528,75,'小呆',1,2,'活泼','西藏犬',NULL,'http://dummyimage.com/400x400/99cc00/ffffff',1,'总是让人微笑','gh','963852741','2025-02-08 11:11:05',NULL,1),
(2025023911110529,76,'小兔兔',1,5,'沉稳','中华田园犬',NULL,'http://dummyimage.com/400x400/ddffff/ffffff',1,'喜欢安静的窝','ajax','258963417','2025-02-08 11:11:05',NULL,1),
(2025023911110530,77,'小黑咪',0,3,'懒惰','法斗',NULL,'http://dummyimage.com/400x400/ffcc33/000000',1,'很放松','jb','963258741','2025-02-08 11:11:05',NULL,1),
(2025023911110531,78,'小马',1,2,'活泼','哈士奇',NULL,'http://dummyimage.com/400x400/ffcc66/000000',1,'好动喜欢奔跑','tyw','543896712','2025-02-08 11:11:05',NULL,1),
(2025023911110532,79,'小白白',0,4,'沉稳','大丹犬',NULL,'http://dummyimage.com/400x400/aa00cc/ffffff',2,'看起来很温婉','akg','856147961','2025-02-08 11:11:05',NULL,1),
(2025023911110533,80,'巧克力',1,3,'活泼','比利时牧羊犬',NULL,'http://dummyimage.com/400x400/99cc99/ffffff',1,'充满活力','ye','258963685','2025-02-08 11:11:05',NULL,1),
(2025023911110534,81,'小乖乖',0,2,'懒惰','古牧',NULL,'http://dummyimage.com/400x400/ff9933/ffffff',1,'安静','bg','654123789','2025-02-08 11:11:05',NULL,1),
(2025023911110535,82,'小果仁',0,1,'内向','边境犬',NULL,'http://dummyimage.com/400x400/cc99cc/ffffff',1,'喜欢静静待着','qm','258963123','2025-02-08 11:11:05',NULL,1),
(2025023911110536,83,'小紫',1,4,'活泼','土耳其安哥拉猫',NULL,'http://dummyimage.com/400x400/66cc66/ffffff',1,'对人喜好','lt','243653891','2025-02-08 11:11:05',NULL,1),
(2025023911110537,84,'小小树',0,3,'沉稳','金毛',NULL,'http://dummyimage.com/400x400/ff0066/ffffff',1,'喜欢安静','ty','361258747','2025-02-08 11:11:05',NULL,1),
(2025023911110538,85,'小飞飞',1,2,'活泼','中华田园狗',NULL,'http://dummyimage.com/400x400/ccff33/ffffff',1,'非常亲切','bk','234651997','2025-02-08 11:11:05',NULL,1),
(2025023911110539,86,'小圆',0,4,'沉稳','柴犬',NULL,'http://dummyimage.com/400x400/00cc99/ffffff',1,'很乖巧','yu','258963974','2025-02-08 11:11:05',NULL,1),
(2025023911110540,87,'小色',0,3,'活泼','古牧',NULL,'http://dummyimage.com/400x400/ff3366/ffffff',1,'非常有趣','ha','789214753','2025-02-08 11:11:05',NULL,1),
(2025023911110541,88,'小包',0,5,'沉稳','西亚犬',NULL,'http://dummyimage.com/400x400/00ffff/ffffff',2,'很温柔','by','789654321','2025-02-08 11:11:05',NULL,1),
(2025023911110542,89,'小可爱',1,2,'活泼','大斗',NULL,'http://dummyimage.com/400x400/ff6633/ffffff',1,'很友好','yt','963258741','2025-02-08 11:11:05',NULL,1),
(2025023911110543,90,'小悠悠',1,3,'内向','英短',NULL,'http://dummyimage.com/400x400/ffcc00/ffffff',1,'非常安静','by','963258741','2025-02-08 11:11:05',NULL,1),
(2025023911110544,91,'小奶茶',1,1,'懒惰','可卡犬',NULL,'http://dummyimage.com/400x400/99cc00/ffffff',1,'特别舒服','ty','258963741','2025-02-08 11:11:05',NULL,1),
(2025023911110545,92,'小麦',0,5,'沉稳','金色猎犬',NULL,'http://dummyimage.com/400x400/ff66cc/ffffff',1,'很安静','hm','258963147','2025-02-08 11:11:05',NULL,1),
(2025023911110546,93,'小冰',0,3,'懒惰','比熊',NULL,'http://dummyimage.com/400x400/ffffcc/000000',1,'爱在家睡','xp','957473215','2025-02-08 11:11:05',NULL,1),
(2025023911110547,94,'小白白',1,1,'活泼','羊狗',NULL,'http://dummyimage.com/400x400/336633/ffffff',1,'很嗨','jg','963258741','2025-02-08 11:11:05',NULL,1),
(2025023911110548,95,'小弦',1,2,'沉稳','藏獒',NULL,'http://dummyimage.com/400x400/cc66ff/ffffff',2,'需要营业场所','ah','641237859','2025-02-08 11:11:05',NULL,2),
(2025023911110549,96,'小耳',0,4,'内向','哈士奇',NULL,'http://dummyimage.com/400x400/cc9933/ffffff',1,'总是羞涩','ty','258963741','2025-02-08 11:11:05',NULL,3),
(2025023911110550,97,'小哈',0,3,'懒惰','金毛',NULL,'http://dummyimage.com/400x400/66ccff/ffffff',1,'爱待在沙发','sh','825690306','2025-02-08 11:11:05',NULL,1),
(2025023911110551,98,'小皮皮',1,5,'沉稳','泰迪',NULL,'http://dummyimage.com/400x400/ff9933/ffffff',1,'适合搭伴','jh','258963147','2025-02-08 11:11:05',NULL,1),
(2025023911110552,99,'小王子',1,2,'活泼','西高地',NULL,'http://dummyimage.com/400x400/dd00ff/ffffff',1,'非常活跃','ty','258963741','2025-02-08 11:11:05',NULL,1),
(2025023911110553,100,'小夹子',0,3,'沉稳','柯基犬',NULL,'http://dummyimage.com/400x400/00cc33/ffffff',1,'安安静静','ty','258963741','2025-02-08 11:11:05',NULL,1),
(2025025620441407,0,'小小黑',1,25,'内向','中华田园犬',NULL,'http://dummyimage.com/400x400',1,'爱晒太阳','张涛','17918391238','2025-02-25 20:44:15',NULL,2),
(2025025620485348,0,'小小黑',1,25,'内向','中华田园犬',NULL,'http://dummyimage.com/400x400',1,'爱晒太阳','张涛','17918391238','2025-02-25 20:48:53',NULL,2),
(2025025620503086,0,'小小黑',1,25,'内向','中华田园犬','狗','http://dummyimage.com/400x400',1,'爱晒太阳','张涛','17918391238','2025-02-25 20:50:31',NULL,2),
(20260411114420671,112,'1',1,1,'1','狗','狗','[/pet_imgs/0ce85772-d30d-4145-bd24-0ef419d256d3.png]',0,'1','1','1','2026-04-21 14:42:07','2026-04-23 13:49:30',2),
(20260411411412643,0,'????????',1,2,'??','?????','?','/pet_imgs/test.jpg',1,'???????','API Tester','13800138000','2026-04-24 11:41:27',NULL,0),
(20260411411422444,0,'接口测试捐赠宠物',1,2,'温顺','中华田园猫','猫','/pet_imgs/test.jpg',1,'亲人，适合公寓','API Tester','13800138000','2026-04-24 11:42:24',NULL,0),
(20260411411441257,0,'接口测试捐赠宠物',1,2,'温顺','中华田园猫','猫','/pet_imgs/test.jpg',1,'亲人，适合公寓','API Tester','13800138000','2026-04-24 11:44:12',NULL,0),
(20260411709582272,0,'api_donate_register_1777255096',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate register','API Tester','13800138000','2026-04-27 09:58:22',NULL,0),
(20260411709582284,122,'api_donate_login_1777255096',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate login','API Tester','13800138000','2026-04-27 09:58:22',NULL,0),
(20260411709594040,0,'api_donate_register_1777255177',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate register','API Tester','13800138000','2026-04-27 09:59:41',NULL,0),
(20260411709594065,125,'api_donate_login_1777255177',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate login','API Tester','13800138000','2026-04-27 09:59:41',NULL,0),
(20260411710161058,0,'api_donate_register_1777256165',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate register','API Tester','13800138000','2026-04-27 10:16:11',NULL,0),
(20260411710161068,128,'api_donate_login_1777256165',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate login','API Tester','13800138000','2026-04-27 10:16:11',NULL,0),
(20260411710203343,131,'api_donate_login_1777256425',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate login','API Tester','13800138000','2026-04-27 10:20:34',NULL,0),
(20260411710203346,0,'api_donate_register_1777256425',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate register','API Tester','13800138000','2026-04-27 10:20:34',NULL,0),
(20260411710315023,134,'api_donate_login_1777257105',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate login','API Tester','13800138000','2026-04-27 10:31:50',NULL,0),
(20260411710315037,0,'api_donate_register_1777257105',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate register','API Tester','13800138000','2026-04-27 10:31:50',NULL,0),
(20260411710562725,0,'api_donate_register_1777258580',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate register','API Tester','13800138000','2026-04-27 10:56:28',NULL,0),
(20260411710562750,137,'api_donate_login_1777258580',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate login','API Tester','13800138000','2026-04-27 10:56:28',NULL,0),
(20260411711065960,140,'api_donate_login_1777259203',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate login','API Tester','13800138000','2026-04-27 11:07:00',NULL,0),
(20260411711065997,0,'api_donate_register_1777259203',1,2,'gentle','test_breed','cat','/pet_imgs/test.jpg',1,'api donate register','API Tester','13800138000','2026-04-27 11:06:59',NULL,0);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `back_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `adopt_id` int DEFAULT NULL COMMENT '领养人id',
  `donation_id` int DEFAULT NULL COMMENT '捐赠人id',
  `feed` tinyint(1) DEFAULT NULL COMMENT '饮食状况',
  `defecation` tinyint(1) DEFAULT NULL COMMENT '排便状况',
  `emo` tinyint(1) DEFAULT NULL COMMENT '情绪状况',
  `temperature` tinyint(1) DEFAULT NULL COMMENT '体温状况',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '近况图片',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`back_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `feedback` */

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NOT NULL COMMENT '用户id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片链接',
  `top` int DEFAULT NULL COMMENT '置顶',
  `comment_count` int DEFAULT NULL COMMENT '评论数',
  `pageview` int DEFAULT NULL COMMENT '浏览量',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发帖时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forum` */

insert  into `forum`(`id`,`user_id`,`title`,`content`,`image_url`,`top`,`comment_count`,`pageview`,`create_time`) values 
(1,3,'猫咪挑食怎么办，换了好多牌子都不吃','家里的橘猫两岁了，最近突然超级挑食，换了好几个品牌猫粮都不吃，就肯吃零食。去宠物店问了，说可能是被零食惯坏了。现在的做法是先把零食藏起来，强行让它饿一顿再喂猫粮，但感觉好残忍……有没有同样遭遇的铲屎官，有什么好办法？','/pet_imgs/c2.jpg',0,7,339,'2025-10-05 09:14:22'),
(2,12,'分享金毛训练心得，新手必看','养了一只三个月大的金毛，从零开始学训练，踩了不少坑。整理了一下心得分享给大家：坐下最容易教，用小零食引导，每次成功立刻奖励，大概两天就学会了；握手稍微难一点，要多耐心。最重要的是千万不要体罚，会破坏信任感，之后很难纠正。大家有什么补充的吗？','/pet_imgs/c1.jpg',1,7,880,'2025-10-08 14:32:11'),
(3,27,'带猫咪第一次洗澡，差点没命','今天鼓起勇气给我家布偶猫洗澡，提前买好了宠物沐浴露、吹风机、防抓手套，结果刚把猫放进浴缸，它直接炸毛，我胳膊上多了五道血痕。最后还是没洗成功，猫跑到床底下躲了两个小时。请问有什么让猫不排斥洗澡的好方法？','/pet_imgs/c3.jpg',0,7,541,'2025-10-12 20:05:47'),
(4,8,'宠物医院踩坑记录，附避坑指南','最近猫咪拉稀带去看病，跑了三家宠物医院，感触颇深。第一家直接推荐做全套检查，花了600多查不出啥。第二家医生很耐心，说可能是换粮太快导致应激，开了肠道益生菌，50块搞定。所以大家选宠物医院一定要先看口碑，别被过度医疗坑。','/pet_imgs/c4.jpg',0,7,728,'2025-10-15 11:27:38'),
(5,45,'刚领养了一只流浪猫，求经验','昨天在小区门口遇到一只小橘猫，大概三四个月大，一直跟着我。实在不忍心就抱回家了，但完全没养猫经验。已经带去打了疫苗和驱虫。现在猫躲在床底不出来，也不吃东西，是正常的吗？家里还有一只养了两年的成猫，它们会打架吗？求老司机指教！','/pet_imgs/c5.jpg',0,7,493,'2025-10-18 17:44:09'),
(6,19,'狗狗一直挠耳朵，是耳螨吗','博美犬，一岁半，这两天一直挠右边耳朵，耳朵里有黑色分泌物，还有点臭味。在网上查了说可能是耳螨，也有说是耳道发炎的。有宠物医学背景的朋友能帮忙分析一下吗？明天准备去医院，想提前了解一下，别被过度检查坑了。','/pet_imgs/c6.jpg',0,7,389,'2025-10-21 08:55:13'),
(7,56,'猫粮大测评，踩雷和推荐都有','养猫三年，试过不下20个品牌的猫粮，今天来做个总结。踩雷：某网红品牌宣传0谷物，成分表看下来淀粉不低，我家猫吃了两周软便；某进口罐头蛋白含量虚高，仔细看是水解蛋白充数的。推荐：以高肉含量、低碳水为核心指标来选，现在稳定在一款国产新兴品牌，猫毛顺多了。','/pet_imgs/c7.jpg',0,7,652,'2025-10-24 15:08:44'),
(8,33,'狗狗生病住院，心疼死了','边牧两岁，上周突然不吃饭，精神萎靡，以为只是普通食欲不振，结果带去医院发现是急性肠胃炎，需要住院输液三天。住院费大概1800，我每天去看它，看到它无精打采挂着针头就想哭。现在已经出院了，恢复很好，食欲也回来了。建议大家养宠前一定做好经济准备，宠物生病真的烧钱。','/pet_imgs/c1.jpg',0,7,447,'2025-10-27 21:33:55'),
(9,71,'猫咪乱抓沙发，有什么好的解决方案','家里的暹罗猫把布艺沙发抓得一塌糊涂，换了麻绳猫抓板、纸板猫抓板、竖式猫抓柱，猫就是不用，就喜欢抓沙发角。现在想着要不要直接换皮质沙发，但又怕被划破。有没有成功让猫戒掉抓沙发习惯的铲屎官，求分享有效方法！','/pet_imgs/c2.jpg',0,7,375,'2025-11-02 10:22:31'),
(10,88,'分享我家猫的日常，太治愈了','最近压力很大，每天下班回家看到猫就能放松很多。它总是在门口等我，不管多晚，只要听到开门声就跑来蹭腿。有时候趴在我键盘上打滚，有时候塞进我枕头旁边睡觉，整个人都被治愈了。养猫之前没想到会这么喜欢它，现在真的离不开了。大家也来分享一下你们家猫咪的治愈日常吧。','/pet_imgs/c5.jpg',0,7,916,'2025-11-05 19:47:02'),
(22,112,'1','1','/pet_imgs/17391874-aaa9-4425-8ef1-4a66b340d2ce.png',0,0,2,'2026-04-27 14:45:13');

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`class_name`,`tpl_category`,`tpl_web_type`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`gen_type`,`gen_path`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'users','用户管理',NULL,NULL,'Users','crud','element-plus','com.ruoyi.users','users','users','用户管理','ee','0','/','{\"parentMenuId\":3}','admin','2025-03-12 19:42:12','','2025-03-12 21:53:06',NULL),
(2,'pets','宠物管理',NULL,NULL,'Pets','crud','element-plus','com.ruoyi.pets','pets','pets','宠物管理','ee','0','/','{\"parentMenuId\":3}','admin','2025-03-12 20:28:07','','2025-03-12 21:43:46',NULL),
(3,'adoption_applications','宠物申请',NULL,NULL,'AdoptionApplications','crud','element-plus','com.ee.applications','applications','applications','宠物领养','ee','0','/','{\"parentMenuId\":3}','admin','2025-03-25 19:34:48','','2025-03-26 13:40:50',NULL),
(4,'donations','宠物捐赠',NULL,NULL,'Donations','crud','element-plus','com.ee.donations','donations','donations','宠物捐赠','ee','0','/','{\"parentMenuId\":2}','admin','2025-03-26 13:46:07','','2025-03-26 14:10:43',NULL);

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,1,'user_id','id','int','Long','userId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(2,1,'username','用户名','varchar(255)','String','username','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(3,1,'password','密码','varchar(255)','String','password','0','0','1','1','1','0','0','EQ','input','',3,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(4,1,'icon','头像地址','varchar(255)','String','icon','0','0','0','1','1','0','0','EQ','input','',4,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(5,1,'email','邮箱','varchar(255)','String','email','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(6,1,'phone','手机号','varchar(255)','String','phone','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(7,1,'gender','性别','int','Long','gender','0','0','1','1','1','1','1','EQ','select','sys_user_sex',7,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(8,1,'personality','性格','varchar(255)','String','personality','0','0','0','1','1','1','0','EQ','input','',8,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(9,1,'children','家里有无老人小孩','int','Long','children','0','0','0','1','1','1','1','EQ','select','children',9,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(10,1,'age','年龄','int','Long','age','0','0','0','1','1','1','1','EQ','input','',10,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(11,1,'wage','薪资范围','int','Long','wage','0','0','0','1','1','1','0','EQ','select','wage',11,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(12,1,'experience','养宠经验','tinyint(1)','Integer','experience','0','0','0','1','1','1','0','EQ','select','children',12,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(13,1,'cat_or_dog','偏爱猫还是狗','varchar(10)','String','catOrDog','0','0','0','1','1','1','0','EQ','input','',13,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(14,1,'timewithpet','一周能陪伴的时间','int','Long','timewithpet','0','0','0','1','1','1','0','EQ','select','users_accompany',14,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(15,1,'cleanwithpet','多长时间清洁一次','varchar(20)','String','cleanwithpet','0','0','0','1','1','1','0','EQ','input','',15,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(16,1,'bodytypewithpet','钟爱体型','varchar(20)','String','bodytypewithpet','0','0','0','1','1','1','0','EQ','input','',16,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(17,1,'environment','有无后院','varchar(20)','String','environment','0','0','0','1','1','1','0','EQ','input','',17,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(18,1,'petgender','偏爱公母','int','Long','petgender','0','0','0','1','1','1','0','EQ','select','pet_sex',18,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(19,1,'question_fk','反馈表的内容','varchar(255)','String','questionFk','0','0','0','1','1','1','0','EQ','input','',19,'admin','2025-03-12 19:42:12','','2025-03-12 21:53:06'),
(20,2,'pet_id','id','int','Long','petId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(21,2,'user_id','所属用户','int','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(22,2,'name','姓名','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(23,2,'gender','公母','int','Long','gender','0','0','1','1','1','1','1','EQ','select','pet_sex',4,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(24,2,'age','岁数（单位月份）','int','Long','age','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(25,2,'bodytype','体型','varchar(20)','String','bodytype','0','0','0','1','1','1','0','EQ','select','',6,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(26,2,'personality','性格','varchar(255)','String','personality','0','0','0','1','1','1','0','EQ','input','',7,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(27,2,'breed','品种','varchar(255)','String','breed','0','0','0','1','1','1','1','LIKE','input','',8,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(28,2,'cat_or_dog','分类','varchar(255)','String','catOrDog','0','0','1','1','1','1','1','EQ','input','',9,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(29,2,'vaccination','是否接种疫苗','tinyint(1)','Integer','vaccination','0','0','1','1','1','1','0','EQ','select','pet_v',10,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(30,2,'image_url','图片地址','varchar(255)','String','imageUrl','0','0','0','1','1','1','0','EQ','input','',11,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(31,2,'adoption_info','领养注释','varchar(255)','String','adoptionInfo','0','0','0','1','1','1','1','EQ','input','',12,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(32,2,'status','领养状态','int','Long','status','0','0','1','1','1','1','1','EQ','select','pet_status',13,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(33,2,'month_money','月消费能力','int','Long','monthMoney','0','0','0','1','1','1','0','EQ','input','',14,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(34,2,'cleanwithpet','容易脏程度','varchar(20)','String','cleanwithpet','0','0','0','1','1','1','0','EQ','input','',15,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(35,2,'environment','是否需要后院','varchar(20)','String','environment','0','0','0','1','1','1','0','EQ','input','',16,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(36,2,'energy','宠物精力程度','int','Long','energy','0','0','0','1','1','1','0','EQ','input','',17,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(37,2,'hair','脱毛','int','Long','hair','0','0','0','1','1','1','0','EQ','select','pet_hair',18,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(38,2,'score','匹配分数','int','Long','score','0','0','0','0','0','0','0','EQ','input','',19,'admin','2025-03-12 20:28:07','','2025-03-12 21:43:46'),
(39,3,'application_id','id','bigint','Long','applicationId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(40,3,'pet_id','宠物id','int','Long','petId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(41,3,'user_id','用户id','int','Long','userId','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(42,3,'applicant_name','申请人姓名','varchar(255)','String','applicantName','0','0','1','1','1','1','1','LIKE','input','',4,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(43,3,'applicant_contact','申请人联系方式','varchar(255)','String','applicantContact','0','0','1','1','1','1','0','EQ','input','',5,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(44,3,'applicant_address','申请人居住地址','varchar(255)','String','applicantAddress','0','0','1','1','1','1','0','EQ','input','',6,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(45,3,'applicant_age','申请人年纪','int','Long','applicantAge','0','0','1','1','1','1','0','EQ','input','',7,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(46,3,'application_date','申请日期','datetime','Date','applicationDate','0','0','1','1','1','1','0','EQ','datetime','',8,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(47,3,'pass_date','通过日期','datetime','Date','passDate','0','0','0','1','1','1','0','EQ','datetime','',9,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(48,3,'status','状态','int','Long','status','0','0','1','1','1','1','1','EQ','radio','app',10,'admin','2025-03-25 19:34:48','','2025-03-26 13:40:50'),
(49,4,'donation_id','id','bigint','Long','donationId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-03-26 13:46:07','','2025-03-26 14:10:43'),
(50,4,'user_id','用户id','int','Long','userId','0','0','0','1','1','1','0','EQ','input','',2,'admin','2025-03-26 13:46:07','','2025-03-26 14:10:43'),
(51,4,'name','宠物名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2025-03-26 13:46:07','','2025-03-26 14:10:43'),
(52,4,'gender','性别','int','Long','gender','0','0','0','1','1','1','0','EQ','input','',4,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(53,4,'age','年纪','int','Long','age','0','0','0','1','1','1','0','EQ','input','',5,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(54,4,'personality','性格','varchar(255)','String','personality','0','0','0','1','1','1','0','EQ','input','',6,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(55,4,'breed','品种','varchar(255)','String','breed','0','0','0','1','1','1','0','EQ','input','',7,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(56,4,'cat_or_dog','猫还是狗','varchar(10)','String','catOrDog','0','0','0','1','1','1','0','EQ','input','',8,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(57,4,'image_url','图片链接','varchar(255)','String','imageUrl','0','0','0','1','1','0','0','EQ','input','',9,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(58,4,'vaccination','接种疫苗','tinyint(1)','Integer','vaccination','0','0','1','1','1','1','1','EQ','input','',10,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(59,4,'adoption_info','领养备注','varchar(255)','String','adoptionInfo','0','0','0','1','1','1','0','EQ','input','',11,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(60,4,'donor_name','捐赠人真实姓名','varchar(255)','String','donorName','0','0','1','1','1','1','1','LIKE','input','',12,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(61,4,'donor_contact','捐赠人手机号','varchar(255)','String','donorContact','0','0','1','1','1','1','1','EQ','input','',13,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(62,4,'donation_date','捐赠日期','datetime','Date','donationDate','0','0','0','1','1','1','0','EQ','datetime','',14,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(63,4,'pass_date','审核通过时间','datetime','Date','passDate','0','0','0','1','1','1','0','EQ','datetime','',15,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43'),
(64,4,'status','审核状态','int','Long','status','0','0','1','1','1','1','1','EQ','radio','app',16,'admin','2025-03-26 13:46:08','','2025-03-26 14:10:43');

/*Table structure for table `pet_inventory` */

DROP TABLE IF EXISTS `pet_inventory`;

CREATE TABLE `pet_inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `current_quantity` int NOT NULL COMMENT '当前数量',
  `max_quantity` int NOT NULL COMMENT '最大容量',
  PRIMARY KEY (`inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pet_inventory` */

/*Table structure for table `pet_matching` */

DROP TABLE IF EXISTS `pet_matching`;

CREATE TABLE `pet_matching` (
  `match_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `pet_id` int DEFAULT NULL COMMENT '宠物id',
  `match_score` decimal(5,2) NOT NULL COMMENT '匹配分数',
  PRIMARY KEY (`match_id`),
  KEY `user_id` (`user_id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `pet_matching_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `pet_matching_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pet_matching` */

/*Table structure for table `pets` */

DROP TABLE IF EXISTS `pets`;

CREATE TABLE `pets` (
  `pet_id` int NOT NULL AUTO_INCREMENT COMMENT '宠物id',
  `user_id` int DEFAULT NULL COMMENT '关联用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `gender` int NOT NULL COMMENT '公母',
  `age` int NOT NULL COMMENT '岁数（单位月份）',
  `bodytype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '体型',
  `personality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '性格',
  `breed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '品种',
  `cat_or_dog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宠物种类',
  `vaccination` tinyint(1) NOT NULL COMMENT '是否打过疫苗',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关图片链接',
  `adoption_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '领养注释',
  `status` int NOT NULL COMMENT '领养状态',
  `month_money` int DEFAULT NULL COMMENT '月花销',
  `cleanwithpet` varchar(20) DEFAULT NULL COMMENT '容易脏程度',
  `environment` varchar(20) DEFAULT NULL COMMENT '是否需要后院',
  `energy` int DEFAULT NULL COMMENT '宠物精力',
  `hair` int DEFAULT NULL COMMENT '脱毛',
  `score` int DEFAULT NULL COMMENT '匹配分数',
  PRIMARY KEY (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pets` */

insert  into `pets`(`pet_id`,`user_id`,`name`,`gender`,`age`,`bodytype`,`personality`,`breed`,`cat_or_dog`,`vaccination`,`image_url`,`adoption_info`,`status`,`month_money`,`cleanwithpet`,`environment`,`energy`,`hair`,`score`) values 
(1,1,'小白',1,8,'中','活泼','英国短毛猫','猫',1,'/pet_imgs/c1.jpg','喜欢晒太阳',1,2,'一般','需要',1,1,45),
(2,2,'小黑',2,2,'小','沉稳','法斗','狗',2,'/pet_imgs/c2.jpg','喜欢安静',1,1,'不易脏','不需要',2,1,40),
(3,0,'小花',1,4,'大','懒惰','长毛猫','猫',1,'/pet_imgs/c7.jpg','喜欢玩具',1,3,'一般','需要',3,2,20),
(4,0,'小黄',1,6,'小','活泼','比熊','狗',2,'/pet_imgs/c5.jpg','喜欢陪伴',1,1,'易赃','不需要',4,1,6),
(5,0,'小蓝',2,3,'中','沉稳','金毛','狗',1,'/pet_imgs/c6.jpg','温顺可爱',2,2,'不易脏','需要',1,2,40),
(6,6,'小红',1,5,'小','懒惰','英国短毛','猫',2,'/pet_imgs/c4.jpg','喜欢安静',2,4,'一般','不需要',2,1,38),
(7,7,'小黑',2,3,'超大','活泼','阿拉斯加','狗',1,'/pet_imgs/c6.jpg','需要很多运动',2,3,'一般','需要',3,2,20),
(8,8,'小灰',1,8,'中','内向','波斯猫','猫',2,'/pet_imgs/c4.jpg','喜欢安静',1,1,'不易脏','不需要',1,1,45),
(9,9,'小橘',2,2,'小','活泼','小鹿犬','狗',1,'/pet_imgs/c6.jpg','喜欢跑步',1,2,'一般','需要',4,1,11),
(10,10,'小花',2,6,'中','沉稳','拉布拉多','狗',2,'/pet_imgs/c6.jpg','温顺耐性好',1,1,'不易脏','需要',3,2,40),
(11,11,'小龙',1,8,'超大','活泼','斗牛犬','狗',1,'/pet_imgs/c6.jpg','喜欢工作',1,3,'一般','不需要',4,1,6),
(12,12,'小美',2,4,'大','懒惰','西伯利亚哈士奇','狗',1,'/pet_imgs/c6.jpg','好动',1,2,'不易脏','需要',3,1,20),
(13,13,'小红',1,5,'中','活泼','金毛','狗',2,'/pet_imgs/c6.jpg','喜欢游泳',2,4,'易赃','不需要',4,1,6),
(14,14,'小白',2,7,'超大','懒惰','法斗','狗',1,'/pet_imgs/c6.jpg','没有太多需求',2,2,'一般','需要',1,1,20),
(15,15,'小灰',1,2,'小','内向','海狸犬','狗',2,'/pet_imgs/c6.jpg','喜欢咕噜',2,1,'不易脏','不需要',3,2,15),
(16,16,'小鸭',2,10,'超大','活泼','西高地白梗','狗',1,'/pet_imgs/c6.jpg','非常活泼',1,3,'一般','需要',4,1,11),
(17,17,'小胖',1,3,'中','沉稳','巴哥狗','狗',2,'/pet_imgs/c6.jpg','性格温和',1,4,'一般','不需要',1,2,35),
(18,18,'小金',1,9,'超大','内向','金田犬','狗',2,'/pet_imgs/c6.jpg','喜欢安静的地方',2,1,'不易脏','需要',3,1,15),
(19,19,'小绿',2,6,'中','活泼','比特犬','狗',1,'/pet_imgs/c6.jpg','需要很多锻炼',2,2,'一般','需要',3,2,20),
(20,20,'小土',1,7,'大','沉稳','法兰西犬','狗',2,'/pet_imgs/c6.jpg','性格温和',1,4,'不易脏','不需要',2,2,35),
(21,21,'小欢',1,5,'中','活泼','美国可卡犬','狗',1,'/pet_imgs/c6.jpg','喜欢玩耍',2,3,'一般','需要',5,2,0),
(22,22,'小颂',2,8,'超大','沉稳','巨型雪纳瑞','狗',1,'/pet_imgs/c6.jpg','喜欢安静',1,3,'不易脏','不需要',1,2,40),
(23,23,'小晨',1,10,'小','活泼','博美犬','狗',1,'/pet_imgs/c6.jpg','小巧可爱',1,2,'一般','需要',4,2,6),
(24,24,'小明',2,9,'中','懒惰','拿破仑猫','猫',1,'/pet_imgs/c6.jpg','喜欢安静',2,1,'不易脏','不需要',1,1,65),
(25,25,'小桂',1,1,'小','活泼','查理王小猎犬','狗',1,'/pet_imgs/c6.jpg','喜欢游玩',2,2,'易赃','需要',5,1,0),
(26,26,'小丽',2,4,'大','内向','波士顿梗','狗',2,'/pet_imgs/c6.jpg','喜欢安静',1,3,'不易脏','不需要',2,2,20),
(27,27,'小如',1,6,'小','活泼','巴基斯坦狗','狗',1,'/pet_imgs/c6.jpg','喜欢活动',1,2,'一般','需要',5,1,0),
(28,28,'小欢',2,8,'超大','沉稳','德牧','狗',1,'/pet_imgs/c6.jpg','性格温和',2,1,'不易脏','需要',3,2,40),
(29,29,'小彬',1,7,'大','活泼','腊肠犬','狗',1,'/pet_imgs/c6.jpg','喜欢跑',1,2,'一般','需要',4,2,6),
(30,30,'小希',1,5,'小','沉稳','哪些西高地','狗',1,'/pet_imgs/c6.jpg','很安静',2,3,'不易脏','不需要',1,1,35),
(31,31,'小振',2,6,'超大','活泼','可卡犬','狗',2,'/pet_imgs/c6.jpg','对人很好',1,2,'一般','需要',5,1,5),
(32,32,'小松',1,9,'小','沉稳','雅莉犬','狗',1,'/pet_imgs/c6.jpg','讨人喜欢',2,3,'不易脏','需要',1,2,35),
(33,33,'小英',2,4,'中','活泼','美国短毛','猫',2,'/pet_imgs/c6.jpg','精力旺盛',2,4,'一般','需要',4,1,38),
(34,34,'小辰',1,7,'超大','内向','金斑','狗',1,'/pet_imgs/c6.jpg','温文尔雅',1,3,'不易脏','不需要',2,2,15),
(35,35,'小豆',2,6,'小','活泼','日本贵宾犬','狗',2,'/pet_imgs/c6.jpg','喜欢玩耍',2,4,'一般','需要',5,2,5),
(36,36,'小瑞',1,3,'中','沉稳','哈士奇','狗',1,'/pet_imgs/c6.jpg','比较依赖主人',1,2,'不易脏','不需要',2,1,35),
(37,37,'小星',2,2,'小','活泼','敦文犬','狗',2,'/pet_imgs/c6.jpg','需要很多陪伴',2,1,'一般','不需要',4,1,11),
(38,38,'小梦',1,10,'大','懒惰','拉布拉多','狗',1,'/pet_imgs/c6.jpg','喜欢晒太阳',1,3,'不易脏','需要',1,1,15),
(39,39,'小天',2,4,'中','活泼','英国家庭犬','狗',2,'/pet_imgs/c6.jpg','好动好学',1,1,'易赃','需要',4,2,11),
(40,40,'小茶',1,2,'小','懒惰','柯基','狗',2,'/pet_imgs/c6.jpg','需要轻松的生活',2,1,'不易脏','不需要',1,2,15),
(41,41,'小果',2,8,'大','沉稳','金毛','狗',1,'/pet_imgs/c6.jpg','回家后会乖乖等候',2,3,'一般','需要',2,1,40),
(42,42,'小雅',1,7,'中','活泼','博美','狗',2,'/pet_imgs/c6.jpg','喜欢玩耍',1,4,'易赃','需要',5,1,0),
(43,43,'小梅',2,10,'大','沉稳','斗牛犬','狗',1,'/pet_imgs/c6.jpg','想安静待着',1,3,'不易脏','需要',1,1,40),
(44,44,'小彬',1,6,'小','活泼','中华田园犬','狗',2,'/pet_imgs/c6.jpg','无忧无虑',1,2,'一般','需要',3,2,15),
(45,45,'小美',2,8,'超大','沉稳','贵宾犬','狗',1,'/pet_imgs/c6.jpg','性格温和',2,1,'不易脏','需要',2,1,40),
(46,46,'小蓝',1,5,'小','活泼','秋田犬','狗',1,'/pet_imgs/c6.jpg','乐观开朗',2,2,'一般','不需要',4,1,6),
(47,47,'小雨',2,1,'中','沉稳','爱尔兰猎鹿犬','狗',2,'/pet_imgs/c6.jpg','温顺听话',2,2,'易赃','需要',3,2,40),
(48,48,'小风',1,4,'大','活泼','西施','狗',1,'/pet_imgs/c6.jpg','容易激动',1,4,'不易脏','需要',4,2,6),
(49,49,'小乐',2,6,'小','懒惰','拉布拉多','狗',2,'/pet_imgs/c6.jpg','爱吃',2,1,'不易脏','不需要',2,1,20),
(50,50,'小莉',2,2,'超大','活泼','约克夏','狗',1,'/pet_imgs/c6.jpg','喜欢活动',1,4,'容易脏','需要',5,1,5),
(51,51,'小明',1,5,'小','活泼','柴犬','狗',2,'/pet_imgs/c6.jpg','活力四射',1,3,'一般','需要',5,2,0),
(52,52,'小米',2,6,'中','沉稳','长毛猫','猫',1,'/pet_imgs/c6.jpg','喜欢爬高',1,1,'一般','不需要',2,1,40),
(53,53,'小龙',1,8,'大','活泼','德国牧羊犬','狗',2,'/pet_imgs/c6.jpg','护卫意识强',2,3,'不易脏','需要',4,1,6),
(54,54,'小瑞',2,3,'小','沉稳','田园犬','狗',1,'/pet_imgs/c6.jpg','陪伴力量大',2,3,'不易脏','不需要',2,1,40),
(55,55,'小胖',1,6,'超大','活泼','安哥拉猫','猫',2,'/pet_imgs/c6.jpg','喜欢被人爱',2,1,'易赃','需要',5,1,25),
(56,56,'小淑',2,9,'中','沉稳','比特犬','狗',2,'/pet_imgs/c6.jpg','不喜欢吵闹',2,3,'一般','不需要',2,1,40),
(57,57,'小芳',1,4,'小','活泼','意大利灰狗','狗',1,'/pet_imgs/c6.jpg','喜欢奔跑',1,3,'易赃','需要',5,2,0),
(58,58,'小松',2,10,'中','活泼','人棉毛小狗','狗',1,'/pet_imgs/c6.jpg','朋友',1,1,'一般','需要',4,1,11),
(59,59,'小亮',2,8,'大','沉稳','藏獒','狗',1,'/pet_imgs/c6.jpg','守卫家园',2,3,'不易脏','不需要',2,1,40),
(60,60,'小桂',1,1,'小','外向','巴哥狗','狗',1,'/pet_imgs/c6.jpg','活泼好动',2,4,'易赃','需要',5,1,0),
(61,61,'小恳',1,6,'超大','沉稳','拉布拉多','狗',1,'/pet_imgs/c6.jpg','喜欢陪伴',1,3,'一般','需要',2,1,35),
(62,62,'小晨',1,7,'中','活泼','金田犬','狗',2,'/pet_imgs/c6.jpg','想表现自己',1,2,'不易脏','不需要',3,2,15),
(63,63,'小瑞',2,9,'小','内向','法国斗牛犬','狗',1,'/pet_imgs/c6.jpg','不太喜欢吵',1,1,'一般','需要',2,1,20),
(64,64,'小冬',1,5,'大','活泼','格力犬','狗',1,'/pet_imgs/c6.jpg','性格活泼',1,3,'不易脏','需要',4,1,6),
(65,65,'小圭',2,3,'小','内向','爱尔兰猎犬','狗',2,'/pet_imgs/c6.jpg','需要主人的注意',1,2,'一般','不需要',1,1,20),
(66,66,'小清',1,6,'大','外向','哈士奇','狗',1,'/pet_imgs/c6.jpg','喜欢认识新朋友',1,3,'不易脏','需要',4,1,6),
(67,67,'小圆',2,1,'小','活泼','史宾格','狗',2,'/pet_imgs/c6.jpg','需要互动',1,2,'一般','不需要',5,1,5),
(68,68,'小岛',1,2,'超大','懒惰','大白熊犬','狗',1,'/pet_imgs/c6.jpg','容易吃多',2,1,'不易脏','不需要',1,1,15),
(69,69,'小彤',2,3,'小','活泼','小型雪纳瑞','狗',2,'/pet_imgs/c6.jpg','充满活力',1,4,'容易赃','需要',5,1,5),
(70,70,'小百',1,9,'超大','沉稳','干虾餐','猫',2,'/pet_imgs/c6.jpg','体型较大',2,3,'一般','不需要',2,1,63),
(71,71,'小强',2,8,'中','活泼','比特犬','狗',2,'/pet_imgs/c6.jpg','好动',1,2,'不易脏','需要',4,2,11),
(72,72,'小福',1,7,'小','懒惰','英短','猫',2,'/pet_imgs/c6.jpg','喜欢发呆',1,2,'不易脏','不需要',1,1,45),
(73,73,'小亮',2,4,'大','沉稳','大耳猫','猫',1,'/pet_imgs/c6.jpg','喜欢安宁',1,2,'不易脏','需要',2,1,40),
(74,74,'小小',1,6,'小','活泼','奶牛猫','猫',1,'/pet_imgs/c6.jpg','好动好学',2,3,'一般','不需要',4,1,28),
(75,75,'小禾',2,3,'大','活泼','松狮犬','狗',1,'/pet_imgs/c6.jpg','无忧无虑',1,3,'不易脏','需要',5,2,5),
(76,76,'小孩',1,1,'中','懒惰','圣伯纳犬','狗',2,'/pet_imgs/c6.jpg','喜欢安静的生活',2,1,'不易脏','不需要',3,1,15),
(77,77,'小威',1,7,'中','外向','边牧','狗',1,'/pet_imgs/c6.jpg','技能强大',1,2,'容易脅','需要',5,1,0),
(78,78,'小强',2,5,'超大','沉稳','白色猫','猫',2,'/pet_imgs/c6.jpg','性格温和',1,2,'一般','不需要',2,1,40),
(79,79,'小凤',1,8,'中','活泼','美国柯基','狗',1,'/pet_imgs/c6.jpg','总是盯着食物',2,3,'一般','需要',4,2,6),
(80,80,'小龙',1,6,'大','内向','波斯猫','猫',2,'/pet_imgs/c6.jpg','喜欢待在高处',2,4,'不易脏','不需要',1,2,38),
(81,81,'小李',2,5,'小','活泼','拉布拉多','狗',1,'/pet_imgs/c6.jpg','好动爱浪',1,2,'一般','需要',5,1,5),
(82,82,'小雨',2,9,'大','沉稳','虎皮鹦鹉','猫',1,'/pet_imgs/c6.jpg','容易养活',2,3,'不易脏','需要',2,1,68),
(83,83,'小杰',1,3,'超大','活泼','秋田犬','狗',1,'/pet_imgs/c6.jpg','需要大量运动',1,4,'一般','需要',5,2,0),
(84,84,'小波',2,10,'小','沉稳','开普犬','狗',1,'/pet_imgs/c6.jpg','开朗但不爱吵',1,1,'不易脏','不需要',1,1,40),
(85,85,'小泰',2,6,'中','懒惰','柯基犬','狗',1,'/pet_imgs/c6.jpg','懒散生活',2,2,'一般','需要',1,1,20),
(86,86,'小月',1,4,'小','活泼','贵宾犬','狗',2,'/pet_imgs/c6.jpg','人见人爱',1,2,'易赃','需要',4,1,6),
(87,87,'小木',2,1,'超大','沉稳','挪威森林猫','猫',2,'/pet_imgs/c6.jpg','安静温柔',1,1,'不易脏','不需要',2,2,30),
(88,88,'小丽',2,10,'大','活泼','比特犬','狗',1,'/pet_imgs/c6.jpg','善良',1,3,'一般','需要',4,2,11),
(89,89,'小海',1,8,'超大','沉稳','哈士奇','狗',2,'/pet_imgs/c6.jpg','长得好',2,1,'不易脏','不需要',2,1,35),
(90,90,'小明',2,5,'中','外向','边牧犬','狗',1,'/pet_imgs/c6.jpg','喜欢学习',2,4,'一般','需要',5,2,5),
(91,91,'小南',1,2,'超大','懒惰','圣伯纳犬','狗',1,'/pet_imgs/c6.jpg','需要吃好',1,3,'易赃','需要',1,1,15),
(92,92,'小晨',2,8,'小','沉稳','西高地','狗',1,'/pet_imgs/c6.jpg','需要安静',2,4,'一般','不需要',2,1,40),
(93,93,'小冬',1,5,'中','外向','泰迪','狗',2,'/pet_imgs/c6.jpg','热情',1,1,'不易脏','需要',5,1,0),
(94,94,'小杨',2,10,'小','活泼','斗牛犬','狗',2,'/pet_imgs/c6.jpg','活泼可爱',1,3,'一般','需要',4,1,11),
(95,95,'小峰',1,6,'大','沉稳','西高地白犬','狗',1,'/pet_imgs/c6.jpg','性格温和',2,2,'不易脏','不需要',2,1,35),
(96,96,'小林',2,4,'小','外向','柯基犬','狗',2,'/pet_imgs/c6.jpg','人见人爱',1,2,'无需清理','需要',5,2,5),
(97,97,'小青',1,5,'中','懒惰','嗜睡猫','猫',2,'/pet_imgs/c6.jpg','不喜欢活动',1,3,'不易脏','不需要',1,1,38),
(98,98,'小洋',2,6,'超大','活泼','掘土巴尔鲍','狗',1,'/pet_imgs/c6.jpg','乐于帮助',1,3,'一般','需要',5,1,5),
(99,99,'小玉',1,2,'小','沉稳','波米犬','狗',1,'/pet_imgs/c6.jpg','态度温和',2,2,'不易脏','需要',1,1,35),
(100,100,'小飞',2,3,'超大','活泼','金毛','狗',2,'/pet_imgs/c6.jpg','朋友一样',2,4,'一般','需要',4,1,11),
(101,112,'1',1,1,NULL,'1','狗','狗',0,'/pet_imgs/c6.jpg','1',1,0,NULL,NULL,0,0,0);

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';

/*Data for the table `qrtz_locks` */

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';

/*Data for the table `qrtz_scheduler_state` */

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';

/*Data for the table `qrtz_triggers` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-03-01 14:23:38','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-03-01 14:23:38','',NULL,'初始化密码 123456'),
(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-03-01 14:23:38','',NULL,'深色主题theme-dark，浅色主题theme-light'),
(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2025-03-01 14:23:38','',NULL,'是否开启验证码功能（true开启，false关闭）'),
(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2025-03-01 14:23:38','',NULL,'是否开启注册用户功能（true开启，false关闭）'),
(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-03-01 14:23:38','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL),
(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL),
(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL),
(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL),
(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL),
(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL),
(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL),
(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL),
(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL),
(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-03-01 14:23:36','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,1,'男','1','sys_user_sex','','','Y','0','admin','2025-03-01 14:23:38','admin','2025-03-12 21:17:07','性别男'),
(2,2,'女','2','sys_user_sex','','','N','0','admin','2025-03-01 14:23:38','admin','2025-03-12 21:17:12','性别女'),
(3,3,'未知','3','sys_user_sex','','','N','0','admin','2025-03-01 14:23:38','admin','2025-03-12 21:17:16','性别未知'),
(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'显示菜单'),
(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'隐藏菜单'),
(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'正常状态'),
(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'停用状态'),
(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'正常状态'),
(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'停用状态'),
(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-03-01 14:23:38','',NULL,'默认分组'),
(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-03-01 14:23:38','',NULL,'系统分组'),
(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'系统默认是'),
(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'系统默认否'),
(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-03-01 14:23:38','',NULL,'通知'),
(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-03-01 14:23:38','',NULL,'公告'),
(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'正常状态'),
(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'关闭状态'),
(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-03-01 14:23:38','',NULL,'其他操作'),
(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-03-01 14:23:38','',NULL,'新增操作'),
(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-03-01 14:23:38','',NULL,'修改操作'),
(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'删除操作'),
(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-03-01 14:23:38','',NULL,'授权操作'),
(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-03-01 14:23:38','',NULL,'导出操作'),
(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-03-01 14:23:38','',NULL,'导入操作'),
(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'强退操作'),
(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-03-01 14:23:38','',NULL,'生成操作'),
(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'清空操作'),
(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-03-01 14:23:38','',NULL,'正常状态'),
(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'停用状态'),
(100,1,'公','1','pet_sex',NULL,'default','N','0','admin','2025-03-12 21:19:00','',NULL,NULL),
(101,2,'母','2','pet_sex',NULL,'default','N','0','admin','2025-03-12 21:19:38','',NULL,NULL),
(102,1,'宠物救助平台','0','pet_belong',NULL,'default','N','0','admin','2025-03-12 21:22:17','',NULL,NULL),
(103,1,'易脱毛','1','pet_hair',NULL,'default','N','0','admin','2025-03-12 21:26:15','',NULL,NULL),
(104,2,'不易脱毛','2','pet_hair',NULL,'default','N','0','admin','2025-03-12 21:26:30','',NULL,NULL),
(105,1,'可领养','1','pet_status',NULL,'default','N','0','admin','2025-03-12 21:28:37','',NULL,NULL),
(106,2,'不可','2','pet_status',NULL,'default','N','0','admin','2025-03-12 21:28:57','',NULL,NULL),
(107,1,'是','1','pet_v',NULL,'default','N','0','admin','2025-03-12 21:32:10','admin','2025-03-26 14:02:28',NULL),
(108,2,'否','2','pet_v',NULL,'default','N','0','admin','2025-03-12 21:32:16','',NULL,NULL),
(109,1,'有','1','user_exp',NULL,'default','N','0','admin','2025-03-12 21:46:38','',NULL,NULL),
(110,2,'无','2','user_exp',NULL,'default','N','0','admin','2025-03-12 21:46:44','',NULL,NULL),
(111,1,'3000以内','1','wage',NULL,'default','N','0','admin','2025-03-12 21:47:50','admin','2025-03-12 21:48:03',NULL),
(112,2,'3000-6000','2','wage',NULL,'default','N','0','admin','2025-03-12 21:48:14','',NULL,NULL),
(113,3,'6000-1万','3','wage',NULL,'default','N','0','admin','2025-03-12 21:48:29','',NULL,NULL),
(114,4,'1万以上','4','wage',NULL,'default','N','0','admin','2025-03-12 21:48:41','',NULL,NULL),
(115,1,'有','1','children',NULL,'default','N','0','admin','2025-03-12 21:49:25','',NULL,NULL),
(116,2,'无','2','children',NULL,'default','N','0','admin','2025-03-12 21:49:36','',NULL,NULL),
(117,1,'较少','1','users_accompany',NULL,'default','N','0','admin','2025-03-12 21:51:01','',NULL,NULL),
(118,2,'一般','2','users_accompany',NULL,'default','N','0','admin','2025-03-12 21:51:10','',NULL,NULL),
(119,3,'经常','3','users_accompany',NULL,'default','N','0','admin','2025-03-12 21:51:19','',NULL,NULL),
(120,4,'较多','4','users_accompany',NULL,'default','N','0','admin','2025-03-12 21:51:27','',NULL,NULL),
(121,1,'审核中','1','app','1','default','N','0','admin','2025-03-26 00:04:48','admin','2025-03-26 00:05:23',NULL),
(122,2,'已通过','2','app','1','default','N','0','admin','2025-03-26 00:05:43','admin','2025-03-26 00:06:07',NULL),
(123,3,'未通过','3','app','1','default','N','0','admin','2025-03-26 00:06:17','admin','2025-03-26 00:06:26',NULL),
(124,0,'已接种','1','don','1','default','N','0','admin','2025-03-26 14:08:16','',NULL,NULL),
(125,0,'未接种','2','don','1','default','N','0','admin','2025-03-26 14:08:26','',NULL,NULL);

/*Table structure for table `sys_dict_data_copy` */

DROP TABLE IF EXISTS `sys_dict_data_copy`;

CREATE TABLE `sys_dict_data_copy` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data_copy` */

insert  into `sys_dict_data_copy`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,1,'男','1','sys_user_sex','','','Y','0','admin','2025-03-01 14:23:38','admin','2025-03-12 21:17:07','性别男'),
(2,2,'女','2','sys_user_sex','','','N','0','admin','2025-03-01 14:23:38','admin','2025-03-12 21:17:12','性别女'),
(3,3,'未知','3','sys_user_sex','','','N','0','admin','2025-03-01 14:23:38','admin','2025-03-12 21:17:16','性别未知'),
(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'显示菜单'),
(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'隐藏菜单'),
(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'正常状态'),
(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'停用状态'),
(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'正常状态'),
(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'停用状态'),
(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-03-01 14:23:38','',NULL,'默认分组'),
(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-03-01 14:23:38','',NULL,'系统分组'),
(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'系统默认是'),
(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'系统默认否'),
(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-03-01 14:23:38','',NULL,'通知'),
(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-03-01 14:23:38','',NULL,'公告'),
(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-03-01 14:23:38','',NULL,'正常状态'),
(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'关闭状态'),
(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-03-01 14:23:38','',NULL,'其他操作'),
(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-03-01 14:23:38','',NULL,'新增操作'),
(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-03-01 14:23:38','',NULL,'修改操作'),
(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'删除操作'),
(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-03-01 14:23:38','',NULL,'授权操作'),
(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-03-01 14:23:38','',NULL,'导出操作'),
(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-03-01 14:23:38','',NULL,'导入操作'),
(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'强退操作'),
(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-03-01 14:23:38','',NULL,'生成操作'),
(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'清空操作'),
(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-03-01 14:23:38','',NULL,'正常状态'),
(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-03-01 14:23:38','',NULL,'停用状态'),
(100,1,'公','1','pet_sex',NULL,'default','N','0','admin','2025-03-12 21:19:00','',NULL,NULL),
(101,2,'母','2','pet_sex',NULL,'default','N','0','admin','2025-03-12 21:19:38','',NULL,NULL),
(102,1,'宠物救助平台','0','pet_belong',NULL,'default','N','0','admin','2025-03-12 21:22:17','',NULL,NULL),
(103,1,'易脱毛','1','pet_hair',NULL,'default','N','0','admin','2025-03-12 21:26:15','',NULL,NULL),
(104,2,'不易脱毛','2','pet_hair',NULL,'default','N','0','admin','2025-03-12 21:26:30','',NULL,NULL),
(105,1,'可领养','1','pet_status',NULL,'default','N','0','admin','2025-03-12 21:28:37','',NULL,NULL),
(106,2,'不可','2','pet_status',NULL,'default','N','0','admin','2025-03-12 21:28:57','',NULL,NULL),
(107,1,'是','1','pet_v',NULL,'default','N','0','admin','2025-03-12 21:32:10','admin','2025-03-26 14:02:28',NULL),
(108,2,'否','2','pet_v',NULL,'default','N','0','admin','2025-03-12 21:32:16','',NULL,NULL),
(109,1,'有','1','user_exp',NULL,'default','N','0','admin','2025-03-12 21:46:38','',NULL,NULL),
(110,2,'无','2','user_exp',NULL,'default','N','0','admin','2025-03-12 21:46:44','',NULL,NULL),
(111,1,'3000以内','1','wage',NULL,'default','N','0','admin','2025-03-12 21:47:50','admin','2025-03-12 21:48:03',NULL),
(112,2,'3000-6000','2','wage',NULL,'default','N','0','admin','2025-03-12 21:48:14','',NULL,NULL),
(113,3,'6000-1万','3','wage',NULL,'default','N','0','admin','2025-03-12 21:48:29','',NULL,NULL),
(114,4,'1万以上','4','wage',NULL,'default','N','0','admin','2025-03-12 21:48:41','',NULL,NULL),
(115,1,'有','1','children',NULL,'default','N','0','admin','2025-03-12 21:49:25','',NULL,NULL),
(116,2,'无','2','children',NULL,'default','N','0','admin','2025-03-12 21:49:36','',NULL,NULL),
(117,1,'较少','1','users_accompany',NULL,'default','N','0','admin','2025-03-12 21:51:01','',NULL,NULL),
(118,2,'一般','2','users_accompany',NULL,'default','N','0','admin','2025-03-12 21:51:10','',NULL,NULL),
(119,3,'经常','3','users_accompany',NULL,'default','N','0','admin','2025-03-12 21:51:19','',NULL,NULL),
(120,4,'较多','4','users_accompany',NULL,'default','N','0','admin','2025-03-12 21:51:27','',NULL,NULL),
(121,1,'审核中','1','app','1','default','N','0','admin','2025-03-26 00:04:48','admin','2025-03-26 00:05:23',NULL),
(122,2,'已通过','2','app','1','default','N','0','admin','2025-03-26 00:05:43','admin','2025-03-26 00:06:07',NULL),
(123,3,'未通过','3','app','1','default','N','0','admin','2025-03-26 00:06:17','admin','2025-03-26 00:06:26',NULL),
(124,0,'已接种','1','don','1','default','N','0','admin','2025-03-26 14:08:16','',NULL,NULL),
(125,0,'未接种','2','don','1','default','N','0','admin','2025-03-26 14:08:26','',NULL,NULL);

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'用户性别','sys_user_sex','0','admin','2025-03-01 14:23:38','',NULL,'用户性别列表'),
(2,'菜单状态','sys_show_hide','0','admin','2025-03-01 14:23:38','',NULL,'菜单状态列表'),
(3,'系统开关','sys_normal_disable','0','admin','2025-03-01 14:23:38','',NULL,'系统开关列表'),
(4,'任务状态','sys_job_status','0','admin','2025-03-01 14:23:38','',NULL,'任务状态列表'),
(5,'任务分组','sys_job_group','0','admin','2025-03-01 14:23:38','',NULL,'任务分组列表'),
(6,'系统是否','sys_yes_no','0','admin','2025-03-01 14:23:38','',NULL,'系统是否列表'),
(7,'通知类型','sys_notice_type','0','admin','2025-03-01 14:23:38','',NULL,'通知类型列表'),
(8,'通知状态','sys_notice_status','0','admin','2025-03-01 14:23:38','',NULL,'通知状态列表'),
(9,'操作类型','sys_oper_type','0','admin','2025-03-01 14:23:38','',NULL,'操作类型列表'),
(10,'系统状态','sys_common_status','0','admin','2025-03-01 14:23:38','',NULL,'登录状态列表'),
(100,'宠物性别','pet_sex','0','admin','2025-03-12 21:18:25','',NULL,'宠物性别'),
(101,'宠物所属','pet_belong','0','admin','2025-03-12 21:21:27','',NULL,NULL),
(102,'宠物脱毛','pet_hair','0','admin','2025-03-12 21:25:56','',NULL,NULL),
(103,'宠物状态','pet_status','0','admin','2025-03-12 21:28:12','',NULL,NULL),
(104,'宠物疫苗','pet_v','0','admin','2025-03-12 21:31:56','',NULL,NULL),
(105,'养宠经验','user_exp','0','admin','2025-03-12 21:46:27','',NULL,NULL),
(106,'薪资范围','wage','0','admin','2025-03-12 21:47:13','',NULL,NULL),
(107,'老人小孩','children','0','admin','2025-03-12 21:49:13','',NULL,NULL),
(108,'陪伴时间','users_accompany','0','admin','2025-03-12 21:50:48','',NULL,NULL),
(109,'app','app','0','admin','2025-03-26 00:03:15','',NULL,'申请'),
(110,'don','don','0','admin','2025-03-26 14:07:51','',NULL,'捐赠');

/*Table structure for table `sys_dict_type_copy` */

DROP TABLE IF EXISTS `sys_dict_type_copy`;

CREATE TABLE `sys_dict_type_copy` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type_copy` */

insert  into `sys_dict_type_copy`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'用户性别','sys_user_sex','0','admin','2025-03-01 14:23:38','',NULL,'用户性别列表'),
(2,'菜单状态','sys_show_hide','0','admin','2025-03-01 14:23:38','',NULL,'菜单状态列表'),
(3,'系统开关','sys_normal_disable','0','admin','2025-03-01 14:23:38','',NULL,'系统开关列表'),
(4,'任务状态','sys_job_status','0','admin','2025-03-01 14:23:38','',NULL,'任务状态列表'),
(5,'任务分组','sys_job_group','0','admin','2025-03-01 14:23:38','',NULL,'任务分组列表'),
(6,'系统是否','sys_yes_no','0','admin','2025-03-01 14:23:38','',NULL,'系统是否列表'),
(7,'通知类型','sys_notice_type','0','admin','2025-03-01 14:23:38','',NULL,'通知类型列表'),
(8,'通知状态','sys_notice_status','0','admin','2025-03-01 14:23:38','',NULL,'通知状态列表'),
(9,'操作类型','sys_oper_type','0','admin','2025-03-01 14:23:38','',NULL,'操作类型列表'),
(10,'系统状态','sys_common_status','0','admin','2025-03-01 14:23:38','',NULL,'登录状态列表'),
(100,'宠物性别','pet_sex','0','admin','2025-03-12 21:18:25','',NULL,'宠物性别'),
(101,'宠物所属','pet_belong','0','admin','2025-03-12 21:21:27','',NULL,NULL),
(102,'宠物脱毛','pet_hair','0','admin','2025-03-12 21:25:56','',NULL,NULL),
(103,'宠物状态','pet_status','0','admin','2025-03-12 21:28:12','',NULL,NULL),
(104,'宠物疫苗','pet_v','0','admin','2025-03-12 21:31:56','',NULL,NULL),
(105,'养宠经验','user_exp','0','admin','2025-03-12 21:46:27','',NULL,NULL),
(106,'薪资范围','wage','0','admin','2025-03-12 21:47:13','',NULL,NULL),
(107,'老人小孩','children','0','admin','2025-03-12 21:49:13','',NULL,NULL),
(108,'陪伴时间','users_accompany','0','admin','2025-03-12 21:50:48','',NULL,NULL),
(109,'app','app','0','admin','2025-03-26 00:03:15','',NULL,'申请'),
(110,'don','don','0','admin','2025-03-26 14:07:51','',NULL,'捐赠');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-03-01 14:23:38','',NULL,''),
(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-03-01 14:23:38','',NULL,''),
(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-03-01 14:23:38','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values 
(100,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-03-02 19:40:14'),
(101,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-02 19:40:17'),
(102,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-12 19:11:26'),
(103,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-03-12 19:41:36'),
(104,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-12 19:41:43'),
(105,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-12 23:12:44'),
(106,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-03-12 23:13:46'),
(107,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-12 23:17:43'),
(108,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-03-12 23:34:25'),
(109,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-13 17:28:18'),
(110,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-25 19:05:42'),
(111,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码已失效','2025-03-25 23:05:30'),
(112,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-25 23:05:41'),
(113,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-25 23:35:01'),
(114,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-26 13:35:20'),
(115,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-26 14:53:10'),
(116,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-03-26 15:00:13'),
(117,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-03-26 15:00:16'),
(118,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-26 15:00:20'),
(119,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-03-26 15:01:39'),
(120,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-26 15:02:41'),
(121,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-03-26 15:14:24'),
(122,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-26 15:14:58'),
(123,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-03-26 15:15:07'),
(124,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-26 15:15:27'),
(125,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-03-26 22:09:04'),
(126,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误','2026-04-22 11:05:41'),
(127,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误','2026-04-22 11:05:45'),
(128,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-04-22 11:05:53'),
(129,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-04-23 13:38:45');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2031 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-03-01 14:23:36','admin','2025-03-13 17:29:23','系统管理目录'),
(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-03-01 14:23:36','',NULL,'系统监控目录'),
(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2025-03-01 14:23:36','admin','2025-03-26 22:09:26','系统工具目录'),
(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','1','0','','guide','admin','2025-03-01 14:23:36','admin','2025-03-13 17:28:41','若依官网地址'),
(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2025-03-01 14:23:36','',NULL,'用户管理菜单'),
(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2025-03-01 14:23:36','',NULL,'角色管理菜单'),
(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-03-01 14:23:36','',NULL,'菜单管理菜单'),
(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2025-03-01 14:23:36','',NULL,'部门管理菜单'),
(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2025-03-01 14:23:36','',NULL,'岗位管理菜单'),
(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2025-03-01 14:23:36','',NULL,'字典管理菜单'),
(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2025-03-01 14:23:36','',NULL,'参数设置菜单'),
(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-03-01 14:23:36','',NULL,'通知公告菜单'),
(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-03-01 14:23:36','',NULL,'日志管理菜单'),
(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-03-01 14:23:36','',NULL,'在线用户菜单'),
(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2025-03-01 14:23:36','',NULL,'定时任务菜单'),
(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2025-03-01 14:23:36','',NULL,'数据监控菜单'),
(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2025-03-01 14:23:36','',NULL,'服务监控菜单'),
(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2025-03-01 14:23:36','',NULL,'缓存监控菜单'),
(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2025-03-01 14:23:36','',NULL,'缓存列表菜单'),
(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2025-03-01 14:23:36','',NULL,'表单构建菜单'),
(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-03-01 14:23:36','',NULL,'代码生成菜单'),
(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2025-03-01 14:23:36','',NULL,'系统接口菜单'),
(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2025-03-01 14:23:36','',NULL,'操作日志菜单'),
(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2025-03-01 14:23:36','',NULL,'登录日志菜单'),
(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-03-01 14:23:36','',NULL,''),
(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-03-01 14:23:36','',NULL,''),
(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-03-01 14:23:36','',NULL,''),
(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-03-01 14:23:36','',NULL,''),
(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-03-01 14:23:36','',NULL,''),
(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-03-01 14:23:36','',NULL,''),
(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-03-01 14:23:36','',NULL,''),
(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-03-01 14:23:36','',NULL,''),
(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-03-01 14:23:36','',NULL,''),
(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-03-01 14:23:36','',NULL,''),
(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-03-01 14:23:36','',NULL,''),
(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-03-01 14:23:36','',NULL,''),
(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-03-01 14:23:36','',NULL,''),
(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-03-01 14:23:36','',NULL,''),
(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-03-01 14:23:36','',NULL,''),
(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-03-01 14:23:36','',NULL,''),
(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-03-01 14:23:36','',NULL,''),
(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-03-01 14:23:36','',NULL,''),
(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-03-01 14:23:36','',NULL,''),
(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-03-01 14:23:36','',NULL,''),
(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-03-01 14:23:36','',NULL,''),
(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-03-01 14:23:36','',NULL,''),
(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-03-01 14:23:36','',NULL,''),
(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-03-01 14:23:37','',NULL,''),
(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-03-01 14:23:37','',NULL,''),
(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-03-01 14:23:37','',NULL,''),
(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-03-01 14:23:37','',NULL,''),
(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-03-01 14:23:37','',NULL,''),
(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-03-01 14:23:37','',NULL,''),
(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-03-01 14:23:37','',NULL,''),
(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-03-01 14:23:37','',NULL,''),
(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-03-01 14:23:37','',NULL,''),
(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-03-01 14:23:37','',NULL,''),
(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-03-01 14:23:37','',NULL,''),
(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-03-01 14:23:37','',NULL,''),
(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-03-01 14:23:37','',NULL,''),
(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-03-01 14:23:37','',NULL,''),
(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-03-01 14:23:37','',NULL,''),
(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-03-01 14:23:37','',NULL,''),
(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2025-03-01 14:23:37','',NULL,''),
(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2025-03-01 14:23:37','',NULL,''),
(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2025-03-01 14:23:37','',NULL,''),
(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2025-03-01 14:23:37','',NULL,''),
(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2025-03-01 14:23:37','',NULL,''),
(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2025-03-01 14:23:37','',NULL,''),
(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2025-03-01 14:23:37','',NULL,''),
(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-03-01 14:23:37','',NULL,''),
(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-03-01 14:23:37','',NULL,''),
(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-03-01 14:23:37','',NULL,''),
(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-03-01 14:23:37','',NULL,''),
(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-03-01 14:23:37','',NULL,''),
(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-03-01 14:23:37','',NULL,''),
(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-03-01 14:23:37','',NULL,''),
(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-03-01 14:23:37','',NULL,''),
(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-03-01 14:23:37','',NULL,''),
(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-03-01 14:23:37','',NULL,''),
(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-03-01 14:23:37','',NULL,''),
(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-03-01 14:23:37','',NULL,''),
(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-03-01 14:23:37','',NULL,''),
(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-03-01 14:23:37','',NULL,''),
(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-03-01 14:23:37','',NULL,''),
(2006,'用户管理',0,1,'users','users/users/index',NULL,'',1,0,'C','0','0','users:users:list','peoples','admin','2025-03-12 20:04:11','admin','2025-03-12 20:12:28','用户管理菜单'),
(2007,'用户管理查询',2006,1,'#','',NULL,'',1,0,'F','0','0','users:users:query','#','admin','2025-03-12 20:04:11','',NULL,''),
(2008,'用户管理新增',2006,2,'#','',NULL,'',1,0,'F','0','0','users:users:add','#','admin','2025-03-12 20:04:11','',NULL,''),
(2009,'用户管理修改',2006,3,'#','',NULL,'',1,0,'F','0','0','users:users:edit','#','admin','2025-03-12 20:04:11','',NULL,''),
(2010,'用户管理删除',2006,4,'#','',NULL,'',1,0,'F','0','0','users:users:remove','#','admin','2025-03-12 20:04:11','',NULL,''),
(2011,'用户管理导出',2006,5,'#','',NULL,'',1,0,'F','0','0','users:users:export','#','admin','2025-03-12 20:04:11','',NULL,''),
(2012,'宠物管理',0,1,'pets','pets/pets/index',NULL,'',1,0,'C','0','0','pets:pets:list','宠物 (1)','admin','2025-03-12 20:57:42','admin','2025-03-12 23:31:26','宠物管理菜单'),
(2013,'宠物管理查询',2012,1,'#','',NULL,'',1,0,'F','0','0','pets:pets:query','#','admin','2025-03-12 20:57:42','',NULL,''),
(2014,'宠物管理新增',2012,2,'#','',NULL,'',1,0,'F','0','0','pets:pets:add','#','admin','2025-03-12 20:57:42','',NULL,''),
(2015,'宠物管理修改',2012,3,'#','',NULL,'',1,0,'F','0','0','pets:pets:edit','#','admin','2025-03-12 20:57:42','',NULL,''),
(2016,'宠物管理删除',2012,4,'#','',NULL,'',1,0,'F','0','0','pets:pets:remove','#','admin','2025-03-12 20:57:42','',NULL,''),
(2017,'宠物管理导出',2012,5,'#','',NULL,'',1,0,'F','0','0','pets:pets:export','#','admin','2025-03-12 20:57:42','',NULL,''),
(2019,'宠物领养',0,1,'applications','applications/applications/index',NULL,'',1,0,'C','0','0','applications:applications:list','checkbox','admin','2025-03-25 19:44:04','admin','2025-03-25 23:36:23','宠物领养菜单'),
(2020,'宠物领养查询',2019,1,'#','',NULL,'',1,0,'F','0','0','applications:applications:query','#','admin','2025-03-25 19:44:04','',NULL,''),
(2021,'宠物领养新增',2019,2,'#','',NULL,'',1,0,'F','0','0','applications:applications:add','#','admin','2025-03-25 19:44:04','',NULL,''),
(2022,'宠物领养修改',2019,3,'#','',NULL,'',1,0,'F','0','0','applications:applications:edit','#','admin','2025-03-25 19:44:04','',NULL,''),
(2023,'宠物领养删除',2019,4,'#','',NULL,'',1,0,'F','0','0','applications:applications:remove','#','admin','2025-03-25 19:44:04','',NULL,''),
(2024,'宠物领养导出',2019,5,'#','',NULL,'',1,0,'F','0','0','applications:applications:export','#','admin','2025-03-25 19:44:04','',NULL,''),
(2025,'宠物捐赠',0,1,'donations','donations/donations/index',NULL,'',1,0,'C','0','0','donations:donations:list','education','admin','2025-03-26 13:48:12','admin','2025-03-26 13:51:51','宠物捐赠菜单'),
(2026,'宠物捐赠查询',2025,1,'#','',NULL,'',1,0,'F','0','0','donations:donations:query','#','admin','2025-03-26 13:48:12','',NULL,''),
(2027,'宠物捐赠新增',2025,2,'#','',NULL,'',1,0,'F','0','0','donations:donations:add','#','admin','2025-03-26 13:48:12','',NULL,''),
(2028,'宠物捐赠修改',2025,3,'#','',NULL,'',1,0,'F','0','0','donations:donations:edit','#','admin','2025-03-26 13:48:12','',NULL,''),
(2029,'宠物捐赠删除',2025,4,'#','',NULL,'',1,0,'F','0','0','donations:donations:remove','#','admin','2025-03-26 13:48:12','',NULL,''),
(2030,'宠物捐赠导出',2025,5,'#','',NULL,'',1,0,'F','0','0','donations:donations:export','#','admin','2025-03-26 13:48:12','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2025-03-01 14:23:38','',NULL,'管理员'),
(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2025-03-01 14:23:38','',NULL,'管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values 
(100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"users\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 19:42:12',168),
(101,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"users\",\"className\":\"Users\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"id\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名\",\"columnId\":2,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"密码\",\"columnId\":3,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Icon\",\"columnComment\":\"头像地址\",\"columnId\":4,\"columnName\":\"icon\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"ico','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 19:51:48',86),
(102,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"users\"}',NULL,0,NULL,'2025-03-12 19:51:58',365),
(103,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"users\",\"className\":\"Users\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"id\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 19:51:48\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名\",\"columnId\":2,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 19:51:48\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"密码\",\"columnId\":3,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 19:51:48\",\"usableColumn\":false},{\"capJavaField\":\"Icon\",\"columnComment\":\"头像地址\",\"columnId\":4,\"columnName\":\"icon\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 20:01:04',103),
(104,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"users\"}',NULL,0,NULL,'2025-03-12 20:01:06',279),
(105,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"users\"}',NULL,0,NULL,'2025-03-12 20:01:56',129),
(106,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"users\"}',NULL,0,NULL,'2025-03-12 20:02:47',61),
(107,'用户管理',2,'com.ruoyi.users.controller.UsersController.edit()','PUT',1,'admin','研发部门','/users/users','127.0.0.1','内网IP','{\"age\":15,\"bodytypewithpet\":\"asd\",\"catOrDog\":\"狗\",\"children\":0,\"cleanwithpet\":\"asd\",\"email\":\"123123@qq.com\",\"environment\":\"asd\",\"experience\":1,\"gender\":2,\"icon\":\"123\",\"params\":{},\"personality\":\"沉稳\",\"petgender\":82,\"phone\":\"186157612701\",\"timewithpet\":12,\"userId\":1,\"username\":\"666\",\"wage\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 20:07:24',46),
(108,'用户管理',2,'com.ruoyi.users.controller.UsersController.edit()','PUT',1,'admin','研发部门','/users/users','127.0.0.1','内网IP','{\"age\":15,\"bodytypewithpet\":\"asd\",\"catOrDog\":\"狗\",\"children\":1,\"cleanwithpet\":\"asd\",\"email\":\"123123@qq.com\",\"environment\":\"asd\",\"experience\":1,\"gender\":2,\"icon\":\"123\",\"params\":{},\"personality\":\"沉稳\",\"petgender\":82,\"phone\":\"186157612701\",\"timewithpet\":12,\"userId\":1,\"username\":\"666\",\"wage\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 20:07:34',7),
(109,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"users/users/index\",\"createTime\":\"2025-03-12 20:04:11\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"users\",\"perms\":\"users:users:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 20:12:00',24),
(110,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"users/users/index\",\"createTime\":\"2025-03-12 20:04:11\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"users\",\"perms\":\"users:users:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 20:12:28',7),
(111,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"pets\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 20:28:07',101),
(112,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"pets\",\"className\":\"Pets\",\"columns\":[{\"capJavaField\":\"PetId\",\"columnComment\":\"id\",\"columnId\":20,\"columnName\":\"pet_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"petId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"所属用户\",\"columnId\":21,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"公母\",\"columnId\":23,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gender\",\"javaType\":\"Long\",\"list\":true,\"p','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 20:47:08',98),
(113,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"pets\"}',NULL,0,NULL,'2025-03-12 20:47:11',140),
(114,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pets/pets/index\",\"createTime\":\"2025-03-12 20:57:42\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"宠物管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"pets\",\"perms\":\"pets:pets:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:01:40',29),
(115,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"users\",\"className\":\"Users\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"id\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 20:01:03\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名\",\"columnId\":2,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 20:01:03\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"密码\",\"columnId\":3,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 20:01:03\",\"usableColumn\":false},{\"capJavaField\":\"Icon\",\"columnComment\":\"头像地址\",\"columnId\":4,\"columnName\":\"icon\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:14:47',91),
(116,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"users\"}',NULL,0,NULL,'2025-03-12 21:14:53',196),
(117,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-03-01 14:23:38\",\"cssClass\":\"\",\"default\":true,\"dictCode\":1,\"dictLabel\":\"男\",\"dictSort\":1,\"dictType\":\"sys_user_sex\",\"dictValue\":\"1\",\"isDefault\":\"Y\",\"listClass\":\"\",\"params\":{},\"remark\":\"性别男\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:17:08',51),
(118,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-03-01 14:23:38\",\"cssClass\":\"\",\"default\":false,\"dictCode\":2,\"dictLabel\":\"女\",\"dictSort\":2,\"dictType\":\"sys_user_sex\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"\",\"params\":{},\"remark\":\"性别女\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:17:12',8),
(119,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-03-01 14:23:38\",\"cssClass\":\"\",\"default\":false,\"dictCode\":3,\"dictLabel\":\"未知\",\"dictSort\":3,\"dictType\":\"sys_user_sex\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"\",\"params\":{},\"remark\":\"性别未知\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:17:16',11),
(120,'用户管理',2,'com.ruoyi.users.controller.UsersController.edit()','PUT',1,'admin','研发部门','/users/users','127.0.0.1','内网IP','{\"age\":15,\"bodytypewithpet\":\"asd\",\"catOrDog\":\"狗\",\"children\":1,\"cleanwithpet\":\"asd\",\"email\":\"123123@qq.com\",\"environment\":\"asd\",\"experience\":1,\"gender\":2,\"icon\":\"123\",\"params\":{},\"personality\":\"沉稳\",\"petgender\":82,\"phone\":\"186157612701\",\"timewithpet\":12,\"userId\":1,\"username\":\"小五\",\"wage\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:17:35',44),
(121,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"宠物性别\",\"dictType\":\"pet_sex\",\"params\":{},\"remark\":\"宠物性别\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:18:25',29),
(122,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"公\",\"dictSort\":1,\"dictType\":\"pet_sex\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:19:00',11),
(123,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"母\",\"dictSort\":2,\"dictType\":\"pet_sex\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:19:38',10),
(124,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"宠物所属\",\"dictType\":\"pet_belong\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:21:27',12),
(125,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"宠物救助平台\",\"dictSort\":1,\"dictType\":\"pet_belong\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:22:17',12),
(126,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"宠物脱毛\",\"dictType\":\"pet_hair\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:25:57',9),
(127,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"易脱毛\",\"dictSort\":1,\"dictType\":\"pet_hair\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:26:15',10),
(128,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"不易脱毛\",\"dictSort\":2,\"dictType\":\"pet_hair\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:26:30',8),
(129,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"宠物状态\",\"dictType\":\"pet_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:28:12',11),
(130,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"可领养\",\"dictSort\":1,\"dictType\":\"pet_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:28:37',8),
(131,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"不可\",\"dictSort\":2,\"dictType\":\"pet_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:28:57',9),
(132,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"宠物疫苗\",\"dictType\":\"pet_v\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:31:56',9),
(133,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"1\",\"dictSort\":1,\"dictType\":\"pet_v\",\"dictValue\":\"是\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:32:10',8),
(134,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"否\",\"dictSort\":2,\"dictType\":\"pet_v\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:32:16',7),
(135,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"pets\",\"className\":\"Pets\",\"columns\":[{\"capJavaField\":\"PetId\",\"columnComment\":\"id\",\"columnId\":20,\"columnName\":\"pet_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"petId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 20:47:08\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"所属用户\",\"columnId\":21,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"pet_belong\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 20:47:08\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 20:47:08\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"公母\",\"columnId\":23,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"pet_sex\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:34:47',65),
(136,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"pets\"}',NULL,0,NULL,'2025-03-12 21:34:51',95),
(137,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"pets\",\"className\":\"Pets\",\"columns\":[{\"capJavaField\":\"PetId\",\"columnComment\":\"id\",\"columnId\":20,\"columnName\":\"pet_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"petId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 21:34:47\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"所属用户\",\"columnId\":21,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"pet_belong\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 21:34:47\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 21:34:47\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"公母\",\"columnId\":23,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"pet_sex\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:40:22',79),
(138,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"pets\"}',NULL,0,NULL,'2025-03-12 21:40:24',107),
(139,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"pets\",\"className\":\"Pets\",\"columns\":[{\"capJavaField\":\"PetId\",\"columnComment\":\"id\",\"columnId\":20,\"columnName\":\"pet_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"petId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 21:40:22\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"所属用户\",\"columnId\":21,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 21:40:22\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 21:40:22\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"公母\",\"columnId\":23,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 20:28:07\",\"dictType\":\"pet_sex\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:43:46',66),
(140,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"pets\"}',NULL,0,NULL,'2025-03-12 21:43:50',95),
(141,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"养宠经验\",\"dictType\":\"user_exp\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:46:27',28),
(142,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"有\",\"dictSort\":1,\"dictType\":\"user_exp\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:46:38',10),
(143,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"无\",\"dictSort\":2,\"dictType\":\"user_exp\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:46:44',6),
(144,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"薪资范围\",\"dictType\":\"wage\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:47:13',7),
(145,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"1\",\"dictSort\":1,\"dictType\":\"wage\",\"dictValue\":\"3000以内\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:47:50',10),
(146,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-03-12 21:47:50\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"3000以内\",\"dictSort\":1,\"dictType\":\"wage\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:48:03',9),
(147,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"3000-6000\",\"dictSort\":2,\"dictType\":\"wage\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:48:14',6),
(148,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"6000-1万\",\"dictSort\":3,\"dictType\":\"wage\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:48:29',8),
(149,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"1万以上\",\"dictSort\":4,\"dictType\":\"wage\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:48:41',6),
(150,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"老人小孩\",\"dictType\":\"children\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:49:13',6),
(151,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"有\",\"dictSort\":1,\"dictType\":\"children\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:49:26',19),
(152,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"无\",\"dictSort\":2,\"dictType\":\"children\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:49:36',7),
(153,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"陪伴时间\",\"dictType\":\"users_accompany\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:50:48',9),
(154,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"较少\",\"dictSort\":1,\"dictType\":\"users_accompany\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:51:01',7),
(155,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"一般\",\"dictSort\":2,\"dictType\":\"users_accompany\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:51:10',7),
(156,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"经常\",\"dictSort\":3,\"dictType\":\"users_accompany\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:51:19',9),
(157,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"较多\",\"dictSort\":4,\"dictType\":\"users_accompany\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:51:27',8),
(158,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"users\",\"className\":\"Users\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"id\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 21:14:47\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名\",\"columnId\":2,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 21:14:47\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"密码\",\"columnId\":3,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-12 21:14:47\",\"usableColumn\":false},{\"capJavaField\":\"Icon\",\"columnComment\":\"头像地址\",\"columnId\":4,\"columnName\":\"icon\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 19:42:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:53:06',58),
(159,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"users\"}',NULL,0,NULL,'2025-03-12 21:53:09',67),
(160,'用户管理',2,'com.ruoyi.users.controller.UsersController.edit()','PUT',1,'admin','研发部门','/users/users','127.0.0.1','内网IP','{\"age\":15,\"bodytypewithpet\":\"较大\",\"catOrDog\":\"狗\",\"children\":1,\"cleanwithpet\":\"偶尔\",\"email\":\"123123@qq.com\",\"environment\":\"有\",\"experience\":1,\"gender\":2,\"icon\":\"123\",\"params\":{},\"personality\":\"沉稳\",\"petgender\":1,\"phone\":\"186157612701\",\"timewithpet\":1,\"userId\":1,\"username\":\"小五\",\"wage\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 21:54:28',18),
(161,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pets/pets/index\",\"createTime\":\"2025-03-12 20:57:42\",\"icon\":\"宠物\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"宠物管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"pets\",\"perms\":\"pets:pets:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 23:30:02',51),
(162,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pets/pets/index\",\"createTime\":\"2025-03-12 20:57:42\",\"icon\":\"宠物 (1)\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"宠物管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"pets\",\"perms\":\"pets:pets:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-12 23:31:26',49),
(163,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-03-01 14:23:36\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-13 17:28:41',65),
(164,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-03-01 14:23:36\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-13 17:29:23',12),
(165,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"ee\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-13 17:41:17',18),
(166,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/03/13/mao_20250313174144A001.jpg\",\"code\":200}',0,NULL,'2025-03-13 17:41:44',115),
(167,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"ee\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-13 17:41:46',12),
(168,'菜单管理',1,'com.ee.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"审核中心\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"123\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 19:25:23',64),
(169,'菜单管理',3,'com.ee.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2018','127.0.0.1','内网IP','2018','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 19:34:31',569),
(170,'代码生成',6,'com.ee.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"adoption_applications\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 19:34:48',359),
(171,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"applications\",\"className\":\"AdoptionApplications\",\"columns\":[{\"capJavaField\":\"ApplicationId\",\"columnComment\":\"id\",\"columnId\":39,\"columnName\":\"application_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applicationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PetId\",\"columnComment\":\"宠物id\",\"columnId\":40,\"columnName\":\"pet_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"petId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":41,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ApplicantName\",\"columnComment\":\"申请人姓名\",\"columnId\":42,\"columnName\":\"applicant_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 19:39:26',66),
(172,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"adoption_applications\"}',NULL,0,NULL,'2025-03-25 19:39:28',349),
(173,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"applications\",\"className\":\"AdoptionApplications\",\"columns\":[{\"capJavaField\":\"ApplicationId\",\"columnComment\":\"id\",\"columnId\":39,\"columnName\":\"application_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applicationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-25 19:39:26\",\"usableColumn\":false},{\"capJavaField\":\"PetId\",\"columnComment\":\"宠物id\",\"columnId\":40,\"columnName\":\"pet_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"petId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-25 19:39:26\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":41,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-25 19:39:26\",\"usableColumn\":false},{\"capJavaField\":\"ApplicantName\",\"columnComment\":\"申请人姓名\",\"columnId\":42,\"columnName\":\"applicant_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"incremen','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 19:43:15',80),
(174,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"adoption_applications\"}',NULL,0,NULL,'2025-03-25 19:43:18',126),
(175,'菜单管理',2,'com.ee.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"applications/applications/index\",\"createTime\":\"2025-03-25 19:44:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"宠物领养\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"applications\",\"perms\":\"applications:applications:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 19:47:32',59),
(176,'宠物领养',2,'com.ee.applications.controller.AdoptionApplicationsController.edit()','PUT',1,'admin','研发部门','/applications/applications','127.0.0.1','内网IP','{\"applicantAddress\":\"湖北省韶关市盐池县\",\"applicantAge\":12,\"applicantContact\":\"192312312312\",\"applicantName\":\"张涛\",\"applicationDate\":\"2025-02-26\",\"applicationId\":2025025713461444,\"params\":{},\"petId\":15,\"status\":1,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 19:54:31',133),
(177,'宠物管理',2,'com.ee.pets.controller.PetsController.edit()','PUT',1,'admin','研发部门','/pets/pets','127.0.0.1','内网IP','{\"adoptionInfo\":\"喜欢晒太阳\",\"age\":8,\"bodytype\":\"中\",\"breed\":\"英国短毛猫\",\"catOrDog\":\"猫\",\"cleanwithpet\":\"一般\",\"energy\":1,\"environment\":\"需要\",\"gender\":1,\"hair\":1,\"imageUrl\":\"http://dummyimage.com/400x400\",\"monthMoney\":2,\"name\":\"小白白\",\"params\":{},\"personality\":\"活泼\",\"petId\":1,\"score\":60,\"status\":1,\"userId\":1,\"vaccination\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 20:14:15',177),
(178,'宠物管理',2,'com.ee.pets.controller.PetsController.edit()','PUT',1,'admin','研发部门','/pets/pets','127.0.0.1','内网IP','{\"adoptionInfo\":\"喜欢晒太阳\",\"age\":8,\"bodytype\":\"中\",\"breed\":\"英国短毛猫\",\"catOrDog\":\"猫\",\"cleanwithpet\":\"一般\",\"energy\":1,\"environment\":\"需要\",\"gender\":1,\"hair\":1,\"imageUrl\":\"http://dummyimage.com/400x400\",\"monthMoney\":2,\"name\":\"小白\",\"params\":{},\"personality\":\"活泼\",\"petId\":1,\"score\":60,\"status\":1,\"userId\":1,\"vaccination\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 20:14:24',9),
(179,'菜单管理',2,'com.ee.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"applications/applications/index\",\"createTime\":\"2025-03-25 19:44:04\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"宠物领养\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"applications\",\"perms\":\"applications:applications:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-25 23:36:23',44),
(180,'字典类型',1,'com.ee.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"app\",\"dictType\":\"app\",\"params\":{},\"remark\":\"申请\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 00:03:15',123),
(181,'字典数据',1,'com.ee.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"cssClass\":\"1\",\"default\":false,\"dictLabel\":\"审核中\",\"dictSort\":1,\"dictType\":\"app\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 00:04:48',14),
(182,'字典数据',2,'com.ee.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-03-26 00:04:48\",\"cssClass\":\"\",\"default\":false,\"dictCode\":121,\"dictLabel\":\"审核中\",\"dictSort\":1,\"dictType\":\"app\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 00:05:19',41),
(183,'字典数据',2,'com.ee.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-03-26 00:04:48\",\"cssClass\":\"1\",\"default\":false,\"dictCode\":121,\"dictLabel\":\"审核中\",\"dictSort\":1,\"dictType\":\"app\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 00:05:23',9),
(184,'字典数据',1,'com.ee.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"cssClass\":\"1\",\"default\":false,\"dictLabel\":\"未通过\",\"dictSort\":2,\"dictType\":\"app\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 00:05:43',14),
(185,'字典数据',2,'com.ee.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-03-26 00:05:43\",\"cssClass\":\"1\",\"default\":false,\"dictCode\":122,\"dictLabel\":\"已通过\",\"dictSort\":2,\"dictType\":\"app\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 00:06:07',9),
(186,'字典数据',1,'com.ee.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"cssClass\":\"1\",\"default\":false,\"dictLabel\":\"未通过\",\"dictSort\":2,\"dictType\":\"app\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 00:06:17',12),
(187,'字典数据',2,'com.ee.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-03-26 00:06:17\",\"cssClass\":\"1\",\"default\":false,\"dictCode\":123,\"dictLabel\":\"未通过\",\"dictSort\":3,\"dictType\":\"app\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 00:06:26',12),
(188,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"applications\",\"className\":\"AdoptionApplications\",\"columns\":[{\"capJavaField\":\"ApplicationId\",\"columnComment\":\"id\",\"columnId\":39,\"columnName\":\"application_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applicationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-25 19:43:15\",\"usableColumn\":false},{\"capJavaField\":\"PetId\",\"columnComment\":\"宠物id\",\"columnId\":40,\"columnName\":\"pet_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"petId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-25 19:43:15\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":41,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-25 19:43:15\",\"usableColumn\":false},{\"capJavaField\":\"ApplicantName\",\"columnComment\":\"申请人姓名\",\"columnId\":42,\"columnName\":\"applicant_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"incremen','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 00:07:46',64),
(189,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"adoption_applications\"}',NULL,0,NULL,'2025-03-26 00:07:50',232),
(190,'宠物领养',3,'com.ee.applications.controller.AdoptionApplicationsController.remove()','DELETE',1,'admin','研发部门','/applications/applications/2025025713461445','127.0.0.1','内网IP','[2025025713461445]',NULL,0,NULL,'2025-03-26 00:19:19',13),
(191,'宠物领养',3,'com.ee.applications.controller.AdoptionApplicationsController.remove()','DELETE',1,'admin','研发部门','/applications/applications/2025025713461445','127.0.0.1','内网IP','[2025025713461445]',NULL,0,NULL,'2025-03-26 00:20:58',10),
(192,'宠物领养',3,'com.ee.applications.controller.AdoptionApplicationsController.remove()','DELETE',1,'admin','研发部门','/applications/applications/2025025713461445','127.0.0.1','内网IP','[2025025713461445]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Check constraint \'adoption_applications_chk_1\' is violated.\r\n### The error may exist in com/ee/applications/mapper/AdoptionApplicationsMapper.java (best guess)\r\n### The error may involve com.ee.applications.mapper.AdoptionApplicationsMapper.updatestatus2-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update adoption_applications set status = 3  where application_id = ?\r\n### Cause: java.sql.SQLException: Check constraint \'adoption_applications_chk_1\' is violated.\n; uncategorized SQLException; SQL state [HY000]; error code [3819]; Check constraint \'adoption_applications_chk_1\' is violated.; nested exception is java.sql.SQLException: Check constraint \'adoption_applications_chk_1\' is violated.','2025-03-26 00:25:34',128),
(193,'宠物领养',3,'com.ee.applications.controller.AdoptionApplicationsController.remove()','DELETE',1,'admin','研发部门','/applications/applications/2025025713461445','127.0.0.1','内网IP','[2025025713461445]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Check constraint \'adoption_applications_chk_1\' is violated.\r\n### The error may exist in com/ee/applications/mapper/AdoptionApplicationsMapper.java (best guess)\r\n### The error may involve com.ee.applications.mapper.AdoptionApplicationsMapper.updatestatus2-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update adoption_applications set status = 3  where application_id = ?\r\n### Cause: java.sql.SQLException: Check constraint \'adoption_applications_chk_1\' is violated.\n; uncategorized SQLException; SQL state [HY000]; error code [3819]; Check constraint \'adoption_applications_chk_1\' is violated.; nested exception is java.sql.SQLException: Check constraint \'adoption_applications_chk_1\' is violated.','2025-03-26 00:26:31',91),
(194,'宠物领养',3,'com.ee.applications.controller.AdoptionApplicationsController.remove()','DELETE',1,'admin','研发部门','/applications/applications/2025025713461445','127.0.0.1','内网IP','[2025025713461445]',NULL,0,NULL,'2025-03-26 00:28:51',10),
(195,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"applications\",\"className\":\"AdoptionApplications\",\"columns\":[{\"capJavaField\":\"ApplicationId\",\"columnComment\":\"id\",\"columnId\":39,\"columnName\":\"application_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applicationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 00:07:46\",\"usableColumn\":false},{\"capJavaField\":\"PetId\",\"columnComment\":\"宠物id\",\"columnId\":40,\"columnName\":\"pet_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"petId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 00:07:46\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":41,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 00:07:46\",\"usableColumn\":false},{\"capJavaField\":\"ApplicantName\",\"columnComment\":\"申请人姓名\",\"columnId\":42,\"columnName\":\"applicant_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-25 19:34:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"incremen','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 13:40:50',116),
(196,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"adoption_applications\"}',NULL,0,NULL,'2025-03-26 13:40:53',236),
(197,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"adoption_applications\"}',NULL,0,NULL,'2025-03-26 13:41:33',61),
(198,'宠物领养',3,'com.ee.applications.controller.AdoptionApplicationsController.remove()','DELETE',1,'admin','研发部门','/applications/applications/2025025713461445','127.0.0.1','内网IP','[2025025713461445]',NULL,0,NULL,'2025-03-26 13:45:05',7),
(199,'代码生成',6,'com.ee.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"donations\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 13:46:08',81),
(200,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"donations\",\"className\":\"Donations\",\"columns\":[{\"capJavaField\":\"DonationId\",\"columnComment\":\"id\",\"columnId\":49,\"columnName\":\"donation_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"donationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"宠物名称\",\"columnId\":51,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"性别\",\"columnId\":52,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gender\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 13:47:11',58),
(201,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"donations\",\"className\":\"Donations\",\"columns\":[{\"capJavaField\":\"DonationId\",\"columnComment\":\"id\",\"columnId\":49,\"columnName\":\"donation_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"donationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:47:11\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:47:11\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"宠物名称\",\"columnId\":51,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:47:11\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"性别\",\"columnId\":52,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIn','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 13:47:44',42),
(202,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"donations\"}',NULL,0,NULL,'2025-03-26 13:47:47',52),
(203,'菜单管理',2,'com.ee.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"donations/donations/index\",\"createTime\":\"2025-03-26 13:48:12\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"宠物捐赠\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"donations\",\"perms\":\"donations:donations:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 13:51:11',134),
(204,'菜单管理',2,'com.ee.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"donations/donations/index\",\"createTime\":\"2025-03-26 13:48:12\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"宠物捐赠\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"donations\",\"perms\":\"donations:donations:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 13:51:51',8),
(205,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"donations\",\"className\":\"Donations\",\"columns\":[{\"capJavaField\":\"DonationId\",\"columnComment\":\"id\",\"columnId\":49,\"columnName\":\"donation_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"donationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:47:44\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:47:44\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"宠物名称\",\"columnId\":51,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:47:44\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"性别\",\"columnId\":52,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 13:53:49',129),
(206,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"donations\"}',NULL,0,NULL,'2025-03-26 13:53:52',104),
(207,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"donations\",\"className\":\"Donations\",\"columns\":[{\"capJavaField\":\"DonationId\",\"columnComment\":\"id\",\"columnId\":49,\"columnName\":\"donation_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"donationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:53:49\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:53:49\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"宠物名称\",\"columnId\":51,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:53:49\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"性别\",\"columnId\":52,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 13:58:19',43),
(208,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"donations\"}',NULL,0,NULL,'2025-03-26 13:58:23',46),
(209,'字典数据',2,'com.ee.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-03-12 21:32:10\",\"default\":false,\"dictCode\":107,\"dictLabel\":\"是\",\"dictSort\":1,\"dictType\":\"pet_v\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:02:28',12),
(210,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"donations\"}',NULL,0,NULL,'2025-03-26 14:02:39',48),
(211,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"donations\",\"className\":\"Donations\",\"columns\":[{\"capJavaField\":\"DonationId\",\"columnComment\":\"id\",\"columnId\":49,\"columnName\":\"donation_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"donationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:58:19\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:58:19\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"宠物名称\",\"columnId\":51,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 13:58:19\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"性别\",\"columnId\":52,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:04:05',40),
(212,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"donations\"}',NULL,0,NULL,'2025-03-26 14:04:08',52),
(213,'字典类型',1,'com.ee.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"don\",\"dictType\":\"don\",\"params\":{},\"remark\":\"捐赠\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:07:51',11),
(214,'字典数据',1,'com.ee.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"cssClass\":\"1\",\"default\":false,\"dictLabel\":\"已接种\",\"dictSort\":0,\"dictType\":\"don\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:08:16',19),
(215,'字典数据',1,'com.ee.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"cssClass\":\"1\",\"default\":false,\"dictLabel\":\"未接种\",\"dictSort\":0,\"dictType\":\"don\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:08:26',11),
(216,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"donations\",\"className\":\"Donations\",\"columns\":[{\"capJavaField\":\"DonationId\",\"columnComment\":\"id\",\"columnId\":49,\"columnName\":\"donation_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"donationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 14:04:05\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 14:04:05\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"宠物名称\",\"columnId\":51,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 14:04:05\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"性别\",\"columnId\":52,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:08:56',40),
(217,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"donations\"}',NULL,0,NULL,'2025-03-26 14:08:58',55),
(218,'代码生成',2,'com.ee.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"donations\",\"className\":\"Donations\",\"columns\":[{\"capJavaField\":\"DonationId\",\"columnComment\":\"id\",\"columnId\":49,\"columnName\":\"donation_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"donationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 14:08:56\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 14:08:56\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"宠物名称\",\"columnId\":51,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-26 14:08:56\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"性别\",\"columnId\":52,\"columnName\":\"gender\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-26 13:46:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:10:43',34),
(219,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"donations\"}',NULL,0,NULL,'2025-03-26 14:10:53',44),
(220,'宠物捐赠',3,'com.ee.donations.controller.DonationsController.remove()','DELETE',1,'admin','研发部门','/donations/donations/2025023911110456','127.0.0.1','内网IP','[2025023911110456]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:22:16',23),
(221,'宠物捐赠',3,'com.ee.donations.controller.DonationsController.remove()','DELETE',1,'admin','研发部门','/donations/donations/2025023911110457','127.0.0.1','内网IP','[2025023911110457]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:22:26',13),
(222,'宠物捐赠',3,'com.ee.donations.controller.DonationsController.remove()','DELETE',1,'admin','研发部门','/donations/donations/2025023911110455','127.0.0.1','内网IP','[2025023911110455]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:23:19',14),
(223,'宠物捐赠',3,'com.ee.donations.controller.DonationsController.remove()','DELETE',1,'admin','研发部门','/donations/donations/2025023911110454','127.0.0.1','内网IP','[2025023911110454]',NULL,0,NULL,'2025-03-26 14:24:34',11),
(224,'宠物捐赠',3,'com.ee.donations.controller.DonationsController.remove()','DELETE',1,'admin','研发部门','/donations/donations/2025023911110458','127.0.0.1','内网IP','[2025023911110458]',NULL,0,NULL,'2025-03-26 14:24:38',6),
(225,'菜单管理',2,'com.ee.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-03-01 14:23:36\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 14:53:33',26),
(226,'宠物领养',3,'com.ee.applications.controller.AdoptionApplicationsController.remove()','DELETE',1,'admin','研发部门','/applications/applications/2025025713461445','127.0.0.1','内网IP','[2025025713461445]',NULL,0,NULL,'2025-03-26 15:15:44',48),
(227,'菜单管理',2,'com.ee.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-03-01 14:23:36\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-03-26 22:09:26',31),
(228,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"users\"}',NULL,0,NULL,'2025-03-26 22:09:41',362),
(229,'代码生成',8,'com.ee.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"pets\"}',NULL,0,NULL,'2025-03-26 22:10:18',67),
(230,'宠物捐赠',3,'com.ee.donations.controller.DonationsController.remove()','DELETE',1,'admin','研发部门','/donations/donations/20260411114420670','127.0.0.1','内网IP','[20260411114420670]',NULL,0,NULL,'2026-04-22 11:07:14',19),
(231,'宠物捐赠',3,'com.ee.donations.controller.DonationsController.remove()','DELETE',1,'admin','研发部门','/donations/donations/2025023911110548','127.0.0.1','内网IP','[2025023911110548]',NULL,0,NULL,'2026-04-22 11:07:37',11),
(232,'宠物捐赠',3,'com.ee.donations.controller.DonationsController.remove()','DELETE',1,'admin','研发部门','/donations/donations/2025023911110548','127.0.0.1','内网IP','[2025023911110548]',NULL,0,NULL,'2026-04-22 11:07:41',12),
(233,'宠物捐赠',3,'com.ee.donations.controller.DonationsController.remove()','DELETE',1,'admin','研发部门','/donations/donations/2025023911110549','127.0.0.1','内网IP','[2025023911110549]',NULL,0,NULL,'2026-04-22 11:19:24',98);

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'ceo','董事长',1,'0','admin','2025-03-01 14:23:36','',NULL,''),
(2,'se','项目经理',2,'0','admin','2025-03-01 14:23:36','',NULL,''),
(3,'hr','人力资源',3,'0','admin','2025-03-01 14:23:36','',NULL,''),
(4,'user','普通员工',4,'0','admin','2025-03-01 14:23:36','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2025-03-01 14:23:36','',NULL,'超级管理员'),
(2,'普通角色','common',2,'2',1,1,'0','0','admin','2025-03-01 14:23:36','',NULL,'普通角色');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values 
(2,100),
(2,101),
(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(2,1),
(2,2),
(2,3),
(2,4),
(2,100),
(2,101),
(2,102),
(2,103),
(2,104),
(2,105),
(2,106),
(2,107),
(2,108),
(2,109),
(2,110),
(2,111),
(2,112),
(2,113),
(2,114),
(2,115),
(2,116),
(2,117),
(2,500),
(2,501),
(2,1000),
(2,1001),
(2,1002),
(2,1003),
(2,1004),
(2,1005),
(2,1006),
(2,1007),
(2,1008),
(2,1009),
(2,1010),
(2,1011),
(2,1012),
(2,1013),
(2,1014),
(2,1015),
(2,1016),
(2,1017),
(2,1018),
(2,1019),
(2,1020),
(2,1021),
(2,1022),
(2,1023),
(2,1024),
(2,1025),
(2,1026),
(2,1027),
(2,1028),
(2,1029),
(2,1030),
(2,1031),
(2,1032),
(2,1033),
(2,1034),
(2,1035),
(2,1036),
(2,1037),
(2,1038),
(2,1039),
(2,1040),
(2,1041),
(2,1042),
(2,1043),
(2,1044),
(2,1045),
(2,1046),
(2,1047),
(2,1048),
(2,1049),
(2,1050),
(2,1051),
(2,1052),
(2,1053),
(2,1054),
(2,1055),
(2,1056),
(2,1057),
(2,1058),
(2,1059),
(2,1060);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,103,'admin','ee','00','ry@163.com','15888888888','1','/profile/avatar/2025/03/13/mao_20250313174144A001.jpg','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-04-23 13:38:45','admin','2025-03-01 14:23:36','','2026-04-23 13:38:45','管理员'),
(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-03-01 14:23:36','admin','2025-03-01 14:23:36','',NULL,'测试员');

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values 
(1,1),
(2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
(1,1),
(2,2);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机号',
  `gender` int DEFAULT NULL COMMENT '性别',
  `personality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '自我描述',
  `children` int DEFAULT NULL COMMENT '家里有无老人小孩',
  `age` int DEFAULT NULL COMMENT '年纪',
  `wage` int DEFAULT NULL COMMENT '大致薪资',
  `experience` tinyint(1) NOT NULL COMMENT '养宠经验',
  `cat_or_dog` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '偏爱猫还是狗',
  `timewithpet` int DEFAULT NULL COMMENT '一周能陪伴的时间',
  `cleanwithpet` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '多长时间清洁一次',
  `bodytypewithpet` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '钟爱体型',
  `environment` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '有无后院',
  `petgender` int DEFAULT NULL COMMENT '偏爱公母',
  `question_fk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '反馈表的内容',
  `icode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci CHECKSUM=1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`password`,`icon`,`email`,`phone`,`gender`,`personality`,`children`,`age`,`wage`,`experience`,`cat_or_dog`,`timewithpet`,`cleanwithpet`,`bodytypewithpet`,`environment`,`petgender`,`question_fk`,`icode`) values 
(1,'小五','4297f44b13955235245b2497399d7a93','/pet_imgs/t1.jpg','123123@qq.com','186157612701',2,'沉稳',1,15,3,1,'狗',1,'偶尔','较大','有',1,NULL,NULL),
(2,'李华','123456','/pet_imgs/t1.jpg','lihua@example.com','18657612702',2,'沉稳',2,11,2,2,'猫',2,'经常','中','无',2,'老铁667',NULL),
(3,'王刚','3156f0120e560ff6449794718793231c','/pet_imgs/t1.jpg','wanggang@example.com','18657612703',1,'沉稳',1,9,3,3,'狗',3,'较少','超大','有',1,'老铁668',NULL),
(4,'赵丽','01697bae6bc23625f5af809d875f4f97','/pet_imgs/t1.jpg','zhaoli@example.com','18657612704',2,'外向',2,8,4,1,'猫',1,'偶尔','小','无',2,'老铁669',NULL),
(5,'刘强','37deb25ba9d6436ac5e3dfaffcefbaf4','/pet_imgs/t1.jpg','liuqiang@example.com','18657612705',1,'内向',1,7,1,2,'狗',4,'经常','中','有',1,'老铁670',NULL),
(6,'陈静','60dae0bb00a6f121889f271e21722d17','/pet_imgs/t1.jpg','chenjing@example.com','18657612706',2,'活泼',2,6,2,1,'猫',2,'较少','大','无',2,'老铁671',NULL),
(7,'张敏','3de093d412fa4e20a26a3807c37fdffa','/pet_imgs/t1.jpg','zhangmin@example.com','18657612707',1,'沉稳',1,5,3,2,'狗',3,'偶尔','超大','有',1,'老铁672',NULL),
(8,'林伟','0ba2a7dd0a33cf3dbc82884e196efb08','/pet_imgs/t1.jpg','linwei@example.com','18657612708',2,'外向',2,4,4,1,'猫',1,'经常','小','无',2,'老铁673',NULL),
(9,'周涛','74c7a1bc2247eaf698e8310e622433c3','/pet_imgs/t1.jpg','zhoutao@example.com','18657612709',1,'内向',1,3,1,2,'狗',2,'偶尔','中','有',1,'老铁674',NULL),
(10,'林丽','94cbd2a66b26411d5d0e68b1888c28c4','/pet_imgs/t1.jpg','linli@example.com','18657612710',2,'活泼',2,12,2,1,'猫',3,'经常','大','无',2,'老铁675',NULL),
(11,'杨洋','d61e8988b680ff8933f1aaeb7007c056','/pet_imgs/t1.jpg','yangyang@example.com','18657612711',1,'沉稳',1,11,3,3,'狗',4,'较少','中','有',1,'老铁676',NULL),
(12,'高飞','70eb23936707d82a134b640773879ce1','/pet_imgs/t1.jpg','gaofei@example.com','18657612712',2,'外向',2,10,4,2,'猫',1,'偶尔','小','无',2,'老铁677',NULL),
(13,'郑娜','fc4598a729a04ee77ff60ef7b5d142f9','/pet_imgs/t1.jpg','zhengna@example.com','18657612713',1,'内向',1,9,2,1,'狗',2,'经常','超大','有',1,'老铁678',NULL),
(14,'孙婷','124750234191626cfe5472b966c92b15','/pet_imgs/t1.jpg','sunting@example.com','18657612714',2,'活泼',2,8,3,3,'猫',3,'偶尔','小','无',2,'老铁679',NULL),
(15,'周敏','454e898950a96d9dcca5b335dce98ae5','/pet_imgs/t1.jpg','zhoumin@example.com','18657612715',1,'沉稳',1,7,4,2,'狗',1,'经常','中','有',1,'老铁680',NULL),
(16,'刘海','02472432253545ae6057b759972116c8','/pet_imgs/t1.jpg','liuhaix@example.com','18657612716',2,'外向',2,9,1,1,'猫',2,'较少','超大','无',2,'老铁681',NULL),
(17,'陈涛','a71a0ebd8769beee0b81f80a19831d19','/pet_imgs/t1.jpg','chentao@example.com','18657612717',1,'沉稳',1,6,3,2,'狗',3,'偶尔','小','有',1,'老铁682',NULL),
(18,'王丽','ea2f109b07790bfa6c6e3bdd7fd0bab5','/pet_imgs/t1.jpg','wangli@example.com','18657612718',2,'活泼',2,8,2,1,'猫',1,'经常','中','无',2,'老铁683',NULL),
(19,'郑伟','37dce6d19899feb6c527b64d2bfb3045','/pet_imgs/t1.jpg','zhengwei@example.com','18657612719',1,'沉稳',1,5,3,3,'狗',4,'较少','超大','有',1,'老铁684',NULL),
(20,'曹阳','b4425fbd22354c0c66b2ef48a55df03f','/pet_imgs/t1.jpg','caoyang@example.com','18657612720',2,'外向',2,11,1,2,'猫',3,'经常','小','无',2,'老铁685',NULL),
(21,'黄海','33ce80ecb047baf47bb7fe14aa3d36a2','/pet_imgs/t1.jpg','huanghai@example.com','18657612721',1,'内向',1,9,2,1,'狗',2,'偶尔','大','有',1,'老铁686',NULL),
(22,'郑雪','16350e4602476604195707366739468e','/pet_imgs/t1.jpg','zhengxue@example.com','18657612722',2,'活泼',2,7,3,1,'猫',1,'经常','小','无',2,'老铁687',NULL),
(23,'万丽','d21f8dcb43b11cfdb4d8150c338c1926','/pet_imgs/t1.jpg','wanli@example.com','18657612723',1,'沉稳',1,8,4,2,'狗',2,'较少','中','有',1,'老铁688',NULL),
(24,'胡强','d7dc43c70ecd7591f35e24ea20720771','/pet_imgs/t1.jpg','huqiang@example.com','18657612724',1,'外向',2,10,2,1,'猫',1,'经常','小','无',2,'老铁689',NULL),
(25,'马海','8edf489c2d480172840dd44d7b8a8930','/pet_imgs/t1.jpg','mahai@example.com','18657612725',2,'活泼',2,6,4,2,'狗',3,'偶尔','大','无',2,'老铁690',NULL),
(26,'田华','038251416470c7dc9cd171c643a4bbfd','/pet_imgs/t1.jpg','tianhua@example.com','18657612726',1,'沉稳',1,8,3,3,'猫',2,'经常','小','有',1,'老铁691',NULL),
(27,'高峰','df0f28d81bfd93340ffc5d8feca0b201','/pet_imgs/t1.jpg','gaofeng@example.com','18657612727',2,'外向',2,9,1,2,'狗',1,'偶尔','中','无',2,'老铁692',NULL),
(28,'段丽','73155f8d4c9f880ac1750598b5ecc820','/pet_imgs/t1.jpg','duanli@example.com','18657612728',1,'沉稳',1,6,3,2,'猫',4,'偶尔','放','有',1,'老铁693',NULL),
(29,'夏雨','8dd818b272b51df4d9a92e4a35f4a5de','/pet_imgs/t1.jpg','xiayu@example.com','18657612729',2,'外向',2,8,4,1,'狗',3,'经常','中','无',2,'老铁694',NULL),
(30,'蔡飞','e4a6c5d7ba2780ea8e2c0f2e348056ed','/pet_imgs/t1.jpg','caifei@example.com','18657612730',1,'沉稳',1,7,2,3,'猫',2,'偶尔','大','有',1,'老铁695',NULL),
(31,'杨松','eee0a2490bd46493b35e339693064d38','/pet_imgs/t1.jpg','yangsong@example.com','18657612731',2,'外向',2,5,1,1,'狗',1,'经常','小','无',2,'老铁696',NULL),
(32,'周涛','74c7a1bc2247eaf698e8310e622433c3','/pet_imgs/t1.jpg','zhoutao@example.com','18657612732',1,'沉稳',1,11,4,3,'猫',2,'偶尔','超大','有',1,'老铁697',NULL),
(33,'郭明','be571919639567b22f90b14f7f568d79','/pet_imgs/t1.jpg','guoming@example.com','18657612733',2,'外向',2,4,1,2,'狗',3,'经常','小','无',2,'老铁698',NULL),
(34,'高飞','742105eb9f9e948bf20432bacd2d5b68','/pet_imgs/t1.jpg','gaofei@example.com','18657612734',1,'沉稳',1,12,3,1,'猫',2,'经常','大','有',1,'老铁699',NULL),
(35,'杨辉','5d7d532e61d4e64bce3013acef1be403','/pet_imgs/t1.jpg','yanghui@example.com','18657612735',2,'外向',2,6,4,2,'狗',3,'偶尔','中','无',2,'老铁700',NULL),
(36,'赵蓉','4b621adf6896a896c35917eff3c875d5','/pet_imgs/t1.jpg','zhaorong@example.com','18657612736',1,'沉稳',1,7,3,1,'猫',2,'经常','小','有',1,'老铁701',NULL),
(37,'冯丽','ea3804ab20677ecd961737c8bfc979e8','/pet_imgs/t1.jpg','fengli@example.com','18657612737',2,'外向',2,8,2,2,'狗',1,'偶尔','大','无',2,'老铁702',NULL),
(38,'朱军','b8ac83fbbe8864e26de126b19e6cec22','/pet_imgs/t1.jpg','zhujun@example.com','18657612738',1,'沉稳',1,11,1,1,'猫',2,'较少','中','有',1,'老铁703',NULL),
(39,'梁安','53385d4bf74e769ccbf1d14d82b1435d','/pet_imgs/t1.jpg','liangan@example.com','18657612739',2,'外向',2,9,4,3,'狗',4,'打印','超大','无',2,'老铁704',NULL),
(40,'杜晨','dc2f296c61093541f41a4e6ee3292643','/pet_imgs/t1.jpg','duchen@example.com','18657612740',1,'沉稳',1,10,3,2,'猫',2,'偶尔','小','有',1,'老铁705',NULL),
(41,'季月','e2fcdf8e985a5f5de6fadc77adcdd207','/pet_imgs/t1.jpg','jiyue@example.com','18657612741',2,'外向',2,12,1,1,'狗',1,'经常','中','无',2,'老铁706',NULL),
(42,'郭小东','b8a2b4752d0000820bd3f99367418850','/pet_imgs/t1.jpg','guoxiaodong@example.com','18657612742',1,'沉稳',1,11,2,2,'猫',4,'较少','大','有',1,'老铁707',NULL),
(43,'汤泉','313a3642d678df3f0b299431dfb929d6','/pet_imgs/t1.jpg','tangquan@example.com','18657612743',2,'活泼',2,10,3,1,'狗',3,'经常','小','无',2,'老铁708',NULL),
(44,'王成','91ab32854110eb2d9f9d1217395f8365','/pet_imgs/t1.jpg','wangcheng@example.com','18657612744',1,'沉稳',1,5,4,1,'猫',4,'偶尔','超大','有',1,'老铁709',NULL),
(45,'周丽','5ff4583638b5adee7618ad51d57647dc','/pet_imgs/t1.jpg','zhouli@example.com','18657612745',2,'内向',2,7,1,2,'狗',2,'较少','小','无',2,'老铁710',NULL),
(46,'李健','757ace0b139d82f762b2f2c436075b83','/pet_imgs/t1.jpg','lijian@example.com','18657612746',1,'外向',1,8,3,2,'猫',2,'经常','中','有',1,'老铁711',NULL),
(47,'杜海','81958be1515ea1b61c758cd814685c11','/pet_imgs/t1.jpg','duhai@example.com','18657612747',2,'沉稳',2,5,1,1,'狗',3,'偶尔','超大','无',2,'老铁712',NULL),
(48,'叶桐','6fa0102deee455cd73dc6f4ce4b372d7','/pet_imgs/t1.jpg','yetong@example.com','18657612748',1,'外向',1,11,4,1,'猫',2,'经常','小','有',1,'老铁713',NULL),
(49,'张美丽','248aca33013a2c9ff9e54e3eac82fd78','/pet_imgs/t1.jpg','zhangmeili@example.com','18657612749',2,'沉稳',2,10,1,2,'狗',1,'偶尔','中','无',2,'老铁714',NULL),
(50,'林浩','4dabf68c2da90c7df5113f6ea72b13f8','/pet_imgs/t1.jpg','linhao@example.com','18657612750',1,'活泼',1,9,3,1,'猫',2,'经常','小','有',1,'老铁715',NULL),
(51,'宁静','3d714a18257d1e3590c3fd5ed996cae6','/pet_imgs/t1.jpg','ningjing@example.com','18657612751',2,'沉稳',2,7,3,2,'狗',1,'偶尔','超大','无',2,'老铁716',NULL),
(52,'李伟','7d0e561305879f20cd9ceab92bdfda61','/pet_imgs/t1.jpg','liwei@example.com','18657612752',1,'外向',1,8,4,2,'猫',2,'经常','小','有',1,'老铁717',NULL),
(53,'周伟','3e8c05f9df21387ff818fa5366b803e7','/pet_imgs/t1.jpg','zhouwei@example.com','18657612753',2,'活泼',2,6,1,1,'狗',4,'偶尔','中','无',2,'老铁718',NULL),
(54,'林雪','3e1737c06da386491b75c857af0b6316','/pet_imgs/t1.jpg','linxue@example.com','18657612754',1,'沉稳',1,10,3,2,'猫',2,'经常','小','有',1,'老铁719',NULL),
(55,'贾飞','b67b913a632beae0bf9eb4ba45485337','/pet_imgs/t1.jpg','jiafei@example.com','18657612755',2,'外向',2,8,4,1,'狗',1,'偶尔','超大','无',2,'老铁720',NULL),
(56,'何妍','eed90e867411850f9940a7d088c1ee4d','/pet_imgs/t1.jpg','heyan@example.com','18657612756',1,'内向',2,6,3,2,'猫',2,'经常','小','有',1,'老铁721',NULL),
(57,'马莉','94ffdd18015ab7a590e528a534f76583','/pet_imgs/t1.jpg','mali@example.com','18657612757',2,'活泼',1,5,4,1,'狗',2,'偶尔','超大','无',2,'老铁722',NULL),
(58,'黄磊','ad63a792290dcec651ad42e4cbba4ca6','/pet_imgs/t1.jpg','huanglei@example.com','18657612758',1,'沉稳',2,9,3,1,'猫',2,'经常','小','有',1,'老铁723',NULL),
(59,'任敏','46a485e85c510eb2cd0c5b8383cbb50a','/pet_imgs/t1.jpg','renmin@example.com','18657612759',2,'外向',1,6,2,1,'狗',1,'偶尔','超大','无',2,'老铁724',NULL),
(60,'孔云','7f2e0a752f4fc5fa6c1e64cda366d6e0','/pet_imgs/t1.jpg','kongyun@example.com','18657612760',1,'沉稳',1,11,3,2,'猫',2,'经常','小','有',1,'老铁725',NULL),
(61,'冯刚','6d6800d26c3f353d94ebb55fa0023cf8','/pet_imgs/t1.jpg','fenggang@example.com','18657612761',1,'外向',2,9,1,2,'狗',4,'偶尔','超大','无',2,'老铁726',NULL),
(62,'简洁','53e3f28be7d8f3c842b37f801f8eb585','/pet_imgs/t1.jpg','jianjie@example.com','18657612762',2,'沉稳',1,10,3,1,'猫',1,'经常','小','有',1,'老铁727',NULL),
(63,'顾飞','4bdc52cc6c45e07d84bbbc4dadc0232c','/pet_imgs/t1.jpg','gufei@example.com','18657612763',1,'外向',2,6,2,2,'狗',1,'偶尔','超大','无',2,'老铁728',NULL),
(64,'马青','2e44eec71fe2e4d407be78cc81e800e6','/pet_imgs/t1.jpg','maqing@example.com','18657612764',1,'活泼',1,3,1,1,'猫',2,'经常','小','有',1,'老铁729',NULL),
(65,'王晨','c6bc5ddd0d974a5caddfb705be8ef0bf','/pet_imgs/t1.jpg','wangchen@example.com','18657612765',2,'沉稳',1,8,2,1,'狗',2,'偶尔','超大','无',2,'老铁730',NULL),
(66,'陆明','9aa3fb921300c49b9e27bd55fef2c6c0','/pet_imgs/t1.jpg','luming@example.com','18657612766',1,'外向',2,11,3,2,'猫',1,'经常','小','有',1,'老铁731',NULL),
(67,'于洋','9526426e9ebcf900fc513737412b49e7','/pet_imgs/t1.jpg','yuyang@example.com','18657612767',2,'活泼',1,10,2,1,'狗',2,'偶尔','中','无',2,'老铁732',NULL),
(68,'蒋雯','2338567919b16205bb6183aaaddf66e9','/pet_imgs/t1.jpg','jiangwen@example.com','18657612768',1,'沉稳',2,6,1,1,'猫',2,'经常','小','有',1,'老铁733',NULL),
(69,'韦峰','4c47a5c808aaa6db9f82388ce63b1009','/pet_imgs/t1.jpg','weifeng@example.com','18657612769',2,'外向',1,3,3,1,'狗',2,'偶尔','小','无',2,'老铁734',NULL),
(70,'黄冰','592857f5549e546e878918ca88168508','/pet_imgs/t1.jpg','huangbing@example.com','18657612770',1,'活泼',2,4,4,1,'猫',2,'经常','大','有',1,'老铁735',NULL),
(71,'易卜','a729f2543ade213494f73067557275cc','/pet_imgs/t1.jpg','yibu@example.com','18657612771',2,'沉稳',1,10,1,2,'狗',4,'偶尔','小','无',2,'老铁736',NULL),
(72,'柯南','d794958cf6d8f33ec2badedce6cda26a','/pet_imgs/t1.jpg','kenan@example.com','18657612772',1,'沉稳',2,12,3,1,'猫',2,'经常','小','有',1,'老铁737',NULL),
(73,'斯诺','a43f374a4963ccc46a21d2f844493692','/pet_imgs/t1.jpg','sinuo@example.com','18657612773',2,'外向',1,8,4,1,'狗',2,'偶尔','中','无',2,'老铁738',NULL),
(74,'云生','dd0a892ccd0817421ec8d1c5905c0dea','/pet_imgs/t1.jpg','yunsheng@example.com','18657612774',1,'活泼',1,5,2,1,'猫',4,'偶尔','小','有',1,'老铁739',NULL),
(75,'易飞','5904d241b495117cb18862ef6b0e532e','/pet_imgs/t1.jpg','yifei@example.com','18657612775',2,'沉稳',1,7,3,2,'狗',2,'经常','大','有',2,'老铁740',NULL),
(76,'朱波','e5d0d3975ea190a39062114ab4a78754','/pet_imgs/t1.jpg','zhubo@example.com','18657612776',1,'外向',2,8,2,1,'猫',2,'经常','小','有',1,'老铁741',NULL),
(77,'池晓','0f915d37ce4c98eb8613888cbc8213fe','/pet_imgs/t1.jpg','chixiao@example.com','18657612777',2,'沉稳',1,5,1,1,'狗',3,'偶尔','超大','无',2,'老铁742',NULL),
(78,'莫风','5db53962bf4dd454439ec25233ef7f8c','/pet_imgs/t1.jpg','mofeng@example.com','18657612778',1,'活泼',2,9,4,1,'狗',2,'经常','小','有',2,'老铁743',NULL),
(79,'赵浩','b6b5380818cf7debce530bc220201a61','/pet_imgs/t1.jpg','zhaohai@example.com','18657612779',1,'沉稳',1,6,2,2,'猫',4,'偶尔','大','无',1,'老铁744',NULL),
(80,'于静','e69972dcf23c2640a8080cba64c4d8f6','/pet_imgs/t1.jpg','yujing@example.com','18657612780',2,'内向',2,10,3,1,'狗',2,'经常','小','有',2,'老铁745',NULL),
(81,'钱飞','bd66fd3af01d95a4c8ab8c9774efc9a9','/pet_imgs/t1.jpg','qianfei@example.com','18657612781',2,'外向',2,8,4,1,'猫',2,'经常','小','有',2,'老铁746',NULL),
(82,'丁宁','b2b6752c4c4b995e90953ea4837771a3','/pet_imgs/t1.jpg','dingning@example.com','18657612782',1,'沉稳',1,7,2,1,'狗',3,'偶尔','超大','无',2,'老铁747',NULL),
(83,'哑巴','1586809348a4ec63f284e94c9268eb81','/pet_imgs/t1.jpg','yaba@example.com','18657612783',2,'内向',2,5,1,1,'狗',2,'经常','小','有',2,'老铁748',NULL),
(84,'严静','af2a4557633429b9089541538317cb50','/pet_imgs/t1.jpg','yanjing@example.com','18657612784',1,'活泼',2,6,3,1,'猫',2,'经常','小','有',1,'老铁749',NULL),
(85,'董浩','a0fea3d70e9358517f744b7e9893107e','/pet_imgs/t1.jpg','donghao@example.com','18657612785',1,'沉稳',1,11,3,1,'狗',2,'偶尔','中','无',2,'老铁750',NULL),
(86,'黄林','a4f389e0d9aff9f70f2f9e3753a05e07','/pet_imgs/t1.jpg','huanglin@example.com','18657612786',2,'活泼',2,4,2,1,'猫',2,'经常','小','有',1,'老铁751',NULL),
(87,'林婷婷','6c4de3a97d2c3194b1168d9eada08c6f','/pet_imgs/t1.jpg','lintingting@example.com','18657612787',1,'外向',2,9,3,1,'狗',4,'偶尔','中','有',2,'老铁752',NULL),
(88,'冯晓','334d54b7ea7fde365a2209966896df00','/pet_imgs/t1.jpg','fengxiao@example.com','18657612788',2,'内向',1,10,4,1,'猫',2,'经常','小','有',1,'老铁753',NULL),
(89,'何秀','c22f72315b3413e7f1f167bab099fbd2','/pet_imgs/t1.jpg','hexiu@example.com','18657612789',1,'活泼',2,5,1,1,'狗',3,'经常','小','无',2,'老铁754',NULL),
(90,'周明','a7d25ece362353561a5e25e9c5c4b05a','/pet_imgs/t1.jpg','zhouming@example.com','18657612790',1,'沉稳',1,6,2,1,'猫',4,'偶尔','大','有',1,'老铁755',NULL),
(91,'丁庆','72c48908e061fd17de3fc9bb11eb93b0','/pet_imgs/t1.jpg','dingqing@example.com','18657612791',2,'外向',2,8,3,1,'狗',2,'经常','小','有',1,'老铁756',NULL),
(92,'曾玲','488748e16fa97bb66821af8724cb0387','/pet_imgs/t1.jpg','zengling@example.com','18657612792',1,'沉稳',1,6,1,1,'猫',2,'偶尔','小','有',2,'老铁757',NULL),
(93,'汤伟','c572051d1fe254abf8c876bde4bb0182','/pet_imgs/t1.jpg','tangwei@example.com','18657612793',2,'活泼',2,9,4,1,'狗',4,'偶尔','超大','无',2,'老铁758',NULL),
(94,'冯湘','9dcabb0ad781e5bc332de3b2511301fb','/pet_imgs/t1.jpg','fengxiang@example.com','18657612794',1,'沉稳',1,11,3,1,'猫',2,'经常','大','有',1,'老铁759',NULL),
(95,'高飞','996ded93ce5987fb8b2493fd6272c4ad','/pet_imgs/t1.jpg','gaofei@example.com','18657612795',2,'活泼',2,10,2,1,'狗',1,'偶尔','小','有',1,'老铁760',NULL),
(96,'李刚','b2dd844d5c23c4c73f3a51d664b96d72','/pet_imgs/t1.jpg','ligang@example.com','18657612796',1,'沉稳',1,8,3,1,'猫',4,'经常','小','有',1,'老铁761',NULL),
(97,'许军','7c5b376fdcfc02ae330ef3b6d555ece5','/pet_imgs/t1.jpg','xujun@example.com','18657612797',1,'活泼',2,7,2,1,'狗',2,'经常','小','有',1,'老铁762',NULL),
(98,'夏青','51d100b3f849e8c8b840e5898c8e400a','/pet_imgs/t1.jpg','xiaqing@example.com','18657612798',2,'内向',1,10,4,1,'猫',2,'经常','小','有',2,'老铁763',NULL),
(99,'姜浩','805f1cbc060d71c1bab1c43d5c132c1e','/pet_imgs/t1.jpg','jianghao@example.com','18657612799',2,'外向',1,5,3,1,'狗',2,'偶尔','大','无',1,'老铁764',NULL),
(100,'郭强','dbd759cfc1730c3eed25d6d4acdcc45a','/pet_imgs/t1.jpg','guoqiang@example.com','18657612800',1,'沉稳',2,10,4,1,'猫',2,'经常','小','有',1,'老铁765',NULL),
(101,'老刘','a569a091285f44acfd841d85f86f8eb9','/pet_imgs/t1.jpg','us123123er1@example.com','18657612701',1,NULL,0,12,1,1,'狗',1,'偶尔','sunt','大',1,'老铁666',NULL),
(102,'老12312刘','a569a091285f44acfd841d85f86f8eb9','/pet_imgs/t1.jpg','us121233123er1@example.com','18657612701',1,NULL,0,12,1,1,'狗',1,'偶尔','sunt','大',1,'老铁666',NULL),
(103,'李','a01610228fe998f515a72dd730294d87','/pet_imgs/t1.jpg','123123123@qq.com',NULL,0,NULL,0,12,1,1,'1',0,NULL,NULL,NULL,0,NULL,NULL),
(104,'返回','c20ad4d76fe97759aa27a0c99bff6710','/pet_imgs/t1.jpg','1322335934@qq.com','15119900000',1,NULL,0,12,2,1,NULL,0,NULL,NULL,NULL,0,NULL,NULL),
(105,'返回1','c20ad4d76fe97759aa27a0c99bff6710','/pet_imgs/t1.jpg','1322335934@qq.com','15119900000',1,NULL,0,12,1,1,NULL,0,NULL,NULL,NULL,0,NULL,NULL),
(106,'返回2','c20ad4d76fe97759aa27a0c99bff6710','/pet_imgs/t1.jpg','1322335934@qq.com','15119900000',1,NULL,0,12,1,1,NULL,0,NULL,NULL,NULL,0,NULL,NULL),
(107,'返回6','c20ad4d76fe97759aa27a0c99bff6710','/pet_imgs/t1.jpg','1322335934@qq.com','13600000000',1,NULL,0,1,1,1,NULL,0,NULL,NULL,NULL,0,NULL,NULL),
(108,'返回7','c20ad4d76fe97759aa27a0c99bff6710','/pet_imgs/t1.jpg','1322335934@qq.com','13600000000',2,NULL,0,1,1,2,'猫',0,NULL,NULL,NULL,0,NULL,NULL),
(109,'test1','4297f44b13955235245b2497399d7a93','/pet_imgs/t1.jpg','1233@qq.com','18657612701',1,NULL,0,12,1,1,'狗',0,NULL,NULL,NULL,0,NULL,NULL),
(110,'返回8','c20ad4d76fe97759aa27a0c99bff6710','/pet_imgs/t1.jpg','1322335934@qq.com','13600000000',1,NULL,0,1,1,1,'狗',0,NULL,NULL,NULL,0,NULL,NULL),
(111,'用户哥','4297f44b13955235245b2497399d7a93','/pet_imgs/t1.jpg','12333@qq.com','186576112701',1,NULL,0,12,1,1,'狗',0,NULL,NULL,NULL,0,NULL,NULL),
(112,'1','e10adc3949ba59abbe56e057f20f883e','/pet_imgs/t1.jpg','a958798069@gmail.com','13800000001',1,'沉稳',0,25,8,1,'狗',3,'2','2','2',2,NULL,'935304');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
