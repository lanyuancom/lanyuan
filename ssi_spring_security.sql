/*
MySQL Data Transfer
Source Host: localhost
Source Database: ssi_spring_security
Target Host: localhost
Target Database: ssi_spring_security
Date: 2013-11-24 18:52:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for log
-- ----------------------------
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `action` varchar(30) DEFAULT NULL,
  `actionTime` varchar(30) DEFAULT NULL,
  `userIP` varchar(30) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resources_role
-- ----------------------------
CREATE TABLE `resources_role` (
  `resc_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`resc_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for serverinfo
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `log` VALUES ('6', 'admin', '资源管理', 'save操作', '31', '10.108.1.100', '2013-11-21 15:30:33');
INSERT INTO `log` VALUES ('7', 'admin', '资源管理', 'save操作', '54', '10.108.1.100', '2013-11-21 15:32:24');
INSERT INTO `log` VALUES ('8', 'admin', '资源管理', 'save操作', '87', '10.108.1.100', '2013-11-21 15:32:38');
INSERT INTO `log` VALUES ('9', 'admin', '角色管理', 'update用户的角色', '11', '10.108.1.100', '2013-11-21 15:36:53');
INSERT INTO `log` VALUES ('10', 'admin', '用户管理', 'update用户的角色', '3', '10.108.1.100', '2013-11-21 15:37:01');
INSERT INTO `log` VALUES ('11', 'admin', '资源管理', 'update角色的权限', '128', '10.108.1.100', '2013-11-21 15:37:04');
INSERT INTO `log` VALUES ('12', 'admin', '用户管理', 'update用户的角色', '7', '10.108.1.100', '2013-11-21 15:38:34');
INSERT INTO `log` VALUES ('13', 'admin', '用户管理', 'update用户的角色', '5', '10.108.1.100', '2013-11-21 15:39:06');
INSERT INTO `log` VALUES ('14', 'admin', '资源管理', 'update角色的权限', '83', '10.108.1.100', '2013-11-21 15:41:12');
INSERT INTO `log` VALUES ('15', 'admin', '角色管理', 'update用户的角色', '71', '10.108.1.100', '2013-11-21 15:42:43');
INSERT INTO `log` VALUES ('16', 'admin', '角色管理', 'save操作', '15', '10.108.1.100', '2013-11-21 15:43:08');
INSERT INTO `log` VALUES ('17', 'admin', '资源管理', 'save操作', '2', '10.108.1.100', '2013-11-21 16:21:50');
INSERT INTO `log` VALUES ('18', 'admin', '资源管理', 'save操作', '36', '10.108.1.100', '2013-11-21 16:22:17');
INSERT INTO `log` VALUES ('19', 'admin', '资源管理', 'update操作', '75', '10.108.1.100', '2013-11-21 16:22:29');
INSERT INTO `log` VALUES ('20', 'admin', '资源管理', 'save操作', '28', '10.108.1.100', '2013-11-21 16:25:36');
INSERT INTO `log` VALUES ('21', 'admin', '资源管理', 'save操作', '39', '10.108.1.100', '2013-11-21 16:26:03');
INSERT INTO `log` VALUES ('22', 'admin', '资源管理', 'update操作', '3', '10.108.1.100', '2013-11-21 16:26:56');
INSERT INTO `log` VALUES ('23', 'admin', '资源管理', 'update操作', '5', '10.108.1.100', '2013-11-21 16:27:02');
INSERT INTO `log` VALUES ('24', 'admin', '资源管理', 'update操作', '5', '10.108.1.100', '2013-11-21 16:27:12');
INSERT INTO `log` VALUES ('25', 'admin', '资源管理', 'update操作', '3', '10.108.1.100', '2013-11-21 16:27:20');
INSERT INTO `log` VALUES ('26', 'admin', '资源管理', 'update角色的权限', '77', '10.108.1.100', '2013-11-21 16:27:35');
INSERT INTO `log` VALUES ('27', 'admin', '资源管理', 'save操作', '35', '10.108.1.100', '2013-11-21 16:33:26');
INSERT INTO `log` VALUES ('28', 'admin', '资源管理', 'save操作', '2', '10.108.1.100', '2013-11-21 16:33:58');
INSERT INTO `log` VALUES ('29', 'admin', '资源管理', 'save操作', '4', '10.108.1.100', '2013-11-21 16:34:21');
INSERT INTO `log` VALUES ('30', 'admin', '资源管理', 'save操作', '3', '10.108.1.100', '2013-11-21 16:34:54');
INSERT INTO `log` VALUES ('31', 'admin', '资源管理', 'save操作', '43', '10.108.1.100', '2013-11-21 16:35:50');
INSERT INTO `log` VALUES ('32', 'admin', '资源管理', 'save操作', '24', '10.108.1.100', '2013-11-21 16:36:24');
INSERT INTO `log` VALUES ('33', 'admin', '资源管理', 'save操作', '45', '10.108.1.100', '2013-11-21 16:36:53');
INSERT INTO `log` VALUES ('34', 'admin', '资源管理', 'update角色的权限', '120', '10.108.1.100', '2013-11-21 16:37:38');
INSERT INTO `log` VALUES ('35', 'admin', '资源管理', 'update操作', '4', '10.108.1.100', '2013-11-21 16:38:03');
INSERT INTO `log` VALUES ('36', 'admin', '资源管理', 'update操作', '30', '10.108.1.100', '2013-11-21 16:38:11');
INSERT INTO `log` VALUES ('37', 'admin', '资源管理', 'update操作', '34', '10.108.1.100', '2013-11-21 16:38:20');
INSERT INTO `log` VALUES ('38', 'admin', '资源管理', 'update操作', '4', '10.108.1.100', '2013-11-21 16:49:14');
INSERT INTO `log` VALUES ('39', 'admin', '资源管理', 'update操作', '26', '10.108.1.100', '2013-11-21 16:49:37');
INSERT INTO `log` VALUES ('40', 'admin', '资源管理', 'update操作', '4', '10.108.1.100', '2013-11-21 16:50:30');
INSERT INTO `log` VALUES ('41', 'admin', '资源管理', 'update操作', '2', '10.108.1.100', '2013-11-21 16:51:09');
INSERT INTO `log` VALUES ('42', 'admin', '资源管理', 'update操作', '7', '10.108.1.100', '2013-11-21 16:51:32');
INSERT INTO `log` VALUES ('43', 'admin', '资源管理', 'update操作', '41', '10.108.1.100', '2013-11-21 16:51:52');
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
INSERT INTO `resources_role` VALUES ('1', '1');
INSERT INTO `resources_role` VALUES ('1', '3');
INSERT INTO `resources_role` VALUES ('2', '1');
INSERT INTO `resources_role` VALUES ('2', '3');
INSERT INTO `resources_role` VALUES ('3', '1');
INSERT INTO `resources_role` VALUES ('3', '3');
INSERT INTO `resources_role` VALUES ('4', '1');
INSERT INTO `resources_role` VALUES ('4', '3');
INSERT INTO `resources_role` VALUES ('5', '1');
INSERT INTO `resources_role` VALUES ('5', '3');
INSERT INTO `resources_role` VALUES ('6', '1');
INSERT INTO `resources_role` VALUES ('6', '3');
INSERT INTO `resources_role` VALUES ('7', '1');
INSERT INTO `resources_role` VALUES ('7', '3');
INSERT INTO `resources_role` VALUES ('8', '1');
INSERT INTO `resources_role` VALUES ('8', '3');
INSERT INTO `resources_role` VALUES ('11', '1');
INSERT INTO `resources_role` VALUES ('11', '3');
INSERT INTO `resources_role` VALUES ('18', '1');
INSERT INTO `resources_role` VALUES ('18', '3');
INSERT INTO `resources_role` VALUES ('19', '1');
INSERT INTO `resources_role` VALUES ('19', '3');
INSERT INTO `resources_role` VALUES ('20', '1');
INSERT INTO `resources_role` VALUES ('20', '3');
INSERT INTO `resources_role` VALUES ('21', '1');
INSERT INTO `resources_role` VALUES ('21', '3');
INSERT INTO `resources_role` VALUES ('22', '1');
INSERT INTO `resources_role` VALUES ('22', '3');
INSERT INTO `resources_role` VALUES ('23', '1');
INSERT INTO `resources_role` VALUES ('23', '3');
INSERT INTO `resources_role` VALUES ('39', '1');
INSERT INTO `resources_role` VALUES ('40', '1');
INSERT INTO `resources_role` VALUES ('41', '1');
INSERT INTO `resources_role` VALUES ('42', '1');
INSERT INTO `resources_role` VALUES ('43', '1');
INSERT INTO `resources_role` VALUES ('44', '1');
INSERT INTO `resources_role` VALUES ('45', '1');
INSERT INTO `resources_role` VALUES ('46', '1');
INSERT INTO `resources_role` VALUES ('47', '1');
INSERT INTO `resources_role` VALUES ('48', '1');
INSERT INTO `resources_role` VALUES ('49', '1');
INSERT INTO `resources_role` VALUES ('50', '1');
INSERT INTO `resources_role` VALUES ('51', '1');
INSERT INTO `resources_role` VALUES ('1010', '1');
INSERT INTO `resources_role` VALUES ('1010', '3');
INSERT INTO `role` VALUES ('1', '用户角色', 'ROLE_USER', '用户角色', '1');
INSERT INTO `role` VALUES ('3', '删除', 'ROLE_DELETE', '删除', '0');
INSERT INTO `role` VALUES ('5', '55', '55', '55', '1');
INSERT INTO `serverinfo` VALUES ('1', '9.3', '20', '64.0', '80', '75.0', '80', '1212614949@qq.com', '2013-11-19 11:31:04', '<font color=\'red\'>内存当前：75.0%,超出预设值  60%</font>');
INSERT INTO `serverinfo` VALUES ('2', '0.8', '20', '60.0', '80', '75.0', '80', '1212614949@qq.com', '2013-11-19 11:32:02', '<font color=\'red\'>内存当前：75.0%,超出预设值  60%</font>');
INSERT INTO `serverinfo` VALUES ('3', '1.5', '20', '59.0', '80', '75.0', '80', '1212614949@qq.com', '2013-11-19 11:33:03', '<font color=\'red\'>内存当前：75.0%,超出预设值  60%</font>');
INSERT INTO `serverinfo` VALUES ('4', '0.7', '20', '57.0', '80', '75.0', '80', '1212614949@qq.com', '2013-11-19 11:34:02', '<font color=\'red\'>内存当前：75.0%,超出预设值  60%</font>');
INSERT INTO `serverinfo` VALUES ('5', '2.3', '20', '57.0', '80', '75.0', '80', '1212614949@qq.com', '2013-11-19 11:35:02', '<font color=\'red\'>内存当前：75.0%,超出预设值  60%</font>');
INSERT INTO `serverinfo` VALUES ('6', '17.9', '20', '57.0', '80', '77.0', '80', '1212614949@qq.com', '2013-11-19 11:36:02', '<font color=\'red\'>内存当前：77.0%,超出预设值  60%</font>');
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'admin', 'admin', '10', '男', '枯霜下要孤', '0253526', 'jnfjfjj@163.com', '32432', '2013-06-18 10:37:11', '0000-00-00 00:00:00', '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('3', '6', '6', '7', '7', '7', '男', '7', '7', '7', '7', '2013-11-18 14:35:43', '0000-00-00 00:00:00', '1', '7', '7', '7', null, '7', null, '7', '7', '企业账号', '是', '7', '待审核', '');
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('3', '1');
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
INSERT INTO `userloginlist` VALUES ('130', '1', '2013-11-05 14:11:25', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('131', '1', '2013-11-05 14:26:29', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('132', '1', '2013-11-05 14:31:07', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('133', '1', '2013-11-05 14:51:58', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('134', '1', '2013-11-05 14:54:49', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('135', '3', '2013-11-05 14:56:22', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('136', '1', '2013-11-05 15:40:32', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('137', '3', '2013-11-05 15:41:52', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('138', '1', '2013-11-05 15:44:03', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('139', '1', '2013-11-05 15:44:27', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('140', '3', '2013-11-05 15:52:58', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('141', '1', '2013-11-05 15:55:45', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('142', '1', '2013-11-06 16:23:46', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('143', '1', '2013-11-06 16:38:11', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('144', '1', '2013-11-06 17:00:22', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('145', '1', '2013-11-08 15:45:32', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('146', '1', '2013-11-08 15:46:04', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('147', '1', '2013-11-08 15:53:57', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('148', '1', '2013-11-08 15:55:21', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('149', '1', '2013-11-13 16:21:31', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('150', '1', '2013-11-13 16:37:42', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('151', '1', '2013-11-13 16:39:19', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('152', '1', '2013-11-13 16:41:03', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('153', '1', '2013-11-13 16:46:57', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('154', '1', '2013-11-13 16:59:56', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('155', '1', '2013-11-13 17:15:12', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('156', '1', '2013-11-13 17:20:57', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('157', '1', '2013-11-14 11:46:39', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('158', '1', '2013-11-14 14:19:02', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('159', '1', '2013-11-14 14:48:38', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('160', '1', '2013-11-14 15:08:41', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('161', '1', '2013-11-14 15:12:31', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('162', '1', '2013-11-14 16:20:02', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('163', '1', '2013-11-14 16:28:18', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('164', '1', '2013-11-14 16:47:11', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('165', '1', '2013-11-14 16:49:46', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('166', '1', '2013-11-14 16:50:42', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('167', '1', '2013-11-15 09:55:53', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('168', '1', '2013-11-15 10:49:32', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('169', '1', '2013-11-15 10:51:01', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('170', '1', '2013-11-15 10:51:49', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('171', '1', '2013-11-15 11:03:00', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('172', '1', '2013-11-15 11:25:52', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('173', '1', '2013-11-15 11:35:25', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('174', '1', '2013-11-15 11:57:25', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('175', '1', '2013-11-15 14:04:34', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('176', '1', '2013-11-15 14:46:41', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('177', '1', '2013-11-15 14:48:38', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('178', '1', '2013-11-15 14:52:55', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('179', '1', '2013-11-15 14:58:29', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('180', '1', '2013-11-15 14:59:42', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('181', '1', '2013-11-15 15:09:22', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('182', '1', '2013-11-15 15:16:16', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('183', '1', '2013-11-15 15:29:42', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('184', '1', '2013-11-15 15:30:30', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('185', '1', '2013-11-15 16:29:54', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('186', '1', '2013-11-15 17:01:53', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('187', '1', '2013-11-15 18:37:40', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('188', '1', '2013-11-15 20:25:24', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('189', '1', '2013-11-15 21:54:26', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('190', '1', '2013-11-15 23:11:51', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('191', '3', '2013-11-17 22:53:13', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('192', '3', '2013-11-17 23:37:23', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('193', '3', '2013-11-17 23:39:36', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('194', '3', '2013-11-18 09:16:29', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('195', '3', '2013-11-18 10:20:14', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('196', '3', '2013-11-18 10:22:39', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('197', '3', '2013-11-18 10:27:07', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('198', '3', '2013-11-18 10:30:13', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('199', '3', '2013-11-18 11:12:21', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('200', '3', '2013-11-18 11:21:12', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('201', '3', '2013-11-18 11:27:30', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('202', '3', '2013-11-18 11:30:44', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('203', '3', '2013-11-18 11:42:52', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('204', '3', '2013-11-18 14:08:59', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('205', '4', '2013-11-18 14:56:57', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('206', '5', '2013-11-18 15:03:07', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('207', '1', '2013-11-19 10:58:20', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('208', '1', '2013-11-19 11:05:03', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('209', '1', '2013-11-19 11:12:13', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('210', '1', '2013-11-19 15:09:02', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('211', '1', '2013-11-19 15:14:07', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('212', '1', '2013-11-19 15:20:27', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('213', '1', '2013-11-19 15:22:25', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('214', '1', '2013-11-19 15:32:52', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('215', '1', '2013-11-19 15:35:00', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('216', '1', '2013-11-19 15:39:08', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('217', '1', '2013-11-19 15:41:06', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('218', '1', '2013-11-19 15:47:46', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('219', '1', '2013-11-19 16:12:14', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('220', '1', '2013-11-19 16:52:49', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('221', '1', '2013-11-19 17:10:34', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('222', '1', '2013-11-19 17:14:31', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('223', '1', '2013-11-20 14:17:27', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('224', '1', '2013-11-20 14:39:22', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('225', '1', '2013-11-20 14:45:03', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('226', '1', '2013-11-20 14:53:36', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('227', '1', '2013-11-20 15:09:28', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('228', '1', '2013-11-20 15:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('229', '1', '2013-11-20 15:18:39', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('230', '1', '2013-11-20 15:25:04', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('231', '1', '2013-11-20 15:35:30', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('232', '1', '2013-11-20 16:18:31', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('233', '1', '2013-11-20 16:50:38', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('234', '1', '2013-11-20 16:54:40', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('235', '1', '2013-11-20 17:04:53', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('236', '1', '2013-11-20 17:06:44', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('237', '1', '2013-11-20 17:12:52', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('238', '1', '2013-11-20 17:18:24', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('239', '1', '2013-11-20 17:23:01', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('240', '1', '2013-11-20 17:26:27', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('241', '1', '2013-11-20 17:29:58', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('242', '1', '2013-11-21 10:11:26', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('243', '1', '2013-11-21 10:34:39', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('244', '1', '2013-11-21 10:40:29', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('245', '1', '2013-11-21 11:16:10', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('246', '1', '2013-11-21 11:36:05', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('247', '1', '2013-11-21 11:39:11', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('248', '1', '2013-11-21 11:47:19', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('252', '1', '2013-11-21 15:19:58', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('253', '1', '2013-11-21 15:22:33', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('254', '1', '2013-11-21 15:25:35', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('255', '1', '2013-11-21 15:27:56', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('256', '1', '2013-11-21 15:29:57', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('257', '1', '2013-11-21 15:36:41', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('258', '1', '2013-11-21 15:40:06', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('259', '1', '2013-11-21 15:41:23', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('260', '1', '2013-11-21 15:45:14', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('261', '1', '2013-11-21 16:27:52', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('262', '1', '2013-11-21 16:37:45', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('263', '1', '2013-11-21 16:41:06', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('264', '1', '2013-11-21 16:46:10', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('265', '1', '2013-11-21 16:47:10', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('266', '1', '2013-11-21 21:52:00', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('267', '1', '2013-11-22 14:30:27', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('268', '1', '2013-11-22 14:32:51', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('269', '1', '2013-11-22 14:38:04', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('270', '1', '2013-11-22 14:41:17', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('271', '1', '2013-11-22 14:43:15', '0:0:0:0:0:0:0:1');
INSERT INTO `userloginlist` VALUES ('272', '1', '2013-11-22 15:07:59', '0:0:0:0:0:0:0:1');
