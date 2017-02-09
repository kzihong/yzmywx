/*
Navicat MySQL Data Transfer

Source Server         : 114.215.140.181
Source Server Version : 50173
Source Host           : 114.215.140.181:3306
Source Database       : yzmywx

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-04-05 18:12:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accesstoken`
-- ----------------------------
DROP TABLE IF EXISTS `accesstoken`;
CREATE TABLE `accesstoken` (
  `id` varchar(200) NOT NULL,
  `token` varchar(200) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accesstoken
-- ----------------------------
INSERT INTO `accesstoken` VALUES ('1', 'LnJMvwL78LLeW3JzQqlO6Bwe7qBWrH-fYotMvQpF65MZCHs7ceysuNZpTeb0wB5O_JVDh7q1Oy4rjvSPxDWmJeShPLdP_PcCW7Gc7TZv279bMcR8jPAgpUq2JGUjNjwYVUQhACAIHD', '2016-04-05 17:17:00');
INSERT INTO `accesstoken` VALUES ('2', 'kgt8ON7yVITDhtdwci0qeYdB18Ce7ErYN8dLSz8ZFEQrMi90ZyaWUQiKXex0IOHVCK7ty2H1tT1fn5YjpyN9lA', '2016-04-05 17:17:00');

-- ----------------------------
-- Table structure for `button`
-- ----------------------------
DROP TABLE IF EXISTS `button`;
CREATE TABLE `button` (
  `id` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `pid` varchar(200) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `mediaid` varchar(200) DEFAULT NULL,
  `btkey` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_buttontype` (`type`),
  CONSTRAINT `button_ibfk_1` FOREIGN KEY (`type`) REFERENCES `buttontype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of button
-- ----------------------------
INSERT INTO `button` VALUES ('172bdd86-2915-41ed-ac4d-bf668c8a76a8', '木门维修', '2', '54da7cf2-4d14-490d-9edb-d5869f7de803', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb612fa3cd08890a8&redirect_uri=http://www.9918266.cn/repairClient.jsp&response_type=code&scope=snsapi_base&state=door#wechat_redirect', null, null);
INSERT INTO `button` VALUES ('347577aa-1346-408b-8a3d-27ea6e219a16', '公司资讯', '2', '0', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb612fa3cd08890a8&redirect_uri=http://www.9918266.cn/new.html&response_type=code&scope=snsapi_base&state=door#wechat_redirect', null, null);
INSERT INTO `button` VALUES ('3e7fc08d-d8a5-4186-8db7-2d4ce0786204', 'test', '2', '73eaf9c8-612f-4e7e-b021-77e1590da87a', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb612fa3cd08890a8&redirect_uri=http://www.9918266.cn/testProductorder.jsp&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect', null, null);
INSERT INTO `button` VALUES ('54da7cf2-4d14-490d-9edb-d5869f7de803', '我要维修', '0', '0', null, null, null);
INSERT INTO `button` VALUES ('73eaf9c8-612f-4e7e-b021-77e1590da87a', '韵宅商城', '0', '0', null, null, null);
INSERT INTO `button` VALUES ('817b1fc6-bad2-4cba-b72c-670c4ae0553b', '水电维修', '2', '54da7cf2-4d14-490d-9edb-d5869f7de803', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb612fa3cd08890a8&redirect_uri=http://www.9918266.cn/repairClient.jsp&response_type=code&scope=snsapi_base&state=sd#wechat_redirect', null, null);
INSERT INTO `button` VALUES ('9e6c5407-f432-450c-9827-ea52197fefc0', '我的订单', '2', '73eaf9c8-612f-4e7e-b021-77e1590da87a', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb612fa3cd08890a8&redirect_uri=http://www.9918266.cn/orderhistory.jsp&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect', null, null);
INSERT INTO `button` VALUES ('aa9a860d-c2a3-4397-ba36-38d1d59d8eab', '其他维修', '2', '54da7cf2-4d14-490d-9edb-d5869f7de803', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb612fa3cd08890a8&redirect_uri=http://www.9918266.cn/repairClient.jsp&response_type=code&scope=snsapi_base&state=other#wechat_redirect', null, null);
INSERT INTO `button` VALUES ('c7e2975f-54fe-4933-ac51-9adb142db15b', '历史订单', '2', '54da7cf2-4d14-490d-9edb-d5869f7de803', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb612fa3cd08890a8&redirect_uri=http://www.9918266.cn/repairhistory.jsp&response_type=code&scope=snsapi_base&state=history#wechat_redirect', null, null);
INSERT INTO `button` VALUES ('cc633696-07f2-4ea7-b78a-7047e30e9e9f', '韵宅商城', '2', '73eaf9c8-612f-4e7e-b021-77e1590da87a', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb612fa3cd08890a8&redirect_uri=http://www.9918266.cn/shopping.jsp&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect', null, null);
INSERT INTO `button` VALUES ('e759dca4-c825-46e3-9155-de7bd091ef4d', '师傅入口', '2', '54da7cf2-4d14-490d-9edb-d5869f7de803', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb612fa3cd08890a8&redirect_uri=http://www.9918266.cn/workerentrance.jsp&response_type=code&scope=snsapi_base&state=worker#wechat_redirect', null, null);

-- ----------------------------
-- Table structure for `buttontype`
-- ----------------------------
DROP TABLE IF EXISTS `buttontype`;
CREATE TABLE `buttontype` (
  `id` varchar(200) NOT NULL,
  `typename` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buttontype
-- ----------------------------
INSERT INTO `buttontype` VALUES ('0', '一级菜单');
INSERT INTO `buttontype` VALUES ('1', 'click');
INSERT INTO `buttontype` VALUES ('10', 'view_limited');
INSERT INTO `buttontype` VALUES ('2', 'view');
INSERT INTO `buttontype` VALUES ('3', 'scancode_push');
INSERT INTO `buttontype` VALUES ('4', 'scancode_waitmsg');
INSERT INTO `buttontype` VALUES ('5', 'pic_sysphoto');
INSERT INTO `buttontype` VALUES ('6', 'pic_photo_or_album');
INSERT INTO `buttontype` VALUES ('7', 'pic_weixin');
INSERT INTO `buttontype` VALUES ('8', 'location_select');
INSERT INTO `buttontype` VALUES ('9', 'media_id');

-- ----------------------------
-- Table structure for `cartitem`
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `id` varchar(64) NOT NULL,
  `customer_id` varchar(64) DEFAULT NULL,
  `product_id` varchar(64) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `modifytime` bigint(20) DEFAULT NULL,
  `product_category` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_id_cart` (`customer_id`),
  KEY `fk_product_id_cart` (`product_id`),
  KEY `fk_product_category_cart` (`product_category`),
  CONSTRAINT `fk_customer_id_cart` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`openid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_category_cart` FOREIGN KEY (`product_category`) REFERENCES `productcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_id_cart` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES ('f826543711e6468bb3e8f4040867bca1', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', 'f4dab990-cbd8-4413-8043-1c255d8fa42a', '10', '1459844994410', '1459845012666', '060f79eed4b54dc984fa40c79a58a74a');

-- ----------------------------
-- Table structure for `companynews`
-- ----------------------------
DROP TABLE IF EXISTS `companynews`;
CREATE TABLE `companynews` (
  `id` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `photoUrl` varchar(255) DEFAULT NULL,
  `content` text,
  `createtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companynews
-- ----------------------------
INSERT INTO `companynews` VALUES ('3b5eb477-7d46-4af3-b605-eb7b8c484885', '广东三位厅官互相“举报” 两人同天被免', '/rest/editor/file/image/20160322/20160322173528_143.jpg', '<div class=\"artical-player-wrap\" style=\"margin:0px auto;padding:15px 0px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<div class=\"a-p-hd\" style=\"padding:14px 14px 0px;text-align:center;background:#E4E4E4;\">\r\n		<div class=\"a-p-info\" style=\"text-align:right;\">\r\n			<span id=\"J_Video_Source\">广东省工商局原局长被双开</span>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"img_wrapper\" style=\"text-align:center;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;\">\r\n	<img alt=\"朱泽君 资料图\" src=\"http://n.sinaimg.cn/news/transform/20160322/VJg5-fxqnskh1081864.jpg\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:14px;\">朱泽君 资料图</span>\r\n</div>\r\n<div class=\"img_wrapper\" style=\"text-align:center;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;\">\r\n	<img alt=\"曹鉴燎 资料图\" src=\"http://n.sinaimg.cn/news/transform/20160322/V-u1-fxqpchx6403232.jpg\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:14px;\">曹鉴燎 资料图</span>\r\n</div>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<span style=\"line-height:1.6;\">&nbsp;3月20日，广东省纪委发布消息：日前，经广东省委同意，广东省纪委对省工商局原党组书记、局长朱泽君的严重违纪问题进行了立案审查。</span>\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	法制晚报记者(微信公众号：观海内参guanhaineican)查阅资料发现，朱泽君在去年8月17日被宣布接受组织调查之前，他被广东省纪委调查过两 次。第一次历时8个月，第二次历时近1个月，对外均宣称“去党校学习”。被调查原因都是因为一封举报信，而这封举报信的幕后主谋则是广州市原副市长曹鉴 燎。曹鉴燎在案发前，兼任广州增城市委书记，朱泽君是他的前任。曹鉴燎此举，是要干扰办案方向，把火引向他人。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<strong>副市长举报他人&nbsp; 竟为了干扰办案&nbsp;</strong>\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	早在2013年底，网络上即流传出《增城5市民实名举报梅州市委书记朱泽君》的帖子，内容极为详细。这封信直指朱泽君担任增城市委书记期间买官卖官、贪污受贿、包养情妇，甚至把一名情妇提拔为副市长。举报信末尾，还留下了举报人的姓名与电话。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	据《廉政瞭望》报道，一名熟悉广州政情的人士介绍，举报信一出，尽管内容真假无法查证，但人们都感觉信的背后大有来头。“信里列出了很多细节，这不是一般人能凭空杜撰的。即便是栽赃，也是一个十分熟悉内情的人，通过移花接木，把许多事弄得扑朔迷离。”\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	这名人士说，在举报信里留下姓名的，是一名增城采沙场的老板。这家采沙场被朱泽君整顿过，对方怀恨在心可以理解。不过以他的能量，搞不出这么大动静。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	该人士还透露，举报信里提到，朱的哥哥是画家，他的一幅油画被送到境外拍卖，被一家国内知名地产商以超亿元的价格拍下。“这在广东官场几乎人尽皆知。”\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	直到一年多以后，真相浮出水面。在幕后指使人写举报信的，竟是曹鉴燎。曹鉴燎觉察出纪委正在调查自己，就安排人写举报信，目的是干扰办案方向，把火引向朱泽君。当然，曹并未得逞。2014年7月11日，曹鉴燎被“双开”，并移送司法。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<strong> </strong><span class=\"img_descr\">前任“宠臣”遭后任排挤 &nbsp;两任领导隔空叫板</span> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	法制晚报记者(微信公众号：观海内参guanhaineican)查阅公开资料获悉，1997年3月，朱泽君来到广州增城任副市长，一年后升任增城市委常 委、市委秘书长。3年后，时年37岁的他出任增城市长，6年后升任市委书记，至2010年7月，朱泽君在增城担任党政一把手长达10年。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	2010年7月，朱泽君调任地级市梅州，出任代市长，2012年2月升任市委书记、市人大常委会主任。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	朱泽君的继任者徐志彪是通讯专家，早在2007年便担任广州市副市长。增城市一名公务员介绍，徐志彪的个性比较温和，他在增城只待了一年。对于朱泽君留下的重大政策，徐志彪并未推翻，朱泽君提拔的干部，徐也基本没动。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	徐志彪之后的增城市委书记便是曹鉴燎。曹鉴燎是土生土长的广州人，从一名公社主任干到副市长，是有名的强势人物。根据曹落马后的供述，除了工作玩命，自 己在捞钱上也毫不手软，此外还与多名女性通奸。他的“能量”很大，甚至可以把自己的情妇由科员提拔成副厅级干部，后来还外调到某地级市担任市委常委、宣传 部长。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	曹鉴燎主政增城后，施政风格同样大刀阔斧，一批朱泽君时代的“宠臣”遭到排挤。这些人不断跑去梅州，向老领导诉苦，朱泽君为此牢 骚不断。曹鉴燎在增城也听说了很多朱泽君主政时与商人沆瀣一气的事情，尽管曹本人此前在天河区、海珠区任职时，也是一把敛财的好手，但他还是在办公室怒 斥：“简直是胆大妄为！这种人居然还得到提拔重用，让真正干事的人心里怎么想？”为此，二人开始了隔空叫阵。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<strong>市委书记与纪委书记互相举报 &nbsp; 两人同天被免</strong>\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	朱泽君遭人放“暗箭”，据《廉政瞭望》的报道，他开始一边向上级反映，希望组织还自己清白，一边也在私下探查谁在背后放黑枪。相当长的一段时期内，朱泽君 把“仇家”锁定在李纯德身上。李是河南人，大学毕业后进入广东省纪委，从一名科员干到正处级的政研室副主任。2006年，李纯德来到梅州，担任梅州市委常 委、纪委书记。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	为此，梅州市委书记和梅州纪委书记拉开了一场互相举报的“战争”，朱泽君与李纯德不和也成为了梅州官场人尽皆知的秘密。据财新网报道，两人数度亲自前往广东省纪委举报对方。 &nbsp; &nbsp;&nbsp;\r\n</p>\r\n<div id=\"ad_44086\" class=\"otherContent_01\" style=\"font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;margin:10px 20px 10px 0px;padding:4px;\">\r\n	<iframe width=\"300px\" height=\"250px\" frameborder=\"0\" src=\"http://x.jd.com/exsites?spread_type=2&amp;ad_ids=1884:5&amp;location_info=0&amp;callback=getjjsku_callback\">\r\n	</iframe>\r\n</div>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	据澎湃新闻报道，为拿到李纯德的把柄，朱泽君曾授意当地一名处级官员宴请李，请托私事，故意谈及送钱细节，并全程偷录对话。事后，朱泽君直接将“录音带” 交给广东省相关领导，要求查处。据称，这名官员为梅州某县公安局局长，与朱泽君交好，曾被举报履历造假及贪腐等问题。该局长请李纯德在广州吃饭，希望帮助 解决此事，同时还偷偷做了录音录像。此后，朱泽君拿着这一材料亲自去举报李纯德。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	多位梅州官场人士则称，事实上李纯德并没有答应公安局长请托，举报内容最多够得上大吃大喝或打麻将等“违反八项规定”的情节。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	据财新网报道，2014年8月15日，朱泽君被免去梅州市委书记、常委、委员职务。当时与他一同被免职的还有梅州市原纪委书记李纯德。当年12月，广东省纪委方面公布了对李纯德的处理意见：开除党籍、降为科员。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	而朱泽君调任广东省工商行政管理局党组书记、局长，直到去年8月“落马”。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<strong>文/记者 温如军(微信公众号：观海内参guanhaineican)</strong>\r\n</p>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	责任编辑：刘德宾 SN222\r\n</p>', '1458639344675');
INSERT INTO `companynews` VALUES ('50ace8ca-9eeb-448a-8860-b626dac00f64', '山东问题疫苗流入多省 9家药企涉案', '/rest/editor/file/image/20160322/20160322173317_904.png', '<p>\r\n	<span style=\"color:#444444;font-family:\'Microsoft YaHei\', 微软雅黑, SimSun, 宋体;font-size:16px;line-height:28px;background-color:#ECECF7;\">山东警方破获案值5.7亿元非法疫苗案，疫苗未经严格冷链存储运输销往多个省市。据济南警方初步统计，在长达5年多时间，庞某卫母女从医药公司业务员或疫苗贩子手中，低价购入流感、乙肝、狂犬病等人用疫苗然后加价售往湖北、安徽、广东、河南、四川等省，9家药品批发企业涉山东问题疫苗案被通报。</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#444444;font-family:\'Microsoft YaHei\', 微软雅黑, SimSun, 宋体;font-size:16px;line-height:28px;background-color:#ECECF7;\"><span style=\"color:#656565;font-family:\'Microsoft YaHei\', 微软雅黑, SimSun, 宋体;font-size:14px;line-height:26px;background-color:#FFFFFF;\">【专家：二类疫苗市场化运作导致价格上涨】北京大学医院公共卫生学院教授周子君表示， 现在也有技术手段，比如在疫苗上贴温控，成本随之增高。所以现在很多人抱怨二类疫苗价格贵。因为一类疫苗是国家贴了很多钱，这是个机制的问题。而问题疫苗更有可能流入农村或不规范的民营医院，“二类疫苗有市场化运作，所以有人导快到效期的。因为便宜，再卖出去，加价去打。”（新浪新闻）</span><br />\r\n</span>\r\n</p>', '1458639211663');
INSERT INTO `companynews` VALUES ('5bddddcb-539d-4f4f-a8d6-21d12f199af3', '中国驻比利时大使馆：暂无中国公民伤亡', '/rest/editor/file/image/20160322/20160322173431_975.jpg', '<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	原标题：暂无中国公民伤亡消息\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	中国驻比利时大使馆领事值班人员王先生22日下午告诉@法制晚报 “在爆炸发生后，使馆一直和比利时方面保持联系和沟通，暂时没有收到有中国公民在爆炸中受伤或者死亡的消息，使馆方面也暂未收到有中国公民打来的的求救电话。(记者 李志豪)\r\n</p>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	责任编辑：倪子牮\r\n</p>', '1458639279221');
INSERT INTO `companynews` VALUES ('6017a79b-6056-4e4f-b947-20a6180ca580', '习近平会见朴槿惠 就朝鲜半岛形势交换看法', '/rest/editor/getPIC/image/4e058e73a9714816a5f5ce18309049ad.png', '<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\n	原标题：习近平会见韩国总统朴槿惠\n</p>\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\n	新华社华盛顿3月31日电（记者 刘华 魏建华）31日，国家主席习近平在华盛顿会见韩国总统朴槿惠，就双边关系及共同关心的重大国际和地区问题深入交换意见。\n</p>\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\n	习近平指出，中韩建交24年来，两国关系始终保持平稳快速发展。中方高度重视中韩关系，始终把发展对韩关系放在周边外交的重要位置。当前，我和朴槿惠总统达成的一系列重要共识正在得到全面落实，取得许多积极成果。把中韩关系维护好、巩固好、发展好，是我们共同肩负的历史使命。中方愿同韩方深化各领域交流合作，确保中韩关系始终在正确轨道上健康稳定发展。\n</p>\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\n	习近平强调，中韩双方要保持高层互动势头，用好一系列战略沟通机制密切协调，照顾彼此重大关切，尊重对方主权、安全、发展利益。中方欢迎韩方积极参与“一带一路”建设。双方要加快推进国家发展战略对接，重点做好自由贸易协定实施工作，深化金融合作，推动中韩产业园建设尽快取得实质进展，推进东亚经济一体化进程。要扩大人文交流，相互支持办好2018年平昌冬季奥运会和2022年北京冬季奥运会。中方愿同韩方一道，办好韩国旅游年、青年领导者论坛等项目，鼓励两国人民交流，服务“一千万+”时代人员往来。双方要密切在联合国、二十国集团、亚太经合组织等机制内合作，加强在全球性问题上的沟通协调。\n</p>\n<div id=\"ad_44086\" class=\"otherContent_01\" style=\"font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;margin:10px 20px 10px 0px;padding:4px;\">\n	<iframe width=\"300px\" height=\"250px\" frameborder=\"0\" src=\"http://x.jd.com/exsites?spread_type=2&amp;ad_ids=1884:5&amp;location_info=0&amp;callback=getjjsku_callback\">\n	</iframe>\n</div>\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\n	朴槿惠表示，赞同习近平主席对韩中关系的评价。韩中保持密切的高层交往是两国关系重要性的体现。韩方高度重视对华关系，愿在深化互信的基础上推动韩中战略合作伙伴关系不断向前发展，赞同双方加强高层战略沟通，并在各层级、各领域密切交流。在当前全球经济形势下，韩中双方更有必要加强经贸等领域务实合作，加快实施韩中自贸协定，实现“欧亚合作倡议”同“一带一路”建设对接。韩方支持密切韩中人文交流，相互支持办好平昌冬奥会和北京冬奥会。\n</p>\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\n	习近平欢迎朴槿惠9月赴华出席二十国集团领导人杭州峰会。朴槿惠接受了邀请，表示韩方愿为峰会成功作出积极贡献。\n</p>\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\n	两国元首还就朝鲜半岛形势交换了看法。习近平强调，中方坚持实现半岛无核化、维护半岛和平稳定、通过对话协商解决问题，主张各方都应全面完整履行安理会相关决议。中方敦促各方避免采取任何可能加剧局势紧张的言行，不得损害本地区国家的安全利益和战略平衡。对话协商是解决问题的唯一正确方向，中方愿作出建设性努力，推动在六方会谈框架下重启对话。朴槿惠表明了韩方对当前半岛形势的看法，表示愿就有关问题同中方保持密切沟通。\n</p>\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\n	王沪宁、栗战书、杨洁篪等参加会见。（完）\n</p>\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\n	责任编辑：王浩成\n</p>', '1459485897324');
INSERT INTO `companynews` VALUES ('87894d28-2525-4f93-808c-861245155189', '新浪网友调查：9成曾遭乱变道，6成支持撞', '/rest/editor/file/image/20160322/20160322173359_196.jpg', '<div class=\"mainSub\" id=\"btitle0\" style=\"margin:0px 0px 55px;padding:0px;color:#333333;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun, u5B8Bu4F53, Arial;background-color:#FFFFFF;\">\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		符合法理就一定是对的么？又或者这是另外一种更大的恶？”这是央视主持人白岩松在最近一期节目里，针对东莞比亚迪撞翻变道大众的评论。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		新浪新闻中心21日<span style=\"color:#0000FF;\"><strong><a href=\"http://survey.news.sina.com.cn/survey.php?id=113259&amp;dpc=1\" target=\"_blank\">推出的网络调查</a></strong></span>也表明，过半网友支持比亚迪车主。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		3月5日，广东东莞中堂大桥一辆蓝色大众轿车强制变道，被一辆比亚迪撞翻。此后，后车车主将大众被撞翻的视频上传网络。一场法理与道德的争论，持续两周未停息。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		孰是孰非，就连@深圳交警 也犯晕。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		6日，@深圳交警发表博文称，从法律上来说，变道车辆全责。但从道德上讲，后车两次加速，不让前车变道并将其撞翻，且车翻后未下车施救属居心不良。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		结果次日，@深圳交警 就删除了上述微博并致歉，称是在未经审核情况下发表了不专业的评论。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		这起事故，后来当地交警部门认定强行变道的大众轿车全责。但争论并没有因此停止，特别是后来比亚迪车主在网络群聊天时自称这是自己撞的第7辆车，导致波澜再起。“我开车都很小心，一般不是别人全责我不去撞别人。”\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		在接受央视采访时，比亚迪车主说自己只是在维护自己的路权，下一次还会这样做。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		<strong> 对此，新浪网友是什么意见呢？</strong>\r\n	</p>\r\n	<div class=\"img_wrapper\" style=\"margin:0px auto;padding:0px;text-align:center;\">\r\n		<img src=\"http://n.sinaimg.cn/news/transform/20160322/Cds_-fxqpchx6410678.jpg\" alt=\"新浪网发布的“车主撞翻变道车是维护路权，还是不尊重生命？”调查结果。\" style=\"border:1px solid #EEEEEE;\" /><span class=\"img_descr\" style=\"line-height:26px;color:#666666;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">新浪网发布的“车主撞翻变道车是维护路权，还是不尊重生命？”调查结果。</span>\r\n	</div>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		3月21日，新浪新闻中心发起调查“车主撞翻变道车是维护路权，还是不尊重生命？”截止22日上午10时，共有37958名网友参与，其中60.5%的网友“支持”撞翻变道车维护路权，33%的人“不支持”，还有6.5%认为“说不清”。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		而有过被类似变道车干扰经历的网友高达92.2%。面对变道车的感扰，68.4%的人选择“减速避让”，20.2%则倾向于“坚决不让”，还有11.4%的网友投给了“其他”。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		对于强行变道等交通违规，是该“维护路权”，还是“尊重生命”，双方支持网友差距不大。但选择“尊重路权”的网友占55.3%，略高于认为该“尊重生命”的44.7%。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		东南大学法学院副教授，交通法治与发展研究中心执行副主任顾大松曾对《新闻极客》表示，“尊重生命是属于道德范畴的，前提是遵守规则。如果他没有违背规则，就不会产生生命的问题。”\r\n	</p>\r\n	<p style=\"font-size:16px;text-align:right;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		<strong>（新闻极客 巴芮 报道）</strong>\r\n	</p>\r\n</div>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;color:#333333;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun, u5B8Bu4F53, Arial;background-color:#FFFFFF;\">\r\n	责任编辑：王辉 SN193\r\n</p>', '1458639249967');
INSERT INTO `companynews` VALUES ('a5a8d883-af6a-451c-8fef-867bf82479a2', '奥巴马见卡斯特罗 称不能上网国家无前途', '/rest/editor/file/image/20160322/20160322173625_822.jpg', '<div class=\"mainSub\" id=\"btitle0\" style=\"margin:0px 0px 55px;padding:0px;color:#333333;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun, u5B8Bu4F53, Arial;background-color:#FFFFFF;\">\r\n	<div class=\"img_wrapper\" style=\"margin:0px auto;padding:0px;text-align:center;\">\r\n		<img src=\"http://n.sinaimg.cn/news/transform/20160322/dYsz-fxqnsks4843854.jpg\" alt=\"奥巴马和劳尔-卡斯特罗举行联合记者会\" style=\"border:1px solid #EEEEEE;\" /><span class=\"img_descr\" style=\"line-height:26px;color:#666666;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">奥巴马和劳尔-卡斯特罗举行联合记者会</span>\r\n	</div>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		3月21日，奥巴马和劳尔-卡斯特罗在古巴革命宫举行历史性的联合记者会，为两国关系掀开新的一页。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		在讲话中，奥巴马说，劳尔总是拿卡斯特罗兄弟的讲演有多长跟他开玩笑，但这次奥巴马的讲话反倒更长，因为“要补上半个世纪的工作”。奥巴马称赞了古巴的教育医疗成就，也提及人权问题，更多的篇幅在回顾改善关系的举措和展望，包括让更多古巴人上网、参与国际贸易、留学交流等等。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		以下是奥巴马讲话全文：\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		早上好（西班牙语），卡斯特罗主席，向您、古巴政府和人民致意。感谢你们给予我、我的家人和代表团的欢迎。正如你们所知道的那样，过去半个多世纪的时间里，美国总统出现在哈瓦纳的场景是无法想像，但今天是新的一天。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		这是我们两个国家关系新的一天。主席先生，请允许我短暂地提一下另外一件事，因为就在本周末，我收到消息，我们杰出武装部队的一名军人，来自加州蒂梅丘拉的海军陆战队参谋军士路易斯-卡丁在伊拉克北部地区阵亡，我们正在那里协助伊拉克政府打击“伊斯兰国”恐怖组织。我想向他的家人和那些在行动中受伤的人员致以祈祷与祝福。这提醒我们，就在我们进行这一历史性访问之际，美军士兵每天都在为我们的自由和安全作出牺牲。所以，我向他们表示感谢。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我妻子米歇尔和我在访问古巴时带上了我们的女儿。随便说一下，他们并不总是想和我们一起出访。她们现在已是青少年了，她们在国内有朋友，有想做的事情，但她们想来古巴，因为她们明白这次访问的意义，我们想向她们展现古巴和其人民的美丽。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		昨天欢迎我们的古巴民众让我们很感动，他们在我们乘车从机场向市区进发时微笑和挥手。我们对有机会游览哈瓦纳老城区和品尝非常棒的古巴美食表示感谢。我们对天主教大教堂的访问提醒我们，我们有共同的价值观，支撑众多古巴人和美国人的坚定信仰。这也使我有机会向大主教奥特加表示感谢。他和罗马教皇方济各就改善美古两国政府关系作出了非常大的贡献。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		今天早上，我很荣幸地向何塞-马蒂敬献花圈，这不仅仅是为了他在古巴独立所作出的贡献，而且是他为了支持世界各地的自由而写下和发表的具有深刻意义的话语。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我带来了美国人民的问候和友谊。事实上，陪同我访问古巴的有近40名国会议员，他们中有共和党人，也有民主党人。这是我任总统以来最大规模的代表团，这表明了美国各界对我们两国关系所取得的进展感到激动，对此非常有兴趣。国会议员们认识到，我们与古巴人民之间的新关系是符合美古两国利益的。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		陪同我访问古巴的还有一些美国著名商界领袖和企业家，因为我们做好了寻求与古巴建立更多商业联系的准备，这将为古巴人和美国人创造就业岗位和机遇。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我尤其对这么多古巴裔美国人能够陪同我访问古巴感到高兴。对于他们和美国各地超过200万的自豪的古巴裔美国人来说，这是一个情感激荡的时刻。自从我们放松了两国之间的出行限制后，越来越多的古巴裔美国人回到了过去的家园。对于他们中的许多人来说，这是一个展望未来新希望的时刻。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		所以，卡斯特罗主席，我想就你的邀请和在与我们会谈期间所展现的开放精神表示感谢。你曾在我们去年在巴拿马举行的会谈上表示，我们愿意讨论摆在桌面的所有议题和事情。所以，请您理解，我的讲话将会比平常要长一些。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		卡斯特罗主席总是拿卡斯特罗兄弟的讲演有多长和我开玩笑，但我的讲演可能会比你今天的讲话更长一些，请原谅。我们要补上半个世纪的工作。\r\n	</p>\r\n	<div class=\"img_wrapper\" style=\"margin:0px auto;padding:0px;text-align:center;\">\r\n		<img src=\"http://n.sinaimg.cn/news/transform/20160322/zUy1-fxqnski7833848.jpg\" alt=\"奥巴马和劳尔-卡斯特罗举行联合记者会\" style=\"border:1px solid #EEEEEE;\" /><span class=\"img_descr\" style=\"line-height:26px;color:#666666;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">奥巴马和劳尔-卡斯特罗举行联合记者会</span>\r\n	</div>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		正如你们所知道的那样，我们与古巴不断增加的接触是由一个全面的方针所指导，这个方针就是推动我们两国的共同利益，改善古巴人和美国人的生活。这就是我到这里来的原因。我一直表示，在经过了关系发展困难的五十年，美古两国政府之间的关系不会在一夜之间就得到改善。正如卡斯特罗主席所指出的那样，我们仍将有一些严重分歧，其中包括在民主和人权领域。卡斯特罗主席和我就这些议题进行了非常坦城的对话。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		美国承认古巴作为一个国家所取得的成就，它在教育和医疗健康领域所取得的巨大成就。可能更为重要的是，我重申，古巴的命运将不会由美国或者其它国家决定。古巴是一个主权国家，它非常自豪，这是正确的。古巴的未来将由古巴人决定，而不是由任何其它人所决定。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		与此同时，正如我们在全球各地所做的那样，我明确表示，美国将继续为民主发言，其中包括古巴人民决定自己未来的权利。我们将为普世人权代言，其中包括言论、集会和宗教自由。确实如此，我很盼望我明天与古巴社团组织领导人的会面，听取他们的观点。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		正如你们所听到的那样，卡斯特罗主席也谈到了他所认为的美国在满足人们基本需求、应对贫穷、不公正和种族关系存在的缺点。我们欢迎这样的建设性对话，因为我们认为，当我们在互相尊重的态度时分享我们最深信的信念和想法时，我们双方都可以学到一些东西，让我们人民生活的更好。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		关系正常化的一部分意味着，我们就这些分歧进行直接讨论。所以，我很高兴地看到，我们双方同意今年在哈瓦那举行下一轮美国古巴人权对话。我们两国都将欢迎联合国独立专家的到访，我们两国将打击贩卖人口活动，我们两国都认为这种行为是严重违反人权的行为。\r\n	</p>\r\n	<div class=\"img_wrapper\" style=\"margin:0px auto;padding:0px;text-align:center;\">\r\n		<img src=\"http://n.sinaimg.cn/news/transform/20160322/WOAE-fxqnsks4843868.jpg\" alt=\"奥巴马和劳尔-卡斯特罗\" style=\"border:1px solid #EEEEEE;\" /><span class=\"img_descr\" style=\"line-height:26px;color:#666666;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">奥巴马和劳尔-卡斯特罗</span>\r\n	</div>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		即便我们在分歧进行讨论的时候，我们也都认为我们将继续在存在共同利益的领域取得进展。卡斯特罗主席，你曾在巴拿马表示，我们今天可能在一些议题上存在分歧，但我们明天可能就这些议题达成共识。过去15个月的情况确实是这样的，那些日子的进展促成了今天的来访。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		今天，我可以向大家报告，我们继续在关系正常化的许多领域取得进展。我们为美国人前往古巴旅行并与古巴人互动提供了更多的机会。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		在过去一年，访问古巴的美国人人数已大幅增加。上周，我们批准美国个人出于教育目的访问古巴。美国航空公司将于今年开始直航古巴的业务。我们上周还达成了港口安全措施协议，从而去除了恢复游轮和渡轮服务的最后一个主要障碍。所有这一切将意味着，未来将会有更多的美国人访问古巴，来欣赏古巴人民灿烂的历史和文化。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我们将有更多贸易往来。我们两国距离仅仅90英里，是天然的贸易伙伴。上周我们采取的举措，使得古巴能更广泛的使用美元，让古巴人民更易用美元进行国际贸易，让在美国的古巴人挣薪水。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		这些事情将为创造贸易和合资企业机遇提供更多的条件。我们对古巴有关计划终止就在古巴兑换美元征收10%的处罚的重要决定表示欢迎。这将为更多的旅行和商业开辟大门。这些举措说明，我们是互相开放的。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我们在此次访问期间同意加强农业领域的合作，以支持我们的农民和农场主。我将在今天下午介绍一下美国大公司将要宣布达成的新商业合同的要点。在我继续呼吁国会取消针对古巴的贸易制裁之际，我还与卡斯特罗主席就我们呼吁古巴所采取的措施进行了讨论。我们认为，古巴采取这些措施将表明，它就与美国进行更多贸易做好了准备，这些措施包括允许更多的合资企业，允许外国公司直接雇佣古巴人。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我们继续帮助更多古巴人接上互联网和对接全球经济的努力。在卡斯特罗主席的领导下，古巴已制订了让国民上网的目标，我们想提供帮助。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我将在今天下午的企业家聚会上讨论我们将采取的更多举措，以帮助更多古巴人在网上学习、创新、做生意，因为在21世纪，除非其公民可以上网，否则这个国家将无法取得成功。\r\n	</p>\r\n	<div class=\"img_wrapper\" style=\"margin:0px auto;padding:0px;text-align:center;\">\r\n		<img src=\"http://n.sinaimg.cn/news/transform/20160322/vUDH-fxqnsks4843880.jpg\" alt=\"奥巴马和劳尔-卡斯特罗\" style=\"border:1px solid #EEEEEE;\" /><span class=\"img_descr\" style=\"line-height:26px;color:#666666;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">奥巴马和劳尔-卡斯特罗</span>\r\n	</div>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我们将推进更多的教育交流活动。感谢古巴裔美国人社区的慷慨支持，我可以宣布，我的有关在美洲进行10万人学习交流的倡议将为大学生在海外学习提供更多机会，更多的美国人将去古巴学校学习，更多的古巴人在美国学校学习。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		在推进这方面的工作时，我们将向古巴学生提供教育补贴和奖学金。我们还将与古巴政府合作，向古巴教师提供更多的线上线下的英语培训课程。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		在古巴人准备为滚石乐队的来访作准备之际，我们将推进更多的美古交流活动，这将使古巴人和美国人聚会在一起。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我们都在盼望坦帕湾光芒棒球队明天与古巴国家队的比赛，我们还在健康、科学和环境等广泛领域推进合作。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		正如古巴和美国医疗团队合在海地为应对霍乱进行合作，在西非为应对埃博拉病毒而并肩作战，我想特别表扬古巴医生，他们自愿出发，在西非承担了非常艰巨的任务。他们与美国和其它国家的医疗团队合作。我们非常感谢他们所做的工作。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我们的医疗专业人士现在将在新的领域合作，防止诸如寨卡病毒的扩散，领导研发癌症疫苗的新研究工作。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我们的政府将会合作以保护我们共享的本地区的美丽水域。作为两个受到气候变化威胁的国家，我认为，我们可以合作以保护社区和我们的低海拔海岸地区。我们将邀请古巴和我们的加勒比中美洲伙伴参加今年春天在华盛顿举行的地区能源峰会。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		最后，我们将继续在地区安全推进更加密切的合作。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我们将加强我们的执法协调，尤其是在打击威胁到我们两国人民的贩毒分子方面。我想为古巴主持哥伦比亚和“哥伦比亚革命武装力量”的和平会谈向卡斯特罗主席和古巴政府表示感谢。我们对哥伦比亚实现持久和公正的和平持乐观态度。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		尽管我们没有对委内瑞拉进行广泛的会谈，我们确实谈到了这个议题。我认为，整个地区都对一个正在应对经济挑战，对其人民的期望作出反应，是地区稳定来源的国家有兴趣。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我认为，这是我们共享的兴趣。所以，卡斯特罗主席，我想就你对我的欢迎表示感谢。我认为，可以公平的说，美国和古巴现在正在许多领域接触，每天有越来越多的美国人来到古巴，更多的美国商业机构、学校和宗教团体在与古巴人民建立新的伙伴关系。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		许多古巴人正从访问和贸易所开辟的机遇中受益。正如你所说的那样，前面的道路不是一条坦途。幸运的是，我们不需要与鲨鱼共泳来实现你和我所确定的目标。正如你在这里所说的一样，尽管有困难，但我们将继续前进。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		我们将聚焦未来。我绝对相信，如果坚持这条路线，我们可以为古巴人民和美国人民提供一个更好和更光明的未来。非常感谢你们（西班牙语），非常感谢你们。（新浪国际 陈智勇 严伟江）\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		新浪独家稿件声明：该作品（文字、图片、图表及音视频）特供新浪使用，未经授权，任何媒体和个人不得全部或部分转载。\r\n	</p>\r\n</div>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;color:#333333;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun, u5B8Bu4F53, Arial;background-color:#FFFFFF;\">\r\n	责任编辑：陈智勇\r\n</p>', '1458639413449');
INSERT INTO `companynews` VALUES ('a748078c-6915-40cd-a3e9-a46752162c25', '努比亚（nubia）小牛3 Z7 mini 全黑 移动联通4G电信3G手机 双卡双待', '/rest/editor/getPIC/image/3414ad7b83f44fe8a6653df92f1fb31b.png', '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;font-size:12.7273px;background-color:#FFFFFF;\">\n	<div align=\"center\" style=\"margin:0px;padding:0px;\">\n		<img alt=\"\" border=\"0\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t1942/51/2045145432/131509/53f93676/56a081b2N8806d4e5.jpg\" class=\"\" />\n	</div>\n	<div align=\"center\" style=\"margin:0px;padding:0px;\">\n		<a href=\"http://sale.jd.com/act/qkvuUoidgC.html\" target=\"_blank\"><img alt=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t1945/209/2413180313/73240/8dec460b/56d64f81N092719da.jpg\" class=\"\" /></a><br />\n	</div>\n</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;font-size:12.7273px;background-color:#FFFFFF;\">\n	<table align=\"center\" border=\"0\" width=\"750\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\n		<tbody>\n			<tr>\n				<td>\n					<img alt=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/g12/M00/0A/12/rBEQYFGiw_4IAAAAAAAp4J-ptK0AACEDgOO5BAAACn4809.jpg\" class=\"\" />\n				</td>\n			</tr>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"790\" width=\"750\" src=\"http://img11.360buyimg.com/cms/jfs/t358/264/81927694/125285/a8979f2/54091974Nde2bbd56.jpg\" class=\"\" />\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"32\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#333333;\">\n					<img alt=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/g12/M00/0A/12/rBEQYFGiw-wIAAAAAAApunEpnisAACEDgF4U-4AACnS829.jpg\" class=\"\" />\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"52\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#12D0CC;\">\n					双4G+3G全网通\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"63\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#666666;\">\n					双卡双待，均支持4G网络，主副卡随心切换，流量无忧；<br />\n畅享无界的沟通与上网冲浪体验，支持移动联通双卡双4G，可升级至4G全网通版本。\n				</td>\n			</tr>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"455\" width=\"750\" src=\"http://img14.360buyimg.com/cms/jfs/t178/231/1841783580/72215/be828a16/53ba0ecfN7b713c20.jpg\" class=\"\" />\n				</td>\n			</tr>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"116\" width=\"750\" src=\"http://img11.360buyimg.com/cms/jfs/t661/337/749010600/14048/5b941146/5481ad66Nef191533.jpg\" class=\"\" />\n				</td>\n			</tr>\n		</tbody>\n	</table>\n	<table align=\"center\" border=\"0\" width=\"750\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\n		<tbody>\n			<tr>\n				<td height=\"856\">\n					<img alt=\"\" height=\"856\" width=\"750\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t1885/196/2055985770/123008/2266110b/56a5dde9Nb41e4bb9.jpg\" class=\"\" />\n				</td>\n			</tr>\n		</tbody>\n	</table>\n	<table align=\"center\" border=\"0\" width=\"750\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\n		<tbody>\n			<tr>\n				<td height=\"812\">\n					<img alt=\"\" height=\"816\" width=\"750\" />\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"53\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#00B7EE;\">\n					高通骁龙801处理器\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"58\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#666666;\">\n					nubia定制处理器，性能与功耗的均衡<br />\n采用高通骁龙801 (MSM8974AA) 高级处理器\n				</td>\n			</tr>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"600\" width=\"750\" />\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" bgcolor=\"#fa558f\" height=\"65\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#FFFF71;\">\n					媲美单反 · 毫不逊“摄”\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" bgcolor=\"#fa558f\" height=\"50\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#FFFFFF;\">\n					继承了专业相机拍照的核心功能，并且不断突破，比起单反，毫不逊色。\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fa558f\" height=\"604\">\n					<img alt=\"\" height=\"632\" width=\"750\" />\n				</td>\n			</tr>\n		</tbody>\n	</table>\n	<table align=\"center\" border=\"0\" width=\"750\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\n		<tbody>\n			<tr>\n				<td align=\"center\" height=\"32\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#333333;\">\n					&nbsp;\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"51\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#FA558F;\">\n					手机中的单反机\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"72\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#666666;\">\n					采用索尼IMX214第二代1300万像素CMOS，全新NeoVision 4.0行业领先拍照技术<br />\n1300万后置摄像头 / F2.0大光圈 / 500W前置摄像头\n				</td>\n			</tr>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"560\" width=\"750\" />\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" bgcolor=\"#a2e850\" height=\"59\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#FA558F;\">\n					能拍银河的手机\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" bgcolor=\"#a2e850\" height=\"34\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#666666;\">\n					长达1200秒的长曝光功能，可使用手机拍出银河，nubia Z7 mini，真正定义了手机摄影。\n				</td>\n			</tr>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"586\" width=\"750\" />\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"62\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#12D0CC;\">\n					人人都是摄影师\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#666666;\">\n					nubia致力于专业拍照体验，由繁化简，将高阶的摄影功能易用化、一键化。\n				</td>\n			</tr>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"586\" width=\"750\" />\n				</td>\n			</tr>\n			<tr>\n				<td height=\"806\">\n					<img alt=\"\" height=\"790\" width=\"750\" />\n				</td>\n			</tr>\n		</tbody>\n	</table>\n	<table align=\"center\" border=\"0\" width=\"750\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\n		<tbody>\n			<tr>\n				<td colspan=\"2\" align=\"center\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#333333;\">\n					&nbsp;\n				</td>\n			</tr>\n			<tr>\n				<td rowspan=\"4\" width=\"471\">\n					<img alt=\"\" height=\"790\" width=\"471\" />\n				</td>\n				<td height=\"194\" valign=\"top\" width=\"279\">\n					&nbsp;\n				</td>\n			</tr>\n			<tr>\n				<td height=\"40\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#FA558F;\">\n					nubia UI 2.5<br />\n始终懂你\n				</td>\n			</tr>\n			<tr>\n				<td height=\"20\" valign=\"top\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#666666;\">\n					全新的系统优化，在操作使用上<br />\n更便捷、人性化。\n				</td>\n			</tr>\n			<tr>\n				<td height=\"200\">\n					&nbsp;\n				</td>\n			</tr>\n			<tr>\n				<td colspan=\"2\">\n					&nbsp;\n				</td>\n			</tr>\n		</tbody>\n	</table>\n	<table align=\"center\" border=\"0\" width=\"750\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\n		<tbody>\n			<tr>\n				<td height=\"19\" width=\"223\">\n					&nbsp;\n				</td>\n			</tr>\n		</tbody>\n	</table>\n	<table align=\"center\" border=\"0\" width=\"750\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\n		<tbody>\n			<tr>\n				<td rowspan=\"4\" bgcolor=\"#00b7ee\" width=\"43\">\n					&nbsp;\n				</td>\n				<td bgcolor=\"#00b7ee\" height=\"80\" width=\"236\">\n					&nbsp;\n				</td>\n				<td rowspan=\"4\" bgcolor=\"#00b7ee\" width=\"471\">\n					<img alt=\"\" height=\"789\" width=\"471\" />\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#00b7ee\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#FFFF71;\">\n					大中见小<br />\n极致分屏体验\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#00b7ee\" valign=\"top\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#FFFFFF;\">\n					为充分发挥大屏优势、追求畅爽体验，nubia在新的UI中加入了一键分屏功能，大中见小、小中见大。只需要向上轻轻一滑，就可以马上开启分屏功能。分屏模式保留了用户原有的使用习惯，开启后两个独立的屏幕就像两个手机，用户界面、视觉效果和单屏幕桌面完全一致。此外nubia的分屏模式是系统级的应用，从软件底层进行开发和实现，能适配大部分的系统模块和第三方应用，nubia 的分屏功能是业内用户体验畅爽的分屏功能。\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#00b7ee\">\n					&nbsp;\n				</td>\n			</tr>\n			<tr>\n				<td colspan=\"3\">\n					&nbsp;\n				</td>\n			</tr>\n		</tbody>\n	</table>\n	<table align=\"center\" border=\"0\" width=\"750\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\n		<tbody>\n			<tr>\n				<td rowspan=\"4\" width=\"359\">\n					<img alt=\"\" height=\"789\" width=\"359\" />\n				</td>\n				<td height=\"240\" width=\"253\">\n					&nbsp;\n				</td>\n				<td rowspan=\"4\" width=\"138\">\n					&nbsp;\n				</td>\n			</tr>\n			<tr>\n				<td valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#00B7EE;\">\n					人性化单手操控\n				</td>\n			</tr>\n			<tr>\n				<td valign=\"top\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#666666;\">\n					一手操控：针对大屏手机，nubia Z7mini设计了独特的单手操控模式，无论视界多大，你都可以一手掌控。\n				</td>\n			</tr>\n			<tr>\n				<td height=\"400\">\n					&nbsp;\n				</td>\n			</tr>\n			<tr>\n				<td colspan=\"3\">\n					&nbsp;\n				</td>\n			</tr>\n		</tbody>\n	</table>\n	<table align=\"center\" border=\"0\" width=\"750\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\n		<tbody>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"561\" width=\"750\" />\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" bgcolor=\"#fa558f\" height=\"53\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#FFFF71;\">\n					DTS音效 · 不凡音质\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" bgcolor=\"#fa558f\" height=\"79\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#FFFFFF;\">\n					<p>\n						更专业 / 智能耳机阻抗适配<br />\n更人性 / “超级免提”功能\n					</p>\n					<p>\n						&nbsp;\n					</p>\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"54\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#FA558F;\">\n					nubia节能技术\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" height=\"44\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#666666;\">\n					nubia电工提供强劲节电方案<br />\n采用LucidLogix节能技术，续航全面升级\n				</td>\n			</tr>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"613\" width=\"750\" />\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" bgcolor=\"#a2e850\" height=\"61\" valign=\"bottom\" style=\"font-size:22px;font-family:微软雅黑, 宋体;color:#FFFFFF;\">\n					nubia Z7mini · 多色可选\n				</td>\n			</tr>\n			<tr>\n				<td align=\"center\" bgcolor=\"#a2e850\" height=\"32\" style=\"font-size:14px;font-family:微软雅黑, 宋体;color:#666666;\">\n					<span style=\"color:#FA558F;\">玫瑰红</span>&nbsp;·<span style=\"color:#FFFF71;\">&nbsp;樱草黄</span>&nbsp;·<span style=\"color:#006FBD;\">&nbsp;冰海蓝</span>&nbsp;·<span style=\"color:#259E00;\">&nbsp;柠檬绿</span>\n				</td>\n			</tr>\n			<tr>\n				<td>\n					<img alt=\"\" height=\"634\" width=\"750\" src=\"http://img13.360buyimg.com/cms/jfs/t169/289/1728041905/82163/1d478d52/53ba1317N2742df63.jpg\" class=\"\" /><br />\n				</td>\n			</tr>\n		</tbody>\n	</table>\n</div>', '1459575173319');
INSERT INTO `companynews` VALUES ('b3988b4f-06d2-4a41-ac0a-f2f9beb51d29', '马英九夫妇财产曝光:存款7千万 名下无汽车珠宝', '/rest/editor/file/image/20160322/20160322173456_217.png', '<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	原标题：马英九夫妇财产曝光：存款7553万 名下无汽车珠宝\r\n</p>\r\n<div class=\"img_wrapper\" style=\"text-align:center;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;\">\r\n	<img src=\"http://n.sinaimg.cn/translate/20160322/Bq5B-fxqnska7355799.jpg\" alt=\"\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:14px;\">马英九与夫人周美青。资料图来源：台湾《中国时报》</span>\r\n</div>\r\n<div id=\"ad_44086\" class=\"otherContent_01\" style=\"font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;margin:10px 20px 10px 0px;padding:4px;\">\r\n	<iframe width=\"300px\" height=\"250px\" frameborder=\"0\" src=\"http://x.jd.com/exsites?spread_type=2&amp;ad_ids=362:5&amp;location_info=0&amp;callback=getjjsku_callback\">\r\n	</iframe>\r\n</div>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	中新网3月22日电 据台湾《联合晚报》报道，台“监察院”22日上午发布最新101期廉政专刊，马英九夫妇申报财产曝光。马英九任台湾地区领导人8年，除持有名下原来位于文山区的旧建物与附属土地外，没有任何买卖土地与房屋纪录，名下也没有任何汽车或珠宝。夫妇俩有8笔保险，其中马英九占两笔，夫妇俩持有的有价证券，只有周美青名下一笔15万元（新台币，下同）的基金投资。马英九夫妇的积蓄，都集中在现金存款，总额有75533145元。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	根据马英九申报的财产资料，马英九本身持有土地与建物，都位处文山区兴安段二小段，为1983年通过买卖持有至今，长年来没有任何变动。马英九夫妇持有存款约7553万元，保险则有8笔，马英九有两笔富邦人寿终身寿险与增值分红终身寿险，其余6笔则属于周美青；有价证券则仅周美青名下野村红利基金15万元。夫妇两人未负债。\r\n</p>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	责任编辑：向昌明 SN123\r\n</p>', '1458639305766');
INSERT INTO `companynews` VALUES ('c72f86e3-8322-4dd1-a664-0da80f922482', '李克强：推进供给侧结构性改革 增强企业竞争力', '/rest/editor/file/image/20160322/20160322173004_579.jpg', '<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	原标题：李克强会见出席中国发展高层论坛\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	国务院总理李克强21日下午在人民大会堂会见来华出席中国发展高层论坛2016年年会的境外代表，并同他们座谈交流。来自世界500强企业的负责人、国际知名学术和研究机构的专家学者、主要国际组织和媒体的代表等120余人参加。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	福特汽车公司总裁菲尔兹，经济合作与发展组织秘书长古里亚，耶鲁大学校长苏必德，株式会社日立制作所首席执行官中西宏明，纽约大学教授、诺贝尔经济学奖得主斯宾塞，美国知名电视节目主持人查理·罗斯等分别就中国改革开放、创新创业、制造业发展、投资和营商环境、中外教育合作等提问。李克强一一作答。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	李克强表示，中国改革开放30多年取得了举世瞩目的经济社会发展成就，积累了丰富的发展经验。中国经济未来要保持中高速增长，迈上中高端水平，要继续坚持改革开放。我们将着力推进包括简政放权、减税减负在内的供给侧结构性改革，更好激发市场活力、增强企业竞争力、调动社会创造力。同时要在转变发展方式和稳增长、促改革、调结构、惠民生、防风险中保持平衡，尤其注重稳定就业和居民增收。\r\n</p>\r\n<div id=\"ad_44086\" class=\"otherContent_01\" style=\"font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;margin:10px 20px 10px 0px;padding:4px;\">\r\n	<iframe width=\"300px\" height=\"250px\" frameborder=\"0\" src=\"http://x.jd.com/exsites?spread_type=2&amp;ad_ids=1884:5&amp;location_info=0&amp;callback=getjjsku_callback\">\r\n	</iframe>\r\n</div>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	李克强指出，中国的改革和开放是相互促进、相辅相成的。我们会继续扩大开放，欢迎外资来华投资兴业。只要是在中国注册的企业，无论是内资还是外资、独资还是合资，都将一视同仁对待，提供公平竞争的环境。我们鼓励更多中国留学生赴海外深造，拓宽视野，学习国外先进技术和管理经验，也欢迎更多外国留学生来华学习。通过交流互鉴，尊重文明的多样性，汲取人类创造的文明成果。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	李克强强调，中国正在深入实施创新驱动发展战略，大力推动大众创业万众创新。通过发展新经济，培育新动能、改造提升传统动能，形成中国经济的“双引擎”。我们不仅要进行技术创新，跟上互联网、物联网、大数据时代的创新步伐，让千千万万人共享智慧，激发思想火花，还要进行制度创新，通过简政放权、放管结合、优化服务等改革，创新政府监管方式，把政府不该管的权力放给市场，让政府把更多精力放在事中事后监管，营造公平竞争的市场环境上。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	与会外方代表表示，通过参加本届论坛，对中国经济的发展前景，以及中国致力于深化改革、推动经济转型升级的坚定决心有了更加深刻的认识。相信中国经济中高速增长将对世界经济增长产生重要影响，愿不断深化对华合作，在各自领域为中国发展提供支持与协助。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	杨晶出席上述活动。\r\n</p>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	责任编辑：向昌明 SN123\r\n</p>', '1458639017857');
INSERT INTO `companynews` VALUES ('d4feb968-cdc1-4225-9c72-4fcf2658b2d7', '除了金子，还有啥被政府扣了也没要回来？', '/rest/editor/file/image/20160322/20160322173712_653.jpg', '<div class=\"mainSub\" id=\"btitle0\" style=\"margin:0px 0px 55px;padding:0px;color:#333333;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun, u5B8Bu4F53, Arial;background-color:#FFFFFF;\">\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		近二十斤的黄金被警方查扣二十年，警方最初只愿意以二十年前的金价赔偿88万元。后经媒体报道，警方再次表态：愿意支付国家赔偿金200万。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		这是甘肃人马哈比最近遇到的事。对于这个结果，他并没有完全接受。马哈比认为，当年自己被拘，是刑事案件。警方有保存黄金的义务。他还是想要回属于自己的黄金。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		《新闻极客》梳理发现，马哈比的经历并非个案，被警方或政府部门扣押的物品“有去无回”，已经成为了许多被扣押物主的心病。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		自2007年《物权法》实施以来，今年已经是第九年了。为何这样的事情还会频发？政府部门为何不肯物归原主？\r\n	</p>\r\n	<div class=\"img_wrapper\" style=\"margin:0px auto;padding:0px;text-align:center;\">\r\n		<img src=\"http://n.sinaimg.cn/news/transform/20160318/fXub-fxqnskh0965311.jpeg\" alt=\"被警方或政府部门扣押的物品“有去无回”，已经成为了许多被扣押物主的心病。\" style=\"border:1px solid #EEEEEE;\" /><span class=\"img_descr\" style=\"line-height:26px;color:#666666;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">被警方或政府部门扣押的物品“有去无回”，已经成为了许多被扣押物主的心病。</span>\r\n	</div>\r\n</div>\r\n<div class=\"mainSub\" id=\"btitle1\" style=\"margin:0px 0px 55px;padding:0px;color:#333333;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun, u5B8Bu4F53, Arial;background-color:#FFFFFF;\">\r\n	<h2 class=\"contentSubTitle\" style=\"font-weight:normal;font-size:24px;background:url(&quot;\">\r\n		近20斤黄金遭警方扣押20年获赔200万\r\n	</h2>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		<strong>近20斤黄金遭警方扣押20年获赔200万</strong>\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		根据《新京报》报道，二十年前即1996年2月，甘肃省居民马哈比称携带自产毛金410000克前往广东加工，总加工出黄金金条50条，共计9350克。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		就在马哈比返回甘肃途中，经白云机场安检时，广州白云国际机场公安局将9350克黄金全部查扣，随后被警方以涉嫌走私黄金罪立案侦查，后被收容审查数十天。此后家属多方举债，带了十万保释金前往广州，才将他取保候审，但涉案的全部黄金处于扣押状态。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		马哈比称，取保候审后，公安局方面并没有再次找过他。二十年来，自己多次讨要黄金未果，“黄金是村子人共有的，我得挣钱还他们。”\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		2015年11月，马哈比向广东省公安厅机场公安局提出国家赔偿申请。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		今年2月28日，广东省公安厅机场公安局出具了《行政赔偿决定书》。决定书称，1996年8月1日，广州白云国际机场公安局按规定将没收的黄金交售中国人民银行广州市分行，交售兑换886124.75元，9月5日，将涉案黄金交售款上缴广州市财政局。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		决定书认定，广州白云国际机场公安局没收马哈比涉案黄金的行为不符合法律规定，但黄金已被变卖，决定给付赔偿申请人马哈比1996年没收黄金的交售兑换款886124.75元。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		但是马哈比认为，时隔二十年，黄金价格已上涨数倍，对该决定并不满意。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		《新闻极客》查询发现，近期国内黄金价格为每克260元左右，如果按照这个加价格计算，马哈比被扣押的9350克黄金市值约为243万。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		也正是基于此原因，马哈比受访时表示，不应由当年的黄金价格进行赔偿，要求退还黄金原物。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		此案被媒体披露后，立即引起网友的热议。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		3月18日下午，广东省公安厅机场公安局回应称，当年广州白云国际机场公安局不符法律规定，违规没收马哈比黄金。现应给付赔偿申请人马哈比没收黄金的交售兑换款886124.75元，以及支付该款项自1996年8月19日至赔偿决定作出之日的银行同期定期存款利息。截至2016年2月28日，应赔偿马哈比没收黄金的交售兑换款886124.75元以及银行同期定期存款利息约112万元，合计共需支付约200万元国家赔偿金。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		不过马哈比在接受《新京报》采访时仍然表示，自己20年前被拘是刑事案件，警方有保存黄金的义务，并按照程序出具刑事赔偿决定书。自己还是想要回属于自己的黄金。\r\n	</p>\r\n	<div class=\"img_wrapper\" style=\"margin:0px auto;padding:0px;text-align:center;\">\r\n		<img src=\"http://n.sinaimg.cn/news/transform/20160318/tjXH-fxqnskh0965196.jpg\" alt=\"马哈比收到广东省公安厅机场公安局出具的《行政赔偿决定书》\" style=\"border:1px solid #EEEEEE;\" /><span class=\"img_descr\" style=\"line-height:26px;color:#666666;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">此前马哈比收到广东省公安厅机场公安局出具的《行政赔偿决定书》</span>\r\n	</div>\r\n</div>\r\n<div class=\"mainSub\" id=\"btitle2\" style=\"margin:0px 0px 55px;padding:0px;color:#333333;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun, u5B8Bu4F53, Arial;background-color:#FFFFFF;\">\r\n	<h2 class=\"contentSubTitle\" style=\"font-weight:normal;font-size:24px;background:url(&quot;\">\r\n		扣押物品“有去无回”频发生\r\n	</h2>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		<strong>扣押物品“有去无回”频发生</strong>\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		马哈比遇到的难题，绝不仅仅是他一个人的苦恼。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		1998年，西安商人周振友在河北保定洽谈业务时遭当地曲阳县警方跨区抓捕，其携带的19公斤黄金被扣押。被刑拘30天后，“取保候审”的周振友开始了漫长的申诉、上访，但至今未果。周被告知，当初的19公斤黄金早已不知去向。期间，曲阳警方一度答复称“黄金已经被变卖了”。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		相比马哈比和周振友，吉林商人于润龙则稍显幸运。历经十三年，他最终在2015年要回了属于自己的46385克黄金。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		2002年，于润龙因携带黄金，被吉林市公安局拦截。随后，吉林市公安局将于润龙的46公斤黄金上缴到吉林市财政局罚没处。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		当年春节之后，国务院下发文件，停止执行关于中国人民银行对于黄金管理的黄金收购许可、黄金制品生产加工批发业务审批、黄金供应审批、黄金制品零售业务核准四项制度。这意味着，个人收购、买卖黄金行为将不再构成非法经营罪。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		随后，当地检察院认定于润龙的行为“不构成犯罪”。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		此后，于润龙多次讨要黄金未果。2012年8月，于润龙又因“非法经营罪”再次身陷囹圄，直至 2013年7月，再审判决无罪。于润龙多次改判，但黄金始终未能赔还。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		2015年3月6日，吉林省公安厅出具刑事赔偿复议决定书，宣布撤销原赔偿决定，由吉林市公安局按照调解协议，在三个月内返还赔偿请求人于润龙46385克黄金。5月，于润龙领会了自己的黄金。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		但是像于润龙这样“物归原主”的始终是少数。不少当事人的贵重物品，被政府部门长期扣押甚至超期扣押，往往都是“有去无回”。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		1993年，河北沧州市民张家瑞因涉嫌挪用公款被黄骅市检察院立案侦查，其家中留存的6幅署名范曾画作和2幅署名黄绮书法遭检方扣押。除已归还的黄绮书法作品外，其余画作后证实与案件无关，张家瑞至今未要回原画。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		2015年6月，张家瑞向黄骅市检察院提交国家赔偿申请书。当年7月，黄骅市检察院对此案出具了刑事赔偿决定书，认为这5幅画作被检方归还黄骅港务局后遭抵债，无法认定画作真伪，酌情赔款4万元。张家瑞不服，后向沧州人民检察院提出了赔偿复议的申请。2015年10月，沧州市检察院作出裁决，把4万元的赔偿变更为165万元，按抵债的价款进行赔偿。但是对此判决结果，张家瑞仍然表示不满。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		1989年，北京人孙建龙携带吴昌硕、李苦禅的名画《梅花》、《鹰》南下广东，计划趁办事之际，鉴定画作价值，但却被珠海警方以涉嫌走私文物扣押。后来，警方将孙建龙释放，并认定其携带画作系赝品，至今已时隔26年，这两幅画作仍未归还。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		现年71岁的西安画家张武成也同样遇到类似的事情。1984年，张武成因“涉嫌盗窃”著名画家石鲁等人画作，被西安市公安局碑林分局收容审查。张武成收藏的900多幅画作被警方查扣。后来由于证据不足，张武成被释放，但警方只是退还张武成一百余幅画作，其余的至今未归还。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		为了讨回其余画作，张武成走上了申诉上访之路。此后多年间，公安部门、西安市委办公厅均曾出具报告，认为应当归还从张武成家搜查走的字画，但这些报告均未得到落实。\r\n	</p>\r\n	<div class=\"img_wrapper\" style=\"margin:0px auto;padding:0px;text-align:center;\">\r\n		<img src=\"http://n.sinaimg.cn/news/transform/20160318/Aqeh-fxqpchx6363566.jpg\" alt=\"吉林商人于润龙历经13年拿回了属于自己的46斤黄金。\" style=\"border:1px solid #EEEEEE;\" /><span class=\"img_descr\" style=\"line-height:26px;color:#666666;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">吉林商人于润龙历经13年拿回了属于自己的46斤黄金。</span>\r\n	</div>\r\n</div>\r\n<div class=\"mainSub\" id=\"btitle3\" style=\"margin:0px 0px 55px;padding:0px;color:#333333;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun, u5B8Bu4F53, Arial;background-color:#FFFFFF;\">\r\n	<h2 class=\"contentSubTitle\" style=\"font-weight:normal;font-size:24px;background:url(&quot;\">\r\n		政府部门为何成“老赖”？\r\n	</h2>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		<strong>政府部门为何成“老赖”？</strong>\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		《新闻极客》梳理这些案件发现，除了于润龙案之后，其他多数发生在上世纪八十年代和九十年代前期。并且这些向警方讨要被扣财物的物主，无一例外都是无罪之身。也就是说，警方当时以犯罪嫌疑为由做出的扣押决定，早已失去了法理效力。相关的政府部门对这些人，负有归还其被扣物品，弥补其损失的责任和义务。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		但是现实中的案例则说明，财物被扣押非常容易，追讨则非常难，有关部门往往会成为老赖，一拖再拖。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		《中国青年报》曾经刊登署名杨鑫宇的评论文章《警方扣押物品不应“有去无回”》。文章认为，在《物权法》已经施行九年的情况下，这些物主的权益依然难以得到保障，“这说明，扣押物品管理中存在的问题，已经到了不能不解决的地步。”\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		文章认为，要解决扣押物品“有去无回”的难题，需要执法机关在制度和理念两个层面做出改革。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		在制度上，各级执法机关应当严格执行包括《公安机关涉案财物管理若干规定》在内的法律规章，制定细致可操作的扣押物品登记保存制度，确保所有公安机关临时保管的钱物之去向，都有迹可循，而不至于因为缺少登记制度制造一笔又一笔“糊涂账”。同时，扣押不同于罚没，警方执行的仅仅是保管权，除非经过法院判决，否则没有权利对被扣财物进行处分。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		在通过制度治标的基础上，执法人员的理念也需要随着时代进步，由此方能治本。执法人员最需要确立的就是尊重个人财产权的现代物权意识。在过去，因为立法和一些历史文化因素，我国基层人员一直较为缺乏这方面的意识。随着《物权法》出台，执法人员作为手握权力者，自然需要率先培植物权意识，只有当每个人的财产权都受到充分尊重的时候，我们才能让这种“有去无回”的荒诞故事不再重演。\r\n	</p>\r\n	<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		2015年9月1日新修订的《公安机关涉案财物管理若干规定》开始施行。新版规定明确要求，严禁在刑事案件立案或行政案件受案之前对财物采取查封等措施，确与案件无关的财物应在3日内解除措施退还当事人等。\r\n	</p>\r\n	<p style=\"font-size:16px;text-align:right;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun !important;\">\r\n		<strong>（新浪 《新闻极客》梁超 综合报道）</strong>\r\n	</p>\r\n</div>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;color:#333333;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, SimSun, u5B8Bu4F53, Arial;background-color:#FFFFFF;\">\r\n	责任编辑：梁超 SN188\r\n</p>', '1458639446041');
INSERT INTO `companynews` VALUES ('ebba6611-6c03-4e9f-8186-b352c59c7851', '习近平为干事创业净化“政治和经济”两大生态', '/rest/editor/file/image/20160322/20160322173146_833.jpg', '<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	实现“十三五”宏伟目标，时间紧任务重；需要 凝聚共识，充分发挥一切积极因素，为干事创业提供良好的氛围。所以，习近平总书记不仅提出要净化政治生态，还首次提出要净化经济生态。3月4日，他在参加 全国政协十二届四次会议民建、工商联界委员联组会时指出：“反腐败斗争有利于净化政治生态，也有利于净化经济生态，有利于理顺市场秩序、还市场以本来的面 目，把被扭曲了的东西扭回来。”请随“学习中国”小编一起学习。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	&nbsp;\r\n</p>\r\n<div class=\"img_wrapper\" style=\"text-align:center;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;\">\r\n	<img src=\"http://n.sinaimg.cn/news/transform/20160321/xuEj-fxqpchx6387427.jpg\" alt=\"图为：2016年3月4日下午，中共中央总书记、国家主席、中央军委主席习近平看望出席全国政协十二届四次会议民建、工商联界委员并参加联组讨论\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:14px;\"> 图为：2016年3月4日下午，中共中央总书记、国家主席、中央军委主席习近平看望出席全国政协十二届四次会议民建、工商联界委员并参加联组讨论</span>\r\n</div>\r\n<p align=\"center\" style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<strong>一、净化政治生态营造清风正气</strong>\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	政治生态是一个地方政治生活现状以及政治发展 环境的集中反映，是党风、政风、社会风气的综合体现。良好的政治生态，可以内聚人心、外树形象，可以抓好班子、带好队伍，可以集中精力、形成合力。习近平 指出：“做好各方面工作，必须有一个良好政治生态。政治生态污浊，从政环境就恶劣；政治生态清明，从政环境就优良。政治生态和自然生态一样，稍不注意，就 很容易受到污染，一旦出现问题，再想恢复就要付出很大代价。”他强调：“自然生态要山清水秀，政治生态也要山清水秀。”\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	前些年，政治生态中存在一些不容忽视的问题： 一些地方、一些部门正气不彰，邪气不祛；“明制度”名存实亡，“潜规则”大行其道；德才兼备正直清廉埋头实干的干部处处受排挤，一些德才不彰投机取巧阿谀 逢迎之徒平步青云；形式主义、好人主义、地方保护主义滋生。这样的从政环境、政治生态如不能彻底改变，不仅政党的宗旨信仰无从体现，理想目标渐行渐远，身 处其中的好党员好干部也会无所适从。对于不良的从政环境、政治生态，习近平总书记有着清醒的认识。他在《莫把制度当“稻草人”摆设》一文中指出：“现在执 行制度难，主要原因是一些干部当‘老好人’，不愿得罪人，你好我好大家好，不讲原则讲人情，不讲党性讲关系，甚至批评也成变成了变相表扬。”他还在《批评 与自我批评要动真格》一文中指出：“现在有一种倾向，好像批评是不得了的事情，批评谁就得罪谁，出现批评的人不敢批评、被批评的人也不愿被批评等现象，有 的与其说是批评与自我批评，还不如说是表扬与自我表扬。这是一种不好的文风，甚至对党组织的肌体健康是有危害的。”习近平在党的群众路线教育实践活动工作 会议上指出：“党内脱离群众的现象大量存在，集中表现在形式主义、官僚主义、享乐主义和奢靡之风这‘四风’上。”“在形式主义方面，主要是知行不一、不求 实效，文山会海、花拳绣腿，贪图虚名、弄虚作假。”“在官僚主义方面，主要是脱离实际、脱离群众，高高在上、漠视现实，唯我独尊、自我膨胀。”“在享乐主 义方面，主要是精神懈怠、不思进取，追名逐利、贪图享受，讲究排场、玩风盛行。”“在奢靡之风方面，主要是铺张浪费、挥霍无度，大兴土木、节庆泛滥，生活 奢华、骄奢淫逸，甚至以权谋私、腐化堕落。”\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	“善除害者察其本，善理疾者绝其源。”要消除 这些不良风气，只能依靠净化政治生态，不断铲除不良现象滋生蔓延的土壤。习近平指出：“这些年来，在一些地方和单位，‘四风’问题越积越多，党内和社会上 潜规则越来越盛行，政治生态和社会环境受到污染，根子就在从严治党没有做到位。”要净化政治生态，就必须明确政治生态受污染的根源，对症下药，及时治理， 构建风清气正、政通人和、干事创业的良好政治生态。习近平在十八届中央纪委二次全会上指出：“改进工作作风，就要净化政治生态，营造廉洁从政的良好环 境。”\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	净化政治生态，就是要坚持全面从严治党。习近 平指出：“从严是我们做好一切工作的重要保障。”从严治党要按照严格的标准和健全的制度办事，形成高标准、按程序、守规矩、严执行、重实效的良好习惯。习 近平强调：“从严治党，最根本的就是要使全党各级组织和全体党员、干部都按照党内政治生活准则和党的各项规定办事。”就党员干部而言，严格的标准就是习近 平总书记提出的“三严三实”要求。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	净化政治生态，要抓住领导干部这个“关键少 数”。在参加十二届全国人大三次会议吉林代表团审议时习近平指出：“要突出领导干部这个关键，教育引导各级领导干部立正身、讲原则、守纪律、拒腐蚀，形成 一级带一级、一级抓一级的示范效应，积极营造风清气正的从政环境。”在政治局第十六次集体学习时习近平指出：“营造良好从政环境，要从各级领导干部首先是 高级干部做起。领导干部要坚守正道、弘扬正气，坚持以信念、人格、实干立身；要襟怀坦白、光明磊落，对上对下讲真话、实话；要坚持原则，恪守规矩，严格按 党纪国法办事；要严肃纲纪、疾恶如仇，对一切不正之风敢于亮剑；要艰苦奋斗、清正廉洁，正确行使权力，在各种诱惑面前经得起考验。”\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	净化政治生态，要抓住反腐败斗争这条主线。在 十八届中央纪委五次全会上习近平指出：“从这两年查处的案件和巡视发现的问题看，反腐败斗争形势依然严峻复杂，主要是在实现不敢腐、不能腐、不想腐上还没 有取得压倒性胜利，腐败活动减少了但并没有绝迹，反腐败体制机制建立了但还不够完善，思想教育加强了但思想防线还没有筑牢，减少腐败存量、遏制腐败增量、 重构政治生态的工作艰巨繁重。因此，党风廉政建设和反腐败斗争永远在路上。有全党上下齐心协力，有人民群众鼎力支持，我们一定能够打赢党风廉政建设和反腐 败斗争这场攻坚战、持久战。”\r\n</p>\r\n<div class=\"img_wrapper\" style=\"text-align:center;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;\">\r\n	<img id=\"1125358653\" title=\"习近平为干事创业净化“政治和经济”两大生态\" src=\"http://n.sinaimg.cn/news/crawl/20160321/0pNP-fxqnski7780869.jpg\" alt=\"习近平为干事创业净化“政治和经济”两大生态\" height=\"388\" width=\"590\" style=\"width:590px;height:388px;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:14px;\">&nbsp;图为：2016年3月4日下午，中共中央总书记、国家主席、中央军委主席习近平看望参加全国政协十二届四次会议的民建、工商联委员，并参加联组会，听取委员们意见和建议。中共中央政治局常委、全国政协主席俞正声参加看望和讨论。&nbsp;&nbsp;</span>\r\n</div>\r\n<p align=\"center\" style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<strong>二、净化经济生态造公平公正</strong>\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	经济生态是经济运行和经济发展的综合环境。在腐败的经济生态下，经济发展既不公平，又不可持续，是一种严重扭曲的经济生态。只有公平公正的经济生态，才能保证各种所有制经济依法平等使用生产要素、公平参与市场竞争、同等受到法律保护，实现共同发展、永续发展。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	我国目前的市场竞争环境还不够公平合理，在项 目审批、工程招投标、政府采购、土地矿产资源转让等方面腐败易发多发，干扰了正常的市场竞争，扰乱了正常的市场秩序，败坏了经济发展生态，阻碍了经济的高 速发展。在一些地方和行业中，某些企业的“主攻方向”不是提质增效或创新，而是希望借助潜规则、暗操作来套取项目、资金，获得特殊待遇、排挤竞争对手、攫 取非法利益，不仅严重损害了企业形象，更为严重的是破坏了公平公正的市场规则，严重污染了经济生态，让经济发展出现畸形。权力寻租的结果，终究是少数企业 和个人从不公平竞争中获益，而多数守法企业将面临正常生产经营成本增加、发展处处受限的困难局面。大量事实证明，腐败是经济生态只能发展经济蛀虫，是破坏 经济正常发展的“定时炸弹”。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	营造良好经济生态，必须坚决铲除经济腐败。腐 败毒化了我们的经济环境和政治环境，是社会经济发展最大毒瘤。习近平指出：“如果很多有大大小小权力的人都在吃拿卡要，为个人利益人为制造障碍，或者搞利 益输送、暗箱操作，怎么会对经济发展有利呢？”只有零容忍地反腐败，才能切断歪路、邪路，矫正市场主体发展的路径，让企业摆脱不正常的政商关系，回归市场 本位，转向依靠创新、依靠提升产品和服务质量的内生发展道路。在反腐败与经济发展的关系问题上，党中央始终立场坚定。习近平反复强调：“反腐并不会影响经 济发展，反而有利于经济发展持续健康。”反腐败与推动经济发展是统一的，经济发展需要反腐败来营造良好的政治生态和市场环境，要彻底摒弃反腐败“过了头”、“阻碍了经济发展”的观点，决不能让腐败成为阻碍我们发展进程的“拦路虎”。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	营造公正公平的经济生态，要厘清政府与市场的 边界。经济腐败之所以存在，一个重要的原因就是由于在应该交给市场的地方，政府的手伸得过长，一些领域的改革不到位，导致市场在资源配置中的作用不能充分 发挥。好的市场环境中，需要服务型的政府。政府要做好服务工作和保障工作，创造良好的市场环境并提供有效的社会保障。同时，也不能割裂市场与政府这两个现 代市场经济体系中的重要手段。习近平指出：“使市场在资源配置中起决定性作用和更好发挥政府作用，二者是有机统一的，不是相互否定的，不能把二者割裂开 来、对立起来，既不能用市场在资源配置中的决定性作用取代甚至否定政府作用，也不能用更好发挥政府作用取代甚至否定使市场在资源配置中起决定性作用。”\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	营造良好经济生态，必须创建新型政商关系。发 展社会主义市场经济，政商关系是始终绕不开的重要话题。构建健康、清廉、公开、透明的新型政商关系，是顺应经济新常态的大势所趋。习近平指出，“新型政商 关系应该是什么样的？概括起来说，我看就是‘亲’、‘清’两个字。”经济要想健康发展，唯“亲”才能紧密合作，唯“清”才能洁身守正。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	营造良好经济生态，必须依靠法治。平等性、竞 争性、开放性、法制性是市场经济最为核心的四个基本特征，只有依靠法治才能保证四个方面同时实现。只有赋予法律至高无上的地位，法律面前人人平等，各个经 济主体都为自己的决策后果负责，才能真正实现市场的配置、调节、激励和约束作用。十八届四中全会《决定》中提出：“加强市场法律制度建设，编纂民法典，制 定和完善发展规划、投资管理、土地管理、能源和矿产资源、农业、财政税收、金融等方面法律法规，促进商品和要素自由流动、公平交易、平等使用。依法加强和 改善宏观调控、市场监管，反对垄断，促进合理竞争，维护公平竞争的市场秩序。”通过不断完善相关的市场规则，严格执法，加强市场监督，才能保证各类市场主 体在竞争中处于平等地位，依法保护其合法权益，维护公平竞争。习近平指出：“守法经营，这是任何企业都必须遵守的一个大原则。公有制企业也好，非公有制企 业也好，各类企业都要把守法诚信作为安身立命之本，依法经营、依法治企、依法维权。法律底线不能破，偷税漏税、走私贩私、制假贩假等违法的事情坚决不做， 偷工减料、缺斤短两、质次价高的亏心事坚决不做。”\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;text-indent:30px;\">\r\n	我们正处在全面建成小康社会和民族伟大复兴的关键时期，我们必须齐心协力打赢反腐败斗争这场攻坚战、持久战，努力为中国经济社会健康发展营造有利于干事创业的政治生态和经济生态。\r\n</p>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	责任编辑：平晶晶\r\n</p>', '1458639127009');
INSERT INTO `companynews` VALUES ('f19d73e2-b28c-4c26-a545-795caa28faf7', '印尼官方证实对台湾渔船开枪:拦截时遭冲撞', '/rest/editor/file/image/20160322/20160322173747_26.png', '<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	原标题：台渔船遭印尼射击 涉外部门：厘清事实后或进一步行动\r\n</p>\r\n<div id=\"ad_44086\" class=\"otherContent_01\" style=\"font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;margin:10px 20px 10px 0px;padding:4px;\">\r\n	<iframe width=\"300px\" height=\"250px\" frameborder=\"0\" src=\"http://x.jd.com/exsites?spread_type=2&amp;ad_ids=1884:5&amp;location_info=0&amp;callback=getjjsku_callback\">\r\n	</iframe>\r\n</div>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	【环球网综合报道】据台湾“中央社”3月22日报道，两艘台湾地区的渔船在马六甲海峡遭到印尼公务船开枪。台湾当局涉外部门22日表示，目前确认是印尼公务船开枪，但必须还原当天情况，将在确定事实真貌后采取进一步作为。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	印尼海事与渔业部长苏西21日接受“中央社”访问时宣称，台湾渔船是“非法捕鱼”，遭印尼巡逻船拦截不停并企图冲撞，巡逻船才开枪。这是印尼官方首度证实对台湾渔船开枪。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	苏西提供给中央社记者一段1分32秒、印尼巡逻船拍摄的影片，其中可以清楚看到印尼巡逻船紧跟在台湾渔船“圣德财”左后方，并多次把灯光打向“圣德财”，示意停船，但未获回应，“圣德财”持续向前航。但影片中并没有渔船故意冲撞、以及巡逻船开枪的画面。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	台湾“公众外交协调会”副执行长李宪章上午在例行记者会后表示，台涉外部门与驻印尼代表处21日收到讯息后，第一时间与印尼方面联系，了解事情原貌。\r\n</p>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	责任编辑：向昌明 SN123\r\n</p>', '1458639476680');
INSERT INTO `companynews` VALUES ('f4eeab09-8733-49b3-a1ff-f4053aead256', '布鲁塞尔机场爆炸致数十伤亡 当地地铁站全关闭', '/rest/editor/file/image/20160322/20160322173227_265.jpg', '<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	原标题：布鲁塞尔爆炸已致数十人伤亡\r\n</p>\r\n<div id=\"ad_44089\" class=\"otherContent_01\" style=\"font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;margin:10px 20px 10px 0px;padding:4px;\">\r\n	<iframe width=\"300px\" height=\"250px\" frameborder=\"0\" src=\"http://x.jd.com/exsites?spread_type=2&amp;ad_ids=1884:5&amp;location_info=0&amp;callback=getjjsku_callback\">\r\n	</iframe>\r\n</div>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	新华社布鲁塞尔3月22日电(记者吴昌荣 孙奕 赵小娜)比利时首都布鲁塞尔市郊的扎芬特姆机场和市内欧盟总部附近地铁站22日上午先后发生爆炸，已造成数十人伤亡。目前比利时内政部已将该国的安全警戒级别调至最高级。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	据当地媒体报道，扎芬特姆机场的爆炸发生于当地时间22日上午8时左右。目击者说，机场内有多人受伤，有人昏倒在机场离港大厅里。还有目击者称，爆炸前机场曾响起枪声，有人用阿拉伯语叫喊。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	比利时法语国家电视台援引医院方面的消息说，机场爆炸事件已经造成10人死亡、30人受伤。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	据报道，机场所在区域已启动应急机制，消防员正在现场施救。目前机场已关闭，进出港航班均已取消，原计划入港航班已转至布鲁塞尔附近的其他机场降落，布鲁塞尔市区至扎芬特姆机场的轨道交通暂停运营，市区至该机场的高速公路也已封闭。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	机场爆炸事件发生后不久，位于布鲁塞尔市区欧盟委员会大楼附近的地铁站发生爆炸，目前消防车已抵达事发现场，暂不清楚伤亡情况。据悉，地铁公司已经关闭布鲁塞尔所有地铁站。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	比利时警方尚未证实爆炸是否属于恐怖袭击。(完)\r\n</p>\r\n<p class=\"article-editor\" style=\"text-align:right;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	责任编辑：倪子牮\r\n</p>', '1458639160495');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `openid` varchar(32) NOT NULL,
  `locationprecision` varchar(64) DEFAULT NULL,
  `longitude` varchar(64) DEFAULT NULL,
  `latitude` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`openid`),
  KEY `openid` (`openid`),
  KEY `longitude` (`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('oE4K1uJ7-eD2qTkIo51ISrgR7u4U', '65.000000', '113.356071', '23.198643');
INSERT INTO `customer` VALUES ('oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '30.000000', '113.351608', '23.199146');
INSERT INTO `customer` VALUES ('oQ1HdvidVT4q4ttAcYoAUxFj-IAM', '40.000000', '113.351936', '23.199686');
INSERT INTO `customer` VALUES ('oQ1HdvjYotyK8XMdX8PWohb545Sg', null, null, null);
INSERT INTO `customer` VALUES ('oQ1Hdvmfv5udWNufD5cF7WCTQTdg', '150.000000', '113.355919', '23.198372');
INSERT INTO `customer` VALUES ('oQ1HdvmM7jyO0etqDcVcien0xDqw', '150.000000', '113.474632', '23.106833');
INSERT INTO `customer` VALUES ('oQ1Hdvr8Zin53Cxmrp4-iz0HIloY', '40.000000', '113.356476', '23.198423');
INSERT INTO `customer` VALUES ('oQ1HdvsYO7HPvM1zqN4FggBqZ6RY', '65.000000', '113.356125', '23.198521');
INSERT INTO `customer` VALUES ('oQ1HdvuD1pLBrc7r-cxRfE_WN6q4', '40.000000', '113.356277', '23.198496');
INSERT INTO `customer` VALUES ('oQ1HdvuK1ZRq3qIFGVECqJe3T-Eg', '65.000000', '113.356232', '23.198519');

-- ----------------------------
-- Table structure for `delivery`
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `id` varchar(64) NOT NULL,
  `companyName` varchar(30) DEFAULT NULL,
  `deliverySn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shippercoding` (`companyName`),
  CONSTRAINT `fk_shippercoding` FOREIGN KEY (`companyName`) REFERENCES `shippercoding` (`shipperCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES ('50ae8c2a86354d069d417b53788aa249', 'ZWYSD', '1202035384293');
INSERT INTO `delivery` VALUES ('fdd1a815fb74497182173fad7918a1e6', '7TLSWL', '1202035384293');

-- ----------------------------
-- Table structure for `evaluation`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `id` varchar(64) NOT NULL,
  `content` text,
  `grade` smallint(6) DEFAULT NULL,
  `order_id` varchar(64) DEFAULT NULL,
  `customer_id` varchar(64) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_repairid` (`order_id`),
  CONSTRAINT `fk_repairid` FOREIGN KEY (`order_id`) REFERENCES `repairorder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('2ef8e314-d6d2-4c81-8a7f-da3992bba04a', 'dafsadfsadfsafsadfsadf', '5', '1bebd1de-7c25-46af-9d8c-6f119c490cea', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null);

-- ----------------------------
-- Table structure for `keyword`
-- ----------------------------
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `id` varchar(200) NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `msgtype` varchar(200) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `mediaid` varchar(200) DEFAULT NULL,
  `picurl` varchar(200) DEFAULT NULL,
  `thumbmediaid` varchar(200) DEFAULT NULL,
  `format` varchar(200) DEFAULT NULL,
  `musicurl` varchar(200) DEFAULT NULL,
  `hqmusicurl` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `articlecount` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msgtype_inkeyword` (`msgtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keyword
-- ----------------------------
INSERT INTO `keyword` VALUES ('subscribe', '当用户关注了公众号时', 'text', '感谢关注我', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` varchar(64) NOT NULL,
  `product_id` varchar(64) DEFAULT NULL,
  `order_id` varchar(64) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_category` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_product_id` (`product_id`),
  KEY `fk_orderitem_order_id` (`order_id`),
  KEY `fk_orderitem_category_product` (`product_category`),
  CONSTRAINT `fk_orderitem_category_product` FOREIGN KEY (`product_category`) REFERENCES `productcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderitem_order_id` FOREIGN KEY (`order_id`) REFERENCES `productorder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderitem_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('339f9b86d5b142ef8d51f16b8dafefc6', 'f4dab990-cbd8-4413-8043-1c255d8fa42a', '58795c37c16048e0bbfea8cb8df2f136', '20', '27d2eee4d5ec4c1abd894e805a061b6a');

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `createtime` bigint(20) DEFAULT NULL,
  `payment_type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_type` (`payment_type`),
  CONSTRAINT `fk_payment_type` FOREIGN KEY (`payment_type`) REFERENCES `paymenttype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for `paymenttype`
-- ----------------------------
DROP TABLE IF EXISTS `paymenttype`;
CREATE TABLE `paymenttype` (
  `id` varchar(6) NOT NULL,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paymenttype
-- ----------------------------
INSERT INTO `paymenttype` VALUES ('1001', '线下支付');
INSERT INTO `paymenttype` VALUES ('2001', '微信支付');
INSERT INTO `paymenttype` VALUES ('2002', '支付宝');

-- ----------------------------
-- Table structure for `pevaluation`
-- ----------------------------
DROP TABLE IF EXISTS `pevaluation`;
CREATE TABLE `pevaluation` (
  `id` varchar(64) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `grade` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pevaluation
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) NOT NULL,
  `photoUrl` varchar(255) DEFAULT NULL,
  `description` text,
  `price` float DEFAULT NULL,
  `productSn` varchar(20) NOT NULL,
  `isNew` bit(1) DEFAULT NULL,
  `isHot` bit(1) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `type_id` varchar(64) DEFAULT NULL,
  `picgroup` text,
  PRIMARY KEY (`id`),
  KEY `fk_product_type` (`type_id`),
  CONSTRAINT `fk_product_type` FOREIGN KEY (`type_id`) REFERENCES `producttype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('b0c23a6b-4e3d-4e7e-ad73-b894c8d86f33', '34534', '1459411484892', '/rest/editor/getPIC/image/71faee1bdc1a4bfa89e9bed896400a95.png', '场发射法师打发士大夫', '44', '145941148489223', '', '', '', '1001', '[\"/rest/editor/getPIC/image/288509fe455e440da1262b6e9131cbc0.png\",\"/rest/editor/getPIC/image/9fde0870e71f46c7bf5184558f65a875.png\",\"/rest/editor/getPIC/image/3bcdcb6640134433874f769ef56b66bf.png\"]');
INSERT INTO `product` VALUES ('cb639597-460c-437c-b3ad-1c3042420394', '是打发士大夫', '1459411000126', '/rest/editor/getPIC/image/497fc6e4f0014d5bb2d05ccf864e7bf8.png', '实打实大法师', '44', '145941100012618', '', '', '', '1001', '[\"/rest/editor/getPIC/image/4773f44b442749c98319a254c49dc372.png\"]');
INSERT INTO `product` VALUES ('f4dab990-cbd8-4413-8043-1c255d8fa42a', '是打发士大夫', '1459411069450', '/rest/editor/getPIC/image/8b17ba49bac94f8a8e1cff9d9602997e.png', '阿斯顿法师打发士大夫撒', '11', '145941106945040', '', '', '', '1002', '[\"/rest/editor/getPIC/image/4907261682fc4012a0ab6d9360149a0c.png\"]');
INSERT INTO `product` VALUES ('f5b41648-fc37-4322-93cf-3ee39387cd96', '你没', '1459411526946', '/rest/editor/getPIC/image/12e3ea43da584f3f9c298adaca6e4f06.png', '场发射法师打发士大夫66666', '4455', '145941152694688', '', '', '', '2001', '[\"/rest/editor/getPIC/image/288509fe455e440da1262b6e9131cbc0.png\"]');

-- ----------------------------
-- Table structure for `productattr`
-- ----------------------------
DROP TABLE IF EXISTS `productattr`;
CREATE TABLE `productattr` (
  `id` varchar(64) NOT NULL,
  `product_id` varchar(64) DEFAULT NULL,
  `attrKey` varchar(64) DEFAULT NULL,
  `attrValue` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productattr` (`product_id`),
  CONSTRAINT `fk_productattr` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productattr
-- ----------------------------
INSERT INTO `productattr` VALUES ('744ec843039546f2b3e455a1369deb45', 'f4dab990-cbd8-4413-8043-1c255d8fa42a', '个', '[\"11\",\"22\"]');
INSERT INTO `productattr` VALUES ('9f173177d04540409530c61a88f1cf17', 'cb639597-460c-437c-b3ad-1c3042420394', '高度', '[\"1\",\"2\"]');
INSERT INTO `productattr` VALUES ('bd673ed213cf4a36a6eecd588f6d033b', 'b0c23a6b-4e3d-4e7e-ad73-b894c8d86f33', '高度', '[\"1\",\"2\",\"3\",\"4\",\"5\"]');
INSERT INTO `productattr` VALUES ('ec7c38f90f624f6680fad66e3051e6be', 'f4dab990-cbd8-4413-8043-1c255d8fa42a', '个', '[\"11\",\"\"]');
INSERT INTO `productattr` VALUES ('eca2d0a9fb514743bdd31a968910bfb2', 'f5b41648-fc37-4322-93cf-3ee39387cd96', '高度', '[\"1\",\"23\",\"3\",\"4\",\"5\"]');

-- ----------------------------
-- Table structure for `productcategory`
-- ----------------------------
DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE `productcategory` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `inventory` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `product_id` varchar(64) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_id` (`product_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productcategory
-- ----------------------------
INSERT INTO `productcategory` VALUES ('060f79eed4b54dc984fa40c79a58a74a', '个:22,', '11', '33', 'f4dab990-cbd8-4413-8043-1c255d8fa42a', '0');
INSERT INTO `productcategory` VALUES ('27d2eee4d5ec4c1abd894e805a061b6a', '个:11,', '2', '44', 'f4dab990-cbd8-4413-8043-1c255d8fa42a', '0');
INSERT INTO `productcategory` VALUES ('2959a6b6f9014259ba8a13202d513133', '高度:3,', '2', '1', 'f5b41648-fc37-4322-93cf-3ee39387cd96', '0');
INSERT INTO `productcategory` VALUES ('3894fd3e7da5444bab8b71c5a629c8de', '高度:4,', '266', '1', 'f5b41648-fc37-4322-93cf-3ee39387cd96', '0');
INSERT INTO `productcategory` VALUES ('3914cde932474d4fb985ad03af5e7b99', '高度:1,', '22', '11', 'cb639597-460c-437c-b3ad-1c3042420394', '0');
INSERT INTO `productcategory` VALUES ('3fa15d9812f34b3c82abd845c2441091', '高度:23,', '23', '23', 'f5b41648-fc37-4322-93cf-3ee39387cd96', '0');
INSERT INTO `productcategory` VALUES ('5ea679d646a64774b26df8ef2f54688c', '高度:2,', '2', '1', 'b0c23a6b-4e3d-4e7e-ad73-b894c8d86f33', '0');
INSERT INTO `productcategory` VALUES ('6154b3d91761442491329dab6761d517', '高度:2,', '22', '11', 'cb639597-460c-437c-b3ad-1c3042420394', '66');
INSERT INTO `productcategory` VALUES ('66a116fb0de54e9c9f164cec3cad3fcc', '高度:4,', '2', '1', 'b0c23a6b-4e3d-4e7e-ad73-b894c8d86f33', '0');
INSERT INTO `productcategory` VALUES ('8b1efd5015ed45d88d5457f5ddc782b6', '高度:1,', '2', '1', 'b0c23a6b-4e3d-4e7e-ad73-b894c8d86f33', '0');
INSERT INTO `productcategory` VALUES ('afe2c56dfc5d4be388fd2d38f55e757c', '高度:5,', '22', '1', 'f5b41648-fc37-4322-93cf-3ee39387cd96', '0');
INSERT INTO `productcategory` VALUES ('ca98701911ec42c18097471ec74fae84', '高度:1,', '2', '1', 'f5b41648-fc37-4322-93cf-3ee39387cd96', '0');
INSERT INTO `productcategory` VALUES ('dab33311ff08411cb93d57d79fd9b290', '高度:5,', '2', '1', 'b0c23a6b-4e3d-4e7e-ad73-b894c8d86f33', '0');
INSERT INTO `productcategory` VALUES ('f21ef9d5b7df459fb368f56fcb810f1a', '高度:3,', '2', '1', 'b0c23a6b-4e3d-4e7e-ad73-b894c8d86f33', '0');

-- ----------------------------
-- Table structure for `productorder`
-- ----------------------------
DROP TABLE IF EXISTS `productorder`;
CREATE TABLE `productorder` (
  `id` varchar(255) NOT NULL,
  `createtime` bigint(20) NOT NULL,
  `modifytime` bigint(20) DEFAULT NULL,
  `payment_id` varchar(64) DEFAULT NULL,
  `orderStatus` smallint(6) NOT NULL,
  `memo` tinytext,
  `deliveryfee` float DEFAULT NULL,
  `delivery_id` varchar(64) DEFAULT NULL,
  `orderSn` varchar(20) NOT NULL,
  `customer_id` varchar(64) NOT NULL,
  `shipInfo_id` varchar(64) DEFAULT NULL,
  `totalPrice` float NOT NULL,
  `totalAmount` int(11) NOT NULL,
  `evaluation_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_porder_payment` (`payment_id`),
  KEY `fk_porder_delivery` (`delivery_id`),
  KEY `fk_porder_customer_id` (`customer_id`),
  KEY `fk_poder_shipinfo` (`shipInfo_id`),
  KEY `fk_porder_evaluation` (`evaluation_id`),
  CONSTRAINT `fk_poder_shipinfo` FOREIGN KEY (`shipInfo_id`) REFERENCES `shipinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_porder_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`openid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_porder_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_porder_evaluation` FOREIGN KEY (`evaluation_id`) REFERENCES `pevaluation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_porder_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productorder
-- ----------------------------
INSERT INTO `productorder` VALUES ('36343026b7724536b3d0797aaedf2fe7', '1458639652357', null, null, '0', null, '10', null, '145863965235718', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', 'f0bd8a440b87443ea38cc0a3f06771d1', '10', '0', null);
INSERT INTO `productorder` VALUES ('58795c37c16048e0bbfea8cb8df2f136', '1459845332319', null, null, '0', null, '0', null, '145984533231936', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', 'd8283ece0431408b86f4a9687e50e5af', '880', '20', null);
INSERT INTO `productorder` VALUES ('a41ed7df87d74eb6bf97392d21015cb1', '1458639718642', null, null, '0', null, '0', null, '145863971864268', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '6d4389cf614e40139ebc132e7acbef3f', '999', '15', null);

-- ----------------------------
-- Table structure for `producttype`
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producttype
-- ----------------------------
INSERT INTO `producttype` VALUES ('1001', '木门');
INSERT INTO `producttype` VALUES ('1002', '铁门');
INSERT INTO `producttype` VALUES ('2001', '水电');

-- ----------------------------
-- Table structure for `receiver`
-- ----------------------------
DROP TABLE IF EXISTS `receiver`;
CREATE TABLE `receiver` (
  `id` varchar(255) NOT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `shipArea` varchar(255) DEFAULT NULL,
  `shipStreet` varchar(255) DEFAULT NULL,
  `isDefault` bit(1) DEFAULT NULL,
  `customer_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_receiver_customer_id` (`customer_id`),
  CONSTRAINT `fk_receiver_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`openid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receiver
-- ----------------------------

-- ----------------------------
-- Table structure for `repaircategory`
-- ----------------------------
DROP TABLE IF EXISTS `repaircategory`;
CREATE TABLE `repaircategory` (
  `id` varchar(32) NOT NULL,
  `categoryname` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repaircategory
-- ----------------------------
INSERT INTO `repaircategory` VALUES ('1001', '木门维修');
INSERT INTO `repaircategory` VALUES ('2001', '水电维修');
INSERT INTO `repaircategory` VALUES ('3001', '其它维修');

-- ----------------------------
-- Table structure for `repairorder`
-- ----------------------------
DROP TABLE IF EXISTS `repairorder`;
CREATE TABLE `repairorder` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `createtime` bigint(20) NOT NULL,
  `modifytime` bigint(20) DEFAULT NULL,
  `orderSn` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `booktimeup` bigint(20) DEFAULT NULL,
  `booktimedown` bigint(20) DEFAULT NULL,
  `memo` text,
  `orderStatus` smallint(6) NOT NULL,
  `photoUrl` varchar(100) DEFAULT NULL,
  `customer_id` varchar(64) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL COMMENT '维修工id',
  `contact` varchar(32) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `category_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userid` (`user_id`),
  KEY `fk_customerid` (`customer_id`),
  KEY `fk_category_id` (`category_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `repaircategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_customerid` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`openid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repairorder
-- ----------------------------
INSERT INTO `repairorder` VALUES ('004c04a8-b3e4-4830-95b5-1d83c6858f95', '1458481836981', '1458487872962', '145848183698191', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '1', '/rest/editor/file/image/20160320/20160320215026_500.png', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '', '', '2001');
INSERT INTO `repairorder` VALUES ('00600490-b3b7-454d-8a87-469191e60c86', '1457849786526', '1457850042273', '145784978652700', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457838000000', '1457834400000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '高兴', '18588812515', '1001');
INSERT INTO `repairorder` VALUES ('012ac152-53f6-4dfa-b708-fa41c90e0b29', '1458442766693', '1458442766693', '145844276669455', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '1001');
INSERT INTO `repairorder` VALUES ('02d3860b-edc6-432a-88d9-3505463472c9', '1458558794767', '1458559008014', '145855879476797', '', '1458489600000', '1458489600000', '', '4', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '鍙戦�', '18826136832', '2001');
INSERT INTO `repairorder` VALUES ('06f93994-8d2b-4965-9ad9-0c32dad90085', '1458667053308', '1458903154767', '145866705330806', '', '1458662400000', '1458662400000', '', '1', '', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '哦呃呃哦哦', '', '2001');
INSERT INTO `repairorder` VALUES ('07c913bb-cc0f-410c-a7b8-3409e3d32a85', '1458559669373', '1458559669373', '145855966937476', '我', '1458489600000', '1458489600000', '是不是', '0', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '过', '是', '3001');
INSERT INTO `repairorder` VALUES ('0b324a65-d8f2-45dd-aca6-6d658c39dbe3', '1458481457366', '1458487872963', '145848145736630', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '1', '', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江', '', '2001');
INSERT INTO `repairorder` VALUES ('0b5b5bf6-5bc2-46f6-8e5e-ff5f95f46094', '1458901889775', '1458901960866', '145890188977603', '广东省广州市', '1458867600000', '1458846000000', '', '1', '', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '', '', '2001');
INSERT INTO `repairorder` VALUES ('0f8bcf5a-a4fe-4949-b933-0249c4220b18', '1457793972224', '1457794993851', '145779397222400', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '2001');
INSERT INTO `repairorder` VALUES ('0fedfe64-a453-4da6-9791-df7beefe0b3b', '1457850436270', '1457850436270', '145785043627000', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457798400000', '1457798400000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '3001');
INSERT INTO `repairorder` VALUES ('1556fcc1-9d5f-4fcd-bb0d-da2b8f8a3f20', '1458379936814', '1458379936814', '145837993681574', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458316800000', '1458316800000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '1001');
INSERT INTO `repairorder` VALUES ('18a9cbdf-4fdd-4244-8b3f-69e9acbea3c6', '1458892361261', '1458901960867', '145889236126112', '广东省广州市', '1458835200000', '1458835200000', '', '1', '', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '哦哦哦', '', '2001');
INSERT INTO `repairorder` VALUES ('1993b0e6-2251-4482-b2bb-3abc49fddcba', '1457497788322', '1457502918537', '1', '你家', '1457427000000', '1457425380000', 'sdfsdf', '5', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '你妈', '18933124852', '1001');
INSERT INTO `repairorder` VALUES ('1a0455ec-65d4-4268-957d-26595a2f7feb', '1458556594520', '1458556594520', '145855659452062', '', '1458489600000', '1458489600000', '', '0', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '今天就', '', '2001');
INSERT INTO `repairorder` VALUES ('1bebd1de-7c25-46af-9d8c-6f119c490cea', '1457497530760', '1457512516993', '0', '你家', '1457427000000', '1457425380000', 'sdfsdf', '4', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvidVT4q4ttAcYoAUxFj-IAM', '-1', '你妈', '18933124852', '2001');
INSERT INTO `repairorder` VALUES ('1c76ef2a-914d-4494-9b85-180ec31c74fa', '1457793981339', '1457795186249', '145779398133900', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '3001');
INSERT INTO `repairorder` VALUES ('2af20eab-f90c-422b-bb08-282dc2968e2c', '1458379949393', '1458379949393', '145837994939430', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458316800000', '1458316800000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '讲价', '', '1001');
INSERT INTO `repairorder` VALUES ('2d804f53-59c3-420d-8249-faf7320bdd3d', '1457857656895', '1457857656895', '145785765690209', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457798400000', '1457798400000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '2001');
INSERT INTO `repairorder` VALUES ('2fd146b8-e6df-4dda-8c41-2d692de9f3d5', '1458979189971', '1458979196860', '145897918997116', '广东省广州市', '1458921600000', '1458921600000', '', '4', '/rest/editor/getPIC/image/NVjuE5CFZ_2eiEYe8VYTtQM9f69-QBJLNHEEiK6b0EqV2eiMXR9oxUnVSMSja0Av.jpg', 'oE4K1uJ7-eD2qTkIo51ISrgR7u4U', null, '', '', '2001');
INSERT INTO `repairorder` VALUES ('3047ba2f-131a-48e6-a53c-381f97bca547', '1457864276801', '1457864276801', '14578642768010843', '广东省广州市天河区龙洞街道广东工业大学(龙洞校区)', '1457798400000', '1457798400000', 'wanwan', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvidVT4q4ttAcYoAUxFj-IAM', null, 'caicaicai', '1111', '3001');
INSERT INTO `repairorder` VALUES ('33067fdb-66dc-417f-84b4-70514e4af6fb', '1457539114464', '1457624488241', '3', '啊', '1457452800000', '1457452800000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvjYotyK8XMdX8PWohb545Sg', '1', '', '', '3001');
INSERT INTO `repairorder` VALUES ('337a311f-d718-4d5c-b837-6ef027f03111', '1457795594319', '1457850042273', '145779559431900', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '你妈逼', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '拔出来', '18826136937', '2001');
INSERT INTO `repairorder` VALUES ('341a09a6-ccc9-4ee3-a848-5065fc2a9c09', '1457857781206', '1457857781206', '14578577812062683', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457798400000', '1457798400000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '3001');
INSERT INTO `repairorder` VALUES ('36736060-dde7-4c19-a2cc-8b93ebeca1e9', '1458557151199', '1458557151199', '145855715119922', '', '1458489600000', '1458489600000', '', '0', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '3001');
INSERT INTO `repairorder` VALUES ('36f19b2e-cd5b-4435-a7bd-5227962c7c19', '1457793975418', '1457794993852', '145779397541800', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '1001');
INSERT INTO `repairorder` VALUES ('3babff38-a42e-4084-b5c1-581b23269d42', '1458442746623', '1458442746623', '145844274662408', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '你看看', '', '2001');
INSERT INTO `repairorder` VALUES ('3e85ad68-4159-4701-9819-9e99f6b7b71a', '1457583002397', '1457617497111', '145758300239700', '广东省广州市天河区犀牛东路', '1457596800000', '1457553600000', '狗屎坏了', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽啊', '18826136937', '3001');
INSERT INTO `repairorder` VALUES ('40352626-316a-474d-bdd9-6a4b43096c90', '1457793976618', '1457794945715', '145779397661800', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '2001');
INSERT INTO `repairorder` VALUES ('4052dd0c-486b-4b4e-a720-fd9bcd86e3b1', '1457539107333', '1457623792023', '4', '', '1457452800000', '1457452800000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvjYotyK8XMdX8PWohb545Sg', '1', '', '', '1001');
INSERT INTO `repairorder` VALUES ('40cd74cc-dc39-4f0e-a591-91e151505edb', '1458482222440', '1458487872962', '145848222244147', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '1', '/rest/editor/file/image/20160320/20160320215655_26.png', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '牛逼哄哄', '', '2001');
INSERT INTO `repairorder` VALUES ('45d5c889-89e0-4a77-a215-a5fb0d206627', '1458443629822', '1458443629822', '145844362982291', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '看了', '', '1001');
INSERT INTO `repairorder` VALUES ('48d342ad-9915-4faf-95ac-3245380cfe13', '1458962295434', '1458973877524', '145896229543503', '广东省广州市', '1458921600000', '1458921600000', '规划好', '1', '', 'oE4K1uJ7-eD2qTkIo51ISrgR7u4U', '1', '狂子宫', '18826136937', '2001');
INSERT INTO `repairorder` VALUES ('4d5601c8-baa2-4c5e-8c1b-7009c309bfa5', '1457793970252', '1457794993851', '145779397025300', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '1001');
INSERT INTO `repairorder` VALUES ('500e824e-8f38-46d7-bd35-bf275fe9fddb', '1457850882680', '1457850882680', '145785088268100', '', '1457798400000', '1457798400000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvjYotyK8XMdX8PWohb545Sg', null, '', '', '2001');
INSERT INTO `repairorder` VALUES ('52a20a75-ce46-493d-8d43-67fd6f11462f', '1457532868636', '1458554139585', '5', '你家', '1457427000000', '1457425380000', 'sdfsdf', '4', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '你妈', '18933124852', '2001');
INSERT INTO `repairorder` VALUES ('57f23983-593b-400c-8468-0aae44bfc9fb', '1458379935128', '1458379935128', '145837993512892', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458316800000', '1458316800000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '2001');
INSERT INTO `repairorder` VALUES ('58af75aa-24b4-4601-80b2-f4e571d182e9', '1457850625969', '1457850625969', '145785062596900', '广东省广州市天河区龙洞街道广东工业大学(龙洞校区)', '1457798400000', '1457798400000', '包夜', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvidVT4q4ttAcYoAUxFj-IAM', null, '蔡鸿文', '18826137274', '3001');
INSERT INTO `repairorder` VALUES ('5d203f7c-496f-4eda-a551-1f4a31900348', '1457539112031', '1457624488241', '6', '啊', '1457452800000', '1457452800000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvjYotyK8XMdX8PWohb545Sg', '1', '', '', '3001');
INSERT INTO `repairorder` VALUES ('663a1fd5-6f68-4b74-abfd-02449d17896e', '1458886432107', '1458901960867', '145888643210789', '广东省广州市', '1458835200000', '1458835200000', '刚好 ', '1', '', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '脑残', '滚开', '2001');
INSERT INTO `repairorder` VALUES ('663e96d9-85cb-4178-8468-5a4477e59ee6', '1457793985657', '1457795186250', '145779398565700', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '1001');
INSERT INTO `repairorder` VALUES ('68b2f646-1617-4e62-854c-2c9b0a572539', '1458962533177', '1458973877552', '145896253317714', '广东省广州市', '1458921600000', '1458921600000', '', '1', '/rest/editor/getPIC/image/XvoV23CzdAyy2JRBHM00M3NLzGqJgrX_1AOq8HxR_aztqLJIdUmEo1REgLJn143_.jpg', 'oE4K1uJ7-eD2qTkIo51ISrgR7u4U', '1', '哈哈哈哈看着', '', '1001');
INSERT INTO `repairorder` VALUES ('69c48b43-e4fa-4462-ad0e-524c5fd23abe', '1458443094232', '1458443094232', '145844309423316', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '牛逼', '', '1001');
INSERT INTO `repairorder` VALUES ('6a3b6084-69fb-43f0-b2b7-d7ce9d7e143d', '1457850394800', '1457866551856', '145785039480000', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1457798400000', '1457798400000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvsYO7HPvM1zqN4FggBqZ6RY', '1', '', '', '1001');
INSERT INTO `repairorder` VALUES ('6d854ef3-d093-4c6a-a67f-1288f218cefb', '1457850418976', '1457866533294', '145785041897600', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457798400000', '1457798400000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '', '', '1001');
INSERT INTO `repairorder` VALUES ('72f8e831-0ee1-487a-bda8-1227de49ae79', '1457793974460', '1457794993852', '145779397446000', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '1001');
INSERT INTO `repairorder` VALUES ('756c0bc5-c2de-4b43-b695-73722ca7ffca', '1457793979776', '1457794945715', '145779397977700', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '3001');
INSERT INTO `repairorder` VALUES ('7622d971-601c-4e59-90d6-1a38f147f8d0', '1458560263257', '1458560263257', '145856026325755', '', '1458489600000', '1458489600000', '', '0', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '操你妈的逼逼', '', '3001');
INSERT INTO `repairorder` VALUES ('7a73256a-9515-4d16-ba9e-66310a60abdc', '1457583000190', '1457617513350', '145758300019100', '广东省广州市天河区犀牛东路', '1457596800000', '1457553600000', '狗屎坏了', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽啊', '18826136937', '2001');
INSERT INTO `repairorder` VALUES ('7b8fcec5-c516-4322-8659-a6daed706a41', '1457793980462', '1457794945714', '145779398046200', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '2001');
INSERT INTO `repairorder` VALUES ('7d9f1730-4c18-4f41-b64e-95f64ff76049', '1458481516716', '1458487872963', '145848151671769', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '1', '/rest/editor/file/image/20160320/20160320214514_805.jpeg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '', '', '2001');
INSERT INTO `repairorder` VALUES ('83030580-f888-4e39-8236-e8ccf1b5d2a6', '1457857732216', '1457857732216', '14578577322170401', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457798400000', '1457798400000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '2001');
INSERT INTO `repairorder` VALUES ('85b8649d-a99c-49af-bd23-172089708c15', '1458561419877', '1458561419877', '145856141987760', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458489600000', '1458489600000', '', '0', '', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '吴小金', '18826136842', '3001');
INSERT INTO `repairorder` VALUES ('85d75040-d402-4729-86cf-d1d8ef3085a0', '1457850377753', '1457866551855', '145785037775300', '-热水服务部', '1457798400000', '1457798400000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvsYO7HPvM1zqN4FggBqZ6RY', '1', '', '', '2001');
INSERT INTO `repairorder` VALUES ('899aec37-7db9-4a7d-8b49-a96d76a679e4', '1458664522391', '1458903164954', '145866452239185', '', '1458662400000', '1458662400000', '', '1', '/rest/editor/getPIC/image/def80cec32ad4685b72353fa4fe99a08.jpeg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '', '', null);
INSERT INTO `repairorder` VALUES ('91eca614-cd54-45f3-8a3d-757e9c5c5825', '1458557017293', '1458557017293', '145855701729399', '', '1458489600000', '1458489600000', '', '0', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '狗屎', '', '3001');
INSERT INTO `repairorder` VALUES ('928a4ede-dbdc-4495-a29b-f72e645d9768', '1458442759568', '1458442759568', '145844275956953', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '你看看', '', '1001');
INSERT INTO `repairorder` VALUES ('93e59082-10bc-423f-b211-320588f847ef', '1457794005668', '1457850042272', '145779400566800', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '1001');
INSERT INTO `repairorder` VALUES ('992ddad0-ecaf-42af-994a-6b5df8cf0d2f', '1458443142991', '1458443142991', '145844314299267', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '操', '', '1001');
INSERT INTO `repairorder` VALUES ('9af26c46-1dd6-48b9-a091-aedf563f78f2', '1457793985984', '1457850278021', '145779398598400', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '1001');
INSERT INTO `repairorder` VALUES ('9b1a03ff-1412-469d-93c6-368e4f1ebda3', '1458963201984', '1458973877552', '145896320198577', '广东省广州市', '1458921600000', '1458921600000', '', '1', '/rest/editor/getPIC/image/1Kwa09mghEUPEC_9ggIPQrkAhzhiv8qsso7jZoRxu1gUO_5dkcdC2-mSab0Lgzyq.jpg', 'oE4K1uJ7-eD2qTkIo51ISrgR7u4U', '1', '你是我的小屁眼', '', '2001');
INSERT INTO `repairorder` VALUES ('9c94e745-ab03-4cd5-9fa1-15d7890a0f05', '1458489243049', '1458555425355', '145848924304927', '', '1458403200000', '1458403200000', '', '4', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '操你妈逼', '183882819', '2001');
INSERT INTO `repairorder` VALUES ('a19bee0b-c9f8-4f48-b041-00e7b143d117', '1457850600669', '1457850600669', '145785060067000', '广东省广州市天河区龙洞街道广东工业大学(龙洞校区)', '1457798400000', '1457798400000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvidVT4q4ttAcYoAUxFj-IAM', null, '', '', '2001');
INSERT INTO `repairorder` VALUES ('a259c524-179b-47ed-bf45-5b3a1ead5df0', '1457533122867', '1457624497242', '7', '江佳泽', '1457427000000', '1457425380000', '江佳泽', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '2001');
INSERT INTO `repairorder` VALUES ('a33ec9d4-ca5d-4bf9-8cdd-9b11aa816749', '1458665334305', '1458903154767', '145866533430542', '', '1458662400000', '1458662400000', '', '1', '/rest/editor/getPIC/image/4bbd6b13ff354119a8530c0ed446dd0b.jpeg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '', '', null);
INSERT INTO `repairorder` VALUES ('ab64aae4-ed9e-40dc-8f6b-9762f6e2d1e8', '1457850380122', '1457866551856', '145785038012200', '-热水服务部', '1457798400000', '1457798400000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvsYO7HPvM1zqN4FggBqZ6RY', '1', '', '', '2001');
INSERT INTO `repairorder` VALUES ('ad970fa1-24bd-40c6-9b15-7b305fa7f2e1', '1458561608715', '1458561608715', '145856160871525', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458489600000', '1458489600000', '', '0', '/rest/editor/file/image/20160321/20160321195958_100.jpeg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '隐隐约约隐隐约约有', '', '2001');
INSERT INTO `repairorder` VALUES ('b3d10a19-97b2-42bc-bbf1-bb2818a79161', '1457850431385', '1457866533293', '145785043138500', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457798400000', '1457798400000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '', '', '1001');
INSERT INTO `repairorder` VALUES ('b3ecad68-f4c5-4fe9-b958-e0bda5ae7ebc', '1458963910754', '1458973877552', '145896391075561', '广东省广州市', '1458921600000', '1458921600000', '', '1', '/rest/editor/getPIC/image/xcUCutSSmTNHZRCeozYvTLOXN-OeWLS8mV7aBjOBphZMDeXF01250oUAy3V69YZH.jpg', 'oE4K1uJ7-eD2qTkIo51ISrgR7u4U', '1', '', '', '2001');
INSERT INTO `repairorder` VALUES ('bb988596-dd09-44d0-862b-7d91ab07f609', '1457793973415', '1457794993852', '145779397341600', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '1001');
INSERT INTO `repairorder` VALUES ('bddd550c-3874-4e00-838c-7a1e5203d5bb', '1458557934828', '1458557949555', '145855793482841', '', '1458489600000', '1458489600000', '', '4', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '3001');
INSERT INTO `repairorder` VALUES ('be729f45-c5a0-49ea-9223-9384358df8c6', '1458557574891', '1458557609905', '145855757489293', '', '1458489600000', '1458489600000', '', '1', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '6666', '', '2001');
INSERT INTO `repairorder` VALUES ('c1f54494-e90f-4acb-ad87-ea0bd62b0221', '1458556579482', '1458556579482', '145855657948260', '', '1458489600000', '1458489600000', '', '0', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '今天就', '', '2001');
INSERT INTO `repairorder` VALUES ('c3622647-9b23-45bd-9c16-f9ce5033e065', '1458561792543', '1458903164955', '145856179254338', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458489600000', '1458489600000', '大学的', '1', '/rest/editor/file/image/20160321/20160321200301_70.jpeg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '哈哈', '犯法', '3001');
INSERT INTO `repairorder` VALUES ('c66c727a-8533-4672-93b8-1eb5071cf2e5', '1458636590021', '1458903164954', '145863659002293', '', '1458576000000', '1458576000000', '', '1', '/rest/editor/getPIC/image/108ffc268c824d0b97709d4790d5ea5a.png', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '康4匹', '', '3001');
INSERT INTO `repairorder` VALUES ('cd60ab3f-b77a-4b06-9dd2-a3bf1682345e', '1458886271202', '1458901960867', '145888627120263', '广东省广州市', '1457737200000', '1457722800000', '', '1', '', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '', '', '2001');
INSERT INTO `repairorder` VALUES ('cd8bde65-f6ed-4f5e-bd6c-6e4f75b82c9c', '1458636230902', '1458903164954', '145863623090263', '', '1458576000000', '1458576000000', '', '1', '/rest/editor/getPIC/image/3930fe36c7534fb78b25b433177c11cc.png', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '呵呵哒', '', '2001');
INSERT INTO `repairorder` VALUES ('d6e336ff-4502-4459-a917-fe2f204c0a8a', '1458379939161', '1458379939161', '145837993916171', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458316800000', '1458316800000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '', '', '1001');
INSERT INTO `repairorder` VALUES ('de7026f8-e7a7-45a6-adda-08943f95a853', '1457793997513', '1457850278021', '145779399751300', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '1001');
INSERT INTO `repairorder` VALUES ('e0fac272-0f77-41de-a1f3-5188217a4b3e', '1458482365054', '1458487872940', '145848236505433', '广东省广州市天河区龙洞街道广东工业大学-热水服务部', '1458403200000', '1458403200000', '爽', '1', '', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '蔡鸿文', '110', '2001');
INSERT INTO `repairorder` VALUES ('e9f56273-1174-4a43-9202-fdefad5ff43e', '1458665926454', '1458903154767', '145866592645554', '', '1458662400000', '1458662400000', '', '1', '', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '', '框架', null);
INSERT INTO `repairorder` VALUES ('ec2a52bd-d107-43ff-86b2-8096732b75da', '1457850879590', '1457850879590', '145785087959000', '', '1457798400000', '1457798400000', '', '0', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvjYotyK8XMdX8PWohb545Sg', null, '', '', '1001');
INSERT INTO `repairorder` VALUES ('ee2524fb-80e9-4e23-8c29-953c4bc632cd', '1458558513736', '1458558513736', '145855851373734', 'asdf', '1458489600000', '1458489600000', 'sdf', '0', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, 'sdf', 'sdf', '2001');
INSERT INTO `repairorder` VALUES ('ef026ac5-702d-4fa1-8cba-269f097ea553', '1459060052968', '1459060052968', '145906005296847', '广东省广州市', '1459008000000', '1459008000000', '', '0', '/rest/editor/getPIC/image/XXihxUm-wHOmoNK3Rucm7LOKVals_O3QVoF3RgHH5CYZyyiMMCQV0_EPMjGtO-ix.jpg', 'oE4K1uJ7-eD2qTkIo51ISrgR7u4U', null, '啊考虑考虑', '', '3001');
INSERT INTO `repairorder` VALUES ('f1068eb7-5be4-4088-afcc-0dfe094771e4', '1458559902508', '1458559902508', '145855990250986', '将', '1458489600000', '1458489600000', '对的', '0', null, 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', null, '江佳泽', '18826136937', '2001');
INSERT INTO `repairorder` VALUES ('fa5ec929-27b0-401b-874e-2b226c24dabb', '1457793977578', '1457794993851', '145779397757800', '广东省广州市天河区龙洞街道广州市福利院职工住宅小区', '1457712000000', '1457712000000', '', '2', 'img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg', 'oQ1HdvgOqUiH8rdMPgSrleM5l8tc', '1', '江佳泽', '18826136937', '2001');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` varchar(36) NOT NULL DEFAULT '',
  `pid` varchar(36) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `iconCls` varchar(100) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `target` varchar(100) DEFAULT NULL,
  `resourcetype_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_resource_resourcetype` (`resourcetype_id`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`resourcetype_id`) REFERENCES `resourcetype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('009511cb-31d4-4240-9529-1c670f999dc5', '8154a496-3996-4419-b075-d5298fa2b07c', '维修师傅', '/order/workerManager.jsp', null, 'ext-icon-report_user', '100', null, '0');
INSERT INTO `resource` VALUES ('02ba5884-a6ec-4292-910e-a2138a30d8a0', '10eb4181-f011-4d01-88ba-ae26223e9fe4', '添加被关注回复', 'wechat.messageManager.subscribe', '被动回复', 'ext-icon-bell', '97', null, '1');
INSERT INTO `resource` VALUES ('0cde320a-d375-4f04-a3c1-42dc8236517d', 'eafcee60-8158-44e0-a0eb-e58bc0092626', '粉丝管理', '/wechat/Fans/fansManager.jsp', '关注的人', 'ext-icon-user_female', '102', '', '0');
INSERT INTO `resource` VALUES ('0d86375e-2a21-4cf3-aa00-9cabe21bdf44', 'bce346bf-2723-454d-a54d-585e87b9f7e4', '下架商品', 'shop.productManager.inactive', null, 'ext-icon-cart_error', '100', null, '1');
INSERT INTO `resource` VALUES ('0db00fe0-99f5-4591-8d39-6cc852a9d506', 'f834b158-cde3-496a-9da4-48b23cf4983e', '修改菜单', 'wechat.menuManager.update', '', 'ext-icon-clock_edit', '99', '', '1');
INSERT INTO `resource` VALUES ('0e1b8fa5-3c8a-4174-9f66-c28b3aa9faea', 'bce346bf-2723-454d-a54d-585e87b9f7e4', '添加商品', 'shop.productManager.add', null, 'ext-icon-cart_add', '99', null, '1');
INSERT INTO `resource` VALUES ('10eb4181-f011-4d01-88ba-ae26223e9fe4', 'eafcee60-8158-44e0-a0eb-e58bc0092626', '消息管理', '/wechat/Message/messageManager.jsp', '消息管理', 'ext-icon-bell', '99', '', '0');
INSERT INTO `resource` VALUES ('11937eb8-94f4-4a32-9f17-ef8f837834c8', '9fc7be1d-1af3-4a26-82c6-1747a95e148f', '客服管理', '/wechat/MultiService/serviceManager.jsp', '微信的客服功能', 'ext-icon-comments', '106', null, '0');
INSERT INTO `resource` VALUES ('13769011-db1d-4c06-822b-a6f7f7c2e906', '8154a496-3996-4419-b075-d5298fa2b07c', '评价列表', '/order/evaluationManager.jsp', null, 'ext-icon-application_view_columns', '102', null, '0');
INSERT INTO `resource` VALUES ('141021f2-2036-44d2-91c4-ff5d48cd4a2f', '009511cb-31d4-4240-9529-1c670f999dc5', '查看维修师傅', 'order.workerManager.getById', null, 'ext-icon-user_green', '100', null, '1');
INSERT INTO `resource` VALUES ('143dafbb-f2ed-459e-b4b3-c31255c715a9', 'eafcee60-8158-44e0-a0eb-e58bc0092626', '素材管理', '/wechat/Material/materialManager.jsp', '永久性素材等等', 'ext-icon-heart', '105', '', '0');
INSERT INTO `resource` VALUES ('19fecdcd-245a-44af-b5a0-5bc46bcfa1d5', '9e4e9a02-798e-4f22-a7b3-fadb6647a24a', '评价列表', '/shop/pevaluationManager.jsp', '评价列表', 'ext-icon-comments', '101', null, '0');
INSERT INTO `resource` VALUES ('1dc09534-2bb6-4450-8a1c-ccd8e33f6468', 'c3976154-1779-40f0-85c9-ce4e677f9d0d', '修改', 'news.newsManager.update', '编辑修改新闻', 'ext-icon-feed_edit', '98', null, '1');
INSERT INTO `resource` VALUES ('25c0bb68-760f-425d-8bc5-d60446fb67a5', '11937eb8-94f4-4a32-9f17-ef8f837834c8', '删除客服', 'wechat.multiserviceManager.delete', null, 'ext-icon-bell_delete', '100', null, '1');
INSERT INTO `resource` VALUES ('2bb35557-16bc-4747-a73c-24ae92c69b5b', '10eb4181-f011-4d01-88ba-ae26223e9fe4', '群发', 'system.messageManager.sendall', null, 'ext-icon-asterisk_orange', '100', null, '1');
INSERT INTO `resource` VALUES ('2dc244a0-d137-42e7-a985-9abccaaaf797', '0cde320a-d375-4f04-a3c1-42dc8236517d', '移动至分组', 'wechat.fansManager.movegroup', null, 'ext-icon-group_go', '100', null, '1');
INSERT INTO `resource` VALUES ('315915f1-837b-41e3-af72-23db7d67f5b7', '89fc90b1-a8ab-4475-b624-a5251c60e149', '查看修改订单', 'order.repairManager.getById', null, 'ext-icon-cog_add', '100', null, '1');
INSERT INTO `resource` VALUES ('42e3ac02-71dc-44e0-a492-252058b6ed8a', '89fc90b1-a8ab-4475-b624-a5251c60e149', '修改维修订单', 'order.repairManager.update', '修改某个订单的信息', 'ext-icon-cog_edit', '100', null, '1');
INSERT INTO `resource` VALUES ('4977a422-f903-4c51-bf63-be609d73bbdb', 'caaa1a68-0cf0-42c7-9285-596f90e8e4e0', '商品订单详情', 'productorder.productprderManager.getById', null, 'ext-icon-rss', '95', null, '1');
INSERT INTO `resource` VALUES ('4a2bfb80-9f1c-4c80-8add-d6bc4ebe28a5', 'f1423239-a178-4eca-bfc3-ff4553269d92', '管理商城管理员', 'shop.shopManager.manage', '管理商城管理员', 'ext-icon-vcard', '100', null, '1');
INSERT INTO `resource` VALUES ('4f7bf7eb-7918-4b2f-ac1a-712042da5589', 'c3976154-1779-40f0-85c9-ce4e677f9d0d', '新增', 'news.newsManager.add', '添加新闻', 'ext-icon-feed_add', '90', null, '1');
INSERT INTO `resource` VALUES ('554e2990-9e18-4ca4-8449-70d7d0f339d9', '009511cb-31d4-4240-9529-1c670f999dc5', '添加分组', 'order.workerManager.addGroup', null, 'ext-icon-group_add', '100', null, '1');
INSERT INTO `resource` VALUES ('5cbdcc24-b4fa-447f-9d3c-ba1fae889ef3', '009511cb-31d4-4240-9529-1c670f999dc5', '添加维修师傅', 'order.workerManager.addWorker', null, 'ext-icon-group_add', '100', null, '1');
INSERT INTO `resource` VALUES ('5eb18804-4bac-4a9f-b377-8508bc2b473c', '89fc90b1-a8ab-4475-b624-a5251c60e149', '派单', 'order.repairManager.assign', '给维修工人派单', 'ext-icon-cog_go', '100', null, '1');
INSERT INTO `resource` VALUES ('5f69c89e-aded-40c9-b16b-48d644b876b0', '10eb4181-f011-4d01-88ba-ae26223e9fe4', '关键字回复', 'wechat.messageManager.keyword', null, 'ext-icon-clock', '105', null, '1');
INSERT INTO `resource` VALUES ('6644b8e4-a29e-44bc-a64e-2871d8c07707', '009511cb-31d4-4240-9529-1c670f999dc5', '移动分组', 'order.workerManager.moveGroup', null, 'ext-icon-group_go', '100', null, '1');
INSERT INTO `resource` VALUES ('6d17189a-6870-46da-98ee-d21fcf7de7c4', '0cde320a-d375-4f04-a3c1-42dc8236517d', '删除分组', 'wechat.fansManager.groupdelete', null, 'ext-icon-user_delete', '100', null, '1');
INSERT INTO `resource` VALUES ('79f5edf1-e5e7-42f0-9c41-c3c6ed0c69f0', '11937eb8-94f4-4a32-9f17-ef8f837834c8', '添加多客服', 'wechat.multiserviceManager.add', null, 'ext-icon-bell_add', '100', null, '1');
INSERT INTO `resource` VALUES ('7bd05a00-80ed-46df-9f23-4be503ffc1fe', 'f834b158-cde3-496a-9da4-48b23cf4983e', '删除菜单', 'wechat.menuManager.delete', '', 'ext-icon-clock_delete', '100', '', '1');
INSERT INTO `resource` VALUES ('8154a496-3996-4419-b075-d5298fa2b07c', '0', '维修订单', null, null, 'ext-icon-application_cascade', '85', null, '0');
INSERT INTO `resource` VALUES ('826a6820-eeff-497f-9b15-35ec62dc6319', 'f834b158-cde3-496a-9da4-48b23cf4983e', '创建菜单', 'wechat.menuManager.creat', '增加菜单', 'ext-icon-clock_add', '97', '', '1');
INSERT INTO `resource` VALUES ('894ec6f5-fca0-4cde-9b8a-5ccb55a7e81a', '9b194c86-90f8-49b9-bdf0-fbb11f42f974', '管理新闻管理员', 'news.newsAdmin.manage', '管理新闻管理员', 'ext-icon-emoticon_tongue', '100', null, '1');
INSERT INTO `resource` VALUES ('89fc90b1-a8ab-4475-b624-a5251c60e149', '8154a496-3996-4419-b075-d5298fa2b07c', '订单列表', '/order/repairManager.jsp', null, 'ext-icon-cog', '100', null, '0');
INSERT INTO `resource` VALUES ('99de1666-8a6c-4a73-809a-cf82bbd68f0d', 'bce346bf-2723-454d-a54d-585e87b9f7e4', '修改商品', 'shop.productManager.update', null, 'ext-icon-cart_edit', '100', null, '1');
INSERT INTO `resource` VALUES ('9b194c86-90f8-49b9-bdf0-fbb11f42f974', 'd1660a6c-692a-404a-ae14-05a805ff6fd6', '新闻管理员', '/news/newAdmin.jsp', '新闻管理员', 'ext-icon-user_orange', '100', null, '0');
INSERT INTO `resource` VALUES ('9bffd4bc-0dd9-4c15-a9dd-54951de03e0f', 'caaa1a68-0cf0-42c7-9285-596f90e8e4e0', '删除商品订单', 'productorder.productprderManager.delete', '删除商品订单', 'ext-icon-coins_delete', '98', null, '1');
INSERT INTO `resource` VALUES ('9e4e9a02-798e-4f22-a7b3-fadb6647a24a', '0', '韵宅商城', null, null, 'ext-icon-coins', '87', null, '0');
INSERT INTO `resource` VALUES ('9fc7be1d-1af3-4a26-82c6-1747a95e148f', '0', '高级功能', '', '微信高级功能', 'ext-icon-coins', '99', '', '0');
INSERT INTO `resource` VALUES ('a6f90fc3-3bdc-428d-85ee-b19a4dff0b8c', 'c3976154-1779-40f0-85c9-ce4e677f9d0d', '删除', 'news.newsManager.delete', '删除新闻', 'ext-icon-feed_delete', '97', null, '1');
INSERT INTO `resource` VALUES ('b1e54779-76a3-4309-a419-2414d5e9be42', '009511cb-31d4-4240-9529-1c670f999dc5', '修改维修师傅信息', 'order.workerManager.update', null, 'ext-icon-user_edit', '100', null, '1');
INSERT INTO `resource` VALUES ('b8d7d0a6-8463-46cd-b45a-3ec7df570fd5', '89fc90b1-a8ab-4475-b624-a5251c60e149', '取消维修订单', 'order.repairManager.cancel', null, 'ext-icon-cog_delete', '104', null, '1');
INSERT INTO `resource` VALUES ('b943edd8-32e7-4f33-8473-604ddbf3dee6', 'bce346bf-2723-454d-a54d-585e87b9f7e4', '删除商品', 'shop.productManager.delete', null, 'ext-icon-cart_delete', '100', null, '1');
INSERT INTO `resource` VALUES ('bce346bf-2723-454d-a54d-585e87b9f7e4', '9e4e9a02-798e-4f22-a7b3-fadb6647a24a', '商品管理', '/shop/productManager.jsp', null, 'ext-icon-cart', '88', null, '0');
INSERT INTO `resource` VALUES ('c09379a8-0571-490a-bc89-23975c3b288d', '0cde320a-d375-4f04-a3c1-42dc8236517d', '初始化粉丝列表', 'wechat.fansManager.init', null, 'ext-icon-cake', '100', null, '1');
INSERT INTO `resource` VALUES ('c3976154-1779-40f0-85c9-ce4e677f9d0d', 'd1660a6c-692a-404a-ae14-05a805ff6fd6', '新闻管理', '/news/newsManager.jsp', '新闻管理，管理新闻的增删改', 'ext-icon-monitor', '100', null, '0');
INSERT INTO `resource` VALUES ('caaa1a68-0cf0-42c7-9285-596f90e8e4e0', '9e4e9a02-798e-4f22-a7b3-fadb6647a24a', '商品订单', '/shop/productorderManager.jsp', '商品的订单管理页面', 'ext-icon-color_wheel', '100', null, '0');
INSERT INTO `resource` VALUES ('d1660a6c-692a-404a-ae14-05a805ff6fd6', '0', '新闻中心', null, '新闻中心', 'ext-icon-transmit', '102', null, '0');
INSERT INTO `resource` VALUES ('d6042d00-efd5-4858-889b-3cfc475a58cf', '0cde320a-d375-4f04-a3c1-42dc8236517d', '发送消息', 'wechat.fansManager.sendmsg', null, 'ext-icon-comment', '100', null, '1');
INSERT INTO `resource` VALUES ('e064d917-2dbb-425a-a91a-2a92a856c251', '0cde320a-d375-4f04-a3c1-42dc8236517d', '设置备注', 'wechat.fansManager.remark', null, 'ext-icon-book_edit', '100', null, '1');
INSERT INTO `resource` VALUES ('e8182900-107c-421c-bc24-967a8e70669a', '0cde320a-d375-4f04-a3c1-42dc8236517d', '修改分组名', 'wechat.fansManager.groupupdate', null, 'ext-icon-group_edit', '100', null, '1');
INSERT INTO `resource` VALUES ('ea428e9d-f17a-4757-989d-5602c692e67f', '0cde320a-d375-4f04-a3c1-42dc8236517d', '创建分组', 'wechat.fansManager.groupcreat', null, 'ext-icon-group_add', '100', null, '1');
INSERT INTO `resource` VALUES ('eafcee60-8158-44e0-a0eb-e58bc0092626', '0', '基础功能', '', '微信基础功能，消息管理，粉丝管理，关键字，菜单', 'ext-icon-asterisk_orange', '98', '', '0');
INSERT INTO `resource` VALUES ('f11bc034-57f4-45bb-8475-67e82d87f1ff', 'caaa1a68-0cf0-42c7-9285-596f90e8e4e0', '订单发货', 'productorder.productOrderManager.delivery', '订单发货', 'ext-icon-anchor', '97', null, '1');
INSERT INTO `resource` VALUES ('f1423239-a178-4eca-bfc3-ff4553269d92', '9e4e9a02-798e-4f22-a7b3-fadb6647a24a', '商城管理员', '/shop/shopManager.jsp', '商城管理员', 'ext-icon-user_gray', '84', null, '0');
INSERT INTO `resource` VALUES ('f24d77b2-7226-4bdc-88d8-b3ab6001ab17', '11937eb8-94f4-4a32-9f17-ef8f837834c8', '更新客服', 'wechat.multiserviceManager.update', null, 'ext-icon-bell_error', '100', null, '1');
INSERT INTO `resource` VALUES ('f56535d3-0156-468d-95b5-679f721e4c18', 'caaa1a68-0cf0-42c7-9285-596f90e8e4e0', '修改订单信息', 'productorder.productprderManager.update', '修改订单信息', 'ext-icon-comment_edit', '98', null, '1');
INSERT INTO `resource` VALUES ('f834b158-cde3-496a-9da4-48b23cf4983e', 'eafcee60-8158-44e0-a0eb-e58bc0092626', '自定义菜单', '/wechat/Menu/menuManager.jsp', '微信自定义菜单', 'ext-icon-clock_red', '100', '', '0');
INSERT INTO `resource` VALUES ('grzx', '0', '个人中心', '/wechat/personManager.jsp', '个人中心', 'ext-icon-user', '99', '', '0');
INSERT INTO `resource` VALUES ('jsgl', 'xtgl', '角色管理', '/system/roleManager.jsp', '角色管理，这里主要是添加角色，设置某个角色拥有什么权限', 'ext-icon-group_key', '2', '', '0');
INSERT INTO `resource` VALUES ('jsgl_delete', 'jsgl', '删除角色', 'system.roleManager.delete', '删除角色', 'ext-icon-group_delete', '100', '', '1');
INSERT INTO `resource` VALUES ('jsgl_new', 'jsgl', '新建角色', 'system.roleManager.save', '新建角色', 'ext-icon-group_add', '100', '', '1');
INSERT INTO `resource` VALUES ('jsgl_query', 'jsgl', '查看角色', 'system.roleManager.getById', '查看角色', 'ext-icon-group', '100', '', '1');
INSERT INTO `resource` VALUES ('jsgl_resource', 'jsgl', '设置资源', 'system.roleManager.grant', '设置资源', 'ext-icon-group_link', '100', null, '1');
INSERT INTO `resource` VALUES ('jsgl_update', 'jsgl', '编辑角色', 'system.roleManager.update', '编辑角色', 'ext-icon-group_edit', '100', '', '1');
INSERT INTO `resource` VALUES ('xtgl', '0', '系统管理', '', '系统管理模块', 'ext-icon-monitor', '1', '', '0');
INSERT INTO `resource` VALUES ('yhgl', 'xtgl', '用户管理', '/system/userManager.jsp', '用户管理，即所有的员工，也是系统的所有用户', 'ext-icon-user', '1', '', '0');
INSERT INTO `resource` VALUES ('yhgl_free', 'yhgl', '冻结/激活用户', 'system.userManager.active', '冻结/激活用户', 'ext-icon-user_go', '100', '', '1');
INSERT INTO `resource` VALUES ('yhgl_new', 'yhgl', '新建用户', 'system.userManager.save', '新建用户', 'ext-icon-user_add', '100', null, '1');
INSERT INTO `resource` VALUES ('yhgl_query', 'yhgl', '查看用户详情', 'system.userManager.getById', '查看用户详情', 'ext-icon-user_suit', '100', '', '1');
INSERT INTO `resource` VALUES ('yhgl_role', 'yhgl', '设置角色', 'system.userManager.grantRole', '设置角色', 'ext-icon-group', '100', '', '1');
INSERT INTO `resource` VALUES ('yhgl_update', 'yhgl', '编辑用户', 'system.userManager.update', '编辑用户', 'ext-icon-user_edit', '100', '', '1');
INSERT INTO `resource` VALUES ('zygl', 'xtgl', '资源管理', '/system/resourceManager.jsp', '资源管理，即有哪些菜单即权限', 'ext-icon-application_view_detail', '3', '', '0');
INSERT INTO `resource` VALUES ('zygl_delete', 'zygl', '删除资源', 'system.resourceManager.delete', '删除资源', 'ext-icon-plugin_delete', '100', '', '1');
INSERT INTO `resource` VALUES ('zygl_new', 'zygl', '新建资源', 'system.resourceManager.save', '新建资源', 'ext-icon-plugin_add', '100', '', '1');
INSERT INTO `resource` VALUES ('zygl_query', 'zygl', '查看资源详情', 'system.resourceManager.getById', '查看资源详情', 'ext-icon-plugin', '100', '', '1');
INSERT INTO `resource` VALUES ('zygl_update', 'zygl', '编辑资源', 'system.resourceManager.update', '编辑资源', 'ext-icon-plugin_edit', '100', '', '1');

-- ----------------------------
-- Table structure for `resourcetype`
-- ----------------------------
DROP TABLE IF EXISTS `resourcetype`;
CREATE TABLE `resourcetype` (
  `id` varchar(36) NOT NULL DEFAULT '',
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resourcetype
-- ----------------------------
INSERT INTO `resourcetype` VALUES ('0', '菜单', '菜单类型会显示在系统首页左侧菜单中');
INSERT INTO `resourcetype` VALUES ('1', '功能', '功能类型不会显示在系统首页左侧菜单中');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(36) NOT NULL DEFAULT '',
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('-1', '超级管理员', '用户所有权限。。。', '1', '1');
INSERT INTO `role` VALUES ('9e50563e-c1f1-41a0-8173-c557be9a6e5b', '用户管理员', '管理员工等等', '100', '0');
INSERT INTO `role` VALUES ('cda54e35-5f8c-4b30-a51e-d4d6efc90438', '维修师傅', '维修人员', '97', '0');
INSERT INTO `role` VALUES ('e1e0424c-f173-416a-a892-0c71909ad007', '维修订单管理员', '管理维修订单，派单那些东西', '100', '0');
INSERT INTO `role` VALUES ('shangchengguanliyuan', '商城管理员', '管理商城的商品以及订单', '88', '0');
INSERT INTO `role` VALUES ('xinwenguanliyuan', '新闻管理员', '新闻管理员，新闻的怎删改查', '77', '0');

-- ----------------------------
-- Table structure for `role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `role_id` varchar(36) NOT NULL DEFAULT '',
  `resource_id` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`resource_id`,`role_id`),
  KEY `fk_role_resource_roleid` (`role_id`),
  CONSTRAINT `role_resource_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `role_resource_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('-1', '009511cb-31d4-4240-9529-1c670f999dc5');
INSERT INTO `role_resource` VALUES ('-1', '0d86375e-2a21-4cf3-aa00-9cabe21bdf44');
INSERT INTO `role_resource` VALUES ('-1', '0db00fe0-99f5-4591-8d39-6cc852a9d506');
INSERT INTO `role_resource` VALUES ('-1', '0e1b8fa5-3c8a-4174-9f66-c28b3aa9faea');
INSERT INTO `role_resource` VALUES ('-1', '13769011-db1d-4c06-822b-a6f7f7c2e906');
INSERT INTO `role_resource` VALUES ('-1', '141021f2-2036-44d2-91c4-ff5d48cd4a2f');
INSERT INTO `role_resource` VALUES ('-1', '19fecdcd-245a-44af-b5a0-5bc46bcfa1d5');
INSERT INTO `role_resource` VALUES ('-1', '1dc09534-2bb6-4450-8a1c-ccd8e33f6468');
INSERT INTO `role_resource` VALUES ('-1', '315915f1-837b-41e3-af72-23db7d67f5b7');
INSERT INTO `role_resource` VALUES ('-1', '42e3ac02-71dc-44e0-a492-252058b6ed8a');
INSERT INTO `role_resource` VALUES ('-1', '4977a422-f903-4c51-bf63-be609d73bbdb');
INSERT INTO `role_resource` VALUES ('-1', '4a2bfb80-9f1c-4c80-8add-d6bc4ebe28a5');
INSERT INTO `role_resource` VALUES ('-1', '4f7bf7eb-7918-4b2f-ac1a-712042da5589');
INSERT INTO `role_resource` VALUES ('-1', '554e2990-9e18-4ca4-8449-70d7d0f339d9');
INSERT INTO `role_resource` VALUES ('-1', '5cbdcc24-b4fa-447f-9d3c-ba1fae889ef3');
INSERT INTO `role_resource` VALUES ('-1', '5eb18804-4bac-4a9f-b377-8508bc2b473c');
INSERT INTO `role_resource` VALUES ('-1', '6644b8e4-a29e-44bc-a64e-2871d8c07707');
INSERT INTO `role_resource` VALUES ('-1', '7bd05a00-80ed-46df-9f23-4be503ffc1fe');
INSERT INTO `role_resource` VALUES ('-1', '8154a496-3996-4419-b075-d5298fa2b07c');
INSERT INTO `role_resource` VALUES ('-1', '826a6820-eeff-497f-9b15-35ec62dc6319');
INSERT INTO `role_resource` VALUES ('-1', '894ec6f5-fca0-4cde-9b8a-5ccb55a7e81a');
INSERT INTO `role_resource` VALUES ('-1', '89fc90b1-a8ab-4475-b624-a5251c60e149');
INSERT INTO `role_resource` VALUES ('-1', '99de1666-8a6c-4a73-809a-cf82bbd68f0d');
INSERT INTO `role_resource` VALUES ('-1', '9b194c86-90f8-49b9-bdf0-fbb11f42f974');
INSERT INTO `role_resource` VALUES ('-1', '9bffd4bc-0dd9-4c15-a9dd-54951de03e0f');
INSERT INTO `role_resource` VALUES ('-1', '9e4e9a02-798e-4f22-a7b3-fadb6647a24a');
INSERT INTO `role_resource` VALUES ('-1', 'a6f90fc3-3bdc-428d-85ee-b19a4dff0b8c');
INSERT INTO `role_resource` VALUES ('-1', 'b1e54779-76a3-4309-a419-2414d5e9be42');
INSERT INTO `role_resource` VALUES ('-1', 'b8d7d0a6-8463-46cd-b45a-3ec7df570fd5');
INSERT INTO `role_resource` VALUES ('-1', 'b943edd8-32e7-4f33-8473-604ddbf3dee6');
INSERT INTO `role_resource` VALUES ('-1', 'bce346bf-2723-454d-a54d-585e87b9f7e4');
INSERT INTO `role_resource` VALUES ('-1', 'c3976154-1779-40f0-85c9-ce4e677f9d0d');
INSERT INTO `role_resource` VALUES ('-1', 'caaa1a68-0cf0-42c7-9285-596f90e8e4e0');
INSERT INTO `role_resource` VALUES ('-1', 'd1660a6c-692a-404a-ae14-05a805ff6fd6');
INSERT INTO `role_resource` VALUES ('-1', 'eafcee60-8158-44e0-a0eb-e58bc0092626');
INSERT INTO `role_resource` VALUES ('-1', 'f11bc034-57f4-45bb-8475-67e82d87f1ff');
INSERT INTO `role_resource` VALUES ('-1', 'f1423239-a178-4eca-bfc3-ff4553269d92');
INSERT INTO `role_resource` VALUES ('-1', 'f56535d3-0156-468d-95b5-679f721e4c18');
INSERT INTO `role_resource` VALUES ('-1', 'f834b158-cde3-496a-9da4-48b23cf4983e');
INSERT INTO `role_resource` VALUES ('-1', 'grzx');
INSERT INTO `role_resource` VALUES ('-1', 'jsgl');
INSERT INTO `role_resource` VALUES ('-1', 'jsgl_delete');
INSERT INTO `role_resource` VALUES ('-1', 'jsgl_new');
INSERT INTO `role_resource` VALUES ('-1', 'jsgl_query');
INSERT INTO `role_resource` VALUES ('-1', 'jsgl_resource');
INSERT INTO `role_resource` VALUES ('-1', 'jsgl_update');
INSERT INTO `role_resource` VALUES ('-1', 'xtgl');
INSERT INTO `role_resource` VALUES ('-1', 'yhgl');
INSERT INTO `role_resource` VALUES ('-1', 'yhgl_free');
INSERT INTO `role_resource` VALUES ('-1', 'yhgl_new');
INSERT INTO `role_resource` VALUES ('-1', 'yhgl_query');
INSERT INTO `role_resource` VALUES ('-1', 'yhgl_role');
INSERT INTO `role_resource` VALUES ('-1', 'yhgl_update');
INSERT INTO `role_resource` VALUES ('-1', 'zygl');
INSERT INTO `role_resource` VALUES ('-1', 'zygl_delete');
INSERT INTO `role_resource` VALUES ('-1', 'zygl_new');
INSERT INTO `role_resource` VALUES ('-1', 'zygl_query');
INSERT INTO `role_resource` VALUES ('-1', 'zygl_update');
INSERT INTO `role_resource` VALUES ('9e50563e-c1f1-41a0-8173-c557be9a6e5b', 'xtgl');
INSERT INTO `role_resource` VALUES ('9e50563e-c1f1-41a0-8173-c557be9a6e5b', 'yhgl');
INSERT INTO `role_resource` VALUES ('9e50563e-c1f1-41a0-8173-c557be9a6e5b', 'yhgl_free');
INSERT INTO `role_resource` VALUES ('9e50563e-c1f1-41a0-8173-c557be9a6e5b', 'yhgl_new');
INSERT INTO `role_resource` VALUES ('9e50563e-c1f1-41a0-8173-c557be9a6e5b', 'yhgl_query');
INSERT INTO `role_resource` VALUES ('9e50563e-c1f1-41a0-8173-c557be9a6e5b', 'yhgl_role');
INSERT INTO `role_resource` VALUES ('9e50563e-c1f1-41a0-8173-c557be9a6e5b', 'yhgl_update');
INSERT INTO `role_resource` VALUES ('e1e0424c-f173-416a-a892-0c71909ad007', '315915f1-837b-41e3-af72-23db7d67f5b7');
INSERT INTO `role_resource` VALUES ('e1e0424c-f173-416a-a892-0c71909ad007', '42e3ac02-71dc-44e0-a492-252058b6ed8a');
INSERT INTO `role_resource` VALUES ('e1e0424c-f173-416a-a892-0c71909ad007', '5eb18804-4bac-4a9f-b377-8508bc2b473c');
INSERT INTO `role_resource` VALUES ('e1e0424c-f173-416a-a892-0c71909ad007', '8154a496-3996-4419-b075-d5298fa2b07c');
INSERT INTO `role_resource` VALUES ('e1e0424c-f173-416a-a892-0c71909ad007', '89fc90b1-a8ab-4475-b624-a5251c60e149');
INSERT INTO `role_resource` VALUES ('e1e0424c-f173-416a-a892-0c71909ad007', 'b8d7d0a6-8463-46cd-b45a-3ec7df570fd5');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', '0d86375e-2a21-4cf3-aa00-9cabe21bdf44');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', '0e1b8fa5-3c8a-4174-9f66-c28b3aa9faea');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', '19fecdcd-245a-44af-b5a0-5bc46bcfa1d5');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', '4977a422-f903-4c51-bf63-be609d73bbdb');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', '99de1666-8a6c-4a73-809a-cf82bbd68f0d');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', '9bffd4bc-0dd9-4c15-a9dd-54951de03e0f');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', '9e4e9a02-798e-4f22-a7b3-fadb6647a24a');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', 'b943edd8-32e7-4f33-8473-604ddbf3dee6');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', 'bce346bf-2723-454d-a54d-585e87b9f7e4');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', 'caaa1a68-0cf0-42c7-9285-596f90e8e4e0');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', 'f11bc034-57f4-45bb-8475-67e82d87f1ff');
INSERT INTO `role_resource` VALUES ('shangchengguanliyuan', 'f56535d3-0156-468d-95b5-679f721e4c18');
INSERT INTO `role_resource` VALUES ('xinwenguanliyuan', '1dc09534-2bb6-4450-8a1c-ccd8e33f6468');
INSERT INTO `role_resource` VALUES ('xinwenguanliyuan', '4f7bf7eb-7918-4b2f-ac1a-712042da5589');
INSERT INTO `role_resource` VALUES ('xinwenguanliyuan', 'a6f90fc3-3bdc-428d-85ee-b19a4dff0b8c');
INSERT INTO `role_resource` VALUES ('xinwenguanliyuan', 'c3976154-1779-40f0-85c9-ce4e677f9d0d');
INSERT INTO `role_resource` VALUES ('xinwenguanliyuan', 'd1660a6c-692a-404a-ae14-05a805ff6fd6');

-- ----------------------------
-- Table structure for `role_user`
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_id` varchar(36) NOT NULL DEFAULT '',
  `user_id` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_user_roleid` (`role_id`),
  CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('-1', '-1');
INSERT INTO `role_user` VALUES ('cda54e35-5f8c-4b30-a51e-d4d6efc90438', '1');

-- ----------------------------
-- Table structure for `shipinfo`
-- ----------------------------
DROP TABLE IF EXISTS `shipinfo`;
CREATE TABLE `shipinfo` (
  `id` varchar(64) NOT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `shipArea` varchar(255) DEFAULT NULL,
  `shipStreet` varchar(255) DEFAULT NULL,
  `shipAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipinfo
-- ----------------------------
INSERT INTO `shipinfo` VALUES ('6d4389cf614e40139ebc132e7acbef3f', '510520', '18826137274', '蔡鸿文', '天河区', '龙洞街道广东工业大学', '广东省');
INSERT INTO `shipinfo` VALUES ('d8283ece0431408b86f4a9687e50e5af', '510520', '18826137274', '蔡鸿文', '天河区', '龙洞街道广东工业大学', '广东省');
INSERT INTO `shipinfo` VALUES ('f0bd8a440b87443ea38cc0a3f06771d1', '510520', '18826137274', '蔡鸿文', '天河区', '龙洞街道广东工业大学', '广东省');

-- ----------------------------
-- Table structure for `shippercoding`
-- ----------------------------
DROP TABLE IF EXISTS `shippercoding`;
CREATE TABLE `shippercoding` (
  `shipperCode` varchar(30) NOT NULL,
  `shipperName` varchar(30) NOT NULL,
  PRIMARY KEY (`shipperCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shippercoding
-- ----------------------------
INSERT INTO `shippercoding` VALUES ('7TLSWL', '7天连锁物流');
INSERT INTO `shippercoding` VALUES ('AJ', '安捷快递');
INSERT INTO `shippercoding` VALUES ('ANE', '安能物流');
INSERT INTO `shippercoding` VALUES ('AXD', '安信达快递');
INSERT INTO `shippercoding` VALUES ('BALUNZHI', '巴伦支快递');
INSERT INTO `shippercoding` VALUES ('BFDF', '百福东方');
INSERT INTO `shippercoding` VALUES ('BKWL', '宝凯物流');
INSERT INTO `shippercoding` VALUES ('BQXHM', '北青小红帽');
INSERT INTO `shippercoding` VALUES ('BSWL', '邦送物流');
INSERT INTO `shippercoding` VALUES ('BTWL', '百世物流');
INSERT INTO `shippercoding` VALUES ('CCES', 'CCES快递');
INSERT INTO `shippercoding` VALUES ('CITY100', '城市100');
INSERT INTO `shippercoding` VALUES ('COE', 'COE东方快递');
INSERT INTO `shippercoding` VALUES ('CSCY', '长沙创一');
INSERT INTO `shippercoding` VALUES ('CXWL', '传喜物流');
INSERT INTO `shippercoding` VALUES ('DBL', '德邦');
INSERT INTO `shippercoding` VALUES ('DCWL', '德创物流');
INSERT INTO `shippercoding` VALUES ('DHWL', '东红物流');
INSERT INTO `shippercoding` VALUES ('DSWL', 'D速物流');
INSERT INTO `shippercoding` VALUES ('DTKD', '店通快递');
INSERT INTO `shippercoding` VALUES ('DTWL', '大田物流');
INSERT INTO `shippercoding` VALUES ('DYWL', '大洋物流快递');
INSERT INTO `shippercoding` VALUES ('EMS', 'EMS');
INSERT INTO `shippercoding` VALUES ('FAST', '快捷速递');
INSERT INTO `shippercoding` VALUES ('FBKD', '飞豹快递');
INSERT INTO `shippercoding` VALUES ('FEDEX', 'FedEx联邦快递');
INSERT INTO `shippercoding` VALUES ('FHKD', '飞狐快递');
INSERT INTO `shippercoding` VALUES ('FKD', '飞康达');
INSERT INTO `shippercoding` VALUES ('FYPS', '飞远配送');
INSERT INTO `shippercoding` VALUES ('FYSD', '凡宇速递');
INSERT INTO `shippercoding` VALUES ('GDEMS', '广东邮政');
INSERT INTO `shippercoding` VALUES ('GDKD', '冠达快递');
INSERT INTO `shippercoding` VALUES ('GHX', '挂号信');
INSERT INTO `shippercoding` VALUES ('GKSD', '港快速递');
INSERT INTO `shippercoding` VALUES ('GSD', '共速达');
INSERT INTO `shippercoding` VALUES ('GTKD', '广通速递');
INSERT INTO `shippercoding` VALUES ('GTO', '国通快递');
INSERT INTO `shippercoding` VALUES ('GTSD', '高铁速递');
INSERT INTO `shippercoding` VALUES ('HBJH', '河北建华');
INSERT INTO `shippercoding` VALUES ('HFWL', '汇丰物流');
INSERT INTO `shippercoding` VALUES ('HHKD', '华航快递');
INSERT INTO `shippercoding` VALUES ('HHTT', '天天快递');
INSERT INTO `shippercoding` VALUES ('HLKD', '韩润物流');
INSERT INTO `shippercoding` VALUES ('HLWL', '恒路物流');
INSERT INTO `shippercoding` VALUES ('HMJKD', '黄马甲快递');
INSERT INTO `shippercoding` VALUES ('HMSD', '海盟速递');
INSERT INTO `shippercoding` VALUES ('HOAU', '天地华宇');
INSERT INTO `shippercoding` VALUES ('hq568', '华强物流');
INSERT INTO `shippercoding` VALUES ('HQKY', '华企快运');
INSERT INTO `shippercoding` VALUES ('HSWL', '昊盛物流');
INSERT INTO `shippercoding` VALUES ('HTKY', '百世汇通');
INSERT INTO `shippercoding` VALUES ('HTWL', '户通物流');
INSERT INTO `shippercoding` VALUES ('HXLWL', '华夏龙物流');
INSERT INTO `shippercoding` VALUES ('HYLSD', '好来运快递');
INSERT INTO `shippercoding` VALUES ('JD', '京东快递');
INSERT INTO `shippercoding` VALUES ('JGSD', '京广速递');
INSERT INTO `shippercoding` VALUES ('JIUYE', '九曳供应链');
INSERT INTO `shippercoding` VALUES ('JJKY', '佳吉快运');
INSERT INTO `shippercoding` VALUES ('JLDT', '嘉里大通');
INSERT INTO `shippercoding` VALUES ('JTKD', '捷特快递');
INSERT INTO `shippercoding` VALUES ('JXD', '急先达');
INSERT INTO `shippercoding` VALUES ('JYKD', '晋越快递');
INSERT INTO `shippercoding` VALUES ('JYM', '加运美');
INSERT INTO `shippercoding` VALUES ('JYSD', '久易快递');
INSERT INTO `shippercoding` VALUES ('JYWL', '佳怡物流');
INSERT INTO `shippercoding` VALUES ('KLWL', '康力物流');
INSERT INTO `shippercoding` VALUES ('KTKD', '快淘快递');
INSERT INTO `shippercoding` VALUES ('KYDSD', '快优达速递');
INSERT INTO `shippercoding` VALUES ('KYWL', '跨越速递');
INSERT INTO `shippercoding` VALUES ('LB', '龙邦快递');
INSERT INTO `shippercoding` VALUES ('LBKD', '联邦快递');
INSERT INTO `shippercoding` VALUES ('LHKD', '蓝弧快递');
INSERT INTO `shippercoding` VALUES ('LHT', '联昊通速递');
INSERT INTO `shippercoding` VALUES ('LJD', '乐捷递');
INSERT INTO `shippercoding` VALUES ('LJS', '立即送');
INSERT INTO `shippercoding` VALUES ('MB', '民邦速递');
INSERT INTO `shippercoding` VALUES ('MDM', '门对门');
INSERT INTO `shippercoding` VALUES ('MHKD', '民航快递');
INSERT INTO `shippercoding` VALUES ('MLWL', '明亮物流');
INSERT INTO `shippercoding` VALUES ('MSKD', '闽盛快递');
INSERT INTO `shippercoding` VALUES ('NEDA', '能达速递');
INSERT INTO `shippercoding` VALUES ('NJSBWL', '南京晟邦物流');
INSERT INTO `shippercoding` VALUES ('PADTF', '平安达腾飞快递');
INSERT INTO `shippercoding` VALUES ('PXWL', '陪行物流');
INSERT INTO `shippercoding` VALUES ('QCKD', '全晨快递');
INSERT INTO `shippercoding` VALUES ('QFKD', '全峰快递');
INSERT INTO `shippercoding` VALUES ('QRT', '全日通快递');
INSERT INTO `shippercoding` VALUES ('RFD', '如风达');
INSERT INTO `shippercoding` VALUES ('RLWL', '日昱物流');
INSERT INTO `shippercoding` VALUES ('SAD', '赛澳递');
INSERT INTO `shippercoding` VALUES ('SAWL', '圣安物流');
INSERT INTO `shippercoding` VALUES ('SBWL', '盛邦物流');
INSERT INTO `shippercoding` VALUES ('SDHH', '山东海红');
INSERT INTO `shippercoding` VALUES ('SDWL', '上大物流');
INSERT INTO `shippercoding` VALUES ('SF', '顺丰快递');
INSERT INTO `shippercoding` VALUES ('SFWL', '盛丰物流');
INSERT INTO `shippercoding` VALUES ('SHLDHY', '上海林道货运');
INSERT INTO `shippercoding` VALUES ('SHWL', '盛辉物流');
INSERT INTO `shippercoding` VALUES ('SJWL', '穗佳物流');
INSERT INTO `shippercoding` VALUES ('ST', '速通物流');
INSERT INTO `shippercoding` VALUES ('STO', '申通快递');
INSERT INTO `shippercoding` VALUES ('STSD', '三态速递');
INSERT INTO `shippercoding` VALUES ('SURE', '速尔快递');
INSERT INTO `shippercoding` VALUES ('SXHMJ', '山西红马甲');
INSERT INTO `shippercoding` VALUES ('SYJHE', '沈阳佳惠尔');
INSERT INTO `shippercoding` VALUES ('SYKD', '世运快递');
INSERT INTO `shippercoding` VALUES ('THTX', '通和天下');
INSERT INTO `shippercoding` VALUES ('TSSTO', '唐山申通');
INSERT INTO `shippercoding` VALUES ('UAPEX', '全一快递');
INSERT INTO `shippercoding` VALUES ('UC', '优速快递');
INSERT INTO `shippercoding` VALUES ('WJWL', '万家物流');
INSERT INTO `shippercoding` VALUES ('WTP', '微特派');
INSERT INTO `shippercoding` VALUES ('WXWL', '万象物流');
INSERT INTO `shippercoding` VALUES ('XBWL', '新邦物流');
INSERT INTO `shippercoding` VALUES ('XFEX', '信丰快递');
INSERT INTO `shippercoding` VALUES ('XGYZ', '香港邮政');
INSERT INTO `shippercoding` VALUES ('XLYT', '祥龙运通');
INSERT INTO `shippercoding` VALUES ('XYT', '希优特');
INSERT INTO `shippercoding` VALUES ('YADEX', '源安达快递');
INSERT INTO `shippercoding` VALUES ('YBJ', '邮必佳');
INSERT INTO `shippercoding` VALUES ('YCWL', '远成物流');
INSERT INTO `shippercoding` VALUES ('YD', '韵达快递');
INSERT INTO `shippercoding` VALUES ('YDH', '义达国际物流');
INSERT INTO `shippercoding` VALUES ('YFEX', '越丰物流');
INSERT INTO `shippercoding` VALUES ('YFHEX', '原飞航物流');
INSERT INTO `shippercoding` VALUES ('YFSD', '亚风快递');
INSERT INTO `shippercoding` VALUES ('YJSD', '银捷速递');
INSERT INTO `shippercoding` VALUES ('YLSY', '亿领速运');
INSERT INTO `shippercoding` VALUES ('YMWL', '英脉物流');
INSERT INTO `shippercoding` VALUES ('YSH', '亿顺航');
INSERT INTO `shippercoding` VALUES ('YSKY', '音素快运');
INSERT INTO `shippercoding` VALUES ('YTD', '易通达');
INSERT INTO `shippercoding` VALUES ('YTFH', '一统飞鸿');
INSERT INTO `shippercoding` VALUES ('YTKD', '运通快递');
INSERT INTO `shippercoding` VALUES ('YTO', '圆通速递');
INSERT INTO `shippercoding` VALUES ('YXWL', '宇鑫物流');
INSERT INTO `shippercoding` VALUES ('YZPY', '邮政平邮/小包');
INSERT INTO `shippercoding` VALUES ('ZENY', '增益快递');
INSERT INTO `shippercoding` VALUES ('ZHQKD', '汇强快递');
INSERT INTO `shippercoding` VALUES ('ZJS', '宅急送');
INSERT INTO `shippercoding` VALUES ('ZMKM', '芝麻开门');
INSERT INTO `shippercoding` VALUES ('ZRSD', '中睿速递');
INSERT INTO `shippercoding` VALUES ('ZTE', '众通快递');
INSERT INTO `shippercoding` VALUES ('ZTKY', '中铁快运');
INSERT INTO `shippercoding` VALUES ('ZTO', '中通速递');
INSERT INTO `shippercoding` VALUES ('ZTWL', '中铁物流');
INSERT INTO `shippercoding` VALUES ('ZTWY', '中天万运');
INSERT INTO `shippercoding` VALUES ('ZWYSD', '中外运速递');
INSERT INTO `shippercoding` VALUES ('ZYWL', '中邮物流');
INSERT INTO `shippercoding` VALUES ('ZZJH', '郑州建华');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(36) NOT NULL DEFAULT '',
  `loginname` varchar(30) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `sex` varchar(3) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `active` varchar(1) NOT NULL DEFAULT '1',
  `groupid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_worker_groupid` (`groupid`),
  CONSTRAINT `fk_worker_groupid` FOREIGN KEY (`groupid`) REFERENCES `workergroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('-1', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', '管理员', '1', '0283566c83ad4d23994d453f77505090.jpg', '1', null);
INSERT INTO `user` VALUES ('1', '18826136937', 'c4ca4238a0b923820dcc509a6f75849b', '江佳泽', '1', '0283566c83ad4d23994d453f77505090.jpg', '1', '1');

-- ----------------------------
-- Table structure for `workergroup`
-- ----------------------------
DROP TABLE IF EXISTS `workergroup`;
CREATE TABLE `workergroup` (
  `id` varchar(32) NOT NULL,
  `groupname` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workergroup
-- ----------------------------
INSERT INTO `workergroup` VALUES ('1', '天河区');
INSERT INTO `workergroup` VALUES ('2', '白云区');
