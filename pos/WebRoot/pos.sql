/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : pos

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2014-01-01 22:01:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `publishTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('55', '1', 'my factory', 'welcome to my country', '2013-06-18 15:24:48');
INSERT INTO `article` VALUES ('56', '1', '维护', 'you are so kind', '2013-06-18 15:24:50');
INSERT INTO `article` VALUES ('58', '1', 'd7u7', 'dd7u7u', '2013-11-05 14:31:51');
INSERT INTO `article` VALUES ('59', '1', 'dyy', 'yy', '2013-11-05 14:31:40');
INSERT INTO `article` VALUES ('61', '2', 'tt', 'tt', '2013-11-05 14:41:03');
INSERT INTO `article` VALUES ('62', '2', 'uu', 'uu', '2013-11-05 14:41:29');
INSERT INTO `article` VALUES ('63', '2', '66', '66', '2013-11-05 14:42:13');
INSERT INTO `article` VALUES ('64', '1', 'a', 'a', '2013-11-05 14:52:04');
INSERT INTO `article` VALUES ('65', '3', 'h', 'h', '2013-11-05 14:56:30');

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channelName` varchar(50) DEFAULT NULL,
  `tradeTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tradeType` varchar(10) DEFAULT NULL,
  `tradeMoney` varchar(10) DEFAULT NULL,
  `transaction` varchar(10) DEFAULT NULL,
  `conveyancing` varchar(10) DEFAULT NULL,
  `accountBalance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('2', '7', '2013-11-08 15:56:15', '7', '7', '7', '7', '7');
INSERT INTO `bill` VALUES ('4', '0', '2013-11-08 15:54:21', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `action` varchar(30) DEFAULT NULL,
  `actionTime` varchar(30) DEFAULT NULL,
  `userIP` varchar(30) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', 'admin', '资源管理', 'update角色的权限', '117', '10.108.1.58', '2013-12-06 11:15:38');
INSERT INTO `log` VALUES ('2', 'admin', '资源管理', 'update角色的权限', '54', '10.108.1.58', '2013-12-06 11:17:40');
INSERT INTO `log` VALUES ('3', 'admin', '资源管理', 'update角色的权限', '128', '192.168.1.100', '2013-12-31 21:34:16');
INSERT INTO `log` VALUES ('4', 'admin', '资源管理', 'update角色的权限', '61', '192.168.1.100', '2013-12-31 21:36:35');
INSERT INTO `log` VALUES ('5', 'admin', '资源管理', 'update角色的权限', '140', '192.168.1.100', '2013-12-31 21:42:48');
INSERT INTO `log` VALUES ('6', 'admin', '资源管理', 'update角色的权限', '127', '192.168.1.100', '2013-12-31 21:43:28');
INSERT INTO `log` VALUES ('7', 'admin', '角色管理', 'save操作', '94', '192.168.1.100', '2013-12-31 21:45:40');
INSERT INTO `log` VALUES ('8', null, '用户管理', 'update操作', '7', '192.168.1.100', '2014-01-01 13:58:06');
INSERT INTO `log` VALUES ('9', 'admin', '用户管理', 'save操作', '91', '192.168.1.100', '2014-01-01 14:15:36');
INSERT INTO `log` VALUES ('10', 'admin', '角色管理', 'save操作', '4', '192.168.1.100', '2014-01-01 14:16:11');
INSERT INTO `log` VALUES ('11', 'admin', '角色管理', 'update用户的角色', '6', '192.168.1.100', '2014-01-01 14:16:24');
INSERT INTO `log` VALUES ('12', 'admin', '资源管理', 'update角色的权限', '44', '192.168.1.100', '2014-01-01 14:16:40');
INSERT INTO `log` VALUES ('13', 'admin', '资源管理', 'update角色的权限', '26', '192.168.1.100', '2014-01-01 14:17:22');
INSERT INTO `log` VALUES ('14', 'admin', '资源管理', 'update角色的权限', '23', '192.168.1.100', '2014-01-01 14:18:43');
INSERT INTO `log` VALUES ('15', 'admin', '资源管理', 'update角色的权限', '88', '192.168.1.100', '2014-01-01 14:19:20');
INSERT INTO `log` VALUES ('16', 'super', '资源管理', 'update角色的权限', '87', '192.168.1.100', '2014-01-01 14:59:48');
INSERT INTO `log` VALUES ('17', 'super', '角色管理', 'delete操作', '3', '192.168.1.100', '2014-01-01 15:34:06');
INSERT INTO `log` VALUES ('18', 'admin', '角色管理', 'delete操作', '0', '223.244.227.11', '2014-01-01 15:44:20');

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `orderId` varchar(20) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productNum` int(11) DEFAULT NULL,
  `productSumPrice` float DEFAULT NULL,
  `userAddress` varchar(100) DEFAULT NULL,
  `userPhone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`orderId`,`userId`,`productId`),
  KEY `userId` (`userId`),
  KEY `productId` (`productId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('1', '1', '1', '1222', '1222', '1', '1');
INSERT INTO `orderlist` VALUES ('1013463417428279', '3', '25', '1', '38', '6', '6');
INSERT INTO `orderlist` VALUES ('1013463417428279', '3', '4', '1', '40', '6', '6');
INSERT INTO `orderlist` VALUES ('1013463417428279', '3', '41', '1', '49', '6', '6');
INSERT INTO `orderlist` VALUES ('1013463417428279', '3', '35', '1', '49', '6', '6');
INSERT INTO `orderlist` VALUES ('1013463417428279', '3', '46', '1', '199', '6', '6');
INSERT INTO `orderlist` VALUES ('1013463417428279', '3', '14', '1', '195', '6', '6');
INSERT INTO `orderlist` VALUES ('1226823817497838', '1', '24', '10', '360', '枯霜下要孤', '0253526');
INSERT INTO `orderlist` VALUES ('1226823817497838', '1', '42', '1', '70', '枯霜下要孤', '0253526');
INSERT INTO `orderlist` VALUES ('1064818011100857', '1', '34', '1', '98', '枯霜下要孤ddd', '13533101815');

-- ----------------------------
-- Table structure for ordermanager
-- ----------------------------
DROP TABLE IF EXISTS `ordermanager`;
CREATE TABLE `ordermanager` (
  `orderId` varchar(20) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `orderSunPrice` float DEFAULT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `orderState` varchar(100) DEFAULT '0',
  `timeState` varchar(100) DEFAULT '1',
  PRIMARY KEY (`orderId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordermanager
-- ----------------------------
INSERT INTO `ordermanager` VALUES ('1', '1', '1', '2013-11-14 16:53:41', '2', '1');
INSERT INTO `ordermanager` VALUES ('1064818011100857', '1', '98', '2013-12-27 22:26:45', '0', '1');
INSERT INTO `ordermanager` VALUES ('1226823817497838', '1', '430', '2013-12-27 14:50:30', '0', '1');
INSERT INTO `ordermanager` VALUES ('1013463417428279', '3', '570', '2013-11-18 11:43:01', '0', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productBrandId` int(11) DEFAULT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `productImagesUrl` varchar(100) DEFAULT NULL,
  `price` float NOT NULL,
  `productUnit` varchar(10) DEFAULT NULL,
  `productLookNuns` int(11) DEFAULT '3974',
  `productProfile` varchar(500) DEFAULT NULL,
  `productProduce` varchar(40) DEFAULT '0',
  PRIMARY KEY (`productId`),
  KEY `productBrandId` (`productBrandId`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('8', '13', '包邮新款时尚低帮韩版男鞋 男士板鞋英伦休闲男鞋子 板鞋子潮鞋', '/uploadfile/2013111517/201311151740309008.jpg', '168', '双', '3978', '货号: 5600品牌: 达乐马鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 布面帮面材料: PU皮皮革风格: 压花皮内里材质: 棉质制作工艺: 胶粘鞋鞋跟: 平跟图案: 纯色流行元素: 翻边风格: 休闲场合: 日常休闲季节: 春秋颜色分类: 5600红色 5600白色 5600黑色 5600棕色尺码: <全网我们最低价> 39<正品 新款 潮鞋> <亏本甩卖,只为赚好评> 40<正品 新款 潮鞋> 41<正品 新款 潮鞋> 42<正品 新款 潮鞋> 43<正品 新款 潮鞋> 44<正品 新款 潮鞋> 标准运动鞋尺码,请放心购买! 原版首发，品质保证 质量保证,7天无理由退换价格区间: 71-120元低帮鞋款式: 板鞋男鞋功能: 耐磨', '大陆');
INSERT INTO `product` VALUES ('3', '12', 'Simier斯米尔流行男鞋真皮正品休闲皮鞋板鞋英伦潮鞋休闲鞋男1331', '/uploadfile/2013111517/201311151724054087.jpg', '158', '双', '3983', '产品参数：\r\n货号: 1331品牌: 斯米尔鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 真皮头层皮帮面材料: 牛皮内里材质: 皮质制作工艺: 胶粘鞋鞋跟: 平跟图案: 纯色流行元素: 车缝线风格: 休闲场合: 日常休闲季节: 春秋颜色分类: 黑色 棕色 浅兰色 黄棕色 米色尺码: 39 38 40 41 42 43 44 45价格区间: 201-500元低帮鞋款式: 板鞋男鞋功能: 透气消费人群: 青年低帮鞋品名: 板鞋', '大陆');
INSERT INTO `product` VALUES ('4', '12', '秋冬季包邮时尚潮流男士内增高板鞋韩版潮鞋英伦男士休闲鞋男鞋子', '/uploadfile/2013111517/201311151730026366.jpg', '40', '双', '3985', '货号: 3098品牌: 时尚流行鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 布面帮面材料: 牛仔布内里材质: 棉质制作工艺: 胶粘鞋鞋跟: 平跟图案: 拼色流行元素: 图腾风格: 休闲场合: 日常休闲季节: 春秋颜色分类: 3098黄色___7cm增高 3098白色___7cm增高 3098蓝色___7cm增高 333黄色____7cm增高 333黑色____7cm增高 333白色____7cm增高 333黄色加棉+5cm增高 333加棉黄色 333黑色加棉+5cm增高 333黑色加棉 333白色加棉+5cm增高 333白色加棉 333黄色_____5cm增高 333黄色_____ 333白色___5cm增高 333白色___ 333黑色_____5cm增高 333黑色_____ 3098黄色____5cm增高 3098黄色___ 3098蓝色____5cm增高 3098蓝色___ 3098白色____5cm增高 3098白色___尺码: 39 40 41 42 43 44 加7cm增高垫的拍大一码送袜子价格区间: 31-70元低帮鞋款式: 板鞋男鞋功能: 耐磨', '大陆');
INSERT INTO `product` VALUES ('5', '12', '2013特价时尚潮流英伦秋冬正品男士休闲内增高韩版板鞋透气男鞋子', '/uploadfile/2013111517/20131115173105880.jpg', '90', '双', '3976', '货号: 2819品牌: 厂家直销鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶帮面材料: 超纤皮皮革风格: 反绒皮内里材质: 棉质制作工艺: 缝制鞋鞋跟: 厚底图案: 纯色流行元素: 车缝线风格: 休闲场合: 日常休闲颜色分类: 黑色不加棉 新白色加棉 新蓝色加棉 红色加棉 灰色加棉 蓝色加棉 棕色加棉 黑色加棉 灰色不加棉 桔色加棉 红色不加棉 棕色不加棉 橘黄色不加棉尺码: 37 专业质检 厂家直销 39 38 40 41 42 43 44价格区间: 71-120元低帮鞋款式: 板鞋男鞋功能: 耐磨', '大陆');
INSERT INTO `product` VALUES ('6', '12', '2013冬季韩版潮流英伦保暖棉鞋运动休闲鞋潮男鞋内增高鞋子男板鞋', '/uploadfile/2013111517/201311151732259523.jpg', '90', '双', '3975', '货号: 435鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 人造皮革帮面材料: PU皮皮革风格: 磨砂皮内里材质: 网纱制作工艺: 胶粘鞋鞋跟: 平跟图案: 纯色流行元素: 车缝线风格: 休闲场合: 日常休闲季节: 春秋颜色分类: (加棉）青色 (加棉）棕色 (加棉）灰色 (加棉）红色 (加棉）黑色 2819桔色 2819棕色 更多款式请点击首页 2819灰色 2819红色 2819黑色尺码: 39(拍下自动改为69元） 40(拍下自动改为69元） 41(拍下自动改为69元） 42(拍下自动改为69元） 43(拍下自动改为69元） 44(拍下自动改为69元） 收藏即送棉袜！ 好评5心截图返15元优惠券 亲！请不要拍活动哦，请拍码数！ 单69 棉79包邮 仅限今天！价格区间: 71-120元低帮鞋款式: 板鞋男鞋功能: 透气', '大陆');
INSERT INTO `product` VALUES ('7', '12', '秋冬流行男鞋英伦男士休闲鞋 真皮大头鞋子男工装鞋 韩版板鞋潮鞋', '/uploadfile/2013111517/201311151733192894.jpg', '128', '双', '3975', '货号: Y-038品牌: mashaly 马利鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 真皮二层皮帮面材料: 牛皮皮革风格: 反绒皮内里材质: 网纱制作工艺: 胶粘鞋鞋跟: 平跟图案: 纯色流行元素: 车缝线风格: 休闲场合: 日常休闲季节: 春秋颜色分类: 酒红色 黑色 深灰色 土棕色 咖啡色尺码: 39 （100%真皮假一罚十） 38 （100%真皮假一罚十） 40 （100%真皮假一罚十） 41 （100%真皮假一罚十） 42 （100%真皮假一罚十） 43 （100%真皮假一罚十） 44 （100%真皮假一罚十） 偏大1号，穿运动鞋要减小1号拍价格区间: 201-500元低帮鞋款式: 板鞋男鞋功能: 耐磨', '大陆');
INSERT INTO `product` VALUES ('9', '13', '秋季男鞋男士帆布鞋男韩版潮流正码板鞋男生英伦休闲鞋男增高鞋子', '/uploadfile/2013111517/201311151742528780.png', '39', '双', '3979', '品牌: 休闲鞋鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 布面帮面材料: 绒面皮革风格: 软面皮内里材质: 棉质制作工艺: 注压鞋鞋跟: 平跟图案: 格纹流行元素: 车缝线风格: 休闲场合: 日常休闲季节: 春秋颜色分类: 669灰红色【加棉】 669黄色【加棉】+增高垫 669蓝色【加棉】+增高垫 669灰红色【加棉】+增高垫 669黄色【加棉】 669蓝色【加棉】 ——669黄色+增高垫—— ——669蓝色+增高垫—— ——669灰红色+增高垫—— 此款鞋子是标准运动鞋尺码 669黄色 669蓝色 669灰红色尺码: 39 40 41 42 43 44价格区间: 71-120元低帮鞋款式: 板鞋男鞋功能: 增高', '大陆');
INSERT INTO `product` VALUES ('10', '13', '2013秋季新款时尚潮流板鞋帆布棉鞋男韩版板鞋英伦男鞋子个性潮鞋', '/uploadfile/2013111517/201311151743495646.jpg', '54', '双', '3974', '鞋头款式: 圆头闭合方式: 魔术贴鞋底材质: 橡胶鞋面材质: 其他非真皮帮面材料: 超纤皮皮革风格: 漆光皮内里材质: 皮质制作工艺: 胶粘鞋鞋跟: 平跟图案: 拼色流行元素: 车缝线风格: 休闲场合: 运动休闲季节: 春秋颜色分类: 黑色 蓝色 白色 黑色 白色 棕色 黄色尺码: 39 请注意：脚宽脚胖建议多加一码拍 40 41 42 43 44 质量保证，喜欢中差评的请勿拍价格区间: 71-120元低帮鞋款式: 板鞋男鞋功能: 透气', '大陆');
INSERT INTO `product` VALUES ('11', '13', '13秋冬季韩版板鞋男鞋子男士休闲鞋英伦瘦版潮流加棉鞋林弯弯潮鞋', '/uploadfile/2013111517/20131115174528205.jpg', '59', '双', '3974', '货号: 8866-579-1993品牌: 版权搜有潮流屋鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 真皮头层皮帮面材料: 绒面皮革风格: 磨砂皮内里材质: 棉质制作工艺: 缝制鞋鞋跟: 平跟图案: 拼色流行元素: 车缝线风格: 休闲场合: 日常休闲季节: 冬季颜色分类: 8866 加棉黑色 收藏加送袜子！！！！！！！！！！！！！！！！！！！！！！！！ 579黄色 1993加棉深蓝 1993深蓝 8866加棉绿色 1993黄色 收藏加送袜子！！！！！！！！！！！！！！！！！！！！！！！ 579绿色 579黑色 8866黑色 8866红色 8866加棉红色 579加棉黑色 1993加棉黄色 1933加棉深蓝 注意：加棉和没有加棉！两种鞋！ 注意：加棉加8元！！！！！！！尺码: 39 40 41 42 43 44 注意：加棉和没有加棉！两种价格区间: 71-120元低帮鞋款式: 板鞋男鞋功能: 透气', '大陆');
INSERT INTO `product` VALUES ('12', '13', '秋冬新款男鞋子韩版潮鞋男士休闲鞋英伦时尚内增高板鞋男保暖棉鞋', '/uploadfile/2013111517/201311151747211860.jpg', '48', '双', '3975', '货号: 2133鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 其他非真皮帮面材料: PU皮皮革风格: 软面皮内里材质: 人造短毛绒制作工艺: 胶粘鞋鞋跟: 平跟图案: 纯色流行元素: 皮革拼接风格: 休闲场合: 日常休闲季节: 冬季颜色分类: 2133黑色单鞋 2133黑色单鞋+增高垫 此款标准休闲鞋尺码 2133黄色单鞋+增高垫 2133黄色 单鞋 2133白色单鞋+增高垫 2133白色 单鞋 2212黄色棉鞋+增高垫 2212黑色棉鞋+增高垫 2212白色棉鞋+增高垫 2212黄色棉鞋 2212黑色棉鞋 2212白色棉鞋尺码: 39 40 41 42 43 44价格区间: 31-70元低帮鞋款式: 板鞋男鞋功能: 保暖', '大陆');
INSERT INTO `product` VALUES ('13', '14', '耐克内增高鞋45码46码运动鞋秋冬男鞋跑步鞋旅游休闲鞋气垫潮女鞋', '/uploadfile/2013111518/201311151839002569.jpg', '210', '双', '3976', '颜色分类: 白灰粉 黑绿 全白 中国红款号: 正品耐克品牌: Nike/耐克上市时间: 2013年冬季性别: 男女通用鞋面材料: 网面+合成革外底材料: 耐磨橡胶适合路面: 小道 公路 跑道运动鞋科技: 气垫 天足 A3 Shox 李宁弓 缓震胶 扭转系统 飞线技术 易弯折功能 强化避震缓冲 透气技术运动鞋功能: 减震 防滑 耐磨 防水 透气 吸汗 包裹性 快干 支撑 平衡 抗冲击 轻便 保暖 增高鞋尺码: 36 37 38 39 40 41 42 43 44 45 46 更多颜色拍下留言/或者联系客服 正品支持验货附带小票/此款是标准尺码价格区间: 201-250元闭合方式: 系带系列: 时尚休闲是否瑕疵: 否', '大陆');
INSERT INTO `product` VALUES ('14', '14', '耐克男鞋NIKE 正品代购全掌气垫跑步鞋女鞋运动鞋429889-006', '/uploadfile/2013111518/201311151840115687.jpg', '195', '双', '3976', '颜色分类: 如需其他颜色请拍这个哦 黑橘红 黑蓝 黑绿 黑银 黑红 黑月 黑桃红 棕金款号: 429889-006品牌: 古臣上市时间: 2013年秋季吊牌价: 1289性别: 男女通用鞋面材料: 牛皮外底材料: 碳素橡胶适合路面: 小道 公路 跑道运动鞋科技: 气垫 缓震胶 易弯折功能 强化避震缓冲运动鞋功能: 减震 防滑 耐磨 防水 透气 轻便 保暖 增高鞋尺码: 36最后5双 37最后7双 38最后6双 39最后6双 40最后6双 41最后8双 42最后9双 43最后5双 44最后4双 45最后7双 7天无理由退换 全国包邮+赠送一双袜子 年中大促+感恩回馈价格区间: 501-800元闭合方式: 系带流行元素: 皮革拼接系列: 跑步AIR MAX是否瑕疵: 否', '大陆');
INSERT INTO `product` VALUES ('15', '14', '2013冬季新款正品耐克板鞋高帮鞋防水雪地靴保暖棉鞋加毛男鞋女鞋', '/uploadfile/2013111518/201311151841029862.jpg', '208', '双', '3975', '颜色分类: 灰红 黑白 深蓝灰 红深蓝 浅蓝白 宝蓝白款号: 见吊牌品牌: 风华木又上市时间: 2012年秋季吊牌价: 520性别: 男女通用鞋帮款式: 高帮鞋面材料: 翻毛皮运动鞋外底材料: 防滑橡胶运动鞋功能: 其它功能鞋尺码: 35 36 37=37.5 37.5=37 39 40 41 42 43 44 （认准官方授产品） 专柜正品，支持验货 需要其他的颜色联系客服价格区间: 501-800元系列: 经典休闲鞋闭合方式: 系带流行元素: 皮革拼接是否瑕疵: 否', '大陆');
INSERT INTO `product` VALUES ('16', '14', '新款正品耐克篮球鞋ZK8科比8代zoom kobe男鞋子NBA全明星低帮战靴', '/uploadfile/2013111518/201311151842058462.jpg', '199', '双', '3974', '产品名称：Nike/耐克 555035颜色分类: 庭紫渐变 圣诞版 蛇年黑 全明星 桔红紫 酒红 黑紫黄 黑人 黑金 黑黄 黑红 黑白 复活节 宝蓝白款号: 555035品牌: Nike/耐克上市时间: 2013年春季1月: 3月吊牌价: 1399性别: 男子鞋帮款式: 低帮鞋面材料: 网面外底材料: 防滑橡胶适合场地: 室内地板运动鞋科技: 缓震胶运动鞋功能: 透气 吸汗 包裹性 快干 平衡 轻便鞋尺码: 40 41 42 43 44 45 46 正品特价，品牌授权 正常码，脚宽请拍大一码 拍下立送棉袜一双 需要小票请留言价格区间: 501-800元是否瑕疵: 否系列: KOBE', '大陆');
INSERT INTO `product` VALUES ('17', '14', '耐克男鞋专柜正品秋季新款慢跑鞋女鞋跑步鞋旅游鞋男子休闲运动鞋', '/uploadfile/2013111518/2013111518431079.jpg', '178', '双', '3974', '产品名称：Nike/耐克 男子跑步鞋跑步...颜色分类: 黑宝蓝36--45 棕金40--45 灰白40--45 黑白 40--45 黑红36--45 酒红 36--45 棕白36--45 灰蓝36--45 黑粉红36--39款号: 511915-004品牌: Nike/耐克上市时间: 2012年夏季吊牌价: 529性别: 男子鞋面材料: 反毛皮外底材料: 耐磨橡胶适合路面: 小道 公路 跑道运动鞋科技: 缓震胶 扭转系统 易弯折功能 强化避震缓冲运动鞋功能: 减震 防滑 耐磨 抗冲击 轻便 保暖鞋尺码: 36 37 38 39 40 41 42 43 44 45价格区间: 251-300元闭合方式: 系带流行元素: 车缝线系列: 跑步其他是否瑕疵: 否', '大陆');
INSERT INTO `product` VALUES ('18', '15', '2013新款休闲板鞋个性男生鞋子秋鞋潮男士鞋韩版潮流英伦低帮潮鞋', '/uploadfile/2013111518/201311151847035192.jpg', '48', '双', '3976', '货号: 255鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 人造皮革帮面材料: PU皮皮革风格: 磨砂皮内里材质: 人造革/PU制作工艺: 胶粘鞋鞋跟: 平跟图案: 拼色风格: 休闲场合: 日常休闲颜色分类: 黑黄 黑红 橙黄 黑色 湖蓝 白色 蓝色 红色 墨绿尺码: 39 40 41 42 43 44 如需增高垫请与卖家联系价格区间: 31-70元', '大陆');
INSERT INTO `product` VALUES ('19', '0', '2013秋冬正品牌男鞋子透气鞋韩版潮流厚底板鞋男士增高运动休闲鞋', '/uploadfile/2013111518/201311151850514848.jpg', '125', '双', '3974', '货号: 品牌折扣品牌: 官方正品鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 真皮头层皮帮面材料: 牛皮内里材质: 皮质制作工艺: 缝制鞋鞋跟: 平跟图案: 拼色流行元素: 车缝线风格: 运动场合: 运动休闲季节: 春秋颜色分类: 20k黑灰红 20k白黑红 20k皮面灰绿 20k白黑 20k宝石蓝 20k黑银 四代灰桃红 四代灰橘红 20k灰桃红 20k灰荧光绿 四代灰宝蓝 四代黑银 四代黑绿 20k皮面灰宝蓝 四代黑黄 四代黑红 四代黑宝蓝 四代大红 四代宝蓝绿 20k皮面黑紫 20k黑金 20k黑银皮面 20k黑蓝皮面 20k黑红皮面尺码: 37 36 38 39 40 41 42 43 44 最后一天全网最低价促销！ 标准码数！能拍的都有现货！ 颜色不同价格也是不同！价格区间: 501-1000元低帮鞋款式: 板鞋男鞋功能: 耐磨', '大陆');
INSERT INTO `product` VALUES ('20', '15', '秋季板鞋男士休闲鞋男流行男鞋子时尚潮流透气单鞋韩版低帮潮鞋', '/uploadfile/2013111518/201311151852186958.jpg', '38', '双', '3974', '鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 人造皮革皮革风格: 磨砂皮内里材质: 棉质制作工艺: 胶粘鞋鞋跟: 平跟图案: 纯色风格: 休闲场合: 日常休闲季节: 春秋颜色分类: 1199深灰 1199浅棕 1199卡其 A03绿色 668灰兰 668灰红 668黄色尺码: 39 40 41 42 43 44 提示：此鞋子为标准的运动鞋尺码价格区间: 71-120元低帮鞋款式: 板鞋男鞋功能: 透气', '大陆');
INSERT INTO `product` VALUES ('21', '15', '秋冬季新款包邮男鞋棉鞋时尚正品休闲鞋潮流鞋子韩版运动保暖板鞋', '/uploadfile/2013111518/201311151853273494.jpg', '62', '双', '3974', '货号: 311鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 其他非真皮帮面材料: 绒面皮革风格: 磨砂皮内里材质: 棉质制作工艺: 胶粘鞋鞋跟: 平跟图案: 拼色流行元素: 车缝线风格: 韩版场合: 运动休闲季节: 春秋颜色分类: 棕色+增高 黑兰+增高 黑兰 棕色 黑白+增高 棕色加棉+增高 黑白加棉+增高 黑兰加棉+增高 黑白 棕色 加棉 黑白 加棉 黑兰 加棉尺码: 39 40 41 42 43 44价格区间: 71-120元低帮鞋款式: 板鞋男鞋功能: 轻质', '大陆');
INSERT INTO `product` VALUES ('22', '24', '包邮2013秋冬季新款韩版厚底松糕鞋马丁靴系带短靴潮靴女靴子女鞋', '/uploadfile/2013111520/201311152026566796.jpg', '39.95', '双', '3975', '上市年份: 2013年冬季风格: 韩版帮面材质: 人造革/PU内里材质: 棉质皮质特征: 软面皮鞋底材质: 橡胶底靴款品名: 马丁靴筒高: 短靴鞋头: 圆头跟高: 中跟(3-5cm)鞋跟形状: 坡跟闭合方式: 前系带流行元素: 坡跟制作工艺: 胶粘鞋颜色分类: 脚宽的胖的平时穿多大选多大 (A-18)白色 (A-18)黑色 提示：脚瘦的选小一码拍 (A839)白色 (A839)黑色尺码: 29码小码订做款 35（标准码，脚瘦的选小一码 36（标准码，脚瘦的选小一码 37（标准码，脚瘦的选小一码 38（标准码，脚瘦的选小一码 39（标准码，脚瘦的选小一码图案: 纯色适合季节: 冬季价格区间: 31-100元消费人群: 青年', '大陆');
INSERT INTO `product` VALUES ('23', '24', '2013秋季系带单鞋女靴内增高休闲鞋女鞋 韩版厚底松糕高帮鞋子', '/uploadfile/2013111520/201311152028428858.jpg', '44.58', '双', '3975', '上市年份: 2013年秋季风格: 甜美帮面材质: 人造革/PU内里材质: 棉质皮质特征: 软面皮鞋底材质: 橡胶底鞋头款式: 圆头闭合方式: 系带跟高: 平跟跟型: 坡跟流行元素: 交叉绑带 链子 坡跟 松糕跟 防水台 金属装饰制作工艺: 胶粘鞋颜色分类: 黑色(帆布鞋) 8506白色（柳钉帆布） 8506黑色（柳钉帆布） 白色（帆布鞋） 黑色（PU皮） 白色（PU皮）尺码: 35（标准码，平时穿多大选多大 36（标准码，平时穿多大选多大 37（标准码，平时穿多大选多大 38（标准码，平时穿多大选多大 39（标准码，平时穿多大选多大图案: 纯色价格区间: 31-70元消费人群: 青年', '大陆');
INSERT INTO `product` VALUES ('24', '24', '啊甘鞋秋季新款韩版厚底低帮鞋学生帆布鞋女鞋情侣休闲鞋大码女鞋', '/uploadfile/2013111520/201311152030233153.jpg', '36', '双', '3981', '上市年份: 2013年秋季风格: 休闲帮面材质: 人造革/PU内里材质: 网纱皮质特征: 磨砂皮鞋底材质: 橡胶底开口深度: 浅口(7cm以下)鞋头: 圆头跟高: 平跟鞋跟形状: 平跟流行元素: 浅口 交叉绑带闭合方式: 系带颜色分类: 桔绿色 灰红色 黑白色尺码: 双十一依旧 情侣鞋，亏本价出售，还等什么呢 亲们，优惠中哦 36 37 38 39 40 41 42 43 44 有任何问题可以在线咨询客服哦 本店亏本挣信用制作工艺: 胶粘鞋价格区间: 31-100元图案: 卡通', '大陆');
INSERT INTO `product` VALUES ('25', '24', '高帮鞋 女 韩版 潮2013秋季内增高休闲鞋女鞋 松糕鞋学生英伦女鞋', '/uploadfile/2013111520/201311152032585703.jpg', '38', '双', '3976', '上市年份: 2013年秋季风格: 欧美帮面材质: 人造革/PU内里材质: 人造革/PU皮质特征: 软面皮鞋底材质: 橡胶底鞋头款式: 圆头闭合方式: 系带跟型: 内增高流行元素: 交叉绑带制作工艺: 胶粘鞋颜色分类: 黑色 酒红色 棕色尺码: 35 36 37 38 39图案: 纯色价格区间: 31-70元', '大陆');
INSERT INTO `product` VALUES ('26', '25', 'SVNI 2013新款牛皮女靴 欧美粗跟女短靴时尚黑色女靴子真皮骑士靴', '/uploadfile/2013111520/201311152035273542.jpg', '298', '双', '3974', '品牌: SVNI/莎维妮货号: SV898-42上市年份: 2013年夏季风格: 欧美帮面材质: 头层牛皮内里材质: 真皮皮质特征: 软面皮鞋底材质: 橡胶底靴款品名: 骑士靴筒高: 短靴鞋头: 圆头跟高: 高跟(6-8cm)鞋跟形状: 粗跟闭合方式: 套筒流行元素: 金属装饰制作工艺: 胶粘鞋颜色分类: 黑色 绿色尺码: 34【官方新品 保证品质】 35【比双十一的价格更实惠】 36【头层牛皮 骑士靴】 37【支持7天无理由退换】 38【包邮默认圆通】 39【冬季新款 时尚女靴】图案: 纯色适合季节: 冬季价格区间: 501-1000元消费人群: 青年', '大陆');
INSERT INTO `product` VALUES ('27', '25', '新款 哈森短靴 正品真皮 欧美马丁靴粗高跟中筒靴女靴子女鞋包邮', '/uploadfile/2013111520/201311152037185561.jpg', '138', '双', '3976', '品牌: Harson/哈森上市年份: 2013年冬季风格: 欧美帮面材质: 头层牛皮内里材质: 真皮皮质特征: 软面皮鞋底材质: 橡胶底靴款品名: 马丁靴筒高: 短靴鞋头: 圆头跟高: 高跟(6-8cm)鞋跟形状: 粗跟闭合方式: 前系带流行元素: 交叉绑带制作工艺: 胶粘鞋颜色分类: 真皮保证假一赔万 提供专柜小票亲可以放心的购买 黑色（内里皮里） 黑色（内里绒里）尺码: 34 35 36 37 38 39图案: 纯色适合季节: 冬季价格区间: 201-500元', '大陆');
INSERT INTO `product` VALUES ('28', '26', '2013秋明星韩版潮鞋魔术贴内增高拼色保暖运动鞋休闲高帮鞋女鞋子', '/uploadfile/2013111520/201311152041509879.jpg', '61.5', '双', '3974', '上市年份: 2013年秋季风格: 欧美帮面材质: 人造革/PU皮质特征: 磨砂皮鞋底材质: 牛筋底闭合方式: 魔术贴跟型: 内增高流行元素: 搭扣 色拼接 坡跟制作工艺: 胶粘鞋颜色分类: 黑加白（明星同款，独家订制） 棕色（明星同款，独家订制） 蓝色（明星同款，独家订制） 红蓝白（明星同款，独家订制） 黑色（明星同款，独家订制）尺码: 31 35（正码，2013秋款） 36（正码，2013秋款） 37（正码，2013秋款） 38（正码，2013秋款） 39（正码，2013秋款） 40（正码，2013秋款）图案: 拼色价格区间: 31-70元', '大陆');
INSERT INTO `product` VALUES ('29', '26', '爆款欧洲站外贸单平底高帮鞋魔术贴运动鞋内增高休闲鞋女鞋子瑕疵', '/uploadfile/2013111520/201311152042419189.jpg', '88', '双', '3974', '品牌: 欧美品牌上市年份: 2013年冬季风格: 欧美帮面材质: 人造革/PU内里材质: 人造革/PU皮质特征: 软面皮鞋底材质: 牛筋底鞋头款式: 圆头闭合方式: 魔术贴跟高: 高跟(6-8cm)跟型: 内增高流行元素: 搭扣 色拼接 坡跟 松糕跟 细带组合 T型带(脚背) 皮带扣制作工艺: 胶粘鞋颜色分类: 系带黑色，偏大一码，拿小一码 系带棕色(偏大一码，拿小一码 铆钉么术贴棕色 么术贴灰色 全黑(三条带子的)尺码: 5.5=35.5 6=36.5码 35 36 37 38 39 6.5=37 40 10=41.5码 9=40 8.5=39.5 41 11=42 9.5=41图案: 拼色价格区间: 31-70元消费人群: 青年', '大陆');
INSERT INTO `product` VALUES ('30', '26', '外贸大牌原单魔术贴内增高高帮运动女鞋 明星爆款', '/uploadfile/2013111520/201311152045102178.jpg', '65', '双', '3974', '品牌: 西班牙品牌货号: Y001上市年份: 2013年秋季帮面材质: 人造革/PU鞋底材质: 橡胶底流行元素: 色拼接颜色分类: 玫白拼色 粉白拼色 红蓝拼色尺码: 32码 33码 34码 35码 36码价格区间: 71-120元', '大陆');
INSERT INTO `product` VALUES ('31', '27', '13新款欧洲外贸英伦休闲鞋平底高帮运动鞋真皮单鞋女鞋短靴女靴子', '/uploadfile/2013111520/20131115204815171.jpg', '258', '双', '3974', '上市年份: 2013年冬季风格: 欧美帮面材质: 头层牛皮内里材质: 真皮皮质特征: 软面皮鞋底材质: 橡胶底靴款品名: 马丁靴筒高: 短靴鞋头: 圆头跟高: 平跟鞋跟形状: 平跟闭合方式: 套筒制作工艺: 胶粘鞋颜色分类: 黑色 红色 白色尺码: 34【双11狂欢只限今天】 35【双11狂欢只限今天】 36【双11狂欢只限今天】 37【双11狂欢只限今天】 38【双11狂欢只限今天】 39【双11狂欢只限今天】 40【双11狂欢只限今天】价格区间: 501-1000元', '大陆');
INSERT INTO `product` VALUES ('32', '27', '秋冬春季系带牛皮短靴女粗高跟马丁靴女英伦中筒靴女靴子女鞋清仓', '/uploadfile/2013111520/201311152050188991.jpg', '160', '双', '3974', '货号: H1帮面材质: 头层牛皮内里材质: 真皮皮质特征: 软面皮鞋底材质: 橡胶底靴款品名: 马丁靴筒高: 短靴鞋头: 圆头跟高: 高跟(6-8cm)鞋跟形状: 粗跟闭合方式: 前系带颜色分类: 咖啡色绒里 咖啡色皮里 黑色绒里 黑色皮里尺码: 34 35 36 37 38 39图案: 纯色价格区间: 201-500元', '大陆');
INSERT INTO `product` VALUES ('33', '36', '易雨简花 秋冬装新 男士风衣 韩版修身中长款大衣 毛呢男装外套', '/uploadfile/2013111521/201311152147491047.jpg', '139', '件', '3987', '衣长: 中长款货号: 双排 风衣 F2版型: 修身型领型: 翻领衣门襟: 双排扣颜色: 黑色 灰色尺码: 170 (M) 175 (L) 180 (XL) 185/ (XXL) 购买下面套餐更划算 新品特价 仅此一天！ 特价抢购！先拍先发货！工艺处理: 免烫处理品牌: 易雨简花适用季节: 秋场合: 休闲消费群体: 青年基础风格: 时尚都市', '大陆');
INSERT INTO `product` VALUES ('34', '36', '2013秋冬新款男装外套呢料韩版短款风衣 男式呢料潮男休闲装上衣', '/uploadfile/2013111521/201311152149208623.jpg', '98', '件', '4000', '衣长: 短款（穿起计衣长在臀围及以上）版型: 修身型领型: 翻领衣门襟: 单排扣颜色: 咖啡加棉 黑色加棉 咖啡 黑色尺码: 170/88(M) 175/92(L) 180/96(XL) 185/100(XXL)面料分类: 尼丝纺工艺处理: 免烫处理品牌: 其它/other面料主材质: 其它合成纤维适用季节: 秋场合: 休闲消费群体: 青少年男装-口袋设计: 袋盖挖袋款式细节: 纽扣装饰男装-花色: 纯色男装-面料材质: 毛混纺基础风格: 青春流行细分风格: 日系复古', '大陆');
INSERT INTO `product` VALUES ('35', '37', '【专柜品质】包邮semir/森马男装牛仔裤男专柜品质韩版黑色代团购', '/uploadfile/2013111521/20131115215030929.jpg', '49', '件', '3975', '裤长: 长裤（穿起计裤长至脚踝下）货号: 森马306款颜色: 黑色森马306款 黑色美邦604款尺码: 【此商品包邮只发中通快递】 28码【2.1尺】 29码【2.2尺】 30码【2.3尺】 31码【2.4尺】 32码【2.5尺】 33码【2.6尺】 34码【2.7尺】 36码【2.9尺】 38码【3.1尺】 【数量有限，随时涨价】 黑色裤子会掉色的哦 喜欢中差评的亲不要拍牛仔面料: 常规牛仔布工艺处理: 刺绣 水洗品牌: Semir/森马款式细节: 五袋款年份: 2013适用季节: 冬场合: 休闲消费群体: 青年牛仔面料成分分类: 棉涤混纺弹力指数: 无弹腰型: 中腰裤脚口: 直脚/标准直脚裤门襟: 拉链洗水: 普通洗水厚薄: 常规版型: 直筒基础风格: 时尚都市细分风格: 中国风', '大陆');
INSERT INTO `product` VALUES ('36', '37', '秋冬潮流男士休闲长裤修身韩版以纯牛仔裤男前线男装裤子深色大码', '/uploadfile/2013111521/201311152155479010.jpg', '68', '件', '3975', '裤长: 长裤（穿起计裤长至脚踝下）货号: 651颜色: C款吉普651 A款LEE袋盖623 B款以纯620尺码: 专柜品质，限时包邮中！！ 28（2.1尺）包邮送腰带！ 29（2.2尺）包邮送腰带！ 30（2.3尺）包邮送腰带！ 31（2.4尺）包邮送腰带！ 32（2.5尺）包邮送腰带！ 33（2.6尺）包邮送腰带！ 34（2.7尺）包邮送腰带！ 35（2.75尺）包邮送腰带！ 36（2.8尺）包邮送腰带！ 38（3.0尺）包邮送腰带！ 40（3.1尺）包邮送腰带！ 标准尺码，放心购买！！ 超长30天任意退换！免费试穿！牛仔面料: 常规牛仔布工艺处理: 漂白 猫须 手擦 磨边 喷砂 马骝 石磨品牌: Yishion/以纯款式细节: 多口袋年份: 2013适用季节: 冬场合: 休闲消费群体: 青年牛仔面料成分分类: 棉弹力指数: 无弹腰型: 中腰裤脚口: 直脚/标准直脚裤门襟: 拉链洗水: 石洗/石磨 砂洗 石漂洗 酵素洗厚薄: 常规版型: 修身基础风格: 时尚都市细分风格: 商务休闲', '大陆');
INSERT INTO `product` VALUES ('37', '38', '2013秋装新款 韩版时尚商务休闲纯色长袖衬衫 男衬衣 男装潮', '/uploadfile/2013111521/201311152157274272.jpg', '44.1', '件', '3977', '袖长: 长袖（袖长>57cm）版型: 修身型领型: 尖领颜色: 黑色 酒红色 紫色 粉色 白色 藏蓝色 卡其色 灰色 天蓝色尺码: M L XL XXL品牌: 其他/other面料花型: 纯色面料主材质: 棉质棉含量: 50%-69%年份: 2013场合: 休闲适用季节: 秋消费群体: 青年基础风格: 时尚都市细分风格: 潮', '大陆');
INSERT INTO `product` VALUES ('38', '38', '旗顿 保暖衬衫男长袖加厚加绒 男士保暖衬衣 新款休闲衬衫男装潮', '/uploadfile/2013111521/201311152158195788.jpg', '99', '件', '3974', '袖长: 长袖（袖长>57cm）货号: 三小扣保暖衬衫版型: 修身型领型: 方领颜色: 8602 8601 8827 8825 8815 8819 8818 8817 8816 8820 8813 8812 8811 8826 8809 8808 8807 8806 8805 8828 8802 8801 9801 9802尺码: 多买多优惠 亲们，必须加入购物车拍下 38（一件减10元） 39（两件减30） 40（三件减50） 41（申通圆通能到随机发） 42（有机会获得顺丰包邮） 43（承诺7天无条件退货） 44（购物零风险）品牌: QIDEN/旗顿面料花型: 纯色面料主材质: 其它合成纤维年份: 2013场合: 上班适用季节: 冬消费群体: 青年基础风格: 商务绅士细分风格: 商务休闲图案: 其它服装工艺: 免烫处理款式细节: 纽扣装饰', '大陆');
INSERT INTO `product` VALUES ('39', '45', '秋冬装职业装女装韩版时尚工作服OL职业泡泡袖女士新款正装工装', '/uploadfile/2013111522/201311152203403027.jpg', '88.9', '件', '3974', '主图来源: 自主实拍图货号: 0812板型: 宽松品牌: 纤妍服饰风格: 百搭衣长: 常规款(50cm<衣长≤65cm)袖长: 长袖领子: V领袖型: 泡泡袖衣门襟: 单排扣图案: 条纹款式细节: 高温定型 纽扣 拼贴面料分类: 涤纶面料主成分含量: 51%-70%适用人群: 18-24岁年份季节: 2013秋季颜色分类: 黑色 优惠开张 红色 优惠开张 白色 优惠开张尺码: S M L XL XXL', '大陆');
INSERT INTO `product` VALUES ('40', '45', '2013新款女秋装修身外套韩版小西装长袖女显瘦纯色女装西服', '/uploadfile/2013111522/201311152204293890.jpg', '98', '件', '3977', '主图来源: 淘宝分销图货号: LSF100982板型: 修身型风格: 通勤通勤: 韩版衣长: 常规款(50cm<衣长≤65cm)袖长: 长袖领子: 其他领型袖型: 常规袖衣门襟: 一粒扣图案: 纯色款式细节: 高温定型 镂空 勾花镂空 口袋 纽扣 纱网 蕾丝面料分类: 其他合成纤维面料主成分含量: 96%及以上年份季节: 2013秋季颜色分类: 粉色 白色 黑色 玫红色尺码: S M L XL XXL XXXL', '大陆');
INSERT INTO `product` VALUES ('41', '41', '2013秋季秋冬款韩版修身裙大码女装打底裙长袖秋装新款秋冬连衣裙', '/uploadfile/2013111522/2013111522064356.jpg', '49', '件', '3982', '主图来源: 自主实拍图货号: MS528风格: 通勤通勤: 韩版组合形式: 单件裙长: 短裙(76-90厘米)袖长: 长袖领型: 娃娃领袖型: 常规袖腰型: 中腰衣门襟: 套头裙型: 公主裙图案: 纯色流行元素/工艺: 亮片品牌: 旻莎材质: 其他主材质: 其他人造纤维适用人群: 18-24岁年份季节: 2013秋季颜色分类: 杏色 宝蓝色尺码: S码(商城品质 正品保证) M码(现货', '大陆');
INSERT INTO `product` VALUES ('42', '41', '韩版淑女A字裙子高端秋冬连衣裙 气质大码显瘦', '/uploadfile/2013111522/201311152207388323.jpg', '70', '件', '3982', '主图来源: 其他来源风格: 通勤通勤: 淑女组合形式: 单件裙长: 短裙(76-90厘米)款式: 其他款式袖长: 长袖领型: 娃娃领袖型: 常规袖腰型: 高腰衣门襟: 套头裙型: 大摆型图案: 纯色流行元素/工艺: 高温定型 勾花镂空 拼贴/拼接材质: 织锦主成份含量: 81%-90%主材质: 棉适用人群: 25-29岁年份季节: 2013秋季颜色分类: 蓝色 粉色（(截图收藏店铺即送腰带) 紫色（好评5分返现2元－截图） 蓝色（质量超58元－69元版尺码: M L XL XXL', '大陆');
INSERT INTO `product` VALUES ('43', '42', '欧洲站新款套装2013女装秋冬学生加厚加绒卫衣三件套休闲运动服潮', '/uploadfile/2013111522/201311152209478075.jpg', '68', '件', '3974', '颜色分类: 1156-粉色 1045-橘色 127-黑色 1021-绿色 1021-米白 1021-粉色 846-深蓝马甲 846-白色马甲 915-粉色 915-水蓝 915-驼色 915-黄色 915-棕色 915-玫红 915-白色 T222-橘色 T222-蓝色 1816-红色 1816-荧光绿 1816-蓝色 2395-红色 2395-橘色 5242-红色 5242-粉色尺码: XXL码（好评5分截图返3元） XL', '大陆');
INSERT INTO `product` VALUES ('44', '42', '2013秋装最新款原宿潮韩版学生装女装休闲套装假运动服春秋冬卫衣', '/uploadfile/2013111522/20131115221039196.jpg', '35', '件', '3977', '品牌: 语芯月货号: 123颜色分类: 白色 灰色 蓝色 红色尺码: 均码上市年份/季节: 2013适用人群: 18-25岁', '大陆');
INSERT INTO `product` VALUES ('45', '43', '风衣外套女装 2013新款冬秋装韩版修身中长款女式大码品牌大衣潮', '/uploadfile/2013111522/201311152212596030.jpg', '139', '件', '3974', '主图来源: 自主实拍图品牌: FS．REDDY货号: 1260板型: 修身型厚薄: 常规风格: 通勤通勤: 韩版衣长: 中长款(65cm<衣长≤80cm)袖长: 长袖领子: 西装领袖型: 常规袖衣门襟: 双排扣图案: 纯色流行元素/工艺: 蝴蝶结 系带/腰带 背带 纽扣 燕尾面料材质: 其他合成纤维面料主材质含量: 96%及以上里料分类: 涤纶年份季节: 2013秋季颜色分类: 藏蓝 加厚 卡其 加厚 黑色 加厚 橘色 加厚 军绿 加厚尺码: 【S】双11热潮延续中 【M】原价1', '大陆');
INSERT INTO `product` VALUES ('46', '43', '紫叶紫2013秋装新款女装中长款风衣韩版修身春秋外套女式风衣', '/uploadfile/2013111522/201311152213495917.jpg', '199', '件', '3977', '主图来源: 自主实拍图品牌: 紫叶紫货号: S1324板型: 修身型厚薄: 常规风格: 通勤通勤: 韩版衣长: 中长款(65cm<衣长≤80cm)袖长: 长袖领子: 翻领/POLO领袖型: 常规袖衣门襟: 双排扣图案: 纯色流行元素/工艺: 系带/腰带面料材质: 其他人造纤维面料主材质含量: 96%及以上里料分类: 涤纶适用人群: 25-29岁年份季节: 2013秋季颜色分类: 卡其色 大红色 酒红色 深蓝色尺码: 少量现货，即将预售 S M L XL XXL X', '大陆');
INSERT INTO `product` VALUES ('47', '44', '2013秋装新款女装休闲外套女式春秋韩版修身中长款蕾丝风衣', '/uploadfile/2013111522/201311152217344157.jpg', '174', '件', '3975', '货号: 6202图案: 纯色面料材质: 其他合成纤维颜色分类: 藏蓝色 橙红色尺码: S M L XL', '大陆');
INSERT INTO `product` VALUES ('48', '44', '2013女装秋冬装韩版衣服修身显瘦紧身长袖连衣裙打底衫新款', '/uploadfile/2013111522/201311152218526604.png', '47.8', '件', '3974', '货号: 330风格: 通勤通勤: 韩版组合形式: 单件裙长: 中长裙(106-125厘米)款式: 其他款式袖长: 长袖领型: 圆领袖型: 其他袖型腰型: 中腰衣门襟: 套头裙型: 其他裙摆样式图案: 纯色流行元素/工艺: 系带/腰带 拼贴/拼接品牌: 寅都供应商材质: 其他主成份含量: 81%-90%主材质: 其他面料适用人群: 18-24岁年份季节: 2013秋季颜色分类: 黑色 绿色 咖啡尺码: 均码（收藏店铺送腰带）', '大陆');

-- ----------------------------
-- Table structure for productbrand
-- ----------------------------
DROP TABLE IF EXISTS `productbrand`;
CREATE TABLE `productbrand` (
  `productBrandId` int(11) NOT NULL AUTO_INCREMENT,
  `productBrandName` varchar(40) DEFAULT '',
  `parentId` int(11) DEFAULT '0',
  PRIMARY KEY (`productBrandId`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productbrand
-- ----------------------------
INSERT INTO `productbrand` VALUES ('7', '男鞋', '0');
INSERT INTO `productbrand` VALUES ('6', '男装', '0');
INSERT INTO `productbrand` VALUES ('8', '女装', '0');
INSERT INTO `productbrand` VALUES ('9', '女鞋', '0');
INSERT INTO `productbrand` VALUES ('10', '服装配饰', '0');
INSERT INTO `productbrand` VALUES ('11', '体育用品', '0');
INSERT INTO `productbrand` VALUES ('12', '休闲男鞋', '7');
INSERT INTO `productbrand` VALUES ('13', '英伦男鞋', '7');
INSERT INTO `productbrand` VALUES ('14', '耐克男鞋', '7');
INSERT INTO `productbrand` VALUES ('15', '韩版男鞋', '7');
INSERT INTO `productbrand` VALUES ('16', '骆驼男鞋', '7');
INSERT INTO `productbrand` VALUES ('17', '板鞋男', '7');
INSERT INTO `productbrand` VALUES ('18', '帆布鞋男', '7');
INSERT INTO `productbrand` VALUES ('19', '皮鞋男', '7');
INSERT INTO `productbrand` VALUES ('20', '百丽男鞋', '7');
INSERT INTO `productbrand` VALUES ('21', '奥康男鞋', '7');
INSERT INTO `productbrand` VALUES ('22', '阿迪达斯男鞋', '7');
INSERT INTO `productbrand` VALUES ('23', '内增高男鞋', '7');
INSERT INTO `productbrand` VALUES ('24', '秋季女鞋', '9');
INSERT INTO `productbrand` VALUES ('25', '女靴', '9');
INSERT INTO `productbrand` VALUES ('26', '内增高女鞋', '9');
INSERT INTO `productbrand` VALUES ('27', '英伦女鞋', '9');
INSERT INTO `productbrand` VALUES ('28', '真皮女鞋', '9');
INSERT INTO `productbrand` VALUES ('29', '大码女鞋', '9');
INSERT INTO `productbrand` VALUES ('30', '复古女鞋', '9');
INSERT INTO `productbrand` VALUES ('31', '外贸女鞋', '9');
INSERT INTO `productbrand` VALUES ('32', '女鞋单鞋', '9');
INSERT INTO `productbrand` VALUES ('33', '骆驼女鞋', '9');
INSERT INTO `productbrand` VALUES ('34', '意尔康女鞋', '9');
INSERT INTO `productbrand` VALUES ('35', 'tata女鞋', '9');
INSERT INTO `productbrand` VALUES ('36', '风衣', '6');
INSERT INTO `productbrand` VALUES ('37', '牛仔裤', '6');
INSERT INTO `productbrand` VALUES ('38', '衬衫', '6');
INSERT INTO `productbrand` VALUES ('39', '运动套装', '6');
INSERT INTO `productbrand` VALUES ('40', 'Polo衫', '6');
INSERT INTO `productbrand` VALUES ('41', '连衣裙', '8');
INSERT INTO `productbrand` VALUES ('42', '休闲套装', '8');
INSERT INTO `productbrand` VALUES ('43', '风衣', '8');
INSERT INTO `productbrand` VALUES ('44', '韩版女装', '8');
INSERT INTO `productbrand` VALUES ('45', '西装', '8');
INSERT INTO `productbrand` VALUES ('46', '项链', '10');
INSERT INTO `productbrand` VALUES ('47', '服装配饰水钻', '10');
INSERT INTO `productbrand` VALUES ('48', 'DIY饰品配件', '10');
INSERT INTO `productbrand` VALUES ('49', '胸针', '10');
INSERT INTO `productbrand` VALUES ('50', '耳饰', '10');
INSERT INTO `productbrand` VALUES ('51', '篮球', '11');
INSERT INTO `productbrand` VALUES ('52', '羽毛球', '11');
INSERT INTO `productbrand` VALUES ('53', '乒乓球', '11');
INSERT INTO `productbrand` VALUES ('54', '足球', '11');
INSERT INTO `productbrand` VALUES ('55', '排球', '11');

-- ----------------------------
-- Table structure for rates
-- ----------------------------
DROP TABLE IF EXISTS `rates`;
CREATE TABLE `rates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `tradingRates` varchar(30) DEFAULT NULL,
  `channelname` varchar(30) DEFAULT NULL,
  `settlementCosts` varchar(30) DEFAULT NULL,
  `settlementCaps` varchar(30) DEFAULT NULL,
  `mark` varchar(200) DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rates
-- ----------------------------
INSERT INTO `rates` VALUES ('1', null, 'ddd', null, null, null, null, null, '2014-01-01 20:53:08');
INSERT INTO `rates` VALUES ('3', null, '00', null, null, null, null, null, '2014-01-01 20:53:19');

-- ----------------------------
-- Table structure for resources
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resources
-- ----------------------------
INSERT INTO `resources` VALUES ('1', '用户管理', '1010', 'sys_user', '0', 'user', '1', '用户管理');
INSERT INTO `resources` VALUES ('2', '查询用户', '1', 'sys_user_find', '1', '/background/user/query.html', '2', '查询用户');
INSERT INTO `resources` VALUES ('3', '新增用户', '1', 'sys_user_addUI', '1', '/background/user/addUI.html', '3', '新增用户');
INSERT INTO `resources` VALUES ('4', '角色管理', '1010', 'sys_role', '0', 'role', '4', '角色管理');
INSERT INTO `resources` VALUES ('5', '角色列表', '4', 'sys_role_find', '1', '/background/role/query.html', '5', '角色列表');
INSERT INTO `resources` VALUES ('6', '资源管理', '1010', 'sys_resc', '0', 'resc', '6', '资源管理');
INSERT INTO `resources` VALUES ('7', '资源列表', '6', 'sys_resc_find', '1', '/background/resources/query.html', '7', '资源列表');
INSERT INTO `resources` VALUES ('8', '添加资源', '6', 'sys_resc_addUI', '1', '/background/resources/addUI.html', '8', '添加资源');
INSERT INTO `resources` VALUES ('11', '新增角色', '4', 'sys_role_add', '1', '/background/role/addUI.html', '5', '新增角色');
INSERT INTO `resources` VALUES ('18', '服务器配置管理', '1010', 'server', '0', 'server', '16', '服务器配置管理');
INSERT INTO `resources` VALUES ('19', '预警设置', '18', 'ser_warn', '1', '/background/serverInfo/forecast.html', '17', '预警设置');
INSERT INTO `resources` VALUES ('20', '状态列表', '18', 'ser_list', '1', '/background/serverInfo/query.html', '18', '状态列表');
INSERT INTO `resources` VALUES ('21', '服务器状态', '18', 'ser_statu', '1', '/background/serverInfo/show.html', '19', '服务器状态');
INSERT INTO `resources` VALUES ('22', '登陆信息管理', '1010', 'login', '0', 'login', '20', '登陆信息管理');
INSERT INTO `resources` VALUES ('23', '用户登录记录', '22', 'log_list', '1', '/background/userLoginList/query.html', '21', '用户登录记录');
INSERT INTO `resources` VALUES ('39', '操作日志管理', '1010', 'log', '0', 'log', '30', '操作日志管理');
INSERT INTO `resources` VALUES ('40', '日志查询', '39', 'log_find', '1', '/background/log/query.html', '31', '日志查询');
INSERT INTO `resources` VALUES ('41', '分配角色', '2', 'sys_user_fenpeirole', '2', 'sys_user_fenpeirole', '32', '分配角色');
INSERT INTO `resources` VALUES ('42', '分配权限', '2', 'sys_user_permissions', '2', 'sys_user_permissions', '33', '分配权限');
INSERT INTO `resources` VALUES ('43', '编辑用户', '2', 'sys_user_edit', '2', '/background/user/getById.html', '34', '编辑');
INSERT INTO `resources` VALUES ('44', '删除用户', '2', 'sys_user_delete', '2', '/background/user/deleteById.html', '36', '删除用户');
INSERT INTO `resources` VALUES ('45', '分配权限', '5', 'sys_role_permissions', '2', 'sys_role_permissions', '37', '分配权限');
INSERT INTO `resources` VALUES ('46', '显示详细信息', '5', 'sys_role_show', '2', 'sys_role_show', '39', '显示详细信息');
INSERT INTO `resources` VALUES ('47', '编辑角色', '5', 'sys_role_edit', '2', '/background/role/getById.html', '40', '编辑角色');
INSERT INTO `resources` VALUES ('48', '删除角色', '5', 'sys_role_delete', '2', '/background/role/deleteById.html', '41', '删除角色');
INSERT INTO `resources` VALUES ('49', '显示详细信息', '7', 'sys_res_show', '2', 'sys_res_show', '43', '显示详细信息');
INSERT INTO `resources` VALUES ('50', '编辑权限资源', '7', 'sys_res_edit', '2', '/background/resources/getById.html', '44', '编辑权限资源');
INSERT INTO `resources` VALUES ('51', '删除权限资源', '7', 'sys_res_delete', '2', '/background/resources/deleteById.html', '45', '删除权限资源');
INSERT INTO `resources` VALUES ('52', '支付账单管理', '1010', 'sys_pay', '0', 'pay', '13', '支付账单管理');
INSERT INTO `resources` VALUES ('53', '查询账单', '52', 'sys_pay_find', '1', '/background/bill/query.html', '14', '查询账单');
INSERT INTO `resources` VALUES ('54', '新增账单', '52', 'sys_pay_add', '1', '/background/bill/addUI.html', '15', '新增账单');
INSERT INTO `resources` VALUES ('55', '用户订单管理', '1010', 'order', '0', 'order', '22', '用户订单管理');
INSERT INTO `resources` VALUES ('56', '订单查询', '55', 'order_find', '1', '/background/orderlist/query.html', '55', '订单查询');
INSERT INTO `resources` VALUES ('57', '结算查询', '55', 'manager_find', '1', '/background/orderManager/query.html', '55', '结算查询');
INSERT INTO `resources` VALUES ('58', '产品类型管理', '1010', 'ptype', '0', 'ptype', '26', '产品类型管理');
INSERT INTO `resources` VALUES ('59', '类型列表', '58', 'ptype_find', '1', '/background/productBrand/query.html', '58', '类型列表');
INSERT INTO `resources` VALUES ('60', '新增类型', '58', 'ptype_add', '1', '/background/productBrand/addUI.html', '58', '新增类型');
INSERT INTO `resources` VALUES ('61', '产品管理', '1010', 'product', '0', 'product', '29', '产品管理');
INSERT INTO `resources` VALUES ('62', '查询产品', '61', 'product_find', '1', '/background/product/query.html', '61', '查询产品');
INSERT INTO `resources` VALUES ('63', '新增产品', '61', 'product_add', '1', '/background/product/addUI.html', '61', '新增产品');

-- ----------------------------
-- Table structure for resources_role
-- ----------------------------
DROP TABLE IF EXISTS `resources_role`;
CREATE TABLE `resources_role` (
  `resc_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`resc_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resources_role
-- ----------------------------
INSERT INTO `resources_role` VALUES ('1', '4');
INSERT INTO `resources_role` VALUES ('1', '6');
INSERT INTO `resources_role` VALUES ('2', '4');
INSERT INTO `resources_role` VALUES ('2', '6');
INSERT INTO `resources_role` VALUES ('3', '4');
INSERT INTO `resources_role` VALUES ('3', '6');
INSERT INTO `resources_role` VALUES ('4', '6');
INSERT INTO `resources_role` VALUES ('5', '6');
INSERT INTO `resources_role` VALUES ('6', '6');
INSERT INTO `resources_role` VALUES ('7', '6');
INSERT INTO `resources_role` VALUES ('8', '6');
INSERT INTO `resources_role` VALUES ('11', '6');
INSERT INTO `resources_role` VALUES ('18', '6');
INSERT INTO `resources_role` VALUES ('19', '6');
INSERT INTO `resources_role` VALUES ('20', '6');
INSERT INTO `resources_role` VALUES ('21', '6');
INSERT INTO `resources_role` VALUES ('22', '6');
INSERT INTO `resources_role` VALUES ('23', '6');
INSERT INTO `resources_role` VALUES ('39', '6');
INSERT INTO `resources_role` VALUES ('40', '6');
INSERT INTO `resources_role` VALUES ('41', '6');
INSERT INTO `resources_role` VALUES ('42', '6');
INSERT INTO `resources_role` VALUES ('43', '4');
INSERT INTO `resources_role` VALUES ('43', '6');
INSERT INTO `resources_role` VALUES ('44', '4');
INSERT INTO `resources_role` VALUES ('44', '6');
INSERT INTO `resources_role` VALUES ('45', '6');
INSERT INTO `resources_role` VALUES ('46', '6');
INSERT INTO `resources_role` VALUES ('47', '6');
INSERT INTO `resources_role` VALUES ('48', '6');
INSERT INTO `resources_role` VALUES ('49', '6');
INSERT INTO `resources_role` VALUES ('50', '6');
INSERT INTO `resources_role` VALUES ('51', '6');
INSERT INTO `resources_role` VALUES ('52', '4');
INSERT INTO `resources_role` VALUES ('52', '6');
INSERT INTO `resources_role` VALUES ('53', '4');
INSERT INTO `resources_role` VALUES ('53', '6');
INSERT INTO `resources_role` VALUES ('54', '4');
INSERT INTO `resources_role` VALUES ('54', '6');
INSERT INTO `resources_role` VALUES ('55', '6');
INSERT INTO `resources_role` VALUES ('56', '6');
INSERT INTO `resources_role` VALUES ('57', '6');
INSERT INTO `resources_role` VALUES ('58', '6');
INSERT INTO `resources_role` VALUES ('59', '6');
INSERT INTO `resources_role` VALUES ('60', '6');
INSERT INTO `resources_role` VALUES ('61', '6');
INSERT INTO `resources_role` VALUES ('62', '6');
INSERT INTO `resources_role` VALUES ('63', '6');
INSERT INTO `resources_role` VALUES ('1010', '4');
INSERT INTO `resources_role` VALUES ('1010', '6');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('4', '管理员', 'admin', '管理员', '1');
INSERT INTO `role` VALUES ('6', '超级管理员', 'super', '超级管理员', '1');

-- ----------------------------
-- Table structure for serverinfo
-- ----------------------------
DROP TABLE IF EXISTS `serverinfo`;
CREATE TABLE `serverinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `setCpuUsage` varchar(255) DEFAULT NULL,
  `jvmUsage` varchar(255) DEFAULT NULL,
  `setJvmUsage` varchar(255) DEFAULT NULL,
  `ramUsage` varchar(255) DEFAULT NULL,
  `setRamUsage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of serverinfo
-- ----------------------------
INSERT INTO `serverinfo` VALUES ('1', '90.8', '90', '70.0', '90', '82.0', '90', '421828229@qq.com', '2013-12-30 16:04:32', '<font color=\'red\'>CPU当前：90.8%,超出预设值  90%<br></font>');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `userPassword` varchar(40) DEFAULT NULL,
  `userNickname` varchar(20) DEFAULT NULL,
  `userRealname` varchar(20) DEFAULT NULL,
  `userAge` int(11) DEFAULT NULL,
  `userSex` varchar(10) DEFAULT NULL,
  `userAddress` varchar(100) DEFAULT NULL,
  `userPhone` varchar(30) DEFAULT NULL,
  `userMail` varchar(45) DEFAULT NULL,
  `userQQ` varchar(30) DEFAULT NULL,
  `regTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastLogintime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `level` int(11) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `branchBank` varchar(100) DEFAULT NULL,
  `subbranchBank` varchar(100) DEFAULT NULL,
  `openBankName` varchar(100) DEFAULT NULL,
  `bankAccountName` varchar(100) DEFAULT NULL,
  `bankAccount` varchar(100) DEFAULT NULL,
  `accountType` varchar(20) DEFAULT NULL,
  `pay` varchar(20) DEFAULT NULL,
  `mark` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `parentNumber` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'ISMvKXpXpadDiUoOSoAfww==', 'admin00000', 'admindd000', '444', '女', '枯霜下要孤ddd0', '135331018150', '33333j@163.com0', '324320', '2014-01-01 13:58:06', '0000-00-00 00:00:00', '1', '0', '0', '0', null, '0', null, '0', '0', '个人账号', '是', '0', '审核通过', null);
INSERT INTO `user` VALUES ('6', 'super', 'GzIxZVzrt6H3g+3fJ9JUyg==', 'super', 'super', '0', '女', 'super', 'super', 'super', 'super', '2014-01-01 14:24:13', '0000-00-00 00:00:00', '0', 'super', 'super', 'super', null, 'super', null, 'super', 'super', '个人账号', '是', 'super', '待审核', '1');

-- ----------------------------
-- Table structure for userloginlist
-- ----------------------------
DROP TABLE IF EXISTS `userloginlist`;
CREATE TABLE `userloginlist` (
  `loginId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginIP` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`loginId`),
  KEY `FK_userloginlist` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userloginlist
-- ----------------------------
INSERT INTO `userloginlist` VALUES ('220', '1', '2013-12-31 20:50:11', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('221', '1', '2013-12-31 21:03:39', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('222', '1', '2013-12-31 21:04:32', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('223', '1', '2013-12-31 21:16:18', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('224', '1', '2013-12-31 21:17:06', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('225', '1', '2013-12-31 21:19:19', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('226', '1', '2013-12-31 21:21:25', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('227', '1', '2013-12-31 21:28:19', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('228', '1', '2013-12-31 21:33:34', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('229', '1', '2013-12-31 21:37:57', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('230', '1', '2013-12-31 21:41:14', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('231', '1', '2013-12-31 21:43:02', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('232', '1', '2013-12-31 21:44:29', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('233', '1', '2014-01-01 13:34:20', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('234', '1', '2014-01-01 13:56:20', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('235', '1', '2014-01-01 14:04:30', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('236', '1', '2014-01-01 14:18:09', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('237', '1', '2014-01-01 14:19:39', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('238', '1', '2014-01-01 14:34:55', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('239', '6', '2014-01-01 14:35:05', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('240', '6', '2014-01-01 14:59:35', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('241', '1', '2014-01-01 15:31:56', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('242', '6', '2014-01-01 15:32:37', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('243', '6', '2014-01-01 15:33:58', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `role_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '4');
INSERT INTO `user_role` VALUES ('6', '6');
