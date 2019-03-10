/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-03-10 20:01:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(255) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT '20',
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '0： 女 1：男',
  `email` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`,`studentId`),
  UNIQUE KEY `student_id` (`studentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1512011132', '魏芝', '18', '0', '411552711@qq.com');
