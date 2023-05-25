/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 25/05/2023 17:01:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `author` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sort` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time` datetime(0) NULL DEFAULT '2017-09-18 00:00:00',
  `star` int(0) NULL DEFAULT 0,
  `comment` int(0) NULL DEFAULT 0,
  `visit` int(0) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (7, '贝雷蒂尼被指责谈恋爱影响战绩几欲崩溃，支持者用蒂姆新女友反驳', '网球之家', '订阅号', '2018-01-01 00:00:00', 0, 1, 0, '因伤接连宣布退出马德里、罗马和法网三项重大赛事后，意大利帅哥贝雷蒂尼原以为可以好好养伤，以便早日重返赛场。没想到却迎来了新的烦恼，他和新女友谈恋爱这件事竟然被人大做文章，并将之和他新赛季的战绩不佳和伤病扯在了一起，令贝雷蒂尼非常受伤。自从今年1月贝雷蒂尼代表意大利出战联合杯，帮助意大利获得亚军之后，让人意外的是，意大利帅哥非但没有在新赛季迎来万众期待的赛场爆发，反而陷入了状态低迷的泥潭中。截止到目前，他在2023赛季的战绩为7胜6负，世界排名更是跌出了前20。\r\n\r\n\r\n\r\n特别是3月份在阿卡普尔科公开赛1/4决赛中因伤退赛，复出参加北美阳光双赛，意大利人竟然背靠背在印第安维尔斯和迈阿密都遭遇了一轮游。\r\n\r\n\r\n\r\n红土赛季开启后，贝雷蒂尼刚在蒙特卡洛大师赛让人看到了状态有复苏的迹象，没想到第三轮却又因伤退赛。当初外界认为贝雷蒂尼会很快复出参赛，就算他连续退出马德里和罗马两项大师赛，至少不会缺席今年的法网。没想到现在连法网也直接宣布退赛了，让球迷和网友大为震惊。原以为贝雷蒂尼新赛季经历这样的不幸，是件令人值得同情的事情，没想到今年1月意大利帅哥被媒体曝出正在和一位大他9岁的新女友梅丽莎·萨塔交往后，风向瞬间就变了。\r\n\r\n\r\n\r\n用贝雷蒂尼的话说，自己遭遇伤病本来就让他十分郁闷了，实在没有想到，有人竟然将他当前的糟糕状况跟自己的爱情扯在了一起，认为他谈了一场不该谈的恋爱，才将自己推向了当前这样万劫不复境地，似乎爱情正在毁掉他的职业生涯。\r\n\r\n\r\n\r\n“在人生的这一阶段，将一段恋爱关系视为职业运动员的分心，这对我来说是不尊重的，这就好比说一个记者因为有妻子和孩子而写的文章更糟糕。这是没有任何意义的事情，不是吗？”贝雷蒂尼日前在接受采访时，谈及有人将自己的战绩不佳和遭遇的伤病归咎于谈恋爱时，情绪十分激动，更是认为这是极度不尊重他的行为。外界有人对贝雷蒂尼表示同情之余，同时指出现在之所以有人指责他谈恋爱影响了战绩，可能和去年同期他的成绩有关。\r\n\r\n\r\n\r\n去年贝雷蒂尼在未被媒体曝出新恋情时，他在澳网打进了四强，今年有了新女友后，却直接遭遇了一轮游；去年同样也曾遭受伤病困扰，但是排名并没有受到多大的影响。今年自从交了新女友后，状态是肉眼可见的直线下降，不但成绩惨不忍睹，贝雷蒂尼的伤病也让人越来越担心，退赛似乎现在已经成了家常便饭。\r\n\r\n\r\n\r\n那么两相对比之下，自然意大利帅哥的新女友则成了影响他成绩和深陷伤病的罪魁祸首，被人拿来说事也就在所难免了。今年27岁的贝雷蒂尼，曾有过多段恋情，之前也被曝出过和汤姆贾诺维奇、阿尼西莫娃等圈内人交往过。让人费解的是，他和圈内人交往一切都风平浪静，并没有被人拿爱情攻击他的赛场表现，反而交往了圈外这位36岁的模特女友后，外界很多人竟然选择了向贝雷蒂尼和新女友的这段恋情开火。\r\n\r\n据悉，早在未发生这件让贝雷蒂尼郁闷的事情之前，就有网友公开表示，这位大意大利帅哥9岁的模特女友，将会给贝雷蒂尼带来厄运，言辞激烈，十分反对两个人在一起。\r\n\r\n\r\n\r\n现在贝雷蒂尼被公然指责新女友影响了他的战绩，在很多人看来，应该是不喜欢意大利人和当前的这位圈外女友交往，特别是在他当前伤病缠身的情况下。贝雷蒂尼对外表达自己对这件事的愤慨，经媒体披露后，也让意大利人的支持者坐不住了。他们认为，意大利帅哥遭受到了前所未有的委屈，这个锅背得有点冤，同时摆出了蒂姆的例子。\r\n\r\n\r\n\r\n蒂姆自从和梅拉德诺维奇分手后，很多人都十分关注他的最新感情动向。\r\n\r\n\r\n\r\n终于在今年的ATP250慕尼黑公开赛上，被人发现他的包厢里坐着一位神似汤姆贾诺维奇的女孩。起初外界还猜测蒂姆是不是和汤姆贾诺维奇在谈恋爱，后来才发现这个女孩并非是汤姆贾诺维奇，只是两个人长得有些像而已。这个女孩正是蒂姆现在交往的新女友，在马戏团从事表演工作。随着和新女友交往的事情正式公开后，蒂姆从2020年就开始和对方交往，以及2021年两个人开始频频约会，也被外界给扒了出来。\r\n\r\n\r\n\r\n有人从蒂姆和新女友交往的时间反驳指责贝雷蒂尼的人，如果谈恋爱会影响一个人的战绩，蒂姆当年和新女友恋爱时，为什么他却拿下了美网的冠军，不是应该成绩一落千丈吗？可见将贝雷蒂尼的战绩不佳归咎于他的爱情，不但听起来很无稽，对意大利人也非常不公平。还不如明着说，不喜欢贝雷蒂尼找现在这位女朋友，这个理由多么直截了当。\r\n\r\n对于自己现在备受球迷和网友抨击，贝雷蒂尼的这位新女友也感到十分委屈，“贝雷蒂尼的伤与2021年的伤是同一个地方，当时我不认识他。但无论如何，我真的要对网友的这些评论负责吗？”\r\n\r\n\r\n\r\n也许从贝雷蒂尼新女友的这番话里，让人感觉她确实承受了不该有的指责。但是有网友则强调，现在外界齐刷刷地将矛头指向她，皆因她有前科。\r\n\r\n\r\n\r\n贝雷蒂尼这位名叫梅丽莎·萨塔的新女友，曾和米兰球员凯文·普林斯·博阿滕有过一段长达4年的婚姻，当时两个人未离婚时，凯文·普林斯·博阿滕在遭遇伤病迟迟无法尽快恢复时，梅丽莎·萨塔曾被指控过多的性生活影响了前夫的伤病康复。\r\n\r\n\r\n\r\n该网友认为，如果从这件事而言，贝雷蒂尼状态的低迷，以及遭遇伤病这么长时间无法恢复，现在竟然连法网这么重要的比赛也直接放弃了，梅丽莎·萨塔有没有影响到贝雷蒂尼的伤病恢复，可能只有她自己心里最清楚了。尽管支持者为贝雷蒂尼的辩驳，看起来具有一定的道理，但是从现在越来越多的人对贝雷蒂尼和新女友的恋情进行网暴来看，意大利人要想尽快摆脱当前承受的困扰，应该不是一件容易的事情，只能看他的意志力有多坚韧，能不能顺利挺过来了！（来源：网球之家  作者：月亮河的星空）');
INSERT INTO `t_article` VALUES (9, '越来越多年轻人不愿走亲戚，是一种社会进步吗？', '南方周末', '订阅号', '2018-09-18 00:00:00', 0, 0, 0, '“年轻人断亲”这一社会话题持续引发热议。\r\n\r\n越来越多的年轻人不走亲戚，与亲戚之间的聊天内容成为网络吐槽的热门话题，进而诞生了大量“反向调教亲戚”的搞笑短视频。这在胡小武看来，在大城市工作的人，回到故乡其实会有一种不适应感，就像“故乡已是异乡”。');
INSERT INTO `t_article` VALUES (10, '今天，我们很想您！', '江苏共青团', '订阅号', '2019-07-16 21:32:55', 2, 3, 2, '两年前的今天\r\n\r\n2021年5月22日\r\n\r\n袁隆平院士逝世\r\n\r\n从此，春种秋收\r\n\r\n都和怀念有关');
INSERT INTO `t_article` VALUES (11, '把作业烧了 吃烧烤', '乡村教师日记 ', '哔哩哔哩', '2022-05-08 07:04:00', 3, 28, 0, '祝大家母亲节快乐');
INSERT INTO `t_article` VALUES (12, '“中国作协只养一个人，那也该是史铁生”【寻找·史铁生】', '大象放映室 ', '哔哩哔哩', '2022-05-08 07:09:04', 0, 0, 0, '今天，让我们一起「寻找 · 史铁生」。');
INSERT INTO `t_article` VALUES (14, 'BeanUtils.populate()的使用', 'lluozh', 'JAVA', '2023-05-23 19:47:26', 0, 0, 0, '一、方法解释\r\n\r\nBeanUtils位于org.apache.commons.beanutils.BeanUtils下\r\n\r\nBeanUtils.populate(Object bean, Map properties)\r\n\r\npopulate是BeanUtils工具类的一个方法\r\n1.1 作用\r\n\r\n这个方法会遍历map<key, value>中的key，如果bean中有这个属性，就把这个key对应的value值赋给bean的属性\r\n1.2 使用\r\n\r\n    在使用这个方法之前定义一个 JavaBean\r\n    通过该方法将map中的数据映射到JavaBean中的get和set方法中(封装数据到JavaBean中)\r\n    取值直接从JavaBean中的get和set方法中取值\r\n\r\n二、实际栗子\r\n2.1 定义JavaBean\r\n\r\n@Data\r\npublic class ProductDto implements Serializable {\r\n\r\n    /**\r\n     * 产品id\r\n     */\r\n    private String productId;\r\n\r\n    /**\r\n     * 产品名称\r\n     */\r\n    private String productName;\r\n\r\n}\r\n\r\n2.2 populate调用\r\n\r\nimport com.lluozh.dto.ProductDto;\r\nimport org.apache.commons.beanutils.BeanUtils;\r\nimport java.lang.reflect.InvocationTargetException;\r\nimport java.util.ArrayList;\r\nimport java.util.HashMap;\r\nimport java.util.List;\r\nimport java.util.Map;\r\n\r\n/**\r\n * @author lluozh\r\n * @Description:\r\n * @date 2021/3/22\r\n */\r\npublic class DemoUtil {\r\n 	public List<ProductDto> query() throws IllegalAccessException {\r\n\r\n        List<ProductDto> resultList = new ArrayList<>();\r\n\r\n        for(int i=0;i<10;i++){\r\n            //创建对象\r\n            ProductDto bean =new ProductDto();\r\n			// 赋值\r\n            Map<String,Object> beanProperMap =new HashMap<>();\r\n            beanProperMap.put(\"productId\",\"lluozh\"+i);\r\n            beanProperMap.put(\"productName\",\"洛\");\r\n			//将request中的参数映射到User Bean中的set和get方法\r\n            BeanUtils.populate(bean,beanProperMap);\r\n            //保存集合\r\n            resultList.add(bean);\r\n        }\r\n        return resultList;\r\n    }\r\n}');
INSERT INTO `t_article` VALUES (55, '俄媒爆料：乌克兰最高将领在俄军攻击中受重伤，可能将无法继续指挥 ', ' 环球网 ', '新闻', '2023-05-25 00:00:00', 1, 1, 0, ' （原标题：俄媒爆料：乌克兰最高将领在俄军攻击中受重伤，可能将无法继续指挥）\r\n\r\n【环球网报道】综合俄新社、“今日俄罗斯”（RT）网站24日报道，消息人士透露，近期没有公开露面的乌克兰武装部队总司令扎卢日内几周前在俄罗斯对赫尔松附近的一次攻击中受重伤，可能将无法再履行其指挥职责。\r\n\r\n俄媒爆料：乌克兰最高将领在俄军攻击中受重伤，可能将无法继续指挥\r\n\r\n乌克兰武装部队总司令扎卢日内资料图，俄新社报道配图\r\n\r\n综合俄新社、RT报道，5月初，在赫尔松市附近的一个乌军指挥所受到导弹袭击时，扎卢日内头部受创伤，身上还有多处弹片伤。袭击发生后，扎卢日内在基辅的一家军事医院接受了开颅手术。消息人士补充说，医生当时的评估是，扎卢日内将没有生命危险，但将无法履行其指挥职责。报道还称，扎卢日内的身体状况还因他患有的糖尿病而进一步复杂化。\r\n\r\nRT称，关于扎卢日内身体状况的猜测是在他缺席5月10日的一场备受瞩目的北约会议后出现的。北约军事委员会主任鲍尔在北约参谋长级别会议上称，“扎卢日内因‘局势紧张’拒绝参会”，“即便是通过视频形式”。报道称，此后，扎卢日内一直没有公开露面，尽管近日网上出现显示他状态良好的录像，但被认为是在早前制作的。报道还提到，对于扎卢日内的情况，乌克兰国防部副部长安娜·马尔亚尔20日曾称，扎卢日内“健康状况良好”，仍然负责指挥工作，并指责关于扎卢日内可能受伤或死亡的“谣言”是由俄方散布的。\r\n\r\n相关新闻\r\n\r\n被炸身亡？遭袭重伤？很久没公开露面的乌军总司令健康状况疑团重重\r\n\r\n最近几周围绕乌军总司令扎卢日内健康状况的传闻甚嚣尘上。既有说他已经在5月初俄军的导弹袭击中遭袭身亡的，也有说他受重伤，状况糟糕的……虽然乌官方一再否认外界流传的各种版本，但他已经很久没有公开露面，这进一步刺激了流言在国外网站上的传播。而一些似乎想要通过国外社交媒体释放出的反驳乌军将领健康状况的所谓“证据”，不但没有起到释疑的作用，反而进一步加重了疑团的复杂性。\r\n\r\n\r\n乌军总司令扎卢日内\r\n\r\n老刘简单梳理了一下，自从5月以来，有关乌军总司令扎卢日内健康状况的多个版本，虽然根据现有信息并不能证明哪个版本是真实的，或者哪个版本是假的，但通过对比，可以找到不同版本之间共同的地方，以及矛盾之处。\r\n\r\n最新版\r\n\r\n俄罗斯《消息报》22日报道称，21日，俄黑客组织“顿涅茨克小丑”发言人称，扎卢日内5月初在乌军一个指挥部遭到俄导弹打击受重伤，可能会离职。俄军近期加大对乌克兰一些军事设施实施一系列打击后，他再也没有公开露面。俄媒体称，根据西方国家的指示，乌克兰封锁了关于他健康状况的消息，以免打击本就因失去巴赫穆特而消沉的乌军士气。\r\n\r\n根据俄媒的说法，这一黑客组织定期发布通过多种渠道获取的内幕消息和秘密文件，西方和乌克兰媒体已多次证实该黑客组织所爆消息的准确性。\r\n\r\n最初版\r\n\r\n而所有的传言都是无风不起浪。对于俄乌战事的走向有着这么重要影响的当事一方高级军事将领的健康状况，怎么就会传出伤亡之类的传言呢？或者说最初这类传言是怎么出来的呢？\r\n\r\n老刘查看了公开信息，这一说法最初还真不是俄方信息战的结果。\r\n\r\n乌媒称，5月初，北约军事委员会主席罗布·鲍尔海军上将表示，扎卢日内“因局势紧张”放弃参加该组织的会议，甚至没有以视频形式参加。\r\n\r\n\r\n报道截图\r\n\r\n正因如此，多家媒体纷纷猜测他可能已在前线身亡，但这一说法遭到乌国防部官员的驳斥。不过，相关的传闻并没有因为乌官方的反驳而消散，反而越传越离谱。\r\n\r\n细节加强版\r\n\r\n除了上述版本，还有多个增加了多种细节的加强版。比如俄媒援引乌方消息人士的话称，乌军总司令正在基辅国家军事医学临床中心，身体情况很糟糕。俄战地记者安德烈·鲁坚科援引乌军领导层的消息来源透露，扎卢日内于5月8日受重伤。当天，他前往第聂伯罗彼得罗夫斯克地区的乌军部队东部集群的一个指挥所，在那里检查部队准备反攻的情况。当时俄军对这一地区进行了导弹打击，该指挥所被巡航导弹精准击中，结果造成包括扎卢日内在内的大批乌克兰高级军官死伤。\r\n\r\n甚至还有消息称，该医学临床中心的一名工作人员在社交媒体上发表了一篇帖子称，有大量伤员进入基辅医院，其中有一位重要人物伤势严重。5月10日，有人在该中心看到扎卢日内的妻子叶琳娜，她在那里待了4个小时。\r\n\r\n老刘通过梳理上述版本的传闻，发现有关传闻的基本要素大都定位于5月8日对乌指挥所的一场俄军导弹打击。正是在5月8日之后，乌社交网络和乌媒体出现了报道扎卢日内日常活动的有意或无意的暂停。\r\n\r\n除了上述不同版本的传闻，乌方也在试图通过多种渠道去打消外界的疑虑，但截至目前效果似乎并不是很好，甚至有些做法会进一步增加人们的疑惑。\r\n\r\n证据一\r\n\r\n先来看看乌官方的最新回应。\r\n\r\n乌克兰国家通讯社21日报道称，乌克兰国防部副部长安娜·马利亚尔20日表示，扎卢日内将军在继续履行自己的职责。她说，有关乌军总司令死亡的报道旨在打击乌军队士气，“俄罗斯人发起了一场关于我们总司令扎卢日内据称失踪的新闻浪潮。总司令仍在做自己的工作，我们刚刚联系过。这是俄罗斯典型的信息宣传，旨在使乌克兰军队士气低落，俄罗斯人现在散布这种错误信息是因为巴赫穆特的紧张局势达到了顶峰。”\r\n\r\n她称，在过去两周里，俄方一直在散布假消息，声称乌克兰几名高级指挥官死亡，其中包括乌军总司令扎卢日内和乌陆军总司令瑟尔斯基将军等，这是一个骗局。\r\n\r\n证据二\r\n\r\n乌方似乎还希望通过社交媒体来透露一些“证据”。比如，20日，在乌克兰社交网络上流传着一组照片：扎卢日内在海中游泳。乌克兰的博客宣称，乌总司令没有准备“反击”，而是前往塞浦路斯。然而，很快有人就发现这张照片是旧的，因为他看起来太年轻，不像是最新的照片。\r\n\r\n还有分析认为，乌总司令在他的士兵和军官受到重创时却在享受休闲时光，这对乌军方来说太过分了。这一说法被否认，乌方称这是俄罗斯的信息战。\r\n\r\n证据三\r\n\r\n乌社交媒体上此前流传着扎卢日内参加一场婚礼的照片，但相关照片也被证明是以前的画面。\r\n\r\n\r\n扎卢日内参加婚礼的照片\r\n\r\n发帖人表示，扎卢日内确实参加了他的婚礼，但婚礼举办的时间并不在发帖时间。也就是说这组照片也不能作为乌军总司令近期出席了公开活动的佐证。\r\n\r\n证据三\r\n\r\n据报道，敖德萨国立大学法学院发布了扎卢日内于5月20日在科学日国际会议开幕式上发表讲话的视频，但他没有亲自出席会议。在视频中，扎卢日内的演讲背景模糊，他穿着野战服。他没有被问任何问题，也没有参加与其他与会者的对话。\r\n\r\n之前，乌媒体还公布了他接受记者德米特里·科马罗夫采访的视频，但无法证实他是否是现场接受的采访。\r\n\r\n也就是说目前，并没有非常充分的旁证可以证明他近期有公开露面，并不能打破相关传闻。\r\n\r\n证据四\r\n\r\n老刘也去查看了扎卢日内的多个社交媒体账号。\r\n\r\n在他的推特账号上可以看到，最新一次更新是5月2日，内容是与美国参联会主席米利通电话，通话内容大概就是双方讨论要继续加强防空系统的能力。\r\n\r\n\r\n推特截图\r\n\r\n也就是说在传闻中提到的5月8日的俄军空袭行动之后，该账号没有进行过更新。\r\n\r\n不过，老刘在查看该账号的过程中，发现其中有大量扎卢日内与西方国家高级将领通电话的信息，其中通话最多的就是美国参联会主席米利。\r\n\r\n该推特账号发布的两人上一次通话是在4月5日。\r\n\r\n\r\n推特截图\r\n\r\n而扎卢日内的电报账号近日则更新了他与米利近期通话的内容，相关内容也被乌克兰《真理报》等媒体转引。\r\n\r\n\r\n\r\n社交媒体截图\r\n\r\n但即便该账号是20日更新的最新一期内容，但截至目前也没法作为扎卢日内目前健康状况的佐证。一方面因为，这一社交媒体账号完全可以由乌方相关团队来运营，并不一定要由乌军总司令本人来发布；另一方面美军方截至目前也没有证实本次通话确实存在。当然美方即便心知肚明，也很可能不会对外说明相关情况。\r\n\r\n综上所述可以掌握的公开信息，仍不能证明在俄乌媒体以及国外多个社交媒体上热传的有关“扎卢日内身亡或重伤”的说法到底是真是假，但让外界十分不解的一个情况就是，作为对乌军作战以及部队士气非常重要的乌军高级将领，当自身健康状况被外界猜测，带来对其本人以及乌军在俄乌冲突一线整体作战态势的严重负面影响时，为何不亲自出来打破传闻，才是让外界始终不太理解的地方，甚至因此也进一步加重了疑惑。\r\n\r\n当然最终事情的进展，还要看有关当事方发布的权威信息，毕竟信息战、舆论战也是俄乌冲突中非常多见的一种作战方式，甚至此前俄军总参谋长格拉西莫夫也曾被传在视察乌东前线时遭袭受重伤，但之后这一说法被证明是谣言。');
INSERT INTO `t_article` VALUES (57, '测试乱码的文章之二', '乱码的小哥', 'JAVA', '2023-05-25 16:25:51', 1, 0, 0, '乱码不');

-- ----------------------------
-- Table structure for t_article_delete
-- ----------------------------
DROP TABLE IF EXISTS `t_article_delete`;
CREATE TABLE `t_article_delete`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `author` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sort` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time` datetime(0) NULL DEFAULT '2017-09-18 00:00:00',
  `star` int(0) NULL DEFAULT 0,
  `comment` int(0) NULL DEFAULT 0,
  `visit` int(0) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_article_delete
-- ----------------------------
INSERT INTO `t_article_delete` VALUES (1, 'k', 'kkk', 'kkk', '2018-07-16 00:00:00', 3, 3, 3, 'helloworld');
INSERT INTO `t_article_delete` VALUES (2, 'z', 'zzz', 'zzz', '2019-01-18 00:00:00', 2, 2, 2, 'java');
INSERT INTO `t_article_delete` VALUES (3, 'c', 'ccc', 'ccc', '2020-01-01 00:00:00', 1, 1, 1, 'javaweb');
INSERT INTO `t_article_delete` VALUES (4, '删除分类的测试', '删除分类的测试', '删除分类的测试', '2023-05-24 21:45:33', 0, 0, 0, '删除分类的测试');
INSERT INTO `t_article_delete` VALUES (5, '1', '1', '1', '2023-05-24 21:50:47', 0, 0, 0, '1');
INSERT INTO `t_article_delete` VALUES (6, '家庭人均', '核问题然后', '哈', '2023-05-24 23:13:37', 0, 0, 0, '核问题然后我');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `article_id` int(0) NULL DEFAULT NULL,
  `nickname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `time` datetime(0) NULL DEFAULT '2017-09-18 00:00:00',
  `star` int(0) NULL DEFAULT 0,
  `diss` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  CONSTRAINT `article_id` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (10, 10, '9', '9', '2017-09-18 00:00:00', 0, 0);
INSERT INTO `t_comment` VALUES (11, 10, '哈哈', '哈哈哈', '2017-09-18 00:00:00', 0, 0);
INSERT INTO `t_comment` VALUES (14, 11, '666', '6666', '2023-05-25 10:57:35', 1, 1);
INSERT INTO `t_comment` VALUES (17, 11, 'ç­å¿ç½å', '778', '2023-05-25 11:10:20', 1, 10);
INSERT INTO `t_comment` VALUES (41, 7, 'hanbani', 'you are so cool', '2023-05-25 15:39:30', 0, 0);
INSERT INTO `t_comment` VALUES (43, 11, '热心网友', '哈哈哈哈哈', '2023-05-25 16:25:40', 0, 0);
INSERT INTO `t_comment` VALUES (46, 55, '热心网友', '6666', '2023-05-25 16:37:00', 0, 0);

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int(0) NULL DEFAULT NULL,
  `tag` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `t_tag_ibfk_1` FOREIGN KEY (`id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (12, '史铁生');
INSERT INTO `t_tag` VALUES (10, '残疾人发展');
INSERT INTO `t_tag` VALUES (11, '教师');
INSERT INTO `t_tag` VALUES (14, '文章');
INSERT INTO `t_tag` VALUES (57, '文章');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'primary_key',
  `user_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'username',
  `user_password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'password',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'Brian', '1');
INSERT INTO `t_user` VALUES (2, 'Gaosie', '123456');
INSERT INTO `t_user` VALUES (3, 'admin', 'admin');

-- ----------------------------
-- Table structure for t_visitor
-- ----------------------------
DROP TABLE IF EXISTS `t_visitor`;
CREATE TABLE `t_visitor`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `web_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `host` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_visitor
-- ----------------------------
INSERT INTO `t_visitor` VALUES (1, '127.0.0.1', '2018-07-16', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (52, '127.0.0.1', '2018-07-16 21:22:36', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (53, '127.0.0.1', '2018-07-16 21:22:46', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (54, '127.0.0.1', '2018-07-16 21:22:55', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (55, '127.0.0.1', '2018-07-16 21:30:52', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (56, '127.0.0.1', '2018-07-16 21:31:53', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (57, '127.0.0.1', '2018-07-16 21:36:35', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (58, '127.0.0.1', '2018-07-16 22:52:51', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (59, '127.0.0.1', '2018-07-16 22:53:17', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (60, '127.0.0.1', '2018-07-16 22:56:59', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (61, '127.0.0.1', '2018-07-16 22:58:09', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (62, '127.0.0.1', '2018-07-16 22:58:10', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (63, '127.0.0.1', '2018-07-16 22:58:16', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (64, '127.0.0.1', '2018-07-16 22:58:49', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES (65, '127.0.0.1', '2018-07-16 23:16:43', '127.0.0.1', '127.0.0.1');

SET FOREIGN_KEY_CHECKS = 1;
