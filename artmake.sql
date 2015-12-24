/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : artmake

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-12-24 18:11:00
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

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
INSERT INTO `bn_article` VALUES ('40', 'esadsada', '<p>gfdsgd&nbsp;</p>', '1450708593399.jpg', '1', '2015-12-21 22:36:33', null, '2015-12-21', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('41', '2222', '<p>adadada</p>', '1450709898358.jpg', '1', '2015-12-21 22:58:18', null, '2015-12-21', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('42', '4343', '<p>4543</p>', '1450709948549.png', '1', '2015-12-21 22:59:08', null, '2015-12-21', '1', 'big', null);
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
-- Table structure for `bn_cart`
-- ----------------------------
DROP TABLE IF EXISTS `bn_cart`;
CREATE TABLE `bn_cart` (
  `cart_id` int(12) NOT NULL AUTO_INCREMENT,
  `person_id` int(12) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `pcart` (`person_id`),
  CONSTRAINT `pcart` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `bn_demand`
-- ----------------------------
DROP TABLE IF EXISTS `bn_demand`;
CREATE TABLE `bn_demand` (
  `demand_id` int(12) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `endprice` double DEFAULT NULL,
  `startprice` double DEFAULT NULL,
  `person_id` int(12) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1:价格区间 2:固定价格',
  `introduce` varchar(80) DEFAULT NULL,
  `uptime` datetime NOT NULL,
  `state` int(1) DEFAULT NULL COMMENT '1:未完成 -1:已完成',
  PRIMARY KEY (`demand_id`),
  KEY `dem_person_id` (`person_id`),
  CONSTRAINT `dem_person_id` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_demand
-- ----------------------------
INSERT INTO `bn_demand` VALUES ('1', '30', '50', '20', '2', '1', '好需求', '2015-11-25 21:26:10', '1');
INSERT INTO `bn_demand` VALUES ('2', '22', '33', '11', '2', '1', '很好的需求', '2015-11-25 21:26:24', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
  `type` int(11) NOT NULL COMMENT '0:消息；1图片',
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
  `state` int(1) NOT NULL COMMENT '0:未完成 1:已完成',
  PRIMARY KEY (`order_id`),
  KEY `ordper` (`person_id`),
  CONSTRAINT `ordper` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_person
-- ----------------------------
INSERT INTO `bn_person` VALUES ('1', 'admin', '1', '王辉灿', '329669642@qq.com', '15659824572', '福建', '男', '329669642', '350583199501234358', '超级管理员', '0', '10');
INSERT INTO `bn_person` VALUES ('2', 'wanghuican', '666666', '王辉灿', '329669642@qq.com', '15659824572', '福建泉州南安水头', '男', '329669642', '350583199501234358', '啊啊啊啊', '0', '1');
INSERT INTO `bn_person` VALUES ('3', 'whcart', '1', '王艺术', '', '', '', '男', '777', '', '艺术家', '0', '6');
INSERT INTO `bn_person` VALUES ('4', 'whcart2', '1234567890', '王艺术2', '1', '1', '1', '男', '1', '1', '                \r\n            1    ', '0', '5');
INSERT INTO `bn_person` VALUES ('10', 'whccb', '1234567890', '王采编', null, null, null, null, null, null, '采编', '0', '7');
INSERT INTO `bn_person` VALUES ('12', 'whczb', '1234567890', '王辉灿', null, null, null, null, null, null, '测试3', '0', '8');
INSERT INTO `bn_person` VALUES ('13', 'whcad', '1234567890', '王辉灿', null, null, null, null, null, null, '测试', '0', '9');
INSERT INTO `bn_person` VALUES ('19', '55', '66', '', '', '', '', '', '', '', null, '0', '2');
INSERT INTO `bn_person` VALUES ('20', '66', '77', '', '', '', '', '', '', '', null, '0', '2');
INSERT INTO `bn_person` VALUES ('21', '77', '88', '', '', '', '', '', '', '', null, '0', '2');

-- ----------------------------
-- Table structure for `bn_proaction`
-- ----------------------------
DROP TABLE IF EXISTS `bn_proaction`;
CREATE TABLE `bn_proaction` (
  `action_id` int(12) NOT NULL,
  `product_id` int(12) NOT NULL,
  `startprice` double NOT NULL,
  `addprice` double(11,0) NOT NULL,
  `lasttime` int(10) NOT NULL,
  `introduce` varchar(80) DEFAULT NULL,
  `recordtime` datetime NOT NULL,
  PRIMARY KEY (`action_id`),
  KEY `rproid` (`product_id`),
  CONSTRAINT `rproid` FOREIGN KEY (`product_id`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_proaction
-- ----------------------------
INSERT INTO `bn_proaction` VALUES ('1', '1', '11', '11', '11', '11', '2015-12-22 04:50:50');
INSERT INTO `bn_proaction` VALUES ('2', '1', '222', '22', '22', '22', '2015-12-22 04:50:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_product
-- ----------------------------
INSERT INTO `bn_product` VALUES ('1', 'lala', '10', 'lalala', '2015-12-22 03:30:57', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('2', 'lele', '23', '33dads', '2015-12-22 03:31:08', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('3', 'meme', '23', 'adsas', '2015-12-22 03:31:20', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('4', 'adas', '22', 'asda', '2015-12-22 22:12:27', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('5', 'asda', '33', '11', '2015-12-22 22:12:42', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('6', 'dadsa', '55', 'dada', '2015-12-24 00:06:18', '3', '1', '1');
INSERT INTO `bn_product` VALUES ('7', 'dasda222', '33', '2dsada222', '2015-12-24 02:26:25', '3', '0', '1');
INSERT INTO `bn_product` VALUES ('13', 'wwww', '0', '', '2015-12-24 17:41:57', '3', '0', '0');

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
-- Table structure for `rl_collectartist`
-- ----------------------------
DROP TABLE IF EXISTS `rl_collectartist`;
CREATE TABLE `rl_collectartist` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `from_pid` int(12) NOT NULL,
  `to_pid` int(12) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `collect_from` (`from_pid`),
  KEY `collect_to` (`to_pid`),
  CONSTRAINT `collect_from` FOREIGN KEY (`from_pid`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collect_to` FOREIGN KEY (`to_pid`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_collectartist
-- ----------------------------

-- ----------------------------
-- Table structure for `rl_collectproduct`
-- ----------------------------
DROP TABLE IF EXISTS `rl_collectproduct`;
CREATE TABLE `rl_collectproduct` (
  `record_id` int(12) NOT NULL,
  `from_pid` int(12) NOT NULL,
  `to_proid` int(12) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `to_product_id` (`to_proid`),
  KEY `from_person_id` (`from_pid`),
  CONSTRAINT `from_person_id` FOREIGN KEY (`from_pid`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `to_product_id` FOREIGN KEY (`to_proid`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_collectproduct
-- ----------------------------

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
INSERT INTO `rl_demkey` VALUES ('2', '2', '2');
INSERT INTO `rl_demkey` VALUES ('3', '1', '3');

-- ----------------------------
-- Table structure for `rl_demrecord`
-- ----------------------------
DROP TABLE IF EXISTS `rl_demrecord`;
CREATE TABLE `rl_demrecord` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `demand_id` int(12) NOT NULL,
  `person_id` int(12) NOT NULL,
  `price` double NOT NULL,
  `recordtime` datetime NOT NULL,
  PRIMARY KEY (`record_id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_perkey
-- ----------------------------
INSERT INTO `rl_perkey` VALUES ('4', '4', '8');
INSERT INTO `rl_perkey` VALUES ('5', '4', '4');
INSERT INTO `rl_perkey` VALUES ('6', '4', '5');
INSERT INTO `rl_perkey` VALUES ('10', '3', '1');
INSERT INTO `rl_perkey` VALUES ('11', '3', '7');
INSERT INTO `rl_perkey` VALUES ('12', '3', '6');

-- ----------------------------
-- Table structure for `rl_procart`
-- ----------------------------
DROP TABLE IF EXISTS `rl_procart`;
CREATE TABLE `rl_procart` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `cart_id` int(12) NOT NULL,
  `product_id` int(12) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `cartpro` (`product_id`),
  KEY `cart` (`cart_id`),
  CONSTRAINT `cart` FOREIGN KEY (`cart_id`) REFERENCES `bn_cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartpro` FOREIGN KEY (`product_id`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_procart
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_proimg
-- ----------------------------
INSERT INTO `rl_proimg` VALUES ('1', '1', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('2', '2', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('3', '3', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('4', '4', '1', '1.jpg');
INSERT INTO `rl_proimg` VALUES ('5', '5', '1', '1450950117663.jpg');
INSERT INTO `rl_proimg` VALUES ('6', '6', '1', '1450950117663.jpg');
INSERT INTO `rl_proimg` VALUES ('7', '7', '1', '1450950117663.jpg');
INSERT INTO `rl_proimg` VALUES ('19', '13', '0', '1450950117663.jpg');
INSERT INTO `rl_proimg` VALUES ('20', '13', '0', '1450950117699.jpg');
INSERT INTO `rl_proimg` VALUES ('21', '13', '1', '1450950117708.jpg');
INSERT INTO `rl_proimg` VALUES ('22', '5', '0', '1450950117663.jpg');
INSERT INTO `rl_proimg` VALUES ('23', '5', '0', '1450950117663.jpg');

-- ----------------------------
-- Table structure for `rl_prokey`
-- ----------------------------
DROP TABLE IF EXISTS `rl_prokey`;
CREATE TABLE `rl_prokey` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `product_id` int(12) NOT NULL,
  `key_id` int(12) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `key_product` (`product_id`),
  KEY `product_key` (`key_id`),
  CONSTRAINT `key_product` FOREIGN KEY (`product_id`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_key` FOREIGN KEY (`key_id`) REFERENCES `bn_key` (`key_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_prokey
-- ----------------------------
INSERT INTO `rl_prokey` VALUES ('1', '1', '8');
INSERT INTO `rl_prokey` VALUES ('2', '1', '2');
INSERT INTO `rl_prokey` VALUES ('3', '2', '8');
INSERT INTO `rl_prokey` VALUES ('4', '2', '2');

-- ----------------------------
-- Table structure for `rl_proorder`
-- ----------------------------
DROP TABLE IF EXISTS `rl_proorder`;
CREATE TABLE `rl_proorder` (
  `record_id` int(12) NOT NULL AUTO_INCREMENT,
  `order_id` int(12) NOT NULL,
  `product_id` int(12) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `order` (`order_id`),
  KEY `proorder` (`product_id`),
  CONSTRAINT `order` FOREIGN KEY (`order_id`) REFERENCES `bn_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proorder` FOREIGN KEY (`product_id`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_proorder
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_prorecord
-- ----------------------------
