/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ssh_shoppingwebs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-06-17 08:20:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(255) DEFAULT NULL,
  `ad_province` varchar(255) DEFAULT NULL,
  `ad_city` varchar(255) DEFAULT NULL,
  `ad_county` varchar(255) DEFAULT NULL,
  `ad_address` varchar(255) DEFAULT NULL,
  `ad_phone` char(11) DEFAULT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '王欣妍', '北京市', '北京市市辖区', '东城区', '阿阿阿阿阿阿阿阿', '12345678902');
INSERT INTO `address` VALUES ('17', '王欣妍', '吉林省', '四平市', '伊通满族自治县', '阿阿阿阿阿', '15180509206');
INSERT INTO `address` VALUES ('18', '自增长', '天津市', '天津市市辖区', '和平区', '自增长', '15180509206');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `book_descript` varchar(1000) DEFAULT NULL,
  `booK_price` varchar(255) DEFAULT NULL,
  `book_img` varchar(255) DEFAULT NULL,
  `book_time` varchar(255) DEFAULT NULL,
  `book_publish` varchar(255) DEFAULT NULL,
  `book_author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '经典译林 傅雷家书/经典译林', '“经典译林”版《傅雷家书》以傅雷长子傅聪的留学打拼经历、情感婚姻之路为主线，精心选编傅雷夫妇与傅聪及弥拉的往来家信，内容偏重“人伦日用”，突出傅雷“真诚待人，认真做事”的“做人”准则，少了文化艺术的长篇论述，多了日常生活的短小故事。这份两代人双向交流的文字实录，严肃不失亲切，深刻不离日常，以小见大，乐在其中。它不仅反映了亲子交流的重要，也利于青年学子在阅读中理解父辈、增进沟通。 \r\n　　《傅雷家书》中珍贵照片、楼适夷初版代序、傅聪家信及英法文信为受保护版权，2017年不随傅雷著作权进入公版，其他任何家书选本不能收录。 ', '36', 'shu1.png', '2016-08', '译林出版社 ', '傅雷 朱梅馥 傅聪');
INSERT INTO `book` VALUES ('2', '妞妞：一个父亲的札记', '　妞妞出生后不久就被诊断患有绝症，带着这绝症极可爱也极可怜地度过了短促的一岁半时间。在这本书中，周国平写下了女儿妞妞的可爱和可怜，他和妻子在死亡阴影笼罩下抚育女儿的爱哀交加的心境，在摇篮旁兼墓畔的思考。对于作者夫妇来说，妞妞的故事是他们生命中最美丽也最悲惨的故事，', '28', 'shu2.jpg', '2000-07', '广西师范大学出版社 ', '周国平 著');
INSERT INTO `book` VALUES ('3', '我与父辈', '《我与父辈》是卡夫卡文学奖得主阎连科经典之作，以真挚拙朴的文字书写父亲、四叔、大伯几位农民父辈的活着和活着中的柴米油盐、生老病死、亲情伦理。书中父辈岁月苦涩绵远，挚爱亲情逝水流长，令无数读者潸然泪下，被称作是“一部跪着写的书”，“震撼中国人的乡土神经”。曾获《亚洲周刊》“全球华语优秀作品奖”等多项文学奖；被中央电视台、中国散文协会和《新京报》《中国图书商报》《南方都市报》等报刊评为年度优秀作品。', '34', 'shu3.png', '2016-07', '人民文学出版社', '阎连科 著');
INSERT INTO `book` VALUES ('4', '父亲：梁晓声亲情小说选', '《父亲》牵着他的大手我一路走来…… 《不速之客》捧一颗爱心上路…… 《喷壶》宽恕是一种力量…… 《孩子和雁》不要因贫穷而丢失了志气…… 《爱与机缘》当真爱来临的时候…… 《我和橘皮的往事》老师的宽容与鼓励往往能影响人的一生…… 许多年纪稍大的读者，熟悉梁晓声的名字是从《这里一片神奇的土地》、《今夜有暴风雪》、《雪城》、《年轮》等短篇、中篇、长篇小说开始的。这些轰动一时的力作，曾被改编成电视连续剧，甚至其插曲也是万口传唱，雅俗共赏。梁晓声因而成为公认的“知青文学”的奠基人之一。', '23', 'shu4.jpg', '2005-05', '中国画报出版社', '梁晓声');
INSERT INTO `book` VALUES ('5', '遗产：一个真实的故事', '本书是美国当代文学泰斗菲利普·罗斯的一部纪实作品，荣获1992年度“全美书评人大奖”，成为非虚构类作品的当代经典。在本书中，震撼读者心灵的，是菲利普·罗斯在照顾父亲过程中的大量心理独白和日常细节，以及不断闪现的这个普通犹太人家庭生活的记忆碎片，时而幽默，时而忧郁，时而深沉……', '15', 'shu5.jpg', '2006-01', '上海译文出版社', '[美]罗斯 著');
INSERT INTO `book` VALUES ('6', '父性', '人类父亲的原型是史前阶段带有攻击性的雄性动物。成熟的父亲是兼有冲动与理性、刚烈与温和两种性格特质的复杂形象，这一形象在希腊的古典和神话时代发展到了完美的高峰。随后的人类历史经过了法国大革命、工业革命和现代民主文明时期，父亲的雄性冲动性格和承担家庭责任的特权不断受到残忍的打击和削弱。', '48', 'shu6.png', '2015-05', '世界图书出版公司 ', '[意]鲁格·肇嘉 著');
INSERT INTO `book` VALUES ('7', '端午', '《节日中国：端午》的写作目标则是雅俗共赏，作者们在大量占有历史文献的基础上，力求用精练、生动的现代语言进行表达，在细腻地讲述传统节日故事，给广大读者提供有品位、有趣味的阅读。在各位作者、有关专家，专业图像机构和摄影师的协助下，丛书还萃取了能传达传统俗特点和文化内涵的视觉材料，图文并茂，希望以节俗的化理美、艺术美、生活美与读者的心灵产生共鸣。', '22', 'shu7.png', '2010-05', '生活·读书·新知三联书店', '刘晓峰 著');
INSERT INTO `book` VALUES ('8', '端午节与赛龙舟', '端是“最初”“开端”的意思，所以我们也称初五为端五。农历的五月初五，我们俗称“端午节”。端午节是我国的传统节日。提到端午节，我们眼前一般就会出现众人赛龙舟的场面，耳边传来“嘿呵”的划桨之声，清新的粽子叶的味道飘散在空气中，让人垂涎三尺。尽管各地吃粽子的意义不一样，粽子的内容和做法也不尽相同，但是，都不约而同地反映出了人民的美好愿望。', '39', 'shu8.jpg', '2010-04 ', '吉林出版集团有限责任公司 ', '谢冰 著');
INSERT INTO `book` VALUES ('9', '端午诗词', '每年农历五月初五是我国传统的端午节。对于端午节的起源，历史上有多种说法。有的说是为了纪念战同时因不愿看到自己的国家被秦国灭亡而投江自尽的楚国诗人屈原，有的说是远古时代越地先民举行龙图腾祭祀仪式的一种延续，又有的说是由我国最早的夏、商、周三代的夏至节演变而来。但不管怎么说，端午节的历史渊源是够久远的。', '27', 'shu9.jpg', '2008-05 ', '上海古籍出版社', '上海古籍出版社 编 ');
INSERT INTO `book` VALUES ('10', '中华全国风俗志（上下）', '本着弘扬经典、传播文化的理念，上海科学技术文献出版社凭据上海图书馆的资源优势，将近代以降的人文经典冠以“馆藏拂尘”的名义陆续整理出版，所谓“拂尘”，顾名思义，就是去其“尘埃”，使其清新，原汁原味地重新流播于读者的视野之内，这是我们的出发点，也是一以贯之的宗旨。 胡朴安编著的《中华全国风俗志》分上、下两编，上编引述大量历史资料介绍了有史以来各地的风土人情、乡俚民风，下编则是作者对当时各地风俗的记录。关于本书，榆林张炽章为之作序时说，“盖风俗乃历史产物，乡间习俗，皆有渊源，一事一物，俱关文化，故能知古今风俗，即为知中国一切”。', '40', 'shu10.png', '2011-02', '上海科学技术文献出版社', '胡朴安');
INSERT INTO `book` VALUES ('11', '民国风俗（精）全彩插图本中国风俗通', '民国时期社会巨变，思想开放，带来了社会风俗的巨大变化，而这些风俗都与以往有很大的不同。高洪兴、徐吉军、林永匡、徐华龙、王有钧等著的《民国风俗》全面系统阐述了民国社会风俗，叙述了民国的社会丧葬、饮食、居住、服饰、行旅、婚姻、商贸、生育、养老、信仰、岁月等风俗习惯。', '215', 'shu11.png', '2017-04 ', '上海文艺出版社', '高洪兴、 徐吉军');
INSERT INTO `book` VALUES ('12', '中华礼藏·礼俗卷：岁时之属', '著名学者钱穆先生指出，“中国的核心思想就是‘礼’”。中华礼学是中华民族的集体记忆，然而由于去古日远，且礼经特别是仪礼部分“文古义奥，传习者少，注释者亦代不数人”（《四库全书总目提要》），以致三礼之学日渐式微，一度被学界称为“绝学”。礼学各种典籍逐渐散乱，且礼学文献由于散见于各种不同古籍，一直没有作过全面的辑录汇编，许多古籍处于濒危状态。', '198', 'shu12.png', '2016-11', '浙江大学出版社', '窦怀永 著');
INSERT INTO `book` VALUES ('13', '古董局中局1', '一件坊间传说的稀世珍宝，竟牵出千丝万缕的恩怨。 一桩几十年前的惊世之局，将揭开古董江湖*隐秘、*险恶的一面。 真赝之间，必先窥破圈套手段；掌眼之前，须得悟透世情人心。 一切的一切，始于许愿三十岁生日那天……', '30', 'shu13.png', '2018-05', '湖南文艺', '马伯庸');
INSERT INTO `book` VALUES ('14', '在美国钓鳟鱼', '本书为后垮掉派诗人理查德•布劳提根的小说代表作，在本书中，作者以当时美国社会广为盛行的钓鳟鱼活动和露营旅行为关键词，以“在美国钓鳟鱼”作为一个身份百变的主人公，串起一系列在时空之中、在虚构与现实之间穿梭跳跃的钓鳟鱼之旅。 布劳提根既是诗人又是小说家的双重身份 ，使得《在美国钓鳟鱼》一书既呈现为小说的形式，又具有诗的质地，在小说和诗歌两种文体和思维方式之间自如切换。', '25', 'shu14.png', '2018-05 ', '广西师范大学出版社 ', '[美] 理查德·布劳提根 著');
INSERT INTO `book` VALUES ('15', '老夫子传（修订版）', '《老夫子》曾在台湾红编全岛，现在，又在香港风靡一时——30万中小学生都在看它，都爱看它。以厚实的人生阅历，用优美的线条，勾勒出人生的千滋百味，从城市到乡镇村庄，到处可见其踪影，在南洋，特别是在新加坡、马来西亚和印度尼西亚，红火了数十年，无论男女老少皆成为铁杆粉丝。《老夫子（10）：上下夹攻》为现代版第十册，讲述了他在生活中发生的一系列有趣故事。故事贴近民俗，展现人生百态，亦庄亦谐，令人无味无穷！', '4', 'shu15.png', '2008-02 ', '现代出版社 ', '王泽 著');
INSERT INTO `book` VALUES ('16', '屈原赋注', '《屈原赋注》为清代著名学者戴震（1723-1777）对《楚辞》中屈原各篇注释的汇编。    戴震为乾嘉时皖派汉学的创立者，其治学由声音以求文字，由文字以求训诂，由训诂以求典章制度，由典章制度以求义理。其著述范围广泛，举天文、地理、历史、文学、音韵各学科悉有涉猎。其对于屈赋的诠释亦从此一治学原则出发，以文字肇始而至于义理，故言之有物，见解独特，颇具参考价值。', '10', 'shu16.png', '1999-12', '中华书局', '戴震 编');
INSERT INTO `book` VALUES ('17', '韩非子新校注', '本书是《韩非子》的校注本，它选择精良的版本加以校勘，以汇集前人注释成果和体现当代学术水准为主。撰者在阐释和评注方面有其独创的见解，值得一读。', '70', 'shu17.png', '2000-10 ', '上海古籍出版社 ', '韩非子 著');
INSERT INTO `book` VALUES ('18', '职人不足道', '当大家都在谈论“职人”时，职人本人在谈什么？\r\n  近几年，在媒体的神化渲染下，匠人、职人等词处处为用，然而在霹雳的深度采访中，工匠本人从来不会提起这些字眼儿。被我们视为匠人匠心的事，于他们而言只是再平凡不过的日常——昆曲艺术家自小日日练功，在舞台上一站便是三十年；画遍全世界的绘画师从不谈追求或梦想，只因“好玩儿”拿起画笔；南洋寺庙都会请他来做水陆道场用具的扎库师傅，只视这是一门糊口的手艺；中国屈指可数的刻经师将佛学美镌刻在木板上，却坦言不懂经文……', '45', 'shu18.png', '2018-03 ', '新星出版社', '\r\n霹雳 著 ');
INSERT INTO `book` VALUES ('19', '老子传', '《老子传》充满了灵性和想象力。它并不是一部严格意义上的历史作品，更像是一部小说。 本书以第一人称、第三人称混合形式叙述中国先哲的人生心路、还原历史。将老子的一生串成一个完整的人生历程，关于老子与孔子、苌弘、常枞、秦佚、杨朱、周王室的关系，作者都交待得合理而平常，从语言、习俗、礼乐、天下变迁等方面部分还原了先秦的历史。通过讲述老子的爱情、友谊、教育、仕途人生，探索《道德经》思想的缘起和发展。本书还叙写了老子的爱情、友谊、教育、仕途、隐居等一生的活动。', '58', 'shu19.png', '2018-04 ', '长江文艺出版社', '余世存 著 ');
INSERT INTO `book` VALUES ('20', '说文解字今释', '《说文解字》是我国第一部按照偏旁部首编排的字典，也是中国古代第一部系统分析汉字字形和考究汉语字源的字书。作为两汉文字训诂学之集大成者，在中国语言学史上享有极其重要的地位。', '238', 'lunboshu1.png', '\r\n2018-03', '上海古籍出版社', '汤可敬');
INSERT INTO `book` VALUES ('21', '校订元明杂剧事往来信札', '《校订元明杂剧事往来信札》是当时上海商务印书馆为借印整理出版《也是园旧藏元明杂剧》的往来信札专集。当时了解的元明杂剧不多，只有几十种，而《也是园旧藏元明杂剧》里收录的元明杂剧就有二百余种，其中孤本及鲜见之本就有144种。郑振铎不止一次提到，《也是园旧藏元明杂剧》的发现，不下于清代内阁大库的发现，不下于敦煌石窟的发现。', '3432', 'lunboshu3.png', '2018-01', '商务印书馆', '张元济，王季烈');
INSERT INTO `book` VALUES ('22', ' 爵迹3：冷血狂宴', '郭敬明奇幻巨作《爵迹》系列作品第三部《爵迹：冷血狂宴》，众多读者期待的崭新剧情。水源亚斯蓝王爵使徒的终极一战，奏响ZUI后的狂想曲。用我浴血双手，捧起迎你归来的冠冕。', '34', 'lunboshu2.png', '2018-07', '湖南文艺出版社', '郭敬明');
INSERT INTO `book` VALUES ('23', '\r\n端午 ', '\r\n仅1件在售，欲购从速', '15', 'shu20.jpg', '2011-02', '山西出版传媒集团', '王稼句 著');
INSERT INTO `book` VALUES ('24', '\r\n\r\n\r\n\r\n孔裔谈孔 ', '毛边书局出售此书为旧书（二手）；书品详看书影参考（书品按照孔网有定品范畴来进行标品），书的内容详细内容请自行核实，请核实文字与书影一致（不一致，敬谢纠错）；请您选好适合自己的图书（版本和书品等），谨慎下单和结算；收到书有特殊问题，是毛边书局的责任，保证负责，让您满意为止；', '5', 'shu21.jpg', '1998-09', '中国文史出版社', '孔令朋');
INSERT INTO `book` VALUES ('25', '门孔', '近年来，网上阅读轰动的篇目，是余秋雨先生缅怀谢晋导演的《门孔》 \r\n　　由这篇文章开始，广大读者纷纷寻找余先生缅怀其他文化逝者的文章，于是发现了他笔下的巴金、黄佐临、章培恒、陆谷孙、张可、王元化;同时，也读到了他描述海峡对岸至今健在的文化友人星云大师、白先勇、林怀民、余光中的一系列篇章。 ', '25', 'shu22.jpg', '2017-10 ', '湖南文艺出版社', '余秋雨 著');
INSERT INTO `book` VALUES ('26', '孔 子 ', '孔子精选', '11', 'shu23.jpg', '2010-01', '中华书局', '胡玫 著');
INSERT INTO `book` VALUES ('27', '孔府孔庙孔林', '年限旧的自然旧，介意者慎拍！对版次有要求的请联系客服 ', '7', 'shu24.jpg', '2010-03', '吉林文史出版社', '韩秀林、金开诚 著');
INSERT INTO `book` VALUES ('28', '孔子.', '原版本书如图', '20', 'shu25.jpg', '1991-02', '人民日报出版社', '﹝日﹞井上靖/著');
INSERT INTO `book` VALUES ('29', '论孔丘 ', '书脊有点损 ', '20', 'shu26.jpg', '1975-09', '人民出版社', '冯友兰');
INSERT INTO `book` VALUES ('30', '孔子传 ', '商品分类：\r\n历史 ', '21', 'shu27.jpg', '2016-05', '贵州人民出版社', '李木生 著');
INSERT INTO `book` VALUES ('31', '白孔雀 ', '商品分类：\r\n小说 ', '36', 'shu28.jpg', '2018-04', '中国华侨出版社', '[英]D.H.劳伦斯 著');
INSERT INTO `book` VALUES ('32', '孔雀图 ', '商品分类：\r\n小说 ', '11', 'shu29.jpg', '2011-09', '重庆', '岩波, 著');
INSERT INTO `book` VALUES ('33', '孔天胤传 ', '多个版次的随机发货，对版次有要求的请联系客服!!!!年限旧的自然旧，介意者慎拍！(星期天休息）', '26', 'shu30.jpg', '2017-12', '北岳文艺', '张勇耀，韩兵强');
INSERT INTO `book` VALUES ('34', '论孔子 ', '中共中央总书记、国家主席、中央军委主席、中央网络安全和信息化领导小组组长习主席19日上午在京主持召开网络安全和信息化工作座谈会并发表重要讲话，强调按照创新、协调、绿色、开放、共享的发展理念推动我国经济社会发展，是当前和今后一个时期我国发展的总要求和大趋势', '31', 'shu31.jpg', '2016-04', '人民出版社', '彭富春 著');
INSERT INTO `book` VALUES ('35', '问孔 ', '当图片书名与文字标题书名不一致时，以标题为准。图片是网站自动匹配的，有些再版的书图片可能不一样，请核查一下书的定价等信息。======没有客服，不能及时回复消息，不好意思。', '12', 'shu32.jpg', '2012-05', '海南出版社', '朱晓 编');
INSERT INTO `book` VALUES ('36', '孔子传', '《孔子传》是日本著名汉学家白川静先生的著作。作者以其锐利的目光甄别出史书和后人的粉饰，描述了孔子作为一个平民出身的思想家，不断追求理想，在挫折和漂泊中所度过的一生。', '14', 'shu33.jpg', '2014-02 ', '人民出版社 ', '白川静 著');
INSERT INTO `book` VALUES ('37', '脸孔', '《脸孔》是“民国美文典藏文库”系列丛书之一部。书中收录了杨骚不同时期的散文作品，包括《十日糊记》《关于文艺创作不振的感想》《谢谢小瘪三》《脸孔》《略谈作家的敏感性》《感情的泛滥》等。', '26', 'shu34.jpg', '2016-01 ', '中国文史出版社 ', '杨骚 著');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `book_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('61', '王欣妍', '5', '1');
INSERT INTO `cart` VALUES ('62', '王欣妍', '3', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `order_price` varchar(255) DEFAULT NULL,
  `order_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('41', '王欣妍', '1', '36', '1');
INSERT INTO `orders` VALUES ('42', '王欣妍', '4', '23', '1');
INSERT INTO `orders` VALUES ('43', '李四', '3', '34', '1');
INSERT INTO `orders` VALUES ('44', '张三', '2', '28', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_sex` char(2) NOT NULL,
  `user_phone` char(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('21', '张三', '123456', '男', '12345678909');
INSERT INTO `user` VALUES ('4028188168325ecc016832604c290000', '王欣妍', '123456', '男', '12334567891');
INSERT INTO `user` VALUES ('4028188168365c5701683663071b0000', '李四', '123456', '男', '15180509206');