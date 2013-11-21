/*
MySQL Data Transfer
Source Host: localhost
Source Database: pos
Target Host: localhost
Target Database: pos
Date: 2013-11-5 14:09:27
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for article
-- ----------------------------
CREATE TABLE `article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `publishTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for log
-- ----------------------------
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userAccount` varchar(30) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `action` varchar(30) DEFAULT NULL,
  `userIP` varchar(30) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resources
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resources_role
-- ----------------------------
CREATE TABLE `resources_role` (
  `resc_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`resc_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for review
-- ----------------------------
CREATE TABLE `review` (
  `rId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `videoId` int(11) DEFAULT NULL,
  `reviews` varchar(1000) DEFAULT NULL,
  `rpublishedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
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
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `role_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for userloginlist
-- ----------------------------
CREATE TABLE `userloginlist` (
  `loginId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginIP` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`loginId`),
  KEY `FK_userloginlist` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `article` VALUES ('55', '1', 'my factory', 'welcome to my country', '2013-06-18 15:24:48');
INSERT INTO `article` VALUES ('56', '1', '维护', 'you are so kind', '2013-06-18 15:24:50');
INSERT INTO `article` VALUES ('58', '1', 'd', 'dd', '2013-06-18 15:24:51');
INSERT INTO `article` VALUES ('59', '1', 'd', '', '2013-06-18 15:24:52');
INSERT INTO `article` VALUES ('60', '1', 'd', 'd', '2013-06-18 15:24:54');
INSERT INTO `resources` VALUES ('1', '用户管理', '1010', 'sys_user', '0', 'user', '1', '用户管理');
INSERT INTO `resources` VALUES ('2', '查询用户', '1', 'sys_user_find', '1', '/background/user/query.html', '2', '查询用户');
INSERT INTO `resources` VALUES ('3', '新增用户', '1', 'sys_user_addUI', '1', '/background/user/addUI.html', '3', '新增用户');
INSERT INTO `resources` VALUES ('4', '角色管理', '1010', 'sys_role', '0', 'role', '4', '角色管理');
INSERT INTO `resources` VALUES ('5', '角色列表', '4', 'sys_role_find', '1', '/background/role/query.html', '5', '角色列表');
INSERT INTO `resources` VALUES ('6', '资源管理', '1010', 'sys_resc', '0', 'resc', '6', '资源管理');
INSERT INTO `resources` VALUES ('7', '资源列表', '6', 'sys_resc_find', '1', '/background/resources/query.html', '7', '资源列表');
INSERT INTO `resources` VALUES ('8', '添加资源', '6', 'sys_resc_addUI', '1', '/background/resources/addUI.html', '8', '添加资源');
INSERT INTO `resources` VALUES ('11', '新增角色', '4', 'sys_role_add', '1', '/background/role/addUI.html', '5', '新增角色');
INSERT INTO `resources_role` VALUES ('1', '1');
INSERT INTO `resources_role` VALUES ('1', '2');
INSERT INTO `resources_role` VALUES ('1', '3');
INSERT INTO `resources_role` VALUES ('2', '1');
INSERT INTO `resources_role` VALUES ('2', '2');
INSERT INTO `resources_role` VALUES ('2', '3');
INSERT INTO `resources_role` VALUES ('3', '2');
INSERT INTO `resources_role` VALUES ('3', '3');
INSERT INTO `resources_role` VALUES ('4', '1');
INSERT INTO `resources_role` VALUES ('4', '2');
INSERT INTO `resources_role` VALUES ('4', '3');
INSERT INTO `resources_role` VALUES ('5', '1');
INSERT INTO `resources_role` VALUES ('5', '2');
INSERT INTO `resources_role` VALUES ('5', '3');
INSERT INTO `resources_role` VALUES ('6', '1');
INSERT INTO `resources_role` VALUES ('6', '2');
INSERT INTO `resources_role` VALUES ('6', '8');
INSERT INTO `resources_role` VALUES ('7', '1');
INSERT INTO `resources_role` VALUES ('7', '2');
INSERT INTO `resources_role` VALUES ('7', '8');
INSERT INTO `resources_role` VALUES ('8', '1');
INSERT INTO `resources_role` VALUES ('8', '2');
INSERT INTO `resources_role` VALUES ('8', '8');
INSERT INTO `resources_role` VALUES ('11', '1');
INSERT INTO `resources_role` VALUES ('11', '2');
INSERT INTO `resources_role` VALUES ('11', '3');
INSERT INTO `resources_role` VALUES ('1010', '1');
INSERT INTO `resources_role` VALUES ('1010', '2');
INSERT INTO `resources_role` VALUES ('1010', '3');
INSERT INTO `resources_role` VALUES ('1010', '8');
INSERT INTO `review` VALUES ('1', '1', '2', '不错', '2013-02-06 17:28:32');
INSERT INTO `review` VALUES ('4', '2', '1', '学习难点', '2013-05-17 17:35:24');
INSERT INTO `review` VALUES ('6', '2', '7', '视频网站很不错', '2013-05-21 10:15:09');
INSERT INTO `review` VALUES ('7', '2', '7', '继续关注', '2013-05-21 10:15:49');
INSERT INTO `role` VALUES ('1', '用户角色', 'ROLE_USER', '用户角色', '1');
INSERT INTO `role` VALUES ('3', '删除', 'ROLE_DELETE', '删除', '0');
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'admin', 'admin', '10', '男', '枯霜下要孤', '0253526', 'jnfjfjj@163.com', '32432', '2013-06-18 10:37:11', '0000-00-00 00:00:00', '1');
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `userloginlist` VALUES ('101', '1', '2013-11-04 16:12:54', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('102', '1', '2013-11-04 16:19:05', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('103', '1', '2013-11-04 16:33:05', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('104', '1', '2013-11-04 16:35:21', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('105', '1', '2013-11-04 17:13:03', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('106', '1', '2013-11-04 17:45:57', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('107', '1', '2013-11-04 17:52:06', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('108', '1', '2013-11-04 17:59:28', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('109', '1', '2013-11-04 18:03:57', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('110', '1', '2013-11-04 18:16:04', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('111', '1', '2013-11-04 18:22:47', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('112', '1', '2013-11-04 20:43:25', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('113', '1', '2013-11-04 21:16:08', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('114', '1', '2013-11-04 21:20:28', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('115', '1', '2013-11-04 21:34:46', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('116', '1', '2013-11-04 21:57:27', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('117', '1', '2013-11-04 21:59:40', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('118', '1', '2013-11-04 22:02:20', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('119', '1', '2013-11-04 22:11:08', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('120', '1', '2013-11-04 22:13:17', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('121', '1', '2013-11-04 22:25:17', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('122', '1', '2013-11-04 22:26:24', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('123', '1', '2013-11-05 10:43:16', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('124', '1', '2013-11-05 10:46:23', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('125', '1', '2013-11-05 11:15:12', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('126', '1', '2013-11-05 11:18:26', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('127', '1', '2013-11-05 11:41:47', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('128', '1', '2013-11-05 11:42:41', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('129', '1', '2013-11-05 11:45:25', '0:0:0:0:0:0:0:1');
