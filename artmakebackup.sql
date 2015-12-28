/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : artmake

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-12-28 09:16:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bn_article`
-- ----------------------------
DROP TABLE IF EXISTS `bn_article`;
CREATE TABLE `bn_article` (
  `article_id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text,
  `image` varchar(80) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0：资讯，1：广告',
  `uptime` datetime NOT NULL,
  `person_id` int(12) DEFAULT NULL,
  `time` varchar(80) DEFAULT NULL,
  `pass` int(11) NOT NULL,
  `column_id` varchar(40) DEFAULT NULL,
  `video` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `pid` (`person_id`),
  CONSTRAINT `pid` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_article
-- ----------------------------

-- ----------------------------
-- Table structure for `bn_auth`
-- ----------------------------
DROP TABLE IF EXISTS `bn_auth`;
CREATE TABLE `bn_auth` (
  `auth_id` int(12) NOT NULL AUTO_INCREMENT,
  `role_id` int(12) DEFAULT NULL,
  `upnum` int(12) DEFAULT NULL,
  `totalnum` int(12) DEFAULT NULL,
  `lasttime` int(12) DEFAULT NULL,
  PRIMARY KEY (`auth_id`),
  KEY `authrole` (`role_id`),
  CONSTRAINT `authrole` FOREIGN KEY (`role_id`) REFERENCES `bn_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_auth
-- ----------------------------
INSERT INTO `bn_auth` VALUES ('1', '2', '5', '10', '48');
INSERT INTO `bn_auth` VALUES ('2', '3', '8', '16', '72');
INSERT INTO `bn_auth` VALUES ('3', '4', '12', '24', '120');
INSERT INTO `bn_auth` VALUES ('4', '5', '18', '36', '196');
INSERT INTO `bn_auth` VALUES ('5', '6', '30', '60', '360');

-- ----------------------------
-- Table structure for `bn_demand`
-- ----------------------------
DROP TABLE IF EXISTS `bn_demand`;
CREATE TABLE `bn_demand` (
  `demand_id` int(12) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `person_id` int(12) NOT NULL,
  `introduce` varchar(200) DEFAULT NULL,
  `uptime` datetime NOT NULL,
  `pass` int(11) DEFAULT '0',
  `key_id` int(12) DEFAULT NULL,
  `state` int(1) DEFAULT NULL COMMENT '1:未完成 -1:已完成',
  PRIMARY KEY (`demand_id`),
  KEY `dem_person_id` (`person_id`),
  KEY `key_id` (`key_id`),
  CONSTRAINT `dem_person_id` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `key_id` FOREIGN KEY (`key_id`) REFERENCES `bn_key` (`key_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_demand
-- ----------------------------

-- ----------------------------
-- Table structure for `bn_key`
-- ----------------------------
DROP TABLE IF EXISTS `bn_key`;
CREATE TABLE `bn_key` (
  `key_id` int(12) NOT NULL AUTO_INCREMENT,
  `times` int(10) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `keyname` varchar(20) NOT NULL,
  PRIMARY KEY (`key_id`),
  KEY `keyname` (`keyname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_key
-- ----------------------------
INSERT INTO `bn_key` VALUES ('1', '0', '无');
INSERT INTO `bn_key` VALUES ('2', '0', '青花');
INSERT INTO `bn_key` VALUES ('3', '0', '字');
INSERT INTO `bn_key` VALUES ('4', '0', '木雕');
INSERT INTO `bn_key` VALUES ('5', '0', '玉器');
INSERT INTO `bn_key` VALUES ('6', '0', '根雕');
INSERT INTO `bn_key` VALUES ('7', '0', '画');
INSERT INTO `bn_key` VALUES ('8', '0', '陶器');

-- ----------------------------
-- Table structure for `bn_message`
-- ----------------------------
DROP TABLE IF EXISTS `bn_message`;
CREATE TABLE `bn_message` (
  `message_id` int(12) NOT NULL AUTO_INCREMENT,
  `from_pid` int(12) NOT NULL,
  `to_pid` int(12) NOT NULL,
  `content` longtext NOT NULL,
  `messagetime` datetime NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0:未读；1已读',
  PRIMARY KEY (`message_id`),
  KEY `to_pid` (`to_pid`),
  KEY `from_pid` (`from_pid`),
  CONSTRAINT `from_pid` FOREIGN KEY (`from_pid`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `to_pid` FOREIGN KEY (`to_pid`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_message
-- ----------------------------

-- ----------------------------
-- Table structure for `bn_order`
-- ----------------------------
DROP TABLE IF EXISTS `bn_order`;
CREATE TABLE `bn_order` (
  `order_id` int(12) NOT NULL AUTO_INCREMENT,
  `person_id` int(12) NOT NULL,
  `buytime` datetime NOT NULL,
  `demand_id` int(12) DEFAULT NULL,
  `product_id` int(12) DEFAULT NULL,
  `type` int(1) NOT NULL COMMENT '0:product 1:demand',
  `state` int(1) NOT NULL COMMENT '0:未完成 1:已完成',
  PRIMARY KEY (`order_id`),
  KEY `ordper` (`person_id`),
  KEY `producter` (`product_id`),
  KEY `demander` (`demand_id`),
  CONSTRAINT `demander` FOREIGN KEY (`demand_id`) REFERENCES `bn_demand` (`demand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordper` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producter` FOREIGN KEY (`product_id`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_order
-- ----------------------------

-- ----------------------------
-- Table structure for `bn_person`
-- ----------------------------
DROP TABLE IF EXISTS `bn_person`;
CREATE TABLE `bn_person` (
  `person_id` int(12) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `introduce` varchar(80) DEFAULT NULL,
  `state` int(1) DEFAULT NULL COMMENT '0:未完善；1:已经完善-1:已经被禁用',
  `role_id` int(12) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `bn_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_person
-- ----------------------------
INSERT INTO `bn_person` VALUES ('1', 'admin', '1', '王辉灿', '329669642@qq.com', '15659824572', '福建', '男', '329669642', '350583199501234358', '超级管理员', '0', '10');

-- ----------------------------
-- Table structure for `bn_proaction`
-- ----------------------------
DROP TABLE IF EXISTS `bn_proaction`;
CREATE TABLE `bn_proaction` (
  `action_id` int(12) NOT NULL AUTO_INCREMENT,
  `product_id` int(12) NOT NULL,
  `startprice` double NOT NULL,
  `addprice` double(11,0) NOT NULL,
  `lasttime` int(10) NOT NULL,
  `introduce` varchar(80) DEFAULT NULL,
  `endtime` datetime NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '0:未生成订单，1：已生成订单',
  `recordtime` datetime NOT NULL,
  PRIMARY KEY (`action_id`),
  KEY `rproid` (`product_id`),
  CONSTRAINT `rproid` FOREIGN KEY (`product_id`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_proaction
-- ----------------------------

-- ----------------------------
-- Table structure for `bn_product`
-- ----------------------------
DROP TABLE IF EXISTS `bn_product`;
CREATE TABLE `bn_product` (
  `product_id` int(12) NOT NULL AUTO_INCREMENT,
  `productname` varchar(40) NOT NULL,
  `price` double DEFAULT NULL COMMENT '现在的价格',
  `introduce` varchar(80) DEFAULT NULL,
  `uptime` datetime NOT NULL,
  `person_id` int(12) DEFAULT NULL,
  `state` int(1) NOT NULL COMMENT '0:展示；1拍卖中；-1:已售出',
  `pass` int(1) NOT NULL DEFAULT '0' COMMENT '0:未通过；1：已通过',
  PRIMARY KEY (`product_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `person_id` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_product
-- ----------------------------

-- ----------------------------
-- Table structure for `bn_role`
-- ----------------------------
DROP TABLE IF EXISTS `bn_role`;
CREATE TABLE `bn_role` (
  `role_id` int(12) NOT NULL AUTO_INCREMENT,
  `role_code` int(4) NOT NULL COMMENT '0:代表普通用户,1-5:代表5个级别的艺术家；10：代表管理员;99:代表超级管理员',
  `rolename` varchar(20) NOT NULL,
  `frolename` varchar(20) DEFAULT NULL COMMENT '下一级角色',
  PRIMARY KEY (`role_id`),
  KEY `frole` (`frolename`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_role
-- ----------------------------
INSERT INTO `bn_role` VALUES ('1', '0', '用户', '低级艺术家');
INSERT INTO `bn_role` VALUES ('2', '5', '低级艺术家', '初级艺术家');
INSERT INTO `bn_role` VALUES ('3', '5', '初级艺术家', '中级艺术家');
INSERT INTO `bn_role` VALUES ('4', '5', '中级艺术家', '高级艺术家');
INSERT INTO `bn_role` VALUES ('5', '5', '高级艺术家', '顶级艺术家');
INSERT INTO `bn_role` VALUES ('6', '5', '顶级艺术家', '');
INSERT INTO `bn_role` VALUES ('7', '10', '采编人员', '');
INSERT INTO `bn_role` VALUES ('8', '20', '主编人员', '');
INSERT INTO `bn_role` VALUES ('9', '50', '管理员', '');
INSERT INTO `bn_role` VALUES ('10', '100', '超级管理员', '');

-- ----------------------------
-- Table structure for `rl_demkey`
-- ----------------------------
DROP TABLE IF EXISTS `rl_demkey`;
CREATE TABLE `rl_demkey` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `demand_id` int(12) NOT NULL,
  `key_id` int(12) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `key_product` (`demand_id`),
  KEY `product_key` (`key_id`),
  CONSTRAINT `rl_demkey_ibfk_1` FOREIGN KEY (`demand_id`) REFERENCES `bn_demand` (`demand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rl_demkey_ibfk_2` FOREIGN KEY (`key_id`) REFERENCES `bn_key` (`key_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_demkey
-- ----------------------------

-- ----------------------------
-- Table structure for `rl_demrecord`
-- ----------------------------
DROP TABLE IF EXISTS `rl_demrecord`;
CREATE TABLE `rl_demrecord` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `demand_id` int(12) NOT NULL,
  `person_id` int(12) NOT NULL,
  `message` varchar(40) NOT NULL,
  `recordtime` datetime NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `demrecord` (`demand_id`),
  KEY `personrecord` (`person_id`),
  CONSTRAINT `demrecord` FOREIGN KEY (`demand_id`) REFERENCES `bn_demand` (`demand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personrecord` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_demrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `rl_perkey`
-- ----------------------------
DROP TABLE IF EXISTS `rl_perkey`;
CREATE TABLE `rl_perkey` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `person_id` int(12) NOT NULL,
  `key_id` int(12) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `keyperson` (`key_id`),
  KEY `personkey` (`person_id`),
  CONSTRAINT `keyperson` FOREIGN KEY (`key_id`) REFERENCES `bn_key` (`key_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personkey` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_perkey
-- ----------------------------

-- ----------------------------
-- Table structure for `rl_proimg`
-- ----------------------------
DROP TABLE IF EXISTS `rl_proimg`;
CREATE TABLE `rl_proimg` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `product_id` int(12) NOT NULL,
  `flag` int(1) DEFAULT '0' COMMENT '1:主图 0:次图',
  `image` varchar(80) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `img_product_Id` (`product_id`),
  CONSTRAINT `img_product_Id` FOREIGN KEY (`product_id`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_proimg
-- ----------------------------

-- ----------------------------
-- Table structure for `rl_prorecord`
-- ----------------------------
DROP TABLE IF EXISTS `rl_prorecord`;
CREATE TABLE `rl_prorecord` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `action_id` int(12) DEFAULT NULL,
  `product_id` int(12) DEFAULT NULL,
  `person_id` int(12) NOT NULL,
  `price` double NOT NULL,
  `recordtime` datetime NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `rel_person_id` (`person_id`),
  KEY `rel_actionid` (`action_id`) USING BTREE,
  KEY `rel_product_id` (`product_id`),
  CONSTRAINT `rel_action_id` FOREIGN KEY (`action_id`) REFERENCES `bn_proaction` (`action_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_person_id` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_product_id` FOREIGN KEY (`product_id`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_prorecord
-- ----------------------------
