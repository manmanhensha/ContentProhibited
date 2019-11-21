/*
 Navicat Premium Data Transfer

 Source Server         : EBO后台管理,内容,社区测试库
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 10.224.25.21:3306
 Source Schema         : ebo_community

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 21/11/2019 21:08:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_prohibited
-- ----------------------------
DROP TABLE IF EXISTS `b_prohibited`;
CREATE TABLE `b_prohibited`
(
    `prohibited_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `code`          varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '违禁词',
    `created_time`  timestamp(0)                                           NULL DEFAULT NULL,
    `created_by`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `updated_time`  timestamp(0)                                           NULL DEFAULT NULL,
    `updated_by`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`prohibited_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '违禁词表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_prohibited
-- ----------------------------
INSERT INTO `b_prohibited`
VALUES ('38ea1a245fab4aeaa87377dcd5e9b620', '咿呀', '2019-01-26 22:02:21', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('40f4024c9ff741ce9eccbb081ef593dc', 'dd,c', '2019-01-28 21:33:44', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('432d4bafa9314208bd1bfd7b3217a221', '上山打老虎', '2019-01-28 13:31:50', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('5c85ad05d59d426a964bfec0944f851b', '逼', '2019-01-29 14:13:36', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('6de42e2b5ebb41a485d455bda009ae72', '啦啦啦，咿呀咿呀', '2019-01-26 22:03:09', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('7036b18a2693430282ed633015945f5c', 'kj,dxcd', '2019-01-28 21:34:28', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('710d0a9480af4b0585703eb795adc27c', '上山打老虎', '2019-01-28 13:31:50', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('8fb0774db50d43c68525cf625e2ce7ac', 'sdf', '2019-01-28 21:34:06', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('a56d323ffe484e6a87f01c4ec82f8069', '的负担,的负担', '2019-01-28 21:34:54', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('ab4589629261412e90f7dfb4ac1271ce', 'dfd', '2019-01-28 21:34:06', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('b29884d2b4154068945aeb9057f504b2', '江泽民', '2019-01-29 14:13:19', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('b5b59c2543674acfacd0e089761fc3cb', 'dv', '2019-01-28 21:33:32', 'testTiMa', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES ('d935b20ea4464b91873ee077f560c77f', '我', '2019-01-28 13:33:13', 'testTiMa', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
