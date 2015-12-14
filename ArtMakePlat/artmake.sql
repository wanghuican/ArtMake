/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : artmake

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-12-15 02:54:28
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_article
-- ----------------------------
INSERT INTO `bn_article` VALUES ('16', '大广告2', null, '1449944620157.jpg', '1', '2015-12-14 10:59:22', '2', '2015-12-14,2015-12-15', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('23', '第一次大广告', '<p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p><p>吾问无为谓吾问无为谓呜呜呜呜呜呜呜呜呜</p>', '1450105816162.jpg', '1', '2015-12-14 23:10:16', '2', '2015-12-14,2015-12-15,2015-12-16', '1', 'small', null);
INSERT INTO `bn_article` VALUES ('24', '第二个广告了', '<p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad</p><p>wadasdad<img src=\"http://img.baidu.com/hi/jx2/j_0059.gif\"/></p>', '1450105916038.jpg', '1', '2015-12-14 23:11:56', '2', '2015-12-15,2015-12-17', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('25', '你猜是什么广告', '<p><br/></p><p>大大大</p><blockquote><p>大大大</p></blockquote><p>大大大</p><blockquote><p>大大大</p></blockquote>', '1450112369538.jpg', '1', '2015-12-15 00:59:29', '2', '2015-12-15', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('26', '这是一篇咨询', '<p>打第三大的</p><p>dasd爱的</p><p><br/></p><p>大大大</p><p><br/></p><p><br/></p><p>大苏打</p>', '1450112487855.jpg', '0', '2015-12-15 01:01:27', '1', '2015-12-16,2015-12-16,', '0', null, null);
INSERT INTO `bn_article` VALUES ('27', 'lalala', '<p>111</p>', '1450113047790.jpg', '1', '2015-12-15 01:10:47', '2', '2015-12-15,2015-12-15', '1', 'big', null);
INSERT INTO `bn_article` VALUES ('28', 'wwww', '<p>dsadadd.ad</p><p>asd</p><p>a</p><p>d</p><p>a</p><p>sd</p><p>asd</p><p>sad</p>', '1450113069525.jpg', '1', '2015-12-15 01:11:09', '2', '2015-12-15,2015-12-17', '1', 'small', null);
INSERT INTO `bn_article` VALUES ('29', 'adsadffsdfsa', '<p>dsadad</p><p>ads</p><p>d</p><p>a</p><p>sd</p><p>ad</p><p>a</p><p>d</p><p>ad</p><p>a</p><p><br/></p>', '1450113105733.jpg', '1', '2015-12-15 01:11:45', '2', '2015-12-15', '1', 'small', null);
INSERT INTO `bn_article` VALUES ('30', 'wanghuicandsadad', '<p>dasdasd</p><p>ad</p><p>sa</p><p>d</p><p>ad</p><p>a</p><p>sd</p><p>ad</p><p>a</p>', '1450113165841.jpg', '1', '2015-12-15 01:12:45', '2', '2015-12-15', '0', 'small', null);
INSERT INTO `bn_article` VALUES ('31', 'wada', '<p>dsadasjdlkajdslada</p><p>d</p><p>sad</p><p>a</p><p>d</p><p>asd</p><p>a</p><p>d</p><p>asd</p><p><br/></p><p>asd</p><p>a</p>', '1450113186043.jpg', '1', '2015-12-15 01:13:06', '2', '2015-12-15', '0', 'small', null);
INSERT INTO `bn_article` VALUES ('32', 'fddhsgkhdkfgsfds', '<p>dsadadadwdasdaw</p><p>ds</p><p>a</p><p>d</p><p>ad</p><p>ad</p><p>asd</p><p>a</p><p>d</p><p>as</p><p>d</p><p>ad</p><p>a</p>', '1450113217212.jpg', '1', '2015-12-15 01:13:37', '2', '2015-12-15', '0', 'small', null);
INSERT INTO `bn_article` VALUES ('33', '十大啊啊啊啊啊啊啊啊', '<p>湿哒哒</p>', '1450113888170.jpg', '1', '2015-12-15 01:24:48', null, '2015-12-15', '1', 'big', null);

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
  `describe` varchar(80) DEFAULT NULL,
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
  `keyname` varchar(20) NOT NULL,
  PRIMARY KEY (`key_id`),
  KEY `keyname` (`keyname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_key
-- ----------------------------
INSERT INTO `bn_key` VALUES ('3', '肖像');
INSERT INTO `bn_key` VALUES ('1', '陶瓷');
INSERT INTO `bn_key` VALUES ('2', '青花瓷');

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
  `state` int(1) DEFAULT NULL COMMENT '0:未完善；1:已经完善',
  `role_id` int(12) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `bn_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_person
-- ----------------------------
INSERT INTO `bn_person` VALUES ('1', 'admin', 'admin', '王辉灿', null, null, null, null, null, null, '超级管理员', '1', '10');
INSERT INTO `bn_person` VALUES ('2', 'wanghuican', 'wanghuican', '王辉灿', '329669642@qq.com', '15659824572', '福建泉州南安水头', '男', null, null, null, '1', '1');
INSERT INTO `bn_person` VALUES ('3', 'whcart', '1234567890', '王艺术', null, null, null, null, null, null, '艺术家', '1', '2');
INSERT INTO `bn_person` VALUES ('10', 'whccb', '1234567890', '王采编', null, null, null, null, null, null, '采编', '1', '7');
INSERT INTO `bn_person` VALUES ('11', 'wanghuican3', 'wanghuican', '王辉灿', null, null, null, null, null, null, '只是测试', '1', '1');
INSERT INTO `bn_person` VALUES ('12', 'wanghuican4', '1234567890', '王辉灿', null, null, null, null, null, null, '测试3', '1', '1');
INSERT INTO `bn_person` VALUES ('13', 'wanghuican5', 'wanghuican', '王辉灿', null, null, null, null, null, null, '测试', '1', '1');

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
  `describe` varchar(80) DEFAULT NULL,
  `recordtime` datetime NOT NULL,
  PRIMARY KEY (`action_id`),
  KEY `rproid` (`product_id`),
  CONSTRAINT `rproid` FOREIGN KEY (`product_id`) REFERENCES `bn_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_proaction
-- ----------------------------

-- ----------------------------
-- Table structure for `bn_product`
-- ----------------------------
DROP TABLE IF EXISTS `bn_product`;
CREATE TABLE `bn_product` (
  `product_id` int(12) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL COMMENT '现在的价格',
  `fixedprice` double DEFAULT NULL,
  `startprice` double DEFAULT NULL,
  `addprice` int(11) DEFAULT NULL,
  `type` int(1) NOT NULL COMMENT '1:竞买 2:一口价',
  `describe` varchar(80) DEFAULT NULL,
  `uptime` datetime NOT NULL,
  `person_id` int(12) NOT NULL,
  `lasttime` int(10) NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '0:未展示 1:未售出 -1:已售出',
  PRIMARY KEY (`product_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `person_id` FOREIGN KEY (`person_id`) REFERENCES `bn_person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_product
-- ----------------------------
INSERT INTO `bn_product` VALUES ('1', '30', '55.5', '20.5', '5', '1', '美丽的东西', '2015-11-25 21:15:34', '2', '72', '0');
INSERT INTO `bn_product` VALUES ('2', '44', '55', '22', '5', '1', '漂亮的东西', '2015-11-25 21:16:02', '2', '72', '0');

-- ----------------------------
-- Table structure for `bn_role`
-- ----------------------------
DROP TABLE IF EXISTS `bn_role`;
CREATE TABLE `bn_role` (
  `role_id` int(12) NOT NULL AUTO_INCREMENT,
  `role_code` int(4) NOT NULL COMMENT '0:代表普通用户,1-5:代表5个级别的艺术家；10：代表管理员;99:代表超级管理员',
  `rolename` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bn_role
-- ----------------------------
INSERT INTO `bn_role` VALUES ('1', '0', '用户');
INSERT INTO `bn_role` VALUES ('2', '1', '低级艺术家');
INSERT INTO `bn_role` VALUES ('3', '2', '初级艺术家');
INSERT INTO `bn_role` VALUES ('4', '3', '中级艺术家');
INSERT INTO `bn_role` VALUES ('5', '4', '高级艺术家');
INSERT INTO `bn_role` VALUES ('6', '5', '顶级艺术家');
INSERT INTO `bn_role` VALUES ('7', '10', '采编人员');
INSERT INTO `bn_role` VALUES ('8', '20', '主编人员');
INSERT INTO `bn_role` VALUES ('9', '50', '管理员');
INSERT INTO `bn_role` VALUES ('10', '100', '超级管理员');

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
INSERT INTO `rl_demkey` VALUES ('1', '1', '1');
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
  `record_id` int(12) NOT NULL,
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
INSERT INTO `rl_proimg` VALUES ('1', '1', null, 'picture1');
INSERT INTO `rl_proimg` VALUES ('2', '1', null, 'picture2');
INSERT INTO `rl_proimg` VALUES ('3', '2', null, 'picture3');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_prokey
-- ----------------------------
INSERT INTO `rl_prokey` VALUES ('1', '1', '1');
INSERT INTO `rl_prokey` VALUES ('2', '2', '2');
INSERT INTO `rl_prokey` VALUES ('3', '2', '3');

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

-- ----------------------------
-- Table structure for `rl_roleauth`
-- ----------------------------
DROP TABLE IF EXISTS `rl_roleauth`;
CREATE TABLE `rl_roleauth` (
  `record_id` int(12) NOT NULL,
  `role_id` int(12) NOT NULL,
  `upnum` int(12) NOT NULL,
  `lasttime` int(12) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `roleart` (`role_id`),
  CONSTRAINT `roleart` FOREIGN KEY (`role_id`) REFERENCES `bn_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rl_roleauth
-- ----------------------------
INSERT INTO `rl_roleauth` VALUES ('1', '1', '3', '48');
INSERT INTO `rl_roleauth` VALUES ('2', '2', '5', '72');
INSERT INTO `rl_roleauth` VALUES ('3', '3', '8', '120');
INSERT INTO `rl_roleauth` VALUES ('4', '4', '12', '196');
INSERT INTO `rl_roleauth` VALUES ('5', '5', '20', '360');
