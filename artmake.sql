/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : artmake

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-12-27 06:07:40
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_article
-- ----------------------------
INSERT INTO `bn_article` VALUES ('16', '大广告2', null, '1449944620157.jpg', '1', '2015-12-14 10:59:22', '2', '2015-12-14,2015-12-15', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('23', '第一次大广告', '<p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p>', '1450105816162.jpg', '1', '2015-12-14 23:10:16', '2', '2015-12-14,2015-12-15,2015-12-16', '1', 'small', null);
INSERT INTO `bn_article` VALUES ('24', '第二个广告了', '<p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad<img src=\"http://img.baidu.com/hi/jx2/j_0059.gif\"/></p>', '1450105916038.jpg', '1', '2015-12-14 23:11:56', '2', '2015-12-15,2015-12-17', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('25', '你猜是什么广告', '<p><br/></p><p>大大大</p><blockquote><p>大大大</p></blockquote><p>大大大</p><blockquote><p>大大大</p></blockquote>', '1450112369538.jpg', '1', '2015-12-15 00:59:29', '2', '2015-12-15', '1', 'small', null);
INSERT INTO `bn_article` VALUES ('26', '这是一篇咨询', '<p>打第三大的</p><p>dasd爱的</p><p><br/></p><p>大大大</p><p><br/></p><p><br/></p><p>大苏打</p>', '1450112487855.jpg', '1', '2015-12-15 01:01:27', '1', '2015-12-16,2015-12-16,', '1', null, null);
INSERT INTO `bn_article` VALUES ('27', 'lalala', '<p>111</p>', '1450113047790.jpg', '1', '2015-12-15 01:10:47', '2', '2015-12-15,2015-12-15', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('29', 'adsadffsdfsa', '<p>dsadad</p><p>ads</p><p>d</p><p>a</p><p>sd</p><p>ad</p><p>a</p><p>d</p><p>ad</p><p>a</p><p><br/></p>', '1450113105733.jpg', '1', '2015-12-15 01:11:45', '2', '2015-12-15', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('30', 'wanghuicandsadad', '<p>dasdasd</p><p>ad</p><p>sa</p><p>d</p><p>ad</p><p>a</p><p>sd</p><p>ad</p><p>a</p>', '1450113165841.jpg', '1', '2015-12-15 01:12:45', '2', '2015-12-15', '1', 'small', null);
INSERT INTO `bn_article` VALUES ('31', 'wada', '<p>dsadasjdlkajdslada</p><p>d</p><p>sad</p><p>a</p><p>d</p><p>asd</p><p>a</p><p>d</p><p>asd</p><p><br/></p><p>asd</p><p>a</p>', '1450113186043.jpg', '1', '2015-12-15 01:13:06', '2', '2015-12-15', '1', 'small', null);
INSERT INTO `bn_article` VALUES ('33', '十大啊啊啊啊啊啊啊啊', '<p>湿哒哒</p>', '1450113888170.jpg', '1', '2015-12-15 01:24:48', null, '2015-12-16', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('34', '这是广告', '<p>这是广告</p><p>这是广告</p><p>这是广告</p><p>这是广告</p><p>这是广告</p><p>这是广告</p><p>这是广告</p><p>这是广告</p><p>这是广告</p>', '1450369290051.jpg', '1', '2015-12-18 00:21:30', null, '2015-12-18,2015-12-19', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('35', '今天的广告', '<p><br/></p><p>asfdada</p><p>asfdada</p><p>asfdada</p><p>asfdada</p><p>asfdada</p><p>asfdada</p>', '1450558906854.jpg', '1', '2015-12-20 05:01:46', '2', '2015-12-20', '1', 'small', null);
INSERT INTO `bn_article` VALUES ('36', '11111', '<p>13221</p>', '1450708535267.jpg', '0', '2015-12-21 22:35:35', '1', '2015-12-21', '1', null, null);
INSERT INTO `bn_article` VALUES ('37', '1111', '<p>2312</p>', '1450708543558.jpg', '0', '2015-12-21 22:35:43', '1', '2015-12-21', '1', null, null);
INSERT INTO `bn_article` VALUES ('38', '232312', '<p>3213123</p>', '1450708569617.jpg', '1', '2015-12-21 22:36:09', null, '2015-12-21', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('39', '323123343', '<p>dsadad</p>', '1450708583350.jpg', '1', '2015-12-21 22:36:23', '2', '2015-12-21', '1', 'small', null);
INSERT INTO `bn_article` VALUES ('40', 'esadsada', '<p>gfdsgd&nbsp;</p>', '1450708593399.jpg', '1', '2015-12-21 22:36:33', null, '2015-12-25', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('41', '2222', '<p>adadada</p>', '1450709898358.jpg', '1', '2015-12-21 22:58:18', null, '2015-12-25', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('43', 'dsada', '<p>dsadad</p>', '1450722487466.jpg', '0', '2015-12-22 02:28:07', '1', '2015-12-22,2015-12-23,2015-12-24', '1', null, null);

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
  `introduce` varchar(80) DEFAULT NULL,
  `uptime` datetime NOT NULL,
  `pass` int(11) DEFAULT '0',
  `key_id` int(12) DEFAULT NULL,
  `state` int(1) DEFAULT NULL COMMENT '1:未完成 -1:已完成',
  PRIMARY KEY (`demand_id`),
  KEY `dem_person_id` (`person_id`),
  KEY `key_id` (`key_id`),
  CONSTRAINT `dem_person_id` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `key_id` FOREIGN KEY (`key_id`) REFERENCES `bn_key` (`key_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_demand
-- ----------------------------
INSERT INTO `bn_demand` VALUES ('1', '30', '2', '好需求33', '2015-11-25 21:26:10', '1', '2', '-1');
INSERT INTO `bn_demand` VALUES ('5', '33', '2', '好看的青花', '2015-12-27 01:39:03', '1', '2', '1');
INSERT INTO `bn_demand` VALUES ('6', '44', '2', '好看的瓷器', '2015-12-27 01:39:57', '1', '8', '-1');
INSERT INTO `bn_demand` VALUES ('8', '77', '2', '好看的字', '2015-12-27 01:42:05', '1', '3', '-1');

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
INSERT INTO `bn_key` VALUES ('2', '11', '青花');
INSERT INTO `bn_key` VALUES ('3', '12', '字');
INSERT INTO `bn_key` VALUES ('4', '13', '木雕');
INSERT INTO `bn_key` VALUES ('5', '12', '玉器');
INSERT INTO `bn_key` VALUES ('6', '14', '根雕');
INSERT INTO `bn_key` VALUES ('7', '15', '画');
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
  `type` int(11) DEFAULT NULL COMMENT '0:消息；1图片',
  PRIMARY KEY (`message_id`),
  KEY `to_pid` (`to_pid`),
  KEY `from_pid` (`from_pid`),
  CONSTRAINT `from_pid` FOREIGN KEY (`from_pid`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `to_pid` FOREIGN KEY (`to_pid`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_message
-- ----------------------------
INSERT INTO `bn_message` VALUES ('1', '1', '2', 'asdasdadsa', '2015-12-27 06:02:22', null);
INSERT INTO `bn_message` VALUES ('2', '2', '1', 'sdadsa', '2015-12-27 06:02:45', null);
INSERT INTO `bn_message` VALUES ('4', '4', '3', 'sdada', '2015-12-27 06:03:09', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_order
-- ----------------------------
INSERT INTO `bn_order` VALUES ('1', '3', '2015-12-26 03:22:19', '1', null, '1', '0');
INSERT INTO `bn_order` VALUES ('2', '2', '2015-12-26 22:49:48', null, '13', '0', '1');
INSERT INTO `bn_order` VALUES ('3', '3', '2015-12-26 03:23:39', '1', null, '1', '0');
INSERT INTO `bn_order` VALUES ('10', '2', '2015-12-26 05:49:34', null, '14', '0', '1');
INSERT INTO `bn_order` VALUES ('11', '2', '2015-12-26 22:23:14', null, '13', '0', '1');
INSERT INTO `bn_order` VALUES ('12', '3', '2015-12-27 04:36:14', '1', null, '1', '1');
INSERT INTO `bn_order` VALUES ('13', '3', '2015-12-27 04:36:33', '1', null, '1', '0');
INSERT INTO `bn_order` VALUES ('14', '3', '2015-12-27 04:44:43', '1', null, '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_person
-- ----------------------------
INSERT INTO `bn_person` VALUES ('1', 'admin', '1', '王辉灿', '329669642@qq.com', '15659824572', '福建', '男', '329669642', '350583199501234358', '超级管理员', '0', '10');
INSERT INTO `bn_person` VALUES ('2', 'wanghuican', 'wanghuican', '王辉灿', '329669642@qq.com', '15659824572', '福建泉州南安水头', '男', '329669642', '350583199501234358', '啊啊啊啊', '0', '1');
INSERT INTO `bn_person` VALUES ('3', 'whcart', 'wanghuican', '王艺术', '', '', '', '男', '777', '', '艺术家', '0', '6');
INSERT INTO `bn_person` VALUES ('4', 'whcart2', '1234567890', '王艺术2', '1', '1', '1', '男', '1', '1', '                \r\n            1    ', '0', '5');
INSERT INTO `bn_person` VALUES ('10', 'whccb', '1234567890', '王采编', null, null, null, null, null, null, '采编', '0', '7');
INSERT INTO `bn_person` VALUES ('12', 'whczb', '1234567890', '王辉灿', null, null, null, null, null, null, '测试3', '0', '8');
INSERT INTO `bn_person` VALUES ('13', 'whcad', '1234567890', '王辉灿', null, null, null, null, null, null, '测试', '0', '9');
INSERT INTO `bn_person` VALUES ('19', '55', '66', '', '', '', '', '', '', '', null, '0', '2');
INSERT INTO `bn_person` VALUES ('20', '66', '77', '', '', '', '', '', '', '', null, '0', '2');
INSERT INTO `bn_person` VALUES ('21', '77', '88', '', '', '', '', '', '', '', null, '0', '2');
INSERT INTO `bn_person` VALUES ('22', 'whcart3', 'wanghuican', 'ww', '', '', '', '男', '', '', '111', '0', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_proaction
-- ----------------------------
INSERT INTO `bn_proaction` VALUES ('1', '1', '11', '11', '1', '11', '2015-12-28 18:45:00', '0', '2015-12-22 04:50:50');
INSERT INTO `bn_proaction` VALUES ('2', '2', '222', '22', '2', '22', '2015-12-28 06:20:58', '0', '2015-12-22 04:50:58');
INSERT INTO `bn_proaction` VALUES ('3', '14', '20', '10', '3', '很不错的', '2015-12-28 09:08:52', '0', '2015-12-25 06:08:52');
INSERT INTO `bn_proaction` VALUES ('4', '3', '33', '33', '33', '33', '2015-12-27 20:21:08', '0', '2015-12-26 20:21:11');
INSERT INTO `bn_proaction` VALUES ('5', '6', '55', '55', '55', '55', '2015-12-28 20:21:28', '0', '2015-12-26 20:21:30');
INSERT INTO `bn_proaction` VALUES ('6', '5', '44', '44', '44', '44', '2015-12-28 20:21:54', '0', '2015-12-26 20:22:00');
INSERT INTO `bn_proaction` VALUES ('7', '13', '222', '22', '2', '22', '2015-12-28 20:22:33', '0', '2015-12-26 20:22:35');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_product
-- ----------------------------
INSERT INTO `bn_product` VALUES ('1', 'lala', '888', 'lalala', '2015-12-22 03:30:57', '3', '-1', '1');
INSERT INTO `bn_product` VALUES ('2', 'lele', '88', '33dads', '2015-12-22 03:31:08', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('3', 'meme', '23', 'adsas', '2015-12-22 03:31:20', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('5', 'asda', '666', '11', '2015-12-22 22:12:42', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('6', 'dadsa', '555', 'dada', '2015-12-24 00:06:18', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('13', 'wwww', '666', '', '2015-12-24 17:41:57', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('14', '新艺术1', '444', '我问问', '2015-12-24 23:20:24', '3', '-1', '1');
INSERT INTO `bn_product` VALUES ('15', '湿哒哒', '22', '打算的撒', '2015-12-24 23:20:54', '22', '1', '1');

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
-- Table structure for `rl_address`
-- ----------------------------
DROP TABLE IF EXISTS `rl_address`;
CREATE TABLE `rl_address` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `person_id` int(12) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `tel` varchar(20) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `address_person` (`person_id`),
  CONSTRAINT `address_person` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_address
-- ----------------------------
INSERT INTO `rl_address` VALUES ('1', '2', '灿灿', '海韵', '18120757125');
INSERT INTO `rl_address` VALUES ('2', '2', '火山', '本部', '13120757125');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_demkey
-- ----------------------------
INSERT INTO `rl_demkey` VALUES ('1', '1', '8');
INSERT INTO `rl_demkey` VALUES ('3', '1', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_demrecord
-- ----------------------------
INSERT INTO `rl_demrecord` VALUES ('1', '1', '3', 'asdadads', '2015-12-26 03:19:35');
INSERT INTO `rl_demrecord` VALUES ('2', '1', '3', '22adadsasd', '2015-12-26 03:19:54');
INSERT INTO `rl_demrecord` VALUES ('3', '1', '3', '33adsasd', '2015-12-26 03:20:00');
INSERT INTO `rl_demrecord` VALUES ('4', '1', '3', 'adas', '2015-12-26 03:20:19');
INSERT INTO `rl_demrecord` VALUES ('5', '8', '3', '我要这个服务', '2015-12-27 05:11:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_perkey
-- ----------------------------
INSERT INTO `rl_perkey` VALUES ('4', '4', '8');
INSERT INTO `rl_perkey` VALUES ('5', '4', '4');
INSERT INTO `rl_perkey` VALUES ('6', '4', '5');
INSERT INTO `rl_perkey` VALUES ('10', '3', '7');
INSERT INTO `rl_perkey` VALUES ('11', '3', '5');
INSERT INTO `rl_perkey` VALUES ('12', '3', '4');
INSERT INTO `rl_perkey` VALUES ('13', '22', '4');
INSERT INTO `rl_perkey` VALUES ('14', '22', '5');
INSERT INTO `rl_perkey` VALUES ('15', '22', '6');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_proimg
-- ----------------------------
INSERT INTO `rl_proimg` VALUES ('1', '1', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('2', '2', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('3', '3', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('5', '5', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('6', '6', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('19', '13', '0', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('20', '13', '0', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('21', '13', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('22', '5', '0', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('23', '5', '0', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('24', '14', '0', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('25', '14', '0', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('26', '14', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('27', '15', '0', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('28', '15', '1', '1.jpg');

-- ----------------------------
-- Table structure for `rl_prorecord`
-- ----------------------------
DROP TABLE IF EXISTS `rl_prorecord`;
CREATE TABLE `rl_prorecord` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `action_id` int(12) NOT NULL,
  `person_id` int(12) NOT NULL,
  `price` double NOT NULL,
  `recordtime` datetime NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `rel_person_id` (`person_id`),
  KEY `rel_product_id` (`action_id`),
  CONSTRAINT `rel_action_id` FOREIGN KEY (`action_id`) REFERENCES `bn_proaction` (`action_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_person_id` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_prorecord
-- ----------------------------
INSERT INTO `rl_prorecord` VALUES ('14', '1', '2', '888', '2015-12-26 20:44:23');
INSERT INTO `rl_prorecord` VALUES ('15', '2', '2', '88', '2015-12-26 20:44:36');
INSERT INTO `rl_prorecord` VALUES ('16', '6', '2', '666', '2015-12-26 20:46:37');
INSERT INTO `rl_prorecord` VALUES ('17', '5', '2', '555', '2015-12-26 20:46:45');
INSERT INTO `rl_prorecord` VALUES ('18', '7', '2', '666', '2015-12-26 20:46:53');
INSERT INTO `rl_prorecord` VALUES ('19', '3', '2', '444', '2015-12-26 20:47:03');
