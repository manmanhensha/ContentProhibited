/*
 Navicat Premium Data Transfer

 Source Server         : One
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 49.233.133.21:3306
 Source Schema         : prohibited

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 23/11/2019 12:19:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ACT_EVT_LOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_EVT_LOG`;
CREATE TABLE `ACT_EVT_LOG`
(
    `LOG_NR_`       bigint(20)                                       NOT NULL AUTO_INCREMENT,
    `TYPE_`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `PROC_DEF_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `TIME_STAMP_`   timestamp(3)                                     NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `DATA_`         longblob                                         NULL,
    `LOCK_OWNER_`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `LOCK_TIME_`    timestamp(3)                                     NULL     DEFAULT NULL,
    `IS_PROCESSED_` tinyint(4)                                       NULL     DEFAULT 0,
    PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_GE_BYTEARRAY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
CREATE TABLE `ACT_GE_BYTEARRAY`
(
    `ID_`            varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`           int(11)                                          NULL DEFAULT NULL,
    `NAME_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `BYTES_`         longblob                                         NULL,
    `GENERATED_`     tinyint(4)                                       NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_GE_PROPERTY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
CREATE TABLE `ACT_GE_PROPERTY`
(
    `NAME_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `REV_`   int(11)                                          NULL DEFAULT NULL,
    PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_GE_PROPERTY
-- ----------------------------
INSERT INTO `ACT_GE_PROPERTY`
VALUES ('next.dbid', '1', 1);
INSERT INTO `ACT_GE_PROPERTY`
VALUES ('schema.history', 'create(5.22.0.0)', 1);
INSERT INTO `ACT_GE_PROPERTY`
VALUES ('schema.version', '5.22.0.0', 1);

-- ----------------------------
-- Table structure for ACT_HI_ACTINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
CREATE TABLE `ACT_HI_ACTINST`
(
    `ID_`                varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `PROC_DEF_ID_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `PROC_INST_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `EXECUTION_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `ACT_ID_`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `TASK_ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ACT_NAME_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `ACT_TYPE_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `ASSIGNEE_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `START_TIME_`        datetime(3)                                      NOT NULL,
    `END_TIME_`          datetime(3)                                      NULL DEFAULT NULL,
    `DURATION_`          bigint(20)                                       NULL DEFAULT NULL,
    `TENANT_ID_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_ATTACHMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
CREATE TABLE `ACT_HI_ATTACHMENT`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`          int(11)                                           NULL DEFAULT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `NAME_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `DESCRIPTION_`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `URL_`          varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `CONTENT_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TIME_`         datetime(3)                                       NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_COMMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
CREATE TABLE `ACT_HI_COMMENT`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TIME_`         datetime(3)                                       NOT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `ACTION_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `MESSAGE_`      varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `FULL_MSG_`     longblob                                          NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_DETAIL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
CREATE TABLE `ACT_HI_DETAIL`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `ACT_INST_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VAR_TYPE_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `REV_`          int(11)                                           NULL DEFAULT NULL,
    `TIME_`         datetime(3)                                       NOT NULL,
    `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DOUBLE_`       double                                            NULL DEFAULT NULL,
    `LONG_`         bigint(20)                                        NULL DEFAULT NULL,
    `TEXT_`         varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TEXT2_`        varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_TIME` (`TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_NAME` (`NAME_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_IDENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
CREATE TABLE `ACT_HI_IDENTITYLINK`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `GROUP_ID_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_PROCINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
CREATE TABLE `ACT_HI_PROCINST`
(
    `ID_`                        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `PROC_INST_ID_`              varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `BUSINESS_KEY_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_DEF_ID_`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `START_TIME_`                datetime(3)                                       NOT NULL,
    `END_TIME_`                  datetime(3)                                       NULL DEFAULT NULL,
    `DURATION_`                  bigint(20)                                        NULL DEFAULT NULL,
    `START_USER_ID_`             varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `START_ACT_ID_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `END_ACT_ID_`                varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DELETE_REASON_`             varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TENANT_ID_`                 varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    `NAME_`                      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    UNIQUE INDEX `PROC_INST_ID_` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_TASKINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
CREATE TABLE `ACT_HI_TASKINST`
(
    `ID_`             varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `PROC_DEF_ID_`    varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_DEF_KEY_`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_INST_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXECUTION_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DESCRIPTION_`    varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `OWNER_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ASSIGNEE_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `START_TIME_`     datetime(3)                                       NOT NULL,
    `CLAIM_TIME_`     datetime(3)                                       NULL DEFAULT NULL,
    `END_TIME_`       datetime(3)                                       NULL DEFAULT NULL,
    `DURATION_`       bigint(20)                                        NULL DEFAULT NULL,
    `DELETE_REASON_`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PRIORITY_`       int(11)                                           NULL DEFAULT NULL,
    `DUE_DATE_`       datetime(3)                                       NULL DEFAULT NULL,
    `FORM_KEY_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CATEGORY_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TENANT_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_VARINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_VARINST`;
CREATE TABLE `ACT_HI_VARINST`
(
    `ID_`                varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `PROC_INST_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXECUTION_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VAR_TYPE_`          varchar(100) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `REV_`               int(11)                                           NULL DEFAULT NULL,
    `BYTEARRAY_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DOUBLE_`            double                                            NULL DEFAULT NULL,
    `LONG_`              bigint(20)                                        NULL DEFAULT NULL,
    `TEXT_`              varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TEXT2_`             varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `CREATE_TIME_`       datetime(3)                                       NULL DEFAULT NULL,
    `LAST_UPDATED_TIME_` datetime(3)                                       NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`, `VAR_TYPE_`) USING BTREE,
    INDEX `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_GROUP
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_GROUP`;
CREATE TABLE `ACT_ID_GROUP`
(
    `ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`  int(11)                                          NULL DEFAULT NULL,
    `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_INFO
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_INFO`;
CREATE TABLE `ACT_ID_INFO`
(
    `ID_`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`       int(11)                                          NULL DEFAULT NULL,
    `USER_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TYPE_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `KEY_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `VALUE_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PASSWORD_`  longblob                                         NULL,
    `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_MEMBERSHIP
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;
CREATE TABLE `ACT_ID_MEMBERSHIP`
(
    `USER_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_USER
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_USER`;
CREATE TABLE `ACT_ID_USER`
(
    `ID_`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`        int(11)                                          NULL DEFAULT NULL,
    `FIRST_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `LAST_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `EMAIL_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PWD_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_PROCDEF_INFO
-- ----------------------------
DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
CREATE TABLE `ACT_PROCDEF_INFO`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `PROC_DEF_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `REV_`          int(11)                                         NULL DEFAULT NULL,
    `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
    INDEX `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RE_DEPLOYMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
CREATE TABLE `ACT_RE_DEPLOYMENT`
(
    `ID_`          varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `NAME_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `CATEGORY_`    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TENANT_ID_`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
    `DEPLOY_TIME_` timestamp(3)                                     NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RE_MODEL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_MODEL`;
CREATE TABLE `ACT_RE_MODEL`
(
    `ID_`                           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`                          int(11)                                           NULL DEFAULT NULL,
    `NAME_`                         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `KEY_`                          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CATEGORY_`                     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CREATE_TIME_`                  timestamp(3)                                      NULL DEFAULT NULL,
    `LAST_UPDATE_TIME_`             timestamp(3)                                      NULL DEFAULT NULL,
    `VERSION_`                      int(11)                                           NULL DEFAULT NULL,
    `META_INFO_`                    varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DEPLOYMENT_ID_`                varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EDITOR_SOURCE_VALUE_ID_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TENANT_ID_`                    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RE_PROCDEF
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
CREATE TABLE `ACT_RE_PROCDEF`
(
    `ID_`                     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`                    int(11)                                           NULL DEFAULT NULL,
    `CATEGORY_`               varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `NAME_`                   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `KEY_`                    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VERSION_`                int(11)                                           NOT NULL,
    `DEPLOYMENT_ID_`          varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `RESOURCE_NAME_`          varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DGRM_RESOURCE_NAME_`     varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DESCRIPTION_`            varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `HAS_START_FORM_KEY_`     tinyint(4)                                        NULL DEFAULT NULL,
    `HAS_GRAPHICAL_NOTATION_` tinyint(4)                                        NULL DEFAULT NULL,
    `SUSPENSION_STATE_`       int(11)                                           NULL DEFAULT NULL,
    `TENANT_ID_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    UNIQUE INDEX `ACT_UNIQ_PROCDEF` (`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_EVENT_SUBSCR
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
CREATE TABLE `ACT_RU_EVENT_SUBSCR`
(
    `ID_`            varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`           int(11)                                          NULL     DEFAULT NULL,
    `EVENT_TYPE_`    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `EVENT_NAME_`    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `EXECUTION_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `PROC_INST_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `ACTIVITY_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `CREATED_`       timestamp(3)                                     NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `PROC_DEF_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `TENANT_ID_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_EXECUTION
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
CREATE TABLE `ACT_RU_EXECUTION`
(
    `ID_`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`              int(11)                                          NULL DEFAULT NULL,
    `PROC_INST_ID_`     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `BUSINESS_KEY_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PARENT_ID_`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_DEF_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `SUPER_EXEC_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ACT_ID_`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `IS_ACTIVE_`        tinyint(4)                                       NULL DEFAULT NULL,
    `IS_CONCURRENT_`    tinyint(4)                                       NULL DEFAULT NULL,
    `IS_SCOPE_`         tinyint(4)                                       NULL DEFAULT NULL,
    `IS_EVENT_SCOPE_`   tinyint(4)                                       NULL DEFAULT NULL,
    `SUSPENSION_STATE_` int(11)                                          NULL DEFAULT NULL,
    `CACHED_ENT_STATE_` int(11)                                          NULL DEFAULT NULL,
    `TENANT_ID_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
    `NAME_`             varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `LOCK_TIME_`        timestamp(3)                                     NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_IDENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
CREATE TABLE `ACT_RU_IDENTITYLINK`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`          int(11)                                          NULL DEFAULT NULL,
    `GROUP_ID_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_DEF_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
    INDEX `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`) USING BTREE,
    INDEX `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_JOB`;
CREATE TABLE `ACT_RU_JOB`
(
    `ID_`                  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`                 int(11)                                           NULL DEFAULT NULL,
    `TYPE_`                varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `LOCK_EXP_TIME_`       timestamp(3)                                      NULL DEFAULT NULL,
    `LOCK_OWNER_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `EXCLUSIVE_`           tinyint(1)                                        NULL DEFAULT NULL,
    `EXECUTION_ID_`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_DEF_ID_`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `RETRIES_`             int(11)                                           NULL DEFAULT NULL,
    `EXCEPTION_STACK_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXCEPTION_MSG_`       varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DUEDATE_`             timestamp(3)                                      NULL DEFAULT NULL,
    `REPEAT_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `HANDLER_TYPE_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `HANDLER_CFG_`         varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TENANT_ID_`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_TASK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_TASK`;
CREATE TABLE `ACT_RU_TASK`
(
    `ID_`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`              int(11)                                           NULL DEFAULT NULL,
    `EXECUTION_ID_`     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_`     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_DEF_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`             varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PARENT_TASK_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DESCRIPTION_`      varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TASK_DEF_KEY_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `OWNER_`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ASSIGNEE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `DELEGATION_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PRIORITY_`         int(11)                                           NULL DEFAULT NULL,
    `CREATE_TIME_`      timestamp(3)                                      NULL DEFAULT NULL,
    `DUE_DATE_`         datetime(3)                                       NULL DEFAULT NULL,
    `CATEGORY_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `SUSPENSION_STATE_` int(11)                                           NULL DEFAULT NULL,
    `TENANT_ID_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    `FORM_KEY_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_VARIABLE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
CREATE TABLE `ACT_RU_VARIABLE`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`          int(11)                                           NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `NAME_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DOUBLE_`       double                                            NULL DEFAULT NULL,
    `LONG_`         bigint(20)                                        NULL DEFAULT NULL,
    `TEXT_`         varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TEXT2_`        varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`
(
    `LOG_NR_`       bigint(20)                                       NOT NULL AUTO_INCREMENT,
    `TYPE_`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `PROC_DEF_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `TIME_STAMP_`   timestamp(0)                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `DATA_`         longblob                                         NULL,
    `LOCK_OWNER_`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `LOCK_TIME_`    timestamp(0)                                     NULL     DEFAULT NULL,
    `IS_PROCESSED_` tinyint(4)                                       NULL     DEFAULT 0,
    PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`
(
    `ID_`            varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`           int(11)                                          NULL DEFAULT NULL,
    `NAME_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `BYTES_`         longblob                                         NULL,
    `GENERATED_`     tinyint(4)                                       NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------
INSERT INTO `act_ge_bytearray`
VALUES ('135065', 1, '流程审批测试流程.bpmn20.xml', '135064',
        0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612220786D6C6E733A61637469766974693D22687474703A2F2F61637469766974692E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E61637469766974692E6F72672F74657374223E0A20203C70726F636573732069643D2273616C61727922206E616D653D22E6B581E7A88BE5AEA1E689B9E6B58BE8AF95E6B581E7A88B2220697345786563757461626C653D2274727565223E0A202020203C73746172744576656E742069643D22737461727422206E616D653D22E590AFE58AA8E5AEA1E689B9222061637469766974693A696E69746961746F723D226170706C79222061637469766974693A666F726D4B65793D222F6163742F73616C6172792F666F726D223E3C2F73746172744576656E743E0A202020203C656E644576656E742069643D22656E6422206E616D653D22E7BB93E69D9FE5AEA1E689B9223E3C2F656E644576656E743E0A202020203C757365725461736B2069643D226D6F6469667922206E616D653D22E59198E5B7A5E896AAE985ACE6A1A3E7BAA7E4BFAEE694B9222061637469766974693A61737369676E65653D22247B6170706C797D223E3C2F757365725461736B3E0A202020203C757365725461736B2069643D22617564697422206E616D653D22E896AAE985ACE4B8BBE7AEA1E5889DE5AEA1222061637469766974693A61737369676E65653D2261646D696E223E3C2F757365725461736B3E0A202020203C6578636C7573697665476174657761792069643D227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646223E3C2F6578636C7573697665476174657761793E0A202020203C757365725461736B2069643D2261756469743222206E616D653D22E99B86E59BA2E4BABAE58A9BE8B584E6BA90E983A8E983A8E995BFE5AEA1E6A0B8222061637469766974693A61737369676E65653D2261646D696E223E3C2F757365725461736B3E0A202020203C6578636C7573697665476174657761792069643D227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630223E3C2F6578636C7573697665476174657761793E0A202020203C73657175656E6365466C6F772069643D227369642D45463246353142422D314439392D344630422D414346322D4236433133303041374432422220736F757263655265663D2261756469743222207461726765745265663D227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630223E3C2F73657175656E6365466C6F773E0A202020203C757365725461736B2069643D2261756469743322206E616D653D22E99B86E59BA2E4BABAE58A9BE8B584E6BA90E983A8E58886E7AEA1E9A286E5AFBCE5AEA1E6A0B8222061637469766974693A61737369676E65653D2261646D696E223E3C2F757365725461736B3E0A202020203C6578636C7573697665476174657761792069643D227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534223E3C2F6578636C7573697665476174657761793E0A202020203C73657175656E6365466C6F772069643D227369642D33444243443636312D353732302D343438302D383135362D3734384245303237354645462220736F757263655265663D2261756469743322207461726765745265663D227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534223E3C2F73657175656E6365466C6F773E0A202020203C757365725461736B2069643D2261756469743422206E616D653D22E99B86E59BA2E680BBE7BB8FE79086E5AEA1E689B9222061637469766974693A61737369676E65653D2261646D696E223E3C2F757365725461736B3E0A202020203C6578636C7573697665476174657761792069643D227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737223E3C2F6578636C7573697665476174657761793E0A202020203C757365725461736B2069643D226170706C795F656E6422206E616D653D22E896AAE985ACE6A1A3E7BAA7E58591E78EB0222061637469766974693A61737369676E65653D2261646D696E223E3C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D227369642D30324442324144392D313333322D343139382D414338442D3232413335313639443135432220736F757263655265663D2261756469743422207461726765745265663D227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D32414237433031412D353045452D344141432D384338462D4636453139333542334441372220736F757263655265663D22617564697422207461726765745265663D227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D37443732333139302D313433322D343131442D413441342D37373432323545353443443922206E616D653D22E698AF2220736F757263655265663D227369642D33463533423642442D463846332D343936422D414330382D35303633304244313134373722207461726765745265663D226170706C795F656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D44343443414434332D303237312D343932302D413532342D39423835333345353235353022206E616D653D22E698AF2220736F757263655265663D227369642D46453438354232442D394132332D343233362D424430442D44373838434136453330453422207461726765745265663D22617564697434223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D35333235383530322D343345452D344445382D423141342D44424431313932324238414622206E616D653D22E590A62220736F757263655265663D227369642D43323842423546362D303133442D343537302D423433322D36314233383043314634364622207461726765745265663D226D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C6578636C7573697665476174657761792069643D227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130223E3C2F6578636C7573697665476174657761793E0A202020203C73657175656E6365466C6F772069643D227369642D31363344424336302D444243392D343338422D393731412D3637373338464237373135412220736F757263655265663D226D6F6469667922207461726765745265663D227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D37323235384134312D323033452D343238432D423731442D43413335303632353244373322206E616D653D22E698AF2220736F757263655265663D227369642D43323842423546362D303133442D343537302D423433322D36314233383043314634364622207461726765745265663D22617564697432223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D38343438454634412D423632452D343839392D414243322D30453244423241453638333822206E616D653D22E9878DE696B0E794B3E8AFB72220736F757263655265663D227369642D35464544303244362D433338382D343843362D383730452D30393744423231333145413022207461726765745265663D226175646974223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D41373538393038342D343632332D344645412D413737342D30304137304444433144323022206E616D653D22E698AF2220736F757263655265663D227369642D45443436464534312D413046442D343936442D383644432D32433937414635373335463022207461726765745265663D22617564697433223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D46413631383633362D333730382D344430432D383531342D32394134424238424339323622206E616D653D22E590A62220736F757263655265663D227369642D45443436464534312D413046442D343936442D383644432D32433937414635373335463022207461726765745265663D226D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D31353235424646342D334539442D344438412D424638302D31463633414645313632383922206E616D653D22E590A62220736F757263655265663D227369642D46453438354232442D394132332D343233362D424430442D44373838434136453330453422207461726765745265663D226D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D33354343384336432D313036372D343339382D393931432D43434639353531313539363522206E616D653D22E590A62220736F757263655265663D227369642D33463533423642442D463846332D343936422D414330382D35303633304244313134373722207461726765745265663D226D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D42444230414142322D374535302D344433352D383045452D4345304245434444394635372220736F757263655265663D226170706C795F656E6422207461726765745265663D22656E64223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D34344146423943312D343035372D344334382D423146322D31454338393741353243423722206E616D653D22E99480E6AF812220736F757263655265663D227369642D35464544303244362D433338382D343843362D383730452D30393744423231333145413022207461726765745265663D22656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D33364535304338422D364337432D343936382D423032442D4542414134323542463442452220736F757263655265663D22737461727422207461726765745265663D226175646974223E3C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F73616C617279223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D2273616C617279222069643D2242504D4E506C616E655F73616C617279223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227374617274222069643D2242504D4E53686170655F7374617274223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D2233302E302220793D223234302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E64222069643D2242504D4E53686170655F656E64223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223937352E302220793D223335362E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D6F64696679222069643D2242504D4E53686170655F6D6F64696679223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235382E30222077696474683D223130322E302220783D223230392E302220793D223133352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226175646974222069643D2242504D4E53686170655F6175646974223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235372E30222077696474683D2239362E302220783D223130352E302220793D223232352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646222069643D2242504D4E53686170655F7369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223234302E302220793D223234302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617564697432222069643D2242504D4E53686170655F617564697432223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223231302E302220793D223333302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630222069643D2242504D4E53686170655F7369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223334352E302220793D223335302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617564697433222069643D2242504D4E53686170655F617564697433223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223432302E302220793D223333302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534222069643D2242504D4E53686170655F7369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223535352E302220793D223335302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617564697434222069643D2242504D4E53686170655F617564697434223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223633302E302220793D223333302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737222069643D2242504D4E53686170655F7369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223736352E302220793D223335302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226170706C795F656E64222069643D2242504D4E53686170655F6170706C795F656E64223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223834302E302220793D223333302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130222069643D2242504D4E53686170655F7369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223234302E302220793D2234352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D30324442324144392D313333322D343139382D414338442D323241333531363944313543222069643D2242504D4E456467655F7369642D30324442324144392D313333322D343139382D414338442D323241333531363944313543223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223733302E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223736352E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D38343438454634412D423632452D343839392D414243322D304532444232414536383338222069643D2242504D4E456467655F7369642D38343438454634412D423632452D343839392D414243322D304532444232414536383338223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223234302E302220793D2236352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223135332E302220793D2236352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223135332E302220793D223232352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D33364535304338422D364337432D343936382D423032442D454241413432354246344245222069643D2242504D4E456467655F7369642D33364535304338422D364337432D343936382D423032442D454241413432354246344245223E0A20202020202020203C6F6D6764693A776179706F696E7420783D2235392E393936353137363337313839382220793D223235352E3332333230303830303531373735223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D2239312E343030303031353235383738392220793D223235362E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223130352E302220793D223235352E3434383035313939363330363637223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D37443732333139302D313433322D343131442D413441342D373734323235453534434439222069643D2242504D4E456467655F7369642D37443732333139302D313433322D343131442D413441342D373734323235453534434439223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223830352E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223834302E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D35333235383530322D343345452D344445382D423141342D444244313139323242384146222069643D2242504D4E456467655F7369642D35333235383530322D343345452D344445382D423141342D444244313139323242384146223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223234302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223139332E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D41373538393038342D343632332D344645412D413737342D303041373044444331443230222069643D2242504D4E456467655F7369642D41373538393038342D343632332D344645412D413737342D303041373044444331443230223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223338352E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223432302E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D33354343384336432D313036372D343339382D393931432D434346393535313135393635222069643D2242504D4E456467655F7369642D33354343384336432D313036372D343339382D393931432D434346393535313135393635223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223335302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223136342E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331312E302220793D223136342E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D32414237433031412D353045452D344141432D384338462D463645313933354233444137222069643D2242504D4E456467655F7369642D32414237433031412D353045452D344141432D384338462D463645313933354233444137223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223230312E302220793D223235362E34313538383738353034363733223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223234312E31343533373434343933333932322220793D223235382E38353436323535353036363038223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D31353235424646342D334539442D344438412D424638302D314636334146453136323839222069643D2242504D4E456467655F7369642D31353235424646342D334539442D344438412D424638302D314636334146453136323839223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223537352E302220793D223335302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223537352E302220793D223136342E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331312E302220793D223136342E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D33444243443636312D353732302D343438302D383135362D373438424530323735464546222069643D2242504D4E456467655F7369642D33444243443636312D353732302D343438302D383135362D373438424530323735464546223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223532302E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223535352E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D31363344424336302D444243392D343338422D393731412D363737333846423737313541222069643D2242504D4E456467655F7369642D31363344424336302D444243392D343338422D393731412D363737333846423737313541223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223133352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D2238352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D34344146423943312D343035372D344334382D423146322D314543383937413532434237222069643D2242504D4E456467655F7369642D34344146423943312D343035372D344334382D423146322D314543383937413532434237223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223238302E302220793D2236352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223938392E302220793D2236352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223938392E302220793D223335362E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D42444230414142322D374535302D344433352D383045452D434530424543444439463537222069643D2242504D4E456467655F7369642D42444230414142322D374535302D344433352D383045452D434530424543444439463537223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223934302E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223937352E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D37323235384134312D323033452D343238432D423731442D434133353036323532443733222069643D2242504D4E456467655F7369642D37323235384134312D323033452D343238432D423731442D434133353036323532443733223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223238302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223333302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D46413631383633362D333730382D344430432D383531342D323941344242384243393236222069643D2242504D4E456467655F7369642D46413631383633362D333730382D344430432D383531342D323941344242384243393236223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223336352E302220793D223335302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223336352E302220793D223136342E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331312E302220793D223136342E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D44343443414434332D303237312D343932302D413532342D394238353333453532353530222069643D2242504D4E456467655F7369642D44343443414434332D303237312D343932302D413532342D394238353333453532353530223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223539352E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223633302E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D45463246353142422D314439392D344630422D414346322D423643313330304137443242222069643D2242504D4E456467655F7369642D45463246353142422D314439392D344630422D414346322D423643313330304137443242223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331302E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223334352E302220793D223337302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E,
        0);
INSERT INTO `act_ge_bytearray`
VALUES ('135066', 1, '流程审批测试流程.salary.png', '135064',
        0x89504E470D0A1A0A0000000D49484452000003F5000001A4080600000070F60582000042954944415478DAEDDD0B901CF59D1FF0390CC7B91C1726817288CD011542C815A108118509874BA17010413EC03CD62BC942255388E380E33014B631011B7396391BC161CA98608C090747114AC7298A6C56127A58164198C2B2782A8039B102A42332B7468F1376A77F93F96F5ABD333BB34FCDEC7E3E55FFDADD99D9D947F7F7DFFDEBFFBFBB2B15000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060A43EE25F000000009D675ADEB2DA47000000A0439C96B76D795B50FB38DDBF040000003AA7A04F857C8CD46F55D8030000406715F4CD1E07000000DAC0B426857B7ADE39F6000000D086057DB382DD883D000000B491D32A431B811FEAEB01000080312CE8A70FE3FBFA14F6000000D05905FD687D3F000000300CCD2E8A37DEEF030000000CA1101FADA9F346EC010000601C942F72F73B79BBB0F67128CADFE7E279000000300E05FDF44261FEFDBC65B58FAD16F68DBE4F610F000000E350D0870B6B85793684C2BE58D0A736BBF0BC73EC0100006014352AB4EB15E88315F6F55E7F4F9DD73BC71E00000046B1A09F368442BD5E61DF6A415F2EEC4DC5070000806168B5B06E56D80FB5A02FFEFCAD1523F600000030AC82BED582BA5161BFCF300BFAC439F6000000308605FD6085FD4B2328E847FAFB000000C0A432D291F17A85FD480AFA7261EF1C7B0000804EF6D9CF7E36D3C6AEE5FFE205235C4431E5BE3C42FF52EDF1915860F9689AA6699AA6695A759F1D3ABBA8F75F1833CDAE76DFCC6023F5ADDCC7BE1123F50000A01EC24A4C8B05745F656CCEA91F4E61EF9C7A0000500F612566188574AB23E38D6E5B57EFEAF74329EC5DFD1E0000D4435889194161DFACA06E761FFA66F7B16F644AC57DEA0100403D849598616B3652DEACA0AF0CB3B04FA7009C6D110000807A082B31C3D768C4BED5827EA8857DFA790A7A0000500F61256614C4887D792AFC8595A1DF87BE5E613FBBF4739C430F0000EA21ACC48C41615FBC785EB1406FA5A0AF34F93EB7AD030000F5105662C650792A7E14E4B32B43BF4D5DF9FBA629E80100403D849598F12FEC47AADED47E0000403D849598362FEC47FB00010000A887C04A4C0B463A65DE947B0000500F6125A60D0AFBA18EB4BB281E0000A887B012D306863A85DE947B0000500F6125A6030BFB2979EBCBDBD9FE650000A01EC24A4CFB98562BD8A70DF2FC56053D0000A887B012D39E1A8DD89B720F0000EA21B012776061AFA0070000F51058893BB0B05FA0A0070000F51058893BCCEFFFFEEF5F9E7F8865E5B6750000A01E022B71872DA7459FF9CC67B2A953A7EEEBBF010000EA21B0127788AEAEAE4FE4CB69772CABEEEE6E23F50000A01E022B710715F50B6339D5DA3AFF110000500F8195B83396CF94344A9F5A5EE4BB501E0000A887C04ADC01CB6751B1A04FA3F5CEAD070000F5105889DB7BD90C18A54FADBBBBFB6CFF210000500F6125B612B7EFB25952AFA0AFB5B5FE430000A01EC24A6C256ECFE5D27094DEB9F50000A01E022B717B2F97458315F4AE840F0000EA21B0125B560000601F1BACC458560000601F1BACC458560000601F1BACC496150000601F1B2B3196150000D8C7062B3196150000D8C7062BB165050000D8C7C64A8C65050000F6B1C14A8C65050000F6B1C14A8C65050000F6B1C14A6C59010000F6B1B11263590100807D6CB01263590100807D6CB0125B560000807D6CACC458560000601F1BACC458560000601F1BACC458560000601F1BACC496150000601F1B2B3196150000D8C7062B3196150000D8C7062BB165050000D8C7C64A8C65050000F6B1C14A8C65050000F6B1C14A6C59010000F6B1C14A6C590100807D6CFBD85889B1AC0000C03E365889B1AC0000C03E3658892D2B0000C03E3656622C2B0000B08F0D56622C2B0000B08F0D5662CB0A0000B08F8D95D84A6C590100807D6CB01263590100807D6CB01263590100807D6CB0125B560000807D6CACC458560000601F1BACC458560000601F1BACC496150000601F1B2B3196150000D8C7062B3196150000D8C7062BF1086559B6EFABAFBEFAC8934F3EF99B65CB96653D3D3D1DDB625975F2EFBF74E9D26CD5AA557F9FB759920700807A08ACC44D4541BF7AF5EA6CCB962DD9AE5DBBB4BDDCB66EDD9AAD5CB9F2DDBCC03F4FFA0000500F819578503142AFA06FBBC27E574F4FCF0BD20700807A08ACC4838A29F70AE9F66B7951BF5BFA0000500F81957850712EB722BA2D8B7A9D270000EA21B0128F4E51FFEB5FBD99BDBAEE07D9734BBF566DF1793CA60057D40300A01E022B711B17F57DDB7AB30D3FBE3EFBF9E26BF668F1583CA70857D40300A01E022B719B16F59B9EFBDB01057D6A6F3CB74811AEA80700403D0456E2762DEA5F78E29B0D8BFA784E11AEA80700403D0456E2362DEA37F4DCD8B0A88FE714E18A7A0000D443602556D46B8A7A0000D44360251ECDA23EAE76DFA8A88FE714E18A7A0000D44360256ED3A27EE39AEF342CEAE33945B8A21E0000F5105889DBB4A87FA7777DB6E1F11B064EBDCF1F8BE714E18A7A0000D44360256ED3A23EDA6B4FDF3FA0A88FC714E08A7A0000D44360256EE7A27EE7CE6CE34FBF3B70EA7DFE583CA70857D40300A01E022B711B16F57DDB7AB397D7DCD1F09CFA782E5EA31057D40300A01E022B71BB14F53B77666F6E5C9EFDE2475F6E58D0A716AF89D71AB557D40300A01E022BF15E2EEA9B8DCE1BB557D40300A01E022B719B16F5AD8CCE0F366AAF2857D40300A01E022BF15E2AEA875BD0A7A62857D40300A01E022BF15E2AEA35453D000028EAB1122BEA35453D0000EA21B0122BEA15F50000A01E022BB1A27E0214F5DDDDDDFF255F377748280000EA2150D46B1D52D4D78AF99DB15EEA600100500F81A25E11DD01457DB99857D40300A01E022BB1A2BECD8BFA7CFDFBF398665F2EE615F50000A887C04AACA86FD376CB2DB764F546E615F50000A887C04AACA86FF3D6AC98D7344DD3346D64CD5E2EA887B0124FF8A23E9E7BECB1C7B2D9B367575B7C9E7F4BF6C4134F0CBB58DDB1634776E28927565B7ABF73CF3DB7FFF3071F7C307BE08107AA9F6FDEBC39DBB8716376E69967565BFA1DF6DF7FFF6CE5CA95D9B265CBB26DDBB655DF375EBF64C992FE9F135F5F7BEDB57BFCEC78ECF6DB6FAF7EFEC61B6FECF1DCDAB56BABCF6FDAB4299B3A756AB515FFE6D75E7B6D8FD76FD8B0A1FA78FC7EF175FCECFDF6DB6F48FF8BF8FE3BEFBC73D0E9F7175C70C17FCDD7C1F727CA0E898D02C811C811C80B5889C7A9A88FA2F391471E19F0D8C2850BF778EC99679EC9CE39E79C6A4B0700CA0702AEB8E28AFED7BFF7DE7BD516EF13CFF5F5F5551F7FF8E187FB5FB375EBD6FED7C6818078DD21871CD2FFFC09279CD0FFDEAFBCF24AF5E38B2FBEB8C7EF79CF3DF7F47F1EC5777C7CFEF9E7B3458B16553F2FFF5D77DC7147F5F3F87DD2FBBEF3CE3BD5CF8BBF5BBD8306F1F5B1C71E5BFD9DE27F56FCBFC6EF9A7EDF638E39A6FA739E7EFAE93D0E0AB470A1BC1FD62BEEE5096C970039027901457DC3A2FEE4934F1E50A0AF59B366C0E87BF1EB238F3CB25AC4367ADFC71F7FBCFFBDEEBDF7DEEAC718393FFEF8E3AB05F711471C511D294FAFBFEFBEFBAAAF8996660EC4EBD27BC40180F47BC5887A7AFCAEBBEECA8E3AEAA8EA28FA75D75DB7C76B63643EBDFFEAD5ABB3C58B17F7FFCDA9E08EF78A8F575F7DF580BF371E8FEF89031A316320661EC4CF48EF7FC30D37D4FDDB3FF8C10F565F1F1FE37F1BBF6BF1E044B35BDA9547EEE5096C97003902790145FD80168567149A73E7CEDDA3A83FF8E083B3A38F3E7AD069E5CD8AFA187DAF1446D8A3688F69F495DA487ABD830B95DAD4F918398FE9F95144A70302F13D95DAD4F9E2F744E11E4576FCDE77DF7D77F5B1534F3DB5BF888ED7C5F7C4E7F7DF7F7FF56FBBEAAAABFABF3F4E33A8D4A6C8C78186F4DEE9BD2EBBECB26A61FDD5AF7EB5FA78BC2E1D7828FEFE51FC178BF7344321A6F0379A11D1A8A84FD2C8BD3C81ED122047202FA0A8AF5B4847211F9F47F15D2CB6EB15A1AD16F55194A7E236DEE380030EA88EA6C768793C76D145170D38773F3EBFF5D65BABD3EFE3FBD3C87D1C70888FC71D775CF53CFBF241834A6D06407926417ACFF479FC6D31CA9F1E4B23F17160238AFEC30E3B2CFBD4A73E557DEEADB7DEAA4EC58FBF318AFA38B810AF8F030DA79F7E7AF56F8AEF8D5907AFBFFE7AFFCF8A6B05A473F9A3C88F9F577CBE7C20A059512F4F60BB04C811C80B5889072DEAE7CC9953FD3C46B1A3F81E8DA23E9DB35EBE505C3A773D8AE6F2FBA7A2387E8FF9F3E767071E7860F5DCF4DB6EBBAD7F44BE5218A94F23E9A9508F03068315F569C640CC16888BF3AD5FBFBEFFD483F4DA28DAE3F378BE786D81534E39A57AC0210E24C44C82B8585E14F969143EBDB6784E7EF13A01711D80F818D3F815F5801C811C81BC809578D48AFA34521F9FA769E9A351D4C7C8781A8D8F51F718818FABD91F74D04175DF3FBE3EE9A493AADF13C57114D87151BA18E9AE14CE7D8F223E8AE528AEE3EB28CEE3EBE215FC8BD706288FEAC7CF8CA23D0AF334F53E1E8B0309F5FE3F7145FEB8727F9C831FA724C48189387F3F9E8BEB06D42BEAD345F8D2EF1953FECBA3F48A7A408E408E405EC04A3CE2A2FED1471FED1F418F0BD345011A85F4534F3D35A273EA63343E15D631CA1D53D28B857CBDA23E15BEE99CFA4AEDAAF995C239F5514817CF534F57BF6F36FD3EBD2646FF63C43C9E8BBF337D9EAE8A5FAFA84F7F671C50881904F3E6CDAB1E18A8146621A48317871E7A6875CA7E7A8FF43F8869FE8A7A408E408E405EC04A3C6A457DB434121ED3DCD345E566CD9AB5C715F0A3808D8BCF454BA3E031E21EA3EFE9E270693A7CFA5995C22DE662FA791C2C8882B7D14C804A69A43ECE573FE38C3306BC57F1567B95DA94F6980190AE145F6FA43E4DBD8FABD1A7BF370E1AA40BE8A5F3F7E3A27CE5A23EFD3D7111BD787DFC1EB7DC724BF6A10F7DA8FF7A00C5BB0814BF3F7E46BC77BAD27EF9C081A21E902390239017B0120FB9A88F11EB18398EA23A2E10F7EEBBEFD61DA5BEF2CA2B1BDED26EB096DE2F46D52B855BCC952FC457FCBD2A85D1EC345D3E8AE1F2EF543C773EBE8E8309F1FA4633118AE7D4C7C7B8D85EFC1EF1B38B330D52E15DFC9995DA39FC713023CEE93FEBACB3AA17EE6BF6BF88530262AA7EF1774D0716D2C8BEA21E902390239017B0120FABA8D7DAA329EA013902390279012BB1A25E512F4F2047801C81BC602556D46B8A7A79023902390279012BB1A25E53D40372047204F202566245BDA25E9EC076099023901750D46B8A7A790239023902E4052BB1A25E53D4DB28801C811C81BC80955851AFA89727408E408E405EC04AACA857D4CB13C8112047202F588915F59AA25E9E408E408E405EC04AACA8D714F5801C811C81BC80955851AFA89727B05D02E408E40514F59AA25E9E408E408E0079C14AACA8D714F5360A20472047202F602556D42BEAE509902390239017B012972C5BB64C11DD7E6D475ED4EF9627408E408E405EC04A3CA855AB56BDB965CB1685741BB5DEDEDEBFCE8BFA17E409902390239017B0120F6AF9F2E567AD58B1E2576FBFFDF67605F5DE1FA18F827EE9D2A5AFE7ED3C7902E408E408E405ACC44DE505E4F49E9E9E7531E53BCEE5EEC4F6D0430F65B1AC3AF5F7AFB5F8FFBF30510B7A1B05902390239017B012D368392D8A653575EAD47DFD37E409E40890239017B0127788AEAEAE4FE4CB69772CABEEEEEE69FE23F2047204C811C80B58893BA7A85F18CBA9D6D6F98FC813C8112047202F6025EE8CE533258DD2A79617F9D3FD67E409E40890239017B012B7FFF259542CE8D368BD73EBE509E40890239017B012B7F7B219304A9F5A7777F7D9FE43F2047204C811C80B56622B71FB2E9B25F50AFA5A5BEB3F244F2047801C81BC6025B612B7E77269384AEFDC7A79023902E408E405ACC4EDBD5C160D56D0BB12BE3C811C017204F2025662CB0ACB08E408E408E405ACC45856584620472047202F6025C6B2B28C408E00390279012BB16585650472047204C80B56622C2B2C23902390239017B01263595946801C811C81BC8095D8B2C232023902E408E4052B3196159611C811C811C80B5889B1AC2C23408E408E405EC04A8C656519811C017204F2025662CB0ACB08E408E4089017ACC45856584620472047202FB03756D845B1D23669EBFCA77438584620472047202FD07E2BEC94BCED1EACA8EFEAEA9AEE3FA5C3C13202390239027981F65C69970C52D4AF9D3A75EABEFE4B3A1C2C2390239023901768CF95764AA3A2BEBBBBFB6CFF211D0E9611C811C811C80BB4F78A5BEFDCFA7546E97538584620472047202FD0FE2BEE8073EB9D4BAFC3C132023902390279810E9117F10B8DD2EB70B08C408E408E405EA0338BFA4F14CEA59FE63FA2C3C13202390239027981CE5A81ABE7D61BA5D7E16019811C811C81BC40E7ADC053ACC43A1C2C2390239023901726AD2CCBF67DF5D5571F79F2C9277FB36CD9B2ACA7A7A7A35AACC49DF63B2F5DBA345BB56AD5DFE76D960E07CB08E40890239017862D0AFAD5AB57675BB66CC976EDDAA58D53DBBA756BB672E5CA77F302FF3C1D0E9611C8112047202F0C4B8CD02BE8F75A61BFABA7A7E7051D0E9611C8112047202F0C4B4CB95760EFBD9617F5BB753858462047801C81BC302C718EB7E27AAF16F5990E07CB08E40890239017C6B4A8FFF5AFDECC5E5DF783ECB9A55FABB6F83C1E53982BEA7538961120472047202FB47151DFB7AD37DBF0E3EBB39F2FBE668F168FC5738A7345BD0EC73202E408E408E485362DEA373DF7B7030AFAD4DE786E91E25C51AFC3B18C003902390279A15D8BFA179EF866C3A23E9E539C2BEA7538961120472047202FB46951BFA1E7C686457D3CA73857D4EB702C23408E408E405E50D42BEA75385846204720477204F2C26816F571B5FB46457D3CA73857D4EB702C23408E408E405E68D3A27EE39AEF342CEAE339C5B9A25E8763190172047204F2429B16F5EFF4AECF363C7EC3C0A9F7F963F19CE25C51AFC3B18C003902390279A14D8BFA68AF3D7DFF80A23E1E53982BEA7538961120472047202FE32ECBB2DF5BBF7EFDBC1FFEF0872BE7CF9FFFEE15575CB17BCE9C3959FC5366CD9AF5DB3FFEE33FDE75DD75D7BDFACD6F7EF381BCFDEB495DD4EFDC996DFCE977074EBDCF1F8BE714E78AFA164CAB7538D374BD360A2047801C81BC8CA8987FF4D147EFBFE9A69B765F79E595D9F7BEF7BDECC9279FCC7A7B7BB31D3B7664213E6ED9B225FBD9CF7E96E5457FF6A77FFAA7BFFDB33FFBB35F5E7CF1C5174DB6A2BE6F5B6FF6F29A3B1A9E531FCFC56B14E88AFA419C96B76D795B50FB385DF76BA3007204C811C8CB90E5C5FBDCAF7FFDEB3BAFB9E69A6AC1FEFEFBEF67AD7AF6D967B32F7EF18BEFCF9B37EF85F3CF3FFFC8095FD4EFDC99BDB97179F68B1F7DB961419F5ABC265E6BD45E513F48419F0AF918A9DFAAB0B751003902E408E4A565794DBEEF638F3DB6FC924B2EC9162D5A34A462BEEC473FFA513677EEDCED1365D4BE5E51DF6C74DEA8BDA27E98057DB3C7B151003902E408E4656041BF62C58AA72EBFFCF2ECE5975FCE46C32F7FF9CBEC924B2ED97ED14517FDC9442CEA5B199D1F6CD45EB1AEA8AFFCBF11F9C10AF7F4BC73EC6D14408E00390279692C46E8A3A08F73E44753BCDFC5175FDCD7DDDD3D6BA215F5C32DE85353AC4FFAA2BED582DD88BD8D02C8112047202F8DC539F431E57EB446E8EB8DD8CF9E3D7B5B5ED81F3D918A7A4D513F02A7558636023FD4D763A300720472044C86BCC455EEBFF6B5AFED8A73E8C7D2E2C58BB7CF9C3973ADA25E53D40F7BE43DBEAF4F616FA3007204C811C84BBF850B17FE555CE5FE1FFFF11FB3B176E9A597BED5A9D3F015F58AFABD5CD08FD6F763A30072047204F23251C4287DDC873E6E5B371E7EFEF39FEFEAD4D17A45BDA27E1434BB28DE78BF0F360A20472047202F9D6CFDFAF5F3E2E27823B975DD50CD9D3BF7ADFC1F7A783BFCFDDDDDDD074D9D3A755F45BDA27E1C0BFAD19A3A6FC4DE4601E408E4488E60B2E7E5873FFCE1CA7BEEB9271B4F0B162C7836FF875EDD260BF6BCBC6DCA8BFB6F4481AFA857D48F91F245EE7E276F17D63E0E45F9FB5C3CCF4601E408E40898CC79993F7FFEBB4F3EF9E4B816F53FFDE94F7F99FF4317B5C3DF9F17F27F180BB7D676E4ED07799BAAA857D48F41413FBD50987F3F6F59ED63AB857DA3EF53D8DB28801C811C0193352F575C71C5EE37DF7C735C8BFAB7DE7A6B4B8C8EB7C9823DBC50D417DB6B79FBCAF9E79FFF4F14F593BBA88F0B3B8EE074917A53E42FAC15E6D9100AFB62419FDAECC2F3CEB1B751003902390226635EE6CC9993EDD8B1635C8BFAF879312ADE0E7F7F5EB4FFF306457D6A5BF3F6DDBC4D194E511F7FEB89279E586D8F3DF658B5183BF7DC73FB3F7FF0C107B3071E78A0FAF9E6CD9BB38D1B3766679E7966B5CD9E3DBBFABAFDF7DF3F5BB97265B66CD9B26CDBB66DD5F78DD72F59B264C0CFDBB06143F5B9356BD60CFA7BC529178B172FDEE3B1F8BE850B17D67D7D3CFEF0C30F0FAB188FF7FDD6B7BED5B1457DBEEC97E4AD2F2FEEAFCCF3F27B43F8D6468576BD027DB0C2BEDEEBEFA9F37AE7D8DB28801C811C01932D2FF1878DB7DFFEF6B7A960DED9D5D5B52DFFF8666D64FC85BC3D93B79FE605D4F2FCB9C5F9E78FE6EDAFF2F6FDBC7D277FEC5BF9735F8F51F4FCE317F28F7F92B7CFE78FCFCCDB6766CC98F19FF3C74FCD1FFB0F79FB77F963FF262FDC8F98356BD6217941F69128CAF2AF3F90B77F9ABFF65FE5AF39B149519FE5EFB13BFFF8EBE18ED4BFF7DE7BD516857114647D7D7DD5C78B45F2D6AD5BFB5F1B0702E275871C7248FFF3279C7042FF8180575E79A5FAF1C5175F6C58B0C7F36FBCF1C6A085F651471D557DCF8F7DEC63D9534F3D35E08043FC2E71A0E1D4534FED7FECB8E38EAB1E3888AF8B2D0E3C3CFDF4D3D5F78E0310F1583A28117FC729A79CD2FFDA471F7D343BE288233AA9A87FA2B03E6CCAD787CF0EA1A09F368442BD5E61DF6A415F2EEC4DC5B751003902390226435E2EBCF0C2DF8EF748FDF6EDDBE3EAF73BA2C08E42BB365A7E7814E05188E745F949175C70C17F8C023D0AF5FCB119799B1B057C14F2F963D7E59FDF14057E14FA79BB277FFC813800503B10B02C0E0CD40E103C9FB757E3C0411C40C85FB7A3569CBD93B78D79FB5F797BBF4141BF3DDE37FFBE13E220C0708BFAC71F7FBCBF28BEF7DE7BFB0BEEE38F3F3E5BB46851B5C09D3A756AFFEBEFBBEFBEFE022E15C7F1BAF41E7100A052188D8F623A8AF15490C7C183934E3A29BBE4924BFABF273E4FEF7FFFFDF7570BF3F85D6266C0134F3CD17F80215E1BCF970F4AA4EFBBEBAEBBAA071DD26B1F79E491FECF8BEF513C60115FDF74D34DFD5FEFB7DF7ED997BEF4A521FD0F77EEDC99E5EB435A6E2FD796EFA2BCDD972FA36FE71FBF9CB78BF3CFCF8D6B22CC9C39F3DFE61FFFC519679CB1FF28847F639D756351FE333E3EC2C2BA59613FD482BEF8F3B7568CD8DB28801C811C01133F2F975F7EF9AEF13EA77EF3E6CD2FEDCD73EA6FBCF1C67D5A29DACAE7518F64A4BE5218618FA23DA6D1C7E7CF3FFF7CDD51F468B7DF7E7BF6CE3BEF54A7E7C7F4FD744020BE273E6EDAB4A97F8A7FF1FB8F3CF2C8EAC87EA3DF2746CAA3D88FD1F378CF28B00F3EF8E0EA63471F7D74F594804A69A43F3E8FC79E79E6993D0E2CA4E9FAF179FC9EF179CC44885305D2C87C3C3777EEDCEAE7E79C734EF520C570A7DFE7DFFBCFBABABA8E8A033FF9C7E9F9329A539BB1F1E779FB5EFED87FCF3FAEC8DB2FF2B6396FBB62EA7CDEE2E28C3FCBDBE3797B306F77E4EDC6FC7B2F8F8346F9F7FDA7193366FCFB58E67FF4477FF4E1D2FAD1D7E0A04F3CFE95383055A7A06FB5A06E54D8EF33CC823E718EBD8D02C811C8113019F272FDF5D76F1CEFABDFFFF8C73FFE9FED72F5FBDAC21D30BDBADEBDEB8753D447519E0ADB18D53EE08003AAD3DE57AF5E5D7DECA28B2EEA7F3E46CC53817CEBADB756A7ADC7F7A791FB288C2BB529F031DDBDD1CF1CACA87FEBADB7AAEF1123F5F1BE6926409A2A7FD86187F51F348851FC7450E28A2BAEC83EFCE10F679FFEF4A7AB057E3C970E54341A9D2F8EE2C77BC7E7711D80F81F8CE739F571B1C328D6A3688FE23D2FE4BBF38F9745515F2BEEA3C8FF71DE9EAE15FF7DB583019B6B07079A9D9EF166FEDE9FDB77DF7D3F35CC42BA5E61FFD2080AFAE11E60C04601E408E408E4A5D3FCC55FFCC53DE37D9FFA1B6EB86171BBDCA7BEB670973418751D71519F46AE53717BE79D77F617FBF1752AB253019C5E17A3E531DD7DFEFCF9D981071E981D73CC31D96DB7DD567D6EEDDAB57B8CD4A782370E1044D1FCD18F7EB4DAA290BEFBEEBBFBCF8F4FAF7DF7DD77FB7F4E14FFA9A08F11FC62A15E6F96412AF6E33CFBD34F3F7D8FDFB95CD49F7CF2C90346EAE340C559679DD5F617CA3BFFFCF37F37AEC31053F99B14F571EAC6AF3EF9C94FFEFA777FF777B30F7CE0039F1EE68FAC57D88FA4A02F17F6CEB1B7510039023902799988BEF295AFFCCBCB2EBBEC37EFBFFFFEB85DFC7EC68C19AF8CE01661A3AED55B960DB7A88F91EF54DCC6E87814B67131B9830E3A68C0A876FA3ACE898FEF894239A6B51F7BECB1D9EBAFBF5E7DEEB5D75E1B7085FB98CE9F0AF766D3EFEB8DA6A769FC71C1BCE26B52811F0726D201859851109F3FFBECB37B14FE69347E2214F585E00F76CBC31B6BE7D5C781A06C9F7DF6B96D843F2EA6DC9747E85FAA3D3E120B6AEFF5115DB98D02C811C811C8CB0474D55557FDEF9FFDEC67E335F53E2E68B7BA13FF4FC32DEA63343E15B731AD3E9D9F5E9C9E5E2EEA53819CCEA9AFD4AE9A5F299C531F17E01BEAF4FB72519F46EAD3687D5CC42E15EBE5D90695DA15F7D3EC82F5EBD7579F8BC72AB529FDE9F5C5DBED15FF9E786DBDEB08B46B51DFDDDDFD8785423EEE82F0DFF2C7A6D5393DA3D9D5EE9B196CA4BE95FBD83762A4DE4601E408E40898E879F9FCE73F7FFE17BEF085DDE3305ABF6DC68C19CFC4C8F8642AEA2BB529EBA9288E8BD21D7AE8A10D47CC2BA591FAB84AFE19679C31E0BDE2227531053FA6C1474B8579CC008811F174A1BA7481BD981DD0ACA8AF34B8C77DBAB05FF1EF88030E314A1F071DD245F21AFDFDC551FC4EBA4F7D1EFCF36AD7595890AFB747B75040F755C6E69CFAE114F6CEA9B7510039023902264B5EE6CD9BB73E6E9B3696E2FCFD18A5AF7711BA895AD4A7F3D76354BD52B86A7C71B43ABE2EBE777C1D578F2F4E6D4FF7802FBE262EB657EFEAF74339D810CBBCFC58BDA23E5D0360CE9C39FD7F53FC6EE93CFFC18AF64E2EEAF342FEA0B8F5E2300AE95647C61BDDB6AEDED5EF8752D8BBFABD8D02C811C8113099F212E70ECF9D3B77FBCB2FBF3C2605FDFAF5EB1F8B7BC5B730DA39A18A7A6DF4DADE28EA87A9D511F266F7A16F761FFB46A654DCA7DE4601E408E408987C7999356BD6CC79F3E6BDB765CB96512DE8DF78E38D9FCC9831E3F54E9D76AFA857D40F43B391F266057D6598857D3A05E06CDDB68D02C811C8113009F33273E6CCB9175F7C71DF688DD8C7087D14F45D5D5D5FECF4FF8DA25E513F448D46EC5B2DE8875AD8A79FA7A0B751003902390226735EF202FCB3B366CD7AF76FFEE66F7E3D828BE76DFBF6B7BFFD8398729FB73913E1FFA2A857D40F438CD897A7C25F5819FA7DE8EB15F6B34B3FC739F4360A2047204780BCF4FFC187CF983163D9BC79F3DE7AE69967B60FE53EF48F3FFEF843B366CD5A1717C5EBE473E815F58AFA512CEC8B17CF2B16E8AD14F49526DFE7B675360A2047204780BC34FCC3CF8BE27ECE9C395BE6CF9FFFDC4F7EF293D77B7B7BDF8C2BAE87EDDBB7BFB579F3E697962E5DFA3F6EBCF1C6253367CE7C358AF9189DEFD4ABDC2BEA15F563A03C153F0AF2D995A1DFA6AEFC7DD314F4360A2047204780BC349517EB1FEFEEEEBE32FF473C92B7D7F2B623FE29B58F9BF2B6286F57C708FF44FD1F28EA15F5A35CD88F54BDA9FDD828801C811C01F282A25E51DFE685FD681F20C04601E408E408E40545BDA6A86FC148A7CC9B726FA3007204C811C80B8A7A457D1B14F6431D6977513C1B059023408E405E50D42BEADBC050A7D09B726FA3007204C811C80B8A7A457D0716F653F2D697B7B325D14601E4089023901714F58AFAF631AD56B04F1BE4F9AD0A7A1B059023408E405E50D42BEADB53A3117B53EE6D14408E003902794151AFA8EFC0C25E416FA3007204C811C80BA365D9B2658AEBBDD776E445FDEE49B09AA5427E8182DE4601E4089023901746D1AA55ABDEDCB2658B027B2FB4DEDEDEBFCE8BFA1726C9AA36ADD6E1B86D9D8D02C8112047202F8C96E5CB979FB562C58A5FBDFDF6DBDB15DAE337421F05FDD2A54B5FCFDB793A1C2C239023408E405E18B6BCB09CDED3D3B32EA682C739DEDA98B7F83FBF30990A7A1D8E65047204C811C80BA0C3C1320239023902E405D0E16019811C811C81BC00E8702C23408E408E405E001D0E9611C811C8911C81BC003A1C2C23902390239017001D8E6504C811C811C80BA0C3C132023902E408E405D0E16019811C811C81BCC80BA0C3C13202390239027901D0E15846204772047204F202E870B08C408E408E0079017438584620472047202F003A1CCB0890239023901740878365047204C811C80BA0C3C13202390239027901D0E158469611C811C811C80B800EC732023902E408E405D0E16019811C811C01F202E870B08C408E408E405E007438961120472047202F800E07CB08E40890239017408783650472047204F202A0C3B18C00390239027901D0E158462047801C81BC003A1C2C2390239023405E001D0E9611C811C811C80B800EC73202E408E408E405D0E16019811C017204F202E870B08C408E408E405E007438961120472047202F003A1CCB08E40890239017408783650472047204C80BA0C3C13202390239027901D0E15846801C811C81BC003A1C2C2390239023405E001D0E9611C811C811C80B800EC73202E408E408E40598349DCBA2E8609AB475FE53360A2047801C81BC00EDD7B94CC9DBEEC18AFAAEAEAEE9FE53360A2047801C81BC00EDD9C12C19A4A85F3B75EAD47DFD976C14408E0039027901DAB38399D2A8A8EFEEEE3EDB7FC84601E40890239017A0BD3B997AE7D6AF334A6FA3007204C811C80BD0FE9DCC8073EB9D4B6FA3007204C811C80BD021F2227EA1517A1B059023408E405E80CE2CEA3F5138977E9AFF888D02C8112047202F40677536D573EB8DD2DB28801C017204F202745E6733458763A3007204C811C80B4C3A5996EDFBEAABAF3EF2E4934FFE66D9B265594F4F8F36CE6DE9D2A5D9AA55ABFE3E6FB36C14E448932339922339922339922379015A161DFFEAD5ABB32D5BB664BB76EDD2F652DBBA756BB672E5CA77F30DC17976A2E448932339B23ECB911CC9911CC90BD0923892ABE36F9B0DC0AE9E9E9E17EC44C991264772A4C9911CC9911CC90BD092989AA5E36D9F9677FEBBED44C991264772A4C9911CC9911CC90BD09238F747A7DB569DFF84ED3827F246418EE4488EE4488EE4488EB4899823453D4CA0CEFFD7BF7A337B75DD0FB2E7967EADDAE2F3784C87ADF3B75190233992233992233992234D510FB471E7DFB7AD37DBF0E3EBB39F2FBE668F168FC5733A6D9DBF9D2839922339922339922339D214F5409B76FE9B9EFBDB011D7F6A6F3CB748A7ADF3B71325477224477224477224479AA21E68D7CEFF8527BED9B0F38FE774DA3A7F3B5172244772244772244772A429EA8136EDFC37F4DCD8B0F38FE774DA3A7F3B5172244772244772244772A429EA019DBFCEDF4E941C6972244772244772244772242FC06876FE7155D4469D7F3CA7D3D6F9DB8992233992233992233992234D510FB469E7BF71CD771A76FEF19C4E5BE76F274A8EE4488EE4488EE4488E34453DD0A69DFF3BBDEBB30D8FDF30708A56FE583CA7D3D6F9DB8992233992233992233992234D510FB469E71FEDB5A7EF1FD0F9C7633A6C9DBF8D821CC9911CC9911CC9911C698A7AA09D3BFF9D3BB38D3FFDEEC0295AF963F19C4E5BE76F274A8EE4488EE4488EE4488E34453DD0869D7FDFB6DEECE53577343CF72A9E8BD7E8B875FE76A2E4488EE4488EE4488EE448EBDC1CE5D95814F968D2D6A9A0A0533AFF9D3BB337372ECF7EF1A32F37ECF8538BD7C46B1DDDB51365274A8EE4488EE4488EE4488EB48E2DEAA7E46DF760457D5757D77415147440E7DFEC28AEA3BB3A7F3B5172244772244772244772A44DBC1CE5F958324851BF76EAD4A9FBAAA0A0033AFF568EE20E767457276E27CA4E941CC9911CC9911CC9911CC9514716F5531A15F5DDDDDD67AB9EA0433AFFE176FCA9E9C4ED44D531ADB613354D8EE4488EE4488EE4488EE4488EDABAB0AF776EFD3AA3F4D0419DBFA6F31F65A7E56D5BDE16D43E4E97234D8EE4488EE4488EE4488EDAB6A81F706EBD73E941E7AF4DDE9DA8D34A3B4E3132B275A2ED48C9911CC9911CC9911CC9913691729417F10B8DD283CE5FB313755A839190D326DA08891CC9911CC9911CC9911C6913ACA8FF44E15CFA0979BA0A28EA359DFFE0A635D9514ACF4F93234D8EE4488EE4488EE4488EDA4F3AB7DE283DE8FCB5C9B713D5EA0ED28419219123399223399223399223ADD3733473E6CC8F7775755D9617F28FE46D63DEDEAB8DD6EFC8DB6BB529F957C7EB5451A0F3D726EE4ED469431CF118EAEBE548932339D2E4488EE4488E4651DCAA2E6F3D79DB35C83DEACBED89FCF5B35453A0F3D726D64ED470473AE2FBFA3A79474A8EE4488EE4488EE4488EB44ECB515E981F9E17E63F1A42215FAFAD3EFFFCF38F545581CE5FEBFC9DA8914E5DECE8A98F72244772244772244772A475528EBABABA3E3B63C68CFF532CD067CE9C997DE31BDFC8962F5F9EFDDDDFFD5DF60FFFF00F5978EFBDF7B2DEDEDE6CCD9A35D982050BB2CF7DEE73E5C2BECFA83DE8FCB5CEDE896A7611A2F17E1F3992233992234D8EE44893A3C605FDF4BC087FBF58CC3FF0C003D9962D5BB2566CDBB6ADFAFAF8BE62719FBFE745AA2BD0F9EBFC3B6F276AB4AF1ADC91232472244772244772244772A475428E6284BE58D05F75D555D551F9E188EFBBE69A6BCA85BD117BD0F9EBFC3B68F5295F54E877F27661EDE35094BFAFE32E5624477224477224477224475ABBE728CEA12F4EB9BFE1861BFAA7D80F574CCDBFF9E69BCB53F18F566581CE5FE7DF393B50D30B3B42DFCF5B56FBD8EA8E54A3EFEBA81D2939922339922339922339D2DA3D477941BFB438423FD282BE58D89746EC57ABB240E7AFF3EFAC1DA84A6D64232BB45676A48A3B50A9CD2E3CDF31E734CA911CC9911CC9911CC991D6CE398ADBD615CFA11FEE94FBC1A6E217CFB1370D1F74FE3AFFF6D568C7A6DE0ED1603B52F55E7F4F9DD777C4398D72244772244772244772A4B57951DF930AEEB8C8DD5878E8A1878CD6432774FEB1B15BBB766DF6E28B2F563FDFBC7973DDD73DFDF4D3D9B9E79E5B6DB367CFCE1E7BECB1EC9C73CEC9E6CE9D5BFD7CE1C285D5EF1FECE7CC9831A3E5DFEBC8238FCC8E3DF6D886CFBFF6DA6BD5F77CEAA9A7AA5384EEB9E79EECC0030FCCAEBEFAEAEAEF93FEAEF4FA279E78A2FFF78BE7A3C5DF915AFA9E7BEFBD77C0EF7DCB2DB7ECD199C7DF11AFFFF0873F9C6DD8B061AF77FED1A9E7ED0F47B003356D083B46F576A45ADD812AEF488DFBD4C756FF577224477234FE39D23ABF1891233992A3F1593766CE9CF9F17471BC184D7FE79D77C6A4A88FABE2976E7777B86A0BDAACA84F05C8A73EF5A9FE9DF18B2EBAA8FAF941071D94DD7AEBADFDAF3DE08003B2B3CE3A6B8FEFFFD8C73E964D9D3AB5FA795F5F5FD362E4D4534F6DF977FBE8473F9A9D72CA2983BE260A92952B57668F3FFE78B668D1A26AC1F4CC33CF646FBDF556F5E7AD5FBF7EC0EFB078F1E2EAC7284EE2B12858E2EBD75F7F7D8FD7C6FBC6FFE1A69B6EAA3EFFF0C30F57FFD668A9608BC7E3C8E8DEEEFC0BD3A27ABABABA3ED1E2B7B5BA23D36C476AA83B50C59FBF75BC47485AFD5FC9911CC9D1F8E6489B18C5881CC9911C8DCFBA913F7E597A5D1C341F4B711FFB42517FB56A0BDAACA84F1BBD34E2169F5F70C105FD9FEFD8B1638F6264C99225D9AC59B3AA2D5E13237A871D7658F6D5AF7EB5BAE3DFAC1839F8E0831B3E1F3BF851AC448BF7DE6FBFFDB2238E38A2FF777BE49147F678FF356BD654BFBEFFFEFBAB4555FA19471D7554F56865F1BD5F79E595EAC7AD5BB7F68F34BEF1C61BD5EFFDC0073E507DFFF8BBA3A5EF89E22A7E46FA3AFEF6F433366EDC587D2E3DD62E9D7FA12D69728477A8530E1BED48ED33CC1DA8F2C8CCB8ED48B5FABF92233992A3F1CD9136B18A11399223391ADB75237FEC91F4FC8A152BC6B4A88F6D75E17759A4DA82362AEAA3B888A9B631F5B538D536A6CDC614E02806CAAF8F11C698A21B5FC7C778FD1FFCC11F341D618CA2269EDB7FFFFD07FD9D8AC54F79F42E8D0C968B9177DF7DB75A1CC4E7D75F7F7DB51089CF8F3BEEB86AC1918A91782CA6F8460151A94D8F8E8F279C7042F56F3FE49043B233CE3863400115538AD314E518854CC5487CDCB46953BB76FEFD4778EBEC200CF71CC27A3B522F8D60076AA4BFCF98FEAFE4488EE468FC72A44DE862448EE4488EC660DDC8BFDE981E1FED0BE495F5F6F6167F8F4DAA2D6893A23E76A2A378889DF0544CA49DEF18C96B54BC14A70D5F77DD75D511C3F8D8AC184953736344B25870341BFD2C1623F17BC56866FA3ACE01BEEFBEFBAA238AA9A048E7F4DE7EFBEDD5F388BFF4A52FEDF17E975E7A697F61910A9428BCD20862FC8D69B433DEE798638EC9EEB8E38EEC431FFA50F6E8A38F567FFED1471F5D7D7ED9B26503A61AB75BE75F3CC25B9BBE35D291887A3B5223D9812AEF484D6B97FF951CC9911C8D4F8EB4C9518CC8911CC9D1E8AE1B79DB9EBE1EADDBD80D767BBBC2CFDEA1DA82361AA98F163BD831EA77E59557D69D361CCFD72B4662E73CCE958D29BE5100342B462AB5F3808B17D91AAC45A151A94DED4D8F45E1F3C94F7E728FD7158BA9F8F9C59F978A8CF2EF914609D334E7E20863B1D88A91CA283C4E3FFDF4FE69CC695432CE3D4EEFD76CEA700B1DF3B8B4CF7CE633696767C10857B17DEA8C88BC547B7C2416B4CBFF2A9A1CC9911C8D6F8EB4B16F722447DAC4C951B18D87E2CF536D419B14F531CA163BD87181AEB83A767C1E536E638318A372C5AB58A7F361D3B9C071D1ADB4A31F2380F1BAC18A913465385D0D3B3E9F3F7F7ED3D1C518D9AB3785B7513112CF9F7CF2C9FD9F170BA998E61B5FC7E3E9F78C29C4F1BF4A5FC745468A2386311DB95C78A402268D7C56DAEC025F75DABAAEAEAEE953A74EDDB7F6D26657171EC9C8482BF70D6EE791913DFE5772244772343E391AAF3B48C4AC92E2EF13AFB9F9E69BEBFE8C585FE3F9189D8A5356D2CF39F3CC33B33973E68C6A81103FE75BDFFA56D3D7C4E93DF1795C6C32CDD469253B7234B972546FDB71E28927565BDA1E4576D2E70F3EF860751D4A998B7E3ED6F36869BD8F83D671003A6656C595D0EB1D8C8DAFAFBDF6DA01EB6DCCF88ACF8B07978B33CF62C65BBA786A719B19DBD77AB94CD77E49EF5FBEF06CBC5FBA864C6CCBE2DA357101D8E22CB44AED3A321D3A52DFBF6EE49FF719A987495ED447275F9CBE1BC5414CBF8D7361EB8DCC458B29B369C73F76D4EFBEFBEE6AC71857B51EAC18291711CF3EFBECA01D6A1AE5ACF7784C132E3E16BF4F7430E58D47B110297EFF49279D54DD9044A79EA60F4751121FE32AE171C5EFE205BE528153DCC8C4C7D8A98C8D577CFEFCF3CFB763E75FDE792AEFB0F455C6E61CC6E1EC48EDED7318EBFEAFE4488EE4687C72349E779048070EA230291E6CABF7BAF899B1235BBE4645F17494B84344BA28651446918DF87F140B88C8E8073FF8C101778448CFC7EC9638C8970A91C85D5CDCB2FCFBC4B53BD2E729F795DA1D25DABC1891A371CA51A316EB71B474C02BCDC82AAE3B7101D4F4DA741039D6CDF47C9A8D55299C76552EB08BEB68BA664AF4ED51549733593CE89C321BEF9BAEE7D268BDAED46EC19AEECE12071A1A1D044FDBB04AE994B8A1E6A65D73E49C7A50D40F989E9BCE7D8D8B62C551CE782CA6E8A64E3E5A8C1046077FD55557F5EF8C443170C92597F4EF88D4EBB46304A5FC73D351E1D8094B170C8B163B3E7174B838121A1B92D88189D7AF5EBDBAEEDF11EF978A89B88278BD9F9B7684E27CE4B4D1889DABB431890D4F71C424EDF4A50D467123153FAF7C65F036E9FCD77677779FDD60E7692423118D6E1354EF6AC343D991DA9B571B1EF47F2547722447E397A3CA18DF41220E3A45B6E2F49334F2185F47F68A070CA245E1937EEFE2E863A31CA68B5DC6887E7A5DE43C1D888BF5FCD0430F6D5850140FEA458B5354D28183341B28F52529C3C53B55A4BF371D8C93A3C9BD3D6A34F3A47811D74AEDB4ACE38F3FBE5A70C741A474502C5A1CF82D6632D6E334DA1D8FC5362D1D142BAEA377DD7557F5C076E433AE13537C6D1C4C4BEF1FDBA0625EE2006FF1806F9A9552CE7014E669565C2ADAE3CE2BF50E0A170BF9624ED201C4343BAE038AFA86EB86ABDF83A2BEBA231D3B33C59D80989A55ECD46B9D56FFA85E9CFF1B8548A3F72C8E8E444113C541A3D1CA7441AD787DFC9CD8B8C4EBEB1D714D4784CB3B5EB1818862223620694A72F1B65EE591CA380F397606E36F4FF7DD4E0548BA5A77718471B09DCFB4316AA3CE7FB09190918E4834BBEF6FB3FB063732A5B277EE0BDCD2FF4A8EE4488EC62747E3710789C849F97DEA8DFAA71DFF74702D15D795DA54E328C6E3F3C841797D4E4542A5307325A636A71CA5BB3CC4EF17192D1EC048A70EC44183F2E931F5464123E7E9148128C822C37234B973D46CA4BE38C21EDBA374C0B551419C0E14455F1F07A662DB960E08A43EBF78E79254B847111FEB729A859666B214B76BE9E0701C644BDBC394ABF878E79D770E98AD92BEAF7C50BA523A052566C0A59F173367226BE920467C4CB3DC3A60A4BEE9BAE13EF5A0A8D726D8555247A0D9C844B31DA8CA3077A4D294CBB3E54893A3C99BA3F1BA8344AB457D143A51D8477112A398519CC76B8AA38CE9229171C0A1584044D11DD389D3EF5E6930525F6F14311D1028DE3DA2FCFA18A94F239AE9F7A9D4B96E861CD91E950F3EA77534D6B958BFE2206E14C795C2692EC58355E90070CC2A8BEF4F23F771F0A952BBD569F1D6AAE9A0412A9EEBDD9DA598C93828906EA75A9C2E1F0578F40931EB264EC5A97790B9DE01B572819EFA80E281B674C02E65A8DD8BFA56CC9C39F3E37981BD3B0AEDFCF3EAB21A0BD12FCE9A35EBB785A2FE70D51628461423EDA7D10849AB3B5043DD914A3FEF6C39D2E4488EC6E30E1269464B9CE612AF2B5E302B7E66799A6F3C17057B1400517CA451F534753F8D9A177F5EF16290A9008991FA783E4E39291722C5EB4CA491FAF2DD23A21089D90BF19A18F9AC7740A0DDCEA997A3F6DB1EA573E82BB551F054ECC7D7E9DCF4F239E7B1EEC6687A5C2B264E6F895B93DE76DB6DFD07952A8591FA342A9F0AF57AA778153399660C44B11859490577F122ADE50B40A64CA50BEA15335C6FA64AA5C1F4FB74BA5C9C4E3011B64771DFFA546CC7FF6C2C3CF4D043C551FAD52A2D98E0C548A576E5EB62A73763C68C6AA71BD32A6347A9FCFAD84094AF92DD687466A8570A8E9DA4F27BEF8DFF4D07EC44A51192F2D4C30B2B43BFEF6FBD1DA9D94318899990394AA3786927AA7C15E0D4E235E529E99506B7952B5E5C2C767662272B8AA068C59D9D5408A473FF637A6F7A4DA3D7B563EEE46862E668BCEE20112383699A713C17E7DEA73B3A94F398FEE75198C408629AE65F6972F1AEF4F38BE72FC7EF15B7732C4FA96FB5A88F822B1540C551C77AC54AA37E458E6C8F62DD4FEB5A8CBAC77A1685705C84B2D185E462EA7A7C4FACF3B11E1F7BECB1FDB354D2B9EF91C9C8484CD34FEB627C9DCEC32F6F67CAA3FAF13363FB15B368D2D4FB78ACDE9D5D62DA7C6C1F2BB5D30862264D6425FD6FEAE5384E098BDF290E48C4EBD24189915CF9BE0D8BFAB353C11DA3F5A37DC1BC78BF7C5FBE7F943EFF79B3545A30418BFA7425DFB8D04FDAE949B72749B724AA77D4B55CD4C7D7713FEB46EF3FD42B05C76D87A2A848AF4DA334E9F3E2555B15F57BECE04CABB343D4CA0E54A5C9F78DDB6D82DA294769AA5F14D469DD1CEC8ADB312D3215396944A178FBA1E205F16247280A9CD8F14FD31DD34E4FF175C57BD4C78866BD9F5BCE67BBE54E8E26668EC6E30E12319A1885761401575C7145FFC1A62802A238881CC514E4F2CF8962A09897C18AFA18C98CF78FDCC4FB17473B1B5D0BA3DE0181C847A3739C8BE7D4C7EF56BCB8581442F5A63CCB91ED513A3894FAE098569FCE2F2F1E1C2A17F5699D4CE7D4570AB7324DE7D447AED2804D711D6D36FD3EBD268AEDB8064B3C17070CD2E7839D5292D6FFE281BCF478E42F5DCF224E7949B7DF2B9EF35F295C2CAF784D804EDE1EE5C5F613A9E88E6B148CD6EDED623FE20B5FF8C2FBC551FA215E2B03E8A4A23E3AF962919276562AB5AB5CC773C51D9862071BCFA51DACD8D96AD481B77AA5E0748196B81A6A1C558E1DC4D870A40D452B17F09AC4457D7147677A6187687665E8B7052A7FDF48EF47DCB139AA9466B0A4E2A2FCBA1839889D91B81051E426462DD27A5F6F64A1BC73154576EC5045917FE9A597D63D0890AE5A9FAEBC5F1C4189F7298E74B45BEEE46862E768ACEE209166C7C4B626D6FDB85A7E3977C582238D44C6FB45B15CBC477DF9005B141069143D0E44C4EF1E07018A17062B7E6FBD5B44960BA87ADBD794F574B1CD34CA99CE43BEE1861B06DC6A4F8E6C8FCAEB58BAEB4814B47180B77C4786C146EA639B952E845A7CAFE281B7D4D7472E5211586FA43E6526EED292F216057ACA7B3A7FBF7CE1D66871EA4B1C304EDBD29485C87EA57021D8E23DEED305012327C583028D0EB87568517F78DEB6A6FF7BFCAD232DEC63DFE1E69B6F2E9E47DFD7DDDD7DB42A0B2670515FBC87769A92953AEAD4F1D73B1A9A360895DA854B063B6830942B05A71D9DE214C64AED8AA7691473B84767274131526F476A34465CC6FDAAC2ED90A34607ABE2F118892F9F531CEB74ECB0C4CE4CECA0A7DB6FC50C96D801A914A6D8A6F78E8C45DEE6CD9B577D2C5DB8ABDED4FD18E18C02A9FCFB44C193767CD2FBB75BEEE46862E668ACEF2051BE555DB1084899497771683493A0D5F3955B7DFD508AFAD437544A17C72B5EB84F8EE468B096668EA42238DD62AE3823A4523A4DAA52B80D699A2E5FDE4FAB94CE9DAFD44EE3AA374BACDE39F5A9488FDF237E76DC76B53CC32D3EC6B6290E14C401E3C1EE0453AF454E623B5AFC9DE27DA348AD144EC3990839EAEAEAFA6CBA685E1AB11FEE54FCF8BED208BD69F730D18BFA34AA1253A862BA54EC6CC50E48140F5188C4F3B16188A2231D3D8DA3BDA948884EBA78EE557C9E6E9992A6EE0FF54AC1A9B8A8D42E84121F63542715458DEED1ADA81F931DA9D1DE21EB981CC5BA1D231DC5F30AD33A1EA31E31A250A98DC0A70B15C5487D142EE54C449ED2887C14F131D2529CCE9F46342A85F36BD36D7B8A3B41E9D63EF17BC59585E39EC2F1BBC4C7183529CF2068A7DCC9D1E4CC91667B2447722447ADC98BEF39C5C23ECEB18F59107160A4D5ABDCC745F18AE7D047EBEAEAFAA2EA0A2641E71F232D51C0C7C58062A73FA6E5A6AB9416AF061C8540F1FCC94A6D4A644CD76A769E6DA5C58B0A454BF7118E9F17C5501437E948739A0E1CA33476A25A1AD118C914C58E9BE2385A398A22BD782E5F71EA612A7ECB17842C9E871B2316A9A04FA374696423B528EED334E528D053119F66C9A4E23E8AFA58FFA3904FD3298BE7CA576AF7224EB7E22ADF77B85D722747932F479AED911CC9911C0D4D8CD8E76D5BB1288FE23E4E035CB1624575143E4DCD8F6D746F6F6F755FFC2FFFF22FB30B2FBCF037C5EF8B29F771A040650593A4F34FE7C4170BF85450A48B6F559A5C28AF52B8CDCA488BFA782CCE154B53C7D254B3288AD2F4B3F295F8ED4435DD111AEAC846475D8468AC7314EBDCB5D75EBBC7F97DE5ABDC373AB7310E02A451F9628B8D71F100599AAE982E12543CD73EBDBED1B993C5A9CFED9A3B399223CDF6488E34396A2ECEB12FDEEA6E986DB573E8619275FEE9FCC5E2CE7F3AB73E0A8D28662AA5F3B7CA457DBA98518C388EE44AC1F173A378890B76450112071762D4309E4B5382C7FB62791DBE1355DC219A3E46AF9FD0394AEB765A87E3DCC04A6D44BD51219D46EAD3687ACC7E8991EFE2EBA2688E753ADE375D14288AEA98F69F8AF674A0AD7C5BA04AE10AFC8315F5ED943B39B23DD26C8FE44893A32115F7E7D58AFBDD4329E66374DE55EE611276FE69E4318DD0550A17C88BD1F9286A1A152F712E6F9C8F1FC57D1C1CB8F2CA2BAB8FC7FD8A1B5D54ABD2E4A242E9353366CCD8A3A84A57068ECFCF3CF34C9DFFD8EC484DC95B5FDECE96A3FF3F8B25AE4A9F46CAE3BEC0C50B02B552D4571ADC062F5D313C5DC5378DCE4776225BE9005BF9FBE2FCF9B880501A416F7455EE76CA9D1CD91E69B64772A4C9D1D0CD9C39F3E379717F655EAC3F92B7D7F2B6A356C0C7C74D795B94B7AB63845F15053AFFBA3BF88DA618176F99527E3C4630CBA392C3292EE2FF10A3A2F57E46651C2F98374176A2C2B4DA0ED2B4419EDF3A1176A04623475184C7C1A954CCC754F9B8255CA5C955E02BB50BCDD5BBFD63BDD7C7287E5CCF22D6F574602DB5789F460710E2F749F7F76E65147D6FE74E8E6C8F34DB2339D2E40850D46B3AFFB11B219910531CE5488EE4488EE4488EE44853D4033A7F6DA277FEE51DA609B70325477224477224477224479AA21ED0F96B13B9F34F3B4E0B26E20E941CC9911CC9911CC9911C698A7A40E7AF4DF4CE3FCE59CC2A1D7C9B2039922339922339922339D2E408D0F96B93B9F3FF881C697224477224477224477204A0F3D7F923479A1CC9912647C8911C01E8FC75FEC8911C21479A1CC991264780CE5FD3F9CB912647C8911C21479A1C013A7F9D3F72A4C9911C6972841CC91180CE5FE78F1CC91172A4C9911C697204E8FC359D3F722447C8911C21479A1C013A7F4DE72F479A1C214772841CC91180CE5FE78F1C697224479A1C21477204E8FC359D3F722447C891264772A4C911A0F3D774FE72A4C911722447C8911CC911A0F3D7F923479A1CC9912647C8911C01E8FC75FEC8911C21479A1CC991264780CE5FD3F9234772841CC91172A4C911A0F3D774FE72A4C911722447C8911C01E8FC75FEC891264772A4C9911C597FE508986C962D5BA6D36D9FB623EFFC775B2BE548932339D2E4083992238096AC5AB5EACD2D5BB6E878DBA0F5F6F6FE75DEF9BF60AD94234D8EE4489323E4488E005AB27CF9F2B356AC58F1ABB7DF7E7BBB0E78EF1DC98D8E7FE9D2A5AFE7ED3C6BA51C69722447D66939428EE408A065798733BDA7A7675D4C118A737FB4716FF17F7F41C72F479A1CC9911CC911722447000000000000000000000000000000000000000000000000000000000000000000000030AAFE2F45B8138F3E0C4BC80000000049454E44AE426082,
        1);
INSERT INTO `act_ge_bytearray`
VALUES ('142502', 3, 'source', NULL,
        0x7B227265736F757263654964223A22313432353031222C2270726F70657274696573223A7B2270726F636573735F6964223A2270726F63657373222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C2270726F636573735F617574686F72223A22222C2270726F636573735F76657273696F6E223A22222C2270726F636573735F6E616D657370616365223A22687474703A2F2F7777772E61637469766974692E6F72672F70726F63657373646566222C22657865637574696F6E6C697374656E657273223A22222C226576656E746C697374656E657273223A22222C227369676E616C646566696E6974696F6E73223A22222C226D657373616765646566696E6974696F6E73223A22227D2C227374656E63696C223A7B226964223A2242504D4E4469616772616D227D2C226368696C64536861706573223A5B7B227265736F757263654964223A227369642D34353044334531432D304243332D343644312D394133342D423542314532353335384532222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22657865637574696F6E6C697374656E657273223A22222C22696E69746961746F72223A22222C22666F726D6B6579646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22227D2C227374656E63696C223A7B226964223A2253746172744E6F6E654576656E74227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D30313139353135382D323641322D343336442D413941392D423134384534434138324639227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3131362C2279223A39397D2C2275707065724C656674223A7B2278223A38362C2279223A36397D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D31453832344144322D334235452D343645302D394442462D384143304337374544354531222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C22657865637574696F6E6C697374656E657273223A22222C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A22222C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A22227D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D42413345323441392D343739362D343735342D424337342D363539303531463235303444227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3236312C2279223A3132347D2C2275707065724C656674223A7B2278223A3136312C2279223A34347D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D30313139353135382D323641322D343336442D413941392D423134384534434138324639222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D31453832344144322D334235452D343645302D394442462D384143304337374544354531227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3136302E31353632352C2279223A38347D2C2275707065724C656674223A7B2278223A3131362E3630393337352C2279223A38347D7D2C22646F636B657273223A5B7B2278223A31352C2279223A31357D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A227369642D31453832344144322D334235452D343645302D394442462D384143304337374544354531227D7D2C7B227265736F757263654964223A227369642D36363731393533452D363834452D343143322D384338302D384245414439323839373139222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22657865637574696F6E6C697374656E657273223A22227D2C227374656E63696C223A7B226964223A22456E644E6F6E654576656E74227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3333342C2279223A39387D2C2275707065724C656674223A7B2278223A3330362C2279223A37307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D42413345323441392D343739362D343735342D424337342D363539303531463235303444222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D36363731393533452D363834452D343143322D384338302D384245414439323839373139227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3330352E3337352C2279223A38347D2C2275707065724C656674223A7B2278223A3236312E3339303632352C2279223A38347D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A31342C2279223A31347D5D2C22746172676574223A7B227265736F757263654964223A227369642D36363731393533452D363834452D343143322D384338302D384245414439323839373139227D7D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A313230302C2279223A313035307D2C2275707065724C656674223A7B2278223A302C2279223A307D7D2C227374656E63696C736574223A7B2275726C223A227374656E63696C736574732F62706D6E322E302F62706D6E322E302E6A736F6E222C226E616D657370616365223A22687474703A2F2F62336D6E2E6F72672F7374656E63696C7365742F62706D6E322E3023227D2C227373657874656E73696F6E73223A5B5D7D,
        NULL);
INSERT INTO `act_ge_bytearray`
VALUES ('142503', 2, 'source-extra', NULL,
        0x89504E470D0A1A0A0000000D4948445200000180000000AE08060000003F16DA4D000000206348524D00007A26000080840000FA00000080E8000075300000EA6000003A98000017709CBA513C0000000467414D410000B18E7CFB5193000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000EC400000EC401952B0E1B00000FDF4944415478DAEDDD0D50D4677EC0F10776D9055F8063C070D644CD61C51AA3C978DA4989929C9144734D66740A9E682F992434CDD949741A63C6A45E8E4C9CD6A4C9B597DC25DA188227BE4534312ADA399C708EB1E70BC726A95215F584551179953D81DDFE7E1B70F6043C14F685E5FB99F9CFB2CBEE020FCFEFF93DCFB3CFFFF91B0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C08D45500408451E8F27FAD4A9533F696C6CCCBE72E5CAD8A6A6A668B7DB4DC1F436E023223C76BBFD92CD663BD8D2D2B22A2D2DED37940A09000819D2F0FF437575F59B2E976B507272B2898B8B3343870E35919191144E2F691295A46AEAEBEB8DD3E9BCDAD6D6F64D7373737646468683D22101004175E6CC99C293274F3E76C71D7798E1C3876B8F9542F1A3CACA4A535151D12C23AE790F3EF8E0364A6460B1500408A5C65F8EC7C68D1B6792929268FC0340475609090951172E5C989D9D9D5D969797779C5221010001A5D33ED2135DA28D7F6C6C6CA7EFFFB1F1BC717EBDD538BFD966AA4FFDC65CB97CCAD8070F33567B2C85D74B369B4D9380DDE974CE9A3F7FFE8EFCFCFC0B94CAC0C0A42A824E3FF0D5397F9DF6E9AEF13F7BF8BF4C63F531E36EBB6A3CEE5673A5E6843973688D71D59FA300FBC0E0C183CDA851A3DC168BE5E7940609000864EFFF27FA81AFCEF977A5E6F417A6F56A53A7C73519549F2AA600FBC888112312AC56EB983D7BF6FC35A54102000242977AEA6A9FEEE6FC9B6FD0CBD7D101FACEB061C39C7233879220010001A1EBFC75A967773C6D2DDDBFD8C3B9017D293131F12FE4269D921818AC1401824D4FF2D2D528083EF93F7C576E92280946004040E8C9499CE415220DC2B7FF073A862400203444C57CA7FB21AC9D9103400240D84AB8E33E63B50DEEF4B8252AC6248C4CA380001200C2D590A4716670E2D82E1F1F3A6C3C0504900010CEDA5A9A3B3DD6FAC7060A062001205C5D6DBAE83DE3B7F1E2379DBED774A9DC9CF9DD07DEE7002001208CD4551E96C67FB577DF9FEE5CA93D6D2A0EBE672E9FD96F3C9C1300DC14967B21247BFDE78F7FEEEDE1F7846E09A1CF6F9051C2B0BF9C65A2BD4BD901300240BFA33DFA9E36FE7F321A9091C2E9FFF91505089000D05F698FFE56E94EA1007A862920849CD419B91402C00800004002000090000000240000C02DE243E020D26BE1969595FDFD9123477E54555535A9B2B272507D7DBDD5E57219ABD5EA193A74684B4242C2B9D8D8D8FDF2F49F2D5DBAF418A506DC9AF9F3E78F686D6D7D3C222262BADC9D2447B21C43E470C9E194783C2ADFFBADC5622958B76EDD1F4800F05BC3FFC9279FBC9F9B9B3BEFD2A54BD671E3C699F4F47473FBEDB71B69F04D7474B4912410D1D0D0603B7BF6EC6887C331FAF0E1C33F7AE18517CE343535E5BEFFFEFBAB2945A067E6CD9BF7B8DC3CE776BBA749036FEBE229D1728C92EF8D92DBC7DBDADAFE2D2B2BAB58EEAF59BF7E7D3E09007DE6C081034FBEFEFAEBEFD6D5D5D9A592998913271AE97174AE919204F4484A4A32F7DE7BAF59B87061446969E9C88282825FE6E4E42CA9A9A9F9E1A64D9BFE8F1205BA26F1A58DFA2FA5C395710B2F4F97D7A5CB7BE4484278225C638D0410B85EBF75FBF6ED456BD7AE7D60F6ECD9E691471EE9B2E1BF114D16725876EFDE9DBA71E3C6DF3FF3CC33FFC46800E82C3333332B3232F25DE9F55FBB9A90C6DB5D77DD65A64E9D6A5252524C7C7CBC5E0253AF496D6A6B6B4D4545853978F0A091D1B66969B9761DEA3479DD1119453C1B8EA3011240801AFF7DFBF6EDDFBB77EFF7172F5E6CC68C19D3ABF7CBC8C830A9A9A9312B57AEFCF9534F3D655FBD7AF52F2865E05AE3FFA834FEF9D2F85B3A1A7EED70CD9C39D33BA2BEDEA04183BCC7F0E1C3CD7DF7DDE74D063B76EC303B77EE34D2FBD7A70C9118FE589240B42481B0EA70B10A2800B4E7BF65CB96EFBFF2CA2BBD6EFC3B8C1C39D2BCF6DA6B3152D1574AC5CCA694816B3DFF4269B0BD8DBF36EA6FBCF1867E00DC65E3DF151D19E8F3F575FAB99C4F47EE83708B3512809FE99CBFF4241E58B468518F2B604FE9FBBDFCF2CB43A2A2A2FE432A662AA58D814CE7FCA5B7FF6E47E33F76EC58B362C58A3F69C46F86BE4E5F3F61C204DF24F05E38C51A09C08F74B54F5151D17B3AE7DF573DFFAE4602D2EBB14BAFE7434A1C0399C4C0EA8E397FEDF92F59B2C43BC7DF1B3A35F4FCF3CFFB26119D0EFA8004803FABB0B0708D2EE5D4397B7F9A356B564C5C5CDC68A6823050E9524F69FC7FA05FEB9CBF36DABD6DFC7D93808EE07D166DA4854BAC9100FCD8FB77381C7FA74B3DA3A2A2FCFEF3727272BE233DA0E78234F45EAE01989E9ECEA20204AB0E5DABFBFA81EFAD4EFB7447DFEFD1471FF58DEF9C70287702D64FF40CDF0B172E5875E96620DC7DF7DD36BBDD3E5AE7410B0A0A2A02FCE7FE4C02C2DC76DB6D8DF2F30B232222D6B5B6B6966CDAB4A9919A809BA943C9C9C94D99999985BA8AA7A77548CFF095DEFF031DBD7F4D00FEF0F0C30F9BCF3FFFBC6389685A90628D04D01FE8F60EDD9DE4E52F13264C707EF9E59773E5CB55C1F89BA5E1D7D3EAB32590B325806BA547B75DEEAF97C454BC76ED5A17B5023D3058EAD17CA943F32576EAA591DD26F77F7DA33AD4BEBD8337D034E6F46C7A7FD0D5417A52A6C458C743418B35124088D3BD7D747B87409A3A756ABC54CEE9A150292520E3258817CA970B5D2E57B304F206796C9B94CB67C5C5C55CB60B3D112BC702A9470BA40EB9A443B151EE6FBDBE0EB5EFEDE33565CA14BFFE42FAFE3E092024628D0410827463375DA1134877DE79E720F3ED2657A126468E1F4B20FF5886F875920C7649D0AE6564809B10DDD1A1903AA4238322DDAB47EB90E486493E31E0D75F62D4A851BE7727F5F7422501F889EEEAA943C6406A69694992206995E05811C245132747A6FC9E99BAEB696666E6898B172F526142447575B5772B8410AF433A32982B7568AED621E1EEF886BF63EEBAF74F2401A04B5A317533B7403A70E0800E87F57FFA2FFDA59CE4F7FD9EEEBF3267CE1C2A4D08F8E28B2FF4F32BD39FEA90F159CDD8574B3FBBA34B427D47252400744986A61EDDD239904960CA9429D59B376F8E9746F5F500FFB93D692CAEB6DFDAAE4B0027274F9E7C27352634DC7FFFFDE6F4E9D39A047E1A8275A84D7AFD9EF64E8E6F1D72CBC3DE24D0D0D0E0D724A01BC7F9F6F34800E87A8C1A1BDB525B5B6B4B4E4E0ED8CF8C8A8AAA9160701514140474F89E9595D55DF0366B60CAEF64EF68F8E57EADDCDFAB4B452549EED2CF009E7CF2490F3526342426267A57BA2C5DBA3424EA904E69CA8DBB7D1F7F8BDC76AA43D2D12A93EFA5E8F37523377F26007D7F1FD5240074293E3EFE8CF4A452029900CACACA4E682F29C87FBAAEDB8E9063B01C311AB0ED8FED9263434C4CCC5E69F46BA921F833A3C5B6F6FA63F5A9575DD621491E473B12C0C99327FBFC24305FBA65B48FA32400743702D8E770385274EFF140D9BF7FBFF6A4F705F94F1FE213B09BE5D8111D1DFD19AB7D70136C3753876444B04F1285AEC9F7EEE73F7DFA74BFFD62FAFE3EF6F5F7822601F8495D5DDD1B320278A2ADAD2D32402783B9CACBCB7597C2E782F537EBD05C6E8A2323233F6A5FE2494F1F7EAF4356ABB550E2ECDFF5CBD2D252535353E39793C174FAE7D0A1439EF611AE694F4E240074969B9B7B62F1E2C5A7A4427E4FE754FDADA8A8688BDBED1E19A453D35F911E5885F4D236D3D347A0EB905EC07DDEBC79C5923C66E8055CF4422EBA9F7F5FDBB56B979E75DCD1F897F4F76D204800FE1F052CFBB5983871A2D5CFA380DA8F3EFAE8AF2480DE0AC6DF298190CB7F1B41AE437A55BC19FA85268069D3A6F5E9670167CF9E359F7EFAE9B5DEBFC4DAAFC2A1DCD90DD48FD6AC59B3A9B1B1F11BAD90FEB46AD52AEDFD375555551550EA1888D6AF5F5F2837C5FAB58E02DE7EFB6DEF92D0BEA04B3FDF79E79D3689B16BBDFF7089351280FF47017FBB75EBD6E6F2F272BFBC7F5959D9F643870ECD961EC9D3ECB18301EE09D3BE34B3B2B2D2BCF9E69BBD4E02DAF84B32F19C3B77AE6308DF184EB14602F0FFD0B6E2EAD5AB4F4B65BCD2D75B1E48A5FCEDCA952B274985FC67E901FD2FA58D811E6B1E8F67917CE96D9C8F1D3BE6BDA4A34EDFDC0A7DDDABAFBEDA269DAC8E9EBF4EFD3C1B4EB146020880FCFCFC758D8D8D8B962F5FDED8572301EDF9BFF8E28BB7CB70F73DA990F9943260CC860D1B746AE6E98E24A0238165CB96E907C5D79FC4D52D7D9E2413F3D24B2FF9F6FC7585D2B2708B350B552630A4C13E92929272AAA4A464A6C562691D33668C2D32F296F26FED5B6FBD5520157DBA54C8E572FB9FFDBD6C162E5CB822D03BA7A27BBA15C4C71F7FFCD3FEFAFB3B1C8EA3E3C78FD79ED60CE9B1EB2EA2E6F8F1E3DE553C274E9CD0953CDEEB7468FCD9ED76EF348F8ECE2546F532AEE6C30F3F747FF5D55711BAEB44FB5BEAF90839E1106BD7631550807B2759595907366EDCB866E7CE9DE373727262EFB9E79E981EBEDCB567CF9EC2BCBCBC14A9C02952B11F60DA07B871AC499C7CA0CB43F531FD7058773AD5E32666464A74CE3F5C638D041060ED6B877F209573EEAA55AB9EB5D96C135253532FA6A5A50D193D7AB42D2121215937906B6E6E3E2F43D1BAAFBFFEBA5C460D96F2F2F2B1528147C86B7FE1743AF3F9C017E851AC3DA4B1268D788E2482F49B68F34AE45813EEB14602085EE5D4B30837EBF54C4B4B4BE71E3D7AF46FE4FE64F3ED0E83BA85A8EE9BAF171FD5B5C7FF2DC7B3E170E20910CC5873BBDD7A1D818E584B6E8F358D395D3DA47BFBE8F60E9B074AAC9100824CCF62949BB7DB0F00C45AC0B00A0800480000001200008004000020010000480000001200008004000020010000480000001200008004000020010000480000001200064E258C8CF4B8DD6E0A2204C8FFE1B469BF9E2E480080DF4547475F686868A02042C0E5CB971DE6DB0BA3800400F85F545454495D5D1D0511029C4E67BDDC145312240020205C2ED7BF565555B5783C1E0A23B82A6A6A6A26CAED168A82040004C4B469D30E4AE3FFFBCACA4A0A23881C0EC71EF93F543EF4D04307280D120010C85140764545C595FAFA7A0A23086A6B6BB749EFFF876EB7FB054A63E0B050040805F9F9F9D50B162C3878E9D2A5C7E2E2E2A2ED763B8512C0C6BFACAC6C424444C43FCE9C39B384122101000197979777323B3BFB77E7CF9F7F5C1AA3A6D8D8D818B9A560FCA7C2E1706C9291D783DAF8CF9831E3338A646021BA107276EFDE9D1A1919F98ED56ABD272929E90F898989DF955141B23C46E1F492AEF3D7A59EBADA473FF0D5397F9DF6C9C8C870503A240020641415154D929EE91CF9325D8EC97244532ABDA62779E93AFF6239B6F0812F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C10FF0F69FC5631EC579B510000000049454E44AE426082,
        NULL);
INSERT INTO `act_ge_bytearray`
VALUES ('145002', 1, 'new-process.bpmn20.xml', '145001',
        0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612220786D6C6E733A61637469766974693D22687474703A2F2F61637469766974692E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E61637469766974692E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D2270726F636573732220697345786563757461626C653D2274727565223E0A202020203C73746172744576656E742069643D227369642D34353044334531432D304243332D343644312D394133342D423542314532353335384532223E3C2F73746172744576656E743E0A202020203C757365725461736B2069643D227369642D31453832344144322D334235452D343645302D394442462D384143304337374544354531223E3C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D227369642D30313139353135382D323641322D343336442D413941392D4231343845344341383246392220736F757263655265663D227369642D34353044334531432D304243332D343644312D394133342D42354231453235333538453222207461726765745265663D227369642D31453832344144322D334235452D343645302D394442462D384143304337374544354531223E3C2F73657175656E6365466C6F773E0A202020203C656E644576656E742069643D227369642D36363731393533452D363834452D343143322D384338302D384245414439323839373139223E3C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D227369642D42413345323441392D343739362D343735342D424337342D3635393035314632353034442220736F757263655265663D227369642D31453832344144322D334235452D343645302D394442462D38414330433737454435453122207461726765745265663D227369642D36363731393533452D363834452D343143322D384338302D384245414439323839373139223E3C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F70726F63657373223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D2270726F63657373222069643D2242504D4E506C616E655F70726F63657373223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D34353044334531432D304243332D343644312D394133342D423542314532353335384532222069643D2242504D4E53686170655F7369642D34353044334531432D304243332D343644312D394133342D423542314532353335384532223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D2238362E302220793D2236392E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D31453832344144322D334235452D343645302D394442462D384143304337374544354531222069643D2242504D4E53686170655F7369642D31453832344144322D334235452D343645302D394442462D384143304337374544354531223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223136312E302220793D2234342E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D36363731393533452D363834452D343143322D384338302D384245414439323839373139222069643D2242504D4E53686170655F7369642D36363731393533452D363834452D343143322D384338302D384245414439323839373139223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223330362E302220793D2237302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D42413345323441392D343739362D343735342D424337342D363539303531463235303444222069643D2242504D4E456467655F7369642D42413345323441392D343739362D343735342D424337342D363539303531463235303444223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236312E302220793D2238342E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223330362E302220793D2238342E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D30313139353135382D323641322D343336442D413941392D423134384534434138324639222069643D2242504D4E456467655F7369642D30313139353135382D323641322D343336442D413941392D423134384534434138324639223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223131362E302220793D2238342E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223136312E302220793D2238342E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E,
        0);
INSERT INTO `act_ge_bytearray`
VALUES ('145003', 1, 'new-process.process.png', '145001',
        0x89504E470D0A1A0A0000000D4948445200000158000000860806000000982F92AB000008DE4944415478DAEDDDDD4F53671CC0712FBCF08FD885C996CC3F6117BBF00F30D92E2420A01024561D28A224644A20A8113486C42D594C488C868525C620634C5E0A9657C9980498840C364405C132868A142BC8B3E7D751732CA0D0F69C9E9E7E3FC913378A62EC39DF3E7D7A5EB66D0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000984229B57D6C6CEC664F4FCFDB969616D5DCDCCCB078B8DD6ED5DEDEFE8F1EE96C918083485C3B3A3A94D7EB557EBF9F11A3313333A3DADADA5EE8D8EE65AB041C4266AEC4D53691F5EB19ED305B25E010B22C40DCEC33746097D82A0187903540C266ABC02AB64A20C102FBEAF9941AEBBDA686DCA58121FF2D5F238A04164004819D9F9B540F1A8BD4407DC17B43BE268F1146020B20CCC03E19FA794D5C836362A88E30125800E10676F86EF9868195C7082381051066601F34976C1858798C301258000496C002B05760E5A8818D022B8F1146020B20CCC08E767DBF6160E531C24860018419D8D9C941F5A0A978EDF280FE9A3C4618092C8030032BE3E1EF37D60456BE4614092C804802FBFAB51AEDFE61EDF280FE9A3C4618092C8030022B676A8D747DB7E11AAC3CC6D95C0416C05602AB67A653A3ADEA8F866F378C6B70C8F7C8F7329B25B0003E12D88FCD5A99CD12580061067633B3D60FCD6609258105B04160C38D6B70104A020B601B17DC26B000082C81054060190416008125B0803994523B0607075DD7AF5F6F2B2B2B7B71ECD8B1A5CCCC4C959292A2D2D3D3578E1C39E23F7DFAF458797979951E9F135806810D5F5A5ADA27C9C9C9397AFFBAA9C7A81EF3B2AFE9B1A8C743FD588DFEF5947C1F758AF3B0DEBA75EBC6D9B36797F2F2F2D4D5AB57554F4F8F9A9C9C548B8B8B4AC8AF5EAF57DDBF7F5FE900ABE3C78FAF9C387162FCD0A143D904964160376FDFBE7D5FEBD1AC877F35A89B1977F5F7A753AB38A3439A75EEDCB9D705050581782E2F2FABCDEAEFEF57858585CB2E976B382929E93302CB20B01BD391DCA923D9B085A8AE373A9CB4AF3979D6BABDB6B6B6F5F0E1C3AAAEAE6E4B610DD5D0D0A0B2B2B27C4E99CD1258021B6DFAED7E4A6A6AEABFC658EAB7FEEAC2850BAAB5B5553D7EFC58BD7CF932B03F2D2C2C04DE3D767575A98A8A0AB57FFFFED0C8CE339BB5795C3D1ECF6FB9B9B96A64644445C3F8F8B8D2B1F66567677F43601904F6BDB8EED1415C3686B5AAAA2AB0E4B61973737381EF97DF670CADFE33B3A9990DC9CC55E2BAD92778B3E4CFD3B3D8B87F7525B004369A3357635CF3F3F303B3D570C8EF93A5BC90C83293B5DB9AAB2C0B446BE6BADE4CF6C0810373FA89DF456019891C585973352E0B141717BF5B0608972C1F9C3F7F3E74B9601765B3C7D2C08ED2D252BFACB99AA9BEBEDEA7DFCEDC23B08C440EAC8EABDB38738D34AEC6C886CC643BA89B0DD4D4D4FC284FCC9B376F94D98E1E3D3A1DAF6F5F082C818D941C8A655C730D7759E043CB05C63559960A6C307B95E35CE5502C2B0C0C0CF8E375164B60096C1402DB1C8C9F7C406586EAEA6A66B176216768C9075B911C8EB555595959D3B20E65A78D5E8F2F092C8135731B9233AF821F6CC92C737676D694FD4B8E2E0839846B27A58B1139FDB5B2B25259A9A2A2A25F4EF5B3D1870EC1B753CDC9C9C95F1058026BC636B47AFA6BE0FB2E5EBC68F63E660CEC294A1723726D0139FDD54ADDDDDDE3FA49AFB3DBCE611877D69B8D1058021BC936B47A6D81C0E31E8FC7D47D4C4E4630FC5DEA285D8CC8855BA6A6A62C0DECF4F4B4573FE94F6CBC73BC9B8D187712024B6023D986562FDC12F87AB43FDC0A25677C19FE1E4F285D8CC855B182176EB18AFC3CB93290DD770EE36C44DEF61158021BC936A4872FF8FFD13A34EB43876C197EF622A58BE186110B115ED8222683C0DA6BC4E336141C56EF63942E4632323256AC9EC1FA7CBEE93899C1F6CAF9E2BB77EFDECE120133D848B721C3755D99C1268ADCDC5CBFD56BB04F9F3EFDD3E66BB0EF85953558021B8D6D8835D804545454346AF551048D8D8DBFDAF428827B72A64D6858092C818DC636C4510409E8D2A54B95561F075B5C5C5C6FB3E360D79DB11258021BCD6D88E36013D09933673ECDC9C9796BE1995C8BA9A9A97FC7E3D9250496C04642CEE4D2DBFD92156772C9BDF23893CB26F2F3F3FFB2EA5A048D8D8D55F17A7E348125B091E25A0409E8E0C18349274F9E5CB260163BA767AF7D5C4D8BC1D5B4CCBB9A96DEC756B89A96CDB85CAE41B3AF072BEBBDF28AFAB1B54E02CB70F805B7EF9A753D583D515A36CE5EE3755F731C59A7911B149A754783C1C1C15AFD33A6B8A30183C0A6ECD463C6843B1AAC7047031B4B4F4F4FD333D98568DF936B6262A253BF6D79C43DB91804F67F724FAEE0075ED1B82757C8CC95A501BB4A4B4BCB921B14466B262B335789ABDEA00AE3FDDF86C012D828CF64338D910DDE55568E02D8ECD102F2819671CD558613F635479357573D9B7D71FBF6ED57117CF03577F9F2E56BB22C201B9213FE5D082C8135635FD363CE184809AD1C272B2723C8EC34B87C20CB007286969C4470E5CA15959191F136E4ECB179A7EC6B09B126AB5F195B5C2ED7745F5F9F6F2BC7B936353555EB40F7CA22BB93D681082C81356B5F331EBE15E6E860CD353E9FFCBD12DACCCC4C6F5959D9506767E723FD2A3A15BC408C5CB845AE2DE076BB7F292929B9A35F7DC7E4C9965752A77D82496009ACD9FBDA6A6897B6125627EE6B89B8362BF713CA5B3D9FFAA15CA12778A51EB998849CEF2CA7E439F9AC11024B60D9D700024B600110580681054060092C00024B600110580681054060092C00024B600110580681054060092C00024B600110580681054060092C00024B600110580681054060092C00024B600110580681054060092C00024B600110580681054060092C002BB5B4B41036FB8C451DD825B64AC021DADBDBA7BC5E2F71B3C1989C9CFC49077698AD127088D6D6D6AF3C1ECFF367CF9EF9885CEC66AE1257B7DBFD488FBD6C958083E89D7A8F9E39F5CADB53590364583EE4DF7D98B802000000000000000000000000000000000098E43F1FAE2317138A7F0D0000000049454E44AE426082,
        1);
INSERT INTO `act_ge_bytearray`
VALUES ('145006', 2, 'source', NULL,
        0x7B227265736F757263654964223A22313435303035222C2270726F70657274696573223A7B2270726F636573735F6964223A2270726F63657373222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C2270726F636573735F617574686F72223A22222C2270726F636573735F76657273696F6E223A22222C2270726F636573735F6E616D657370616365223A22687474703A2F2F7777772E61637469766974692E6F72672F70726F63657373646566222C22657865637574696F6E6C697374656E657273223A22222C226576656E746C697374656E657273223A22222C227369676E616C646566696E6974696F6E73223A22222C226D657373616765646566696E6974696F6E73223A22227D2C227374656E63696C223A7B226964223A2242504D4E4469616772616D227D2C226368696C64536861706573223A5B5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A313230302C2279223A313035307D2C2275707065724C656674223A7B2278223A302C2279223A307D7D2C227374656E63696C736574223A7B2275726C223A227374656E63696C736574732F62706D6E322E302F62706D6E322E302E6A736F6E222C226E616D657370616365223A22687474703A2F2F62336D6E2E6F72672F7374656E63696C7365742F62706D6E322E3023227D2C227373657874656E73696F6E73223A5B5D7D,
        NULL);
INSERT INTO `act_ge_bytearray`
VALUES ('145007', 1, 'source-extra', NULL,
        0x89504E470D0A1A0A0000000D49484452000000320000003208060000001E3F88B1000000206348524D00007A26000080840000FA00000080E8000075300000EA6000003A98000017709CBA513C0000000467414D410000B18E7CFB5193000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000EC400000EC401952B0E1B000000204944415478DAEDC101010000008220FFAF6E4840010000000000000000C0A30127420001FCA695FE0000000049454E44AE426082,
        NULL);
INSERT INTO `act_ge_bytearray`
VALUES ('57502', 8, 'source', NULL,
        0x7B227265736F757263654964223A223537353031222C2270726F70657274696573223A7B2270726F636573735F6964223A2273616C617279222C226E616D65223A22E6B581E7A88BE5AEA1E689B9E6B58BE8AF95E6B581E7A88B222C22646F63756D656E746174696F6E223A22222C2270726F636573735F617574686F72223A22626F6F74646F222C2270726F636573735F76657273696F6E223A22222C2270726F636573735F6E616D657370616365223A22687474703A2F2F7777772E61637469766974692E6F72672F74657374222C22657865637574696F6E6C697374656E657273223A227B5C22657865637574696F6E4C697374656E6572735C223A5C225B5D5C227D222C226576656E746C697374656E657273223A227B5C226576656E744C697374656E6572735C223A5C225B5D5C227D222C227369676E616C646566696E6974696F6E73223A225C225B5D5C22222C226D657373616765646566696E6974696F6E73223A225C225B5D5C22222C226D65737361676573223A5B5D7D2C227374656E63696C223A7B226964223A2242504D4E4469616772616D227D2C226368696C64536861706573223A5B7B227265736F757263654964223A227374617274222C2270726F70657274696573223A7B226F766572726964656964223A227374617274222C226E616D65223A22E590AFE58AA8E5AEA1E689B9222C22646F63756D656E746174696F6E223A22222C22657865637574696F6E6C697374656E657273223A22222C22696E69746961746F72223A226170706C79222C22666F726D6B6579646566696E6974696F6E223A222F6163742F73616C6172792F666F726D222C22666F726D70726F70657274696573223A22227D2C227374656E63696C223A7B226964223A2253746172744E6F6E654576656E74227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D33364535304338422D364337432D343936382D423032442D454241413432354246344245227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A36302C2279223A3237307D2C2275707065724C656674223A7B2278223A33302C2279223A3234307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A22656E64222C2270726F70657274696573223A7B226F766572726964656964223A22656E64222C226E616D65223A22E7BB93E69D9FE5AEA1E689B9222C22646F63756D656E746174696F6E223A22222C22657865637574696F6E6C697374656E657273223A22227D2C227374656E63696C223A7B226964223A22456E644E6F6E654576656E74227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A313030332C2279223A3338347D2C2275707065724C656674223A7B2278223A3937352C2279223A3335367D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A226D6F64696679222C2270726F70657274696573223A7B226F766572726964656964223A226D6F64696679222C226E616D65223A22E59198E5B7A5E896AAE985ACE6A1A3E7BAA7E4BFAEE694B9222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A66616C73652C226578636C7573697665646566696E6974696F6E223A747275652C22657865637574696F6E6C697374656E657273223A7B22657865637574696F6E4C697374656E657273223A5B5D7D2C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A7B2261737369676E6D656E74223A7B2261737369676E6565223A22247B6170706C797D227D7D2C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A7B227461736B4C697374656E657273223A5B5D7D7D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D31363344424336302D444243392D343338422D393731412D363737333846423737313541227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3331312C2279223A3139337D2C2275707065724C656674223A7B2278223A3230392C2279223A3133357D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A226175646974222C2270726F70657274696573223A7B226F766572726964656964223A226175646974222C226E616D65223A22E896AAE985ACE4B8BBE7AEA1E5889DE5AEA1222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A66616C73652C226578636C7573697665646566696E6974696F6E223A747275652C22657865637574696F6E6C697374656E657273223A7B22657865637574696F6E4C697374656E657273223A5B5D7D2C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A7B2261737369676E6D656E74223A7B2261737369676E6565223A2261646D696E227D7D2C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A7B227461736B4C697374656E657273223A5B5D7D7D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D32414237433031412D353045452D344141432D384338462D463645313933354233444137227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3230312C2279223A3238327D2C2275707065724C656674223A7B2278223A3130352C2279223A3232357D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646222C2270726F70657274696573223A7B226F766572726964656964223A227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C2273657175656E6365666C6F776F72646572223A22227D2C227374656E63696C223A7B226964223A224578636C757369766547617465776179227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D35333235383530322D343345452D344445382D423141342D444244313139323242384146227D2C7B227265736F757263654964223A227369642D37323235384134312D323033452D343238432D423731442D434133353036323532443733227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3238302C2279223A3238307D2C2275707065724C656674223A7B2278223A3234302C2279223A3234307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A22617564697432222C2270726F70657274696573223A7B226F766572726964656964223A22617564697432222C226E616D65223A22E99B86E59BA2E4BABAE58A9BE8B584E6BA90E983A8E983A8E995BFE5AEA1E6A0B8222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A66616C73652C226578636C7573697665646566696E6974696F6E223A747275652C22657865637574696F6E6C697374656E657273223A7B22657865637574696F6E4C697374656E657273223A5B5D7D2C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A7B2261737369676E6D656E74223A7B2261737369676E6565223A2261646D696E227D7D2C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A7B227461736B4C697374656E657273223A5B5D7D7D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D45463246353142422D314439392D344630422D414346322D423643313330304137443242227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3331302C2279223A3431307D2C2275707065724C656674223A7B2278223A3231302C2279223A3333307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630222C2270726F70657274696573223A7B226F766572726964656964223A227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C2273657175656E6365666C6F776F72646572223A22227D2C227374656E63696C223A7B226964223A224578636C757369766547617465776179227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D41373538393038342D343632332D344645412D413737342D303041373044444331443230227D2C7B227265736F757263654964223A227369642D46413631383633362D333730382D344430432D383531342D323941344242384243393236227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3338352C2279223A3339307D2C2275707065724C656674223A7B2278223A3334352C2279223A3335307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D45463246353142422D314439392D344630422D414346322D423643313330304137443242222C2270726F70657274696573223A7B226F766572726964656964223A227369642D45463246353142422D314439392D344630422D414346322D423643313330304137443242222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3334352E313332383132352C2279223A3337307D2C2275707065724C656674223A7B2278223A3331302E32313837352C2279223A3337307D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A32302C2279223A32307D5D2C22746172676574223A7B227265736F757263654964223A227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630227D7D2C7B227265736F757263654964223A22617564697433222C2270726F70657274696573223A7B226F766572726964656964223A22617564697433222C226E616D65223A22E99B86E59BA2E4BABAE58A9BE8B584E6BA90E983A8E58886E7AEA1E9A286E5AFBCE5AEA1E6A0B8222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A66616C73652C226578636C7573697665646566696E6974696F6E223A747275652C22657865637574696F6E6C697374656E657273223A7B22657865637574696F6E4C697374656E657273223A5B5D7D2C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A7B2261737369676E6D656E74223A7B2261737369676E6565223A2261646D696E227D7D2C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A7B227461736B4C697374656E657273223A5B5D7D7D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D33444243443636312D353732302D343438302D383135362D373438424530323735464546227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3532302C2279223A3431307D2C2275707065724C656674223A7B2278223A3432302C2279223A3333307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534222C2270726F70657274696573223A7B226F766572726964656964223A227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C2273657175656E6365666C6F776F72646572223A22227D2C227374656E63696C223A7B226964223A224578636C757369766547617465776179227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D44343443414434332D303237312D343932302D413532342D394238353333453532353530227D2C7B227265736F757263654964223A227369642D31353235424646342D334539442D344438412D424638302D314636334146453136323839227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3539352C2279223A3339307D2C2275707065724C656674223A7B2278223A3535352C2279223A3335307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D33444243443636312D353732302D343438302D383135362D373438424530323735464546222C2270726F70657274696573223A7B226F766572726964656964223A227369642D33444243443636312D353732302D343438302D383135362D373438424530323735464546222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3535352E313332383132352C2279223A3337307D2C2275707065724C656674223A7B2278223A3532302E32313837352C2279223A3337307D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A32302C2279223A32307D5D2C22746172676574223A7B227265736F757263654964223A227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534227D7D2C7B227265736F757263654964223A22617564697434222C2270726F70657274696573223A7B226F766572726964656964223A22617564697434222C226E616D65223A22E99B86E59BA2E680BBE7BB8FE79086E5AEA1E689B9222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A66616C73652C226578636C7573697665646566696E6974696F6E223A747275652C22657865637574696F6E6C697374656E657273223A7B22657865637574696F6E4C697374656E657273223A5B5D7D2C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A7B2261737369676E6D656E74223A7B2261737369676E6565223A2261646D696E227D7D2C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A7B227461736B4C697374656E657273223A5B5D7D7D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D30324442324144392D313333322D343139382D414338442D323241333531363944313543227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3733302C2279223A3431307D2C2275707065724C656674223A7B2278223A3633302C2279223A3333307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737222C2270726F70657274696573223A7B226F766572726964656964223A227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C2273657175656E6365666C6F776F72646572223A22227D2C227374656E63696C223A7B226964223A224578636C757369766547617465776179227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D37443732333139302D313433322D343131442D413441342D373734323235453534434439227D2C7B227265736F757263654964223A227369642D33354343384336432D313036372D343339382D393931432D434346393535313135393635227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3830352C2279223A3339307D2C2275707065724C656674223A7B2278223A3736352C2279223A3335307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A226170706C795F656E64222C2270726F70657274696573223A7B226F766572726964656964223A226170706C795F656E64222C226E616D65223A22E896AAE985ACE6A1A3E7BAA7E58591E78EB0222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A66616C73652C226578636C7573697665646566696E6974696F6E223A747275652C22657865637574696F6E6C697374656E657273223A7B22657865637574696F6E4C697374656E657273223A5B5D7D2C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A7B2261737369676E6D656E74223A7B2261737369676E6565223A2261646D696E227D7D2C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A7B227461736B4C697374656E657273223A5B5D7D7D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D42444230414142322D374535302D344433352D383045452D434530424543444439463537227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3934302C2279223A3431307D2C2275707065724C656674223A7B2278223A3834302C2279223A3333307D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D30324442324144392D313333322D343139382D414338442D323241333531363944313543222C2270726F70657274696573223A7B226F766572726964656964223A227369642D30324442324144392D313333322D343139382D414338442D323241333531363944313543222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3736352E313332383132352C2279223A3337307D2C2275707065724C656674223A7B2278223A3733302E32313837352C2279223A3337307D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A32302C2279223A32307D5D2C22746172676574223A7B227265736F757263654964223A227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737227D7D2C7B227265736F757263654964223A227369642D32414237433031412D353045452D344141432D384338462D463645313933354233444137222C2270726F70657274696573223A7B226F766572726964656964223A227369642D32414237433031412D353045452D344141432D384338462D463645313933354233444137222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3234312E34343731353235343831353839332C2279223A3235382E383732393537383635303735317D2C2275707065724C656674223A7B2278223A3230312E36343635393734353138343130372C2279223A3235362E343535313637313334393234397D7D2C22646F636B657273223A5B7B2278223A34382C2279223A32382E357D2C7B2278223A32302C2279223A32307D5D2C22746172676574223A7B227265736F757263654964223A227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646227D7D2C7B227265736F757263654964223A227369642D37443732333139302D313433322D343131442D413441342D373734323235453534434439222C2270726F70657274696573223A7B226F766572726964656964223A227369642D37443732333139302D313433322D343131442D413441342D373734323235453534434439222C226E616D65223A22E698AF222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D317D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A226170706C795F656E64227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3833392E37383132352C2279223A3337307D2C2275707065724C656674223A7B2278223A3830342E383637313837352C2279223A3337307D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A226170706C795F656E64227D7D2C7B227265736F757263654964223A227369642D44343443414434332D303237312D343932302D413532342D394238353333453532353530222C2270726F70657274696573223A7B226F766572726964656964223A227369642D44343443414434332D303237312D343932302D413532342D394238353333453532353530222C226E616D65223A22E698AF222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D317D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A22617564697434227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3632392E37383132352C2279223A3337307D2C2275707065724C656674223A7B2278223A3539342E383637313837352C2279223A3337307D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A22617564697434227D7D2C7B227265736F757263654964223A227369642D35333235383530322D343345452D344445382D423141342D444244313139323242384146222C2270726F70657274696573223A7B226F766572726964656964223A227369642D35333235383530322D343345452D344445382D423141342D444244313139323242384146222C226E616D65223A22E590A6222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D307D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A226D6F64696679227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3236302C2279223A3233392E357D2C2275707065724C656674223A7B2278223A3236302C2279223A3139332E357D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A35312C2279223A32397D5D2C22746172676574223A7B227265736F757263654964223A226D6F64696679227D7D2C7B227265736F757263654964223A227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130222C2270726F70657274696573223A7B226F766572726964656964223A227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C2273657175656E6365666C6F776F72646572223A22227D2C227374656E63696C223A7B226964223A224578636C757369766547617465776179227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D38343438454634412D423632452D343839392D414243322D304532444232414536383338227D2C7B227265736F757263654964223A227369642D34344146423943312D343035372D344334382D423146322D314543383937413532434237227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3238302C2279223A38357D2C2275707065724C656674223A7B2278223A3234302C2279223A34357D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D31363344424336302D444243392D343338422D393731412D363737333846423737313541222C2270726F70657274696573223A7B226F766572726964656964223A227369642D31363344424336302D444243392D343338422D393731412D363737333846423737313541222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3236302C2279223A3133342E333832383132357D2C2275707065724C656674223A7B2278223A3236302C2279223A38342E353632357D7D2C22646F636B657273223A5B7B2278223A35312C2279223A32397D2C7B2278223A32302C2279223A32307D5D2C22746172676574223A7B227265736F757263654964223A227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130227D7D2C7B227265736F757263654964223A227369642D37323235384134312D323033452D343238432D423731442D434133353036323532443733222C2270726F70657274696573223A7B226F766572726964656964223A227369642D37323235384134312D323033452D343238432D423731442D434133353036323532443733222C226E616D65223A22E698AF222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D317D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A22617564697432227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3236302C2279223A3332392E34363837357D2C2275707065724C656674223A7B2278223A3236302C2279223A3237392E39303632357D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A22617564697432227D7D2C7B227265736F757263654964223A227369642D38343438454634412D423632452D343839392D414243322D304532444232414536383338222C2270726F70657274696573223A7B226F766572726964656964223A227369642D38343438454634412D423632452D343839392D414243322D304532444232414536383338222C226E616D65223A22E9878DE696B0E794B3E8AFB7222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D317D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A226175646974227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3233392E373733343337352C2279223A3232342E35313935333132357D2C2275707065724C656674223A7B2278223A3135332C2279223A36357D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A3135332C2279223A36357D2C7B2278223A34382C2279223A32382E357D5D2C22746172676574223A7B227265736F757263654964223A226175646974227D7D2C7B227265736F757263654964223A227369642D41373538393038342D343632332D344645412D413737342D303041373044444331443230222C2270726F70657274696573223A7B226F766572726964656964223A227369642D41373538393038342D343632332D344645412D413737342D303041373044444331443230222C226E616D65223A22E698AF222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D317D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A22617564697433227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3431392E37383132352C2279223A3337307D2C2275707065724C656674223A7B2278223A3338342E383637313837352C2279223A3337307D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A22617564697433227D7D2C7B227265736F757263654964223A227369642D46413631383633362D333730382D344430432D383531342D323941344242384243393236222C2270726F70657274696573223A7B226F766572726964656964223A227369642D46413631383633362D333730382D344430432D383531342D323941344242384243393236222C226E616D65223A22E590A6222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D307D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A226D6F64696679227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3336352C2279223A3334392E363837357D2C2275707065724C656674223A7B2278223A3331312E3835393337352C2279223A3136347D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A3336352C2279223A3136347D2C7B2278223A35312C2279223A32397D5D2C22746172676574223A7B227265736F757263654964223A226D6F64696679227D7D2C7B227265736F757263654964223A227369642D31353235424646342D334539442D344438412D424638302D314636334146453136323839222C2270726F70657274696573223A7B226F766572726964656964223A227369642D31353235424646342D334539442D344438412D424638302D314636334146453136323839222C226E616D65223A22E590A6222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D307D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A226D6F64696679227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3537352C2279223A3334392E363837357D2C2275707065724C656674223A7B2278223A3331312E34343932313837352C2279223A3136347D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A3537352C2279223A3136347D2C7B2278223A35312C2279223A32397D5D2C22746172676574223A7B227265736F757263654964223A226D6F64696679227D7D2C7B227265736F757263654964223A227369642D33354343384336432D313036372D343339382D393931432D434346393535313135393635222C2270726F70657274696573223A7B226F766572726964656964223A227369642D33354343384336432D313036372D343339382D393931432D434346393535313135393635222C226E616D65223A22E590A6222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D307D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A226D6F64696679227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3738352C2279223A3334392E363837357D2C2275707065724C656674223A7B2278223A3331312E3234343134303632352C2279223A3136347D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A3738352C2279223A3136347D2C7B2278223A35312C2279223A32397D5D2C22746172676574223A7B227265736F757263654964223A226D6F64696679227D7D2C7B227265736F757263654964223A227369642D42444230414142322D374535302D344433352D383045452D434530424543444439463537222C2270726F70657274696573223A7B226F766572726964656964223A227369642D42444230414142322D374535302D344433352D383045452D434530424543444439463537222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A22656E64227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3937342E3037383132352C2279223A3337307D2C2275707065724C656674223A7B2278223A3934302E352C2279223A3337307D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A31342C2279223A31347D5D2C22746172676574223A7B227265736F757263654964223A22656E64227D7D2C7B227265736F757263654964223A227369642D34344146423943312D343035372D344334382D423146322D314543383937413532434237222C2270726F70657274696573223A7B226F766572726964656964223A227369642D34344146423943312D343035372D344334382D423146322D314543383937413532434237222C226E616D65223A22E99480E6AF81222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B706173733D3D307D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A22656E64227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3938392C2279223A3335352E38393435333132357D2C2275707065724C656674223A7B2278223A3238302E323231363739363837352C2279223A36357D7D2C22646F636B657273223A5B7B2278223A32302C2279223A32307D2C7B2278223A3938392C2279223A36357D2C7B2278223A31342C2279223A31347D5D2C22746172676574223A7B227265736F757263654964223A22656E64227D7D2C7B227265736F757263654964223A227369642D33364535304338422D364337432D343936382D423032442D454241413432354246344245222C2270726F70657274696573223A7B226F766572726964656964223A227369642D33364535304338422D364337432D343936382D423032442D454241413432354246344245222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A226175646974227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3130342E38333833323336393937333438312C2279223A3235367D2C2275707065724C656674223A7B2278223A36302E34393937363833313933313634382C2279223A3235352E333334303436373230303334357D7D2C22646F636B657273223A5B7B2278223A31352C2279223A31357D2C7B2278223A39312E343030303031353235383738392C2279223A3235367D2C7B2278223A34382C2279223A32382E357D5D2C22746172676574223A7B227265736F757263654964223A226175646974227D7D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A313230302C2279223A313035307D2C2275707065724C656674223A7B2278223A302C2279223A307D7D2C227374656E63696C736574223A7B2275726C223A227374656E63696C736574732F62706D6E322E302F62706D6E322E302E6A736F6E222C226E616D657370616365223A22687474703A2F2F62336D6E2E6F72672F7374656E63696C7365742F62706D6E322E3023227D2C227373657874656E73696F6E73223A5B5D7D,
        NULL);
INSERT INTO `act_ge_bytearray`
VALUES ('62501', 3, 'source-extra', NULL,
        0x89504E470D0A1A0A0000000D494844520000041D000001CC0806000000995FD0B3000000206348524D00007A26000080840000FA00000080E8000075300000EA6000003A98000017709CBA513C0000000467414D410000B18E7CFB5193000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000EC400000EC401952B0E1B000020004944415478DAECDD097854D5FDFFF1339385040820FBBE88155159545CCBDF628BA2A845452011148A566A0505156BB588B18AFE580441EA8E41858445016B151101952AB206082A502144204142124236B2CCFD9FEFCDBDF1664842B6C9FA7E3DCFE1CE7267E6E6CC9C90F39973CE550A000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A821C68C19D38C5A000000005059DC5401003165CA9451595959C9E1E1E1A3A90D0000000095C18F2A00F0F4D34F871D3E7CF8BDEBAFBFDE151D1DFDC7C18307C77DFDF5D7D1D40C000000808A2074407D15A8CB1F7419ABCB1E5DD2BDEE9751404374F9B188C706E9729E2E89C53CF7D5BA5CA1CB0FC5DCDFCEDA667BDD3E539735555D1193274F1E1A1F1FBF78C284097E37DE78A3EADAB5AB6BDDBA75B70E1830E07F9B366DDA5D4587F15B5DD274C9F2BAAD972EFB8BD8BF832E7D758973DCD64A970CAB7ED3F88803000000840E40559120E0425D3AEB325E97AB7439A2CB0A5D5274C9F30A2424747850972F7419A1CB6EEB71AD7509B3F62F2E54E8AD4BB0CA0F338A221DEB95BABCAFCBFFD3E5625D7EA3CB705D7ED1A5A72EF7EAF2B9AF2B454638242424444AE070E9A5979AB7B56DDB5675EBD6CDBD7EFDFADBAEBBEEBAAA0A1EE6E9F2A92E99BADC6ABD273DACDF5127ACFB3FB2F61DA64B775DE275B9449709D6635759FBCED5E51D3EF200000000A1035015A4637F8E2E2E5D0274E964756E8FA9FC6FCCEFD6E54A5D365AFB5FA7CB285D3ED365B415401CD0658C2ED375595F44E0B0C80A13243CB8DC7A8D40EBFA6BD673D9A3293CBA34D4659B1532C873C9B7F9837479D10A36165AFBF98CACDD101717B770FCF8F16E3B70B0B569D3C60C1E366CD870DB6F7FFBDBDD5BB66CF9D18787D244E58F2A49D0E53E5D22557EE0B2C1BAFF1A5D5E56F9A318C40DBABCA7CBCF56BDDDACCB27BAFC5EE58F1619A0F2431D00000000840E80CFC5591DFE18953F5DA285D559952040462C7C655DB649C0F0475D3E54F9C3FBA75B8FBFBD84CEEC302B3090E76DA44B92B5AF5CBFC90A119CF6AAFCE915FED6F376B5F69310A2812EA9CA8753042470888D8D5DF0F0C30FBB2FB9E49222F791110FDDBB77777FF9E59777F4E9D367D7CE9D3BF7FAE8706454878C64D8AACBD72A7F44CA125DDA58BFA336A9FCD123FBACFD256490944442A3FE2A7FD4C3FF547EC823CF718F2E6B55FE34982C3EFE00000000A103E06BD7EB3254E58F7490F5165AAAFC29101216781C1D5A19A120C3FB9355FEE807191121BDF2D6D6F5EFAC0EEF43560737D37ADC5F55FE1A0F458D7418E4081D642D08F9E65EA656C87400F9863FC5BA4FC28A9FACCB7FD265B3E3F92B337018191B1B1B2181439F3E7D4ADC57463C74EFDEDDEF9B6FBEB9A36FDFBE3B76EEDCB9BF920FC76DD5F7A5D67B72B315241CB5EA25CDBA7DB8555F420E7A96CA0F76240819AC4B882EAFEB62A8FC1113F21ECBF48B937CF401000080EAC32933515F48B0E06F0501018ECBFE5E1D5319B22F5325DE56F9A30F646AC41B2A7FF8BE8C76386475681F51F9EB07D87EB1F691B245971D8EEB098EFDE41BF98F55FE948A782B8CE86ADDB7C6D1A99EEAF5FC9562E2C489B71D3C78D09C5271B6C0C1D6AB572FF5D8638F057A3C9E156161613756F2219DABCB145DDA5AA1C2FF59B737B6828410EB72BAD7EFAD2E8E72C2AACFBBAD004242A2F3ADF70A00000000A1035025B65921800402DF599777AAFCE90C4E37589D570903A4931D6E758E7D4516B95CEB2832BD20B9B25F444638A4A4A42C772E1A595A123C4C9E3C39C0DFDF7FC58811236EA9C4C33AA5F2A75774B2EAFA29EBF635EAD7D0C6FB8C1E6F58418314993E21D366649D8D93D6FE1D75F9171F7700000080D001A82AD2416DAD7EFD26FC4AEBB22C3079D86BDF7556C73FD62AAFA8FC910CB1253C7F7BEBF9A45C6EBD867DBD7509ED4F4EFB18621D8F5DCEA9EC1F7ECA9429A3626363DF2D4FE0E00C1E1E7DF4D1A0C0C0C06595183CC8BA0C32AA444698ACD6E59FD6ED3738EAEF06AFC774B4B6329D4246407C6A5D6F61D5BD8C6A39C2471E000000207400AA824CA1686B85097BAC90E1807559BE45BFDB6B7F3925E636EBF28F56A758167BFCA484D7B84B153FBDE2FA22F697F51B645A418C757C218EE25FD981C3E1C38717CA1A0EE50D1C6C322563F2E4C9951D3C387F1FF5B52E9734D241DE1359EB21D7DACAA93525A891853BE5AC172FF09107000000081D80AA229DD3652A7F3D0599E77FDC2A87AC0EAC0CE9FFADB56FA055FEEB681F0FEAD259E54FC910AD8A788D92BE592FEAD49717E812611DDB0947075BCAB1CAFAC1654A851D3894760D87B3B1A65A040504042CADC4351EA4CE5F52BF2EE8E9D4C87159021979CD89D6750988F65B8F977530241C9290A8131F7B000000A0FAF95305A8E35A588142AEE3B6C6562775B0A353FB3B95BFB0E329ABD32AEB2C7455F9A7B5BC4A97198EC75F7C96D774ABB3077AF28D7E86D76D728AC849AAE850A3CCEC4523274C98501038A4A4A4A8071E78E08C7DE7CE9DAB5AB5FAF565333232D4BDF7DE7BC67EF3E7CF57CD9B37378387C71F7F3C78FAF4E91F8485850D8D8C8C5C5DC1C39550688355271EC7FB25D35C5E75D4BFD4AB4C4191351BE658EFE3405D9AAAFC338A08096DE6EB223F28D32C000000806AE4A20A80B30608DE231502AD30A23867BBDF9BBF2A1C8A54988C70B0028733D670F8EAABAFD4C2850BCD60C1FC01DD6E75C10517C8348C827DE6CC99A3B66FDFAE727272CCEBE79C738EBAF9E69BCDE2B473E74E3563C68CF4DCDCDCD0254B967CECC33AAF8C7D0100000054313FAA00289151C46D7967794C5E195FA3523BCDE1E1E1A3636363238A5B34B24B972E6ACB962D2A3939FF04198661A8B4B434D5A14307D5BE7D7BB577EF5EB562C50A75FAF469F37E7F7F7F7314C4B871E3CC80C2A96DDBB6EABCF3CE53DF7EFBED1D175E78E1AE3D7BF6ECF3519D57C6BE00000000081D00949715382C90351C2EB9E49262F7BBF0C20BD5D75F7F5D3092213737577DFFFDF7EA77BFFB9D9A366D9A4A4D4D2DD8B771E3C64A3F9F6AD1A24591CFD5A64D1B3F3B78B8F8E28BB7C7C4C4FC8F770200000080207400EA88A79F7E3A2C2E2EAE548B464A90909D9DAD626363CDC041783C1E151D1DAD121313CDCB222424445D73CD35EABAEBAE2BF1F92478E8DEBD7BDEB7DF7E7BDB85175EB8A792463C00000000A8E5081D803A60F2E4C943E3E3E317CB948A92463838C93A0E5F7CF185CACCCC34AF4BD020231CF2F27E9D1DD2A851233569D22415101070D6E76BDBB66D40B76EDDF2366DDA24532D76133C000000002074006A3919E160070E45ADE1501C599FA17BF7EEE6FA0EF6340BA766CD9A9967B09035204AAB5DBB7681E79D775ECEB7DF7E3B94E0010000000067AF804F85868676D59B31D4846FB46FDF3E25393979D6F8F1E3DD65091C9C5E7EF965B579F3E682291542020959F7E1A9A79E2AD773464747274D9F3E5DCEE2B1CA300CD678000000407D17111515155B1F7F707FDE7BF8D8185DA6520DBE71F4E85175D34D37A9F2060E62D4A851EABBEFBE2B749B9CD1E2F6DB6F2FF773F6EDDBB779870E1D520F1F3E3C927709000000303D531F7F68420754A570AAA07275EEDCF9D4860D1BA6F7E9D3E7AC8B471667F1E2C5CAE5729941834D463AAC5AB5CA1CED501E3B76EC3876E4C89146FA791731D201000000F558BDFF0296D00155253C2A2AEA19AAA1F23DF9E4933FCF9E3D3BF2A1871E2AF3148BBD7BF7AA5DBB76159A5A216431C943870EA9AD5BB7AA7EFDFA95E939257098316346B07ECEB0254B967CCC3B04000080FA2A34345436F53A7870F331006AB769D3A62D3DE79C7386CE9B372F6FE7CE9DA57E9C040BAFBCF28A4A4B4B2BB84D463CD84E9E3CA9DE79E71D95919151EAE7DCBA75AB1D388C24700000000040E800D40173E6CC59D9AC59B33BF5366FFBF6EDA57ACC871F7E58285090D36276EEDCB9D0E931E5AC164B972E2DD5F3EDDBB72F7EF6ECD981040E000000006C840E401D21C143A3468D86CD9D3B37E76CC1434242825ABD7A75A1D0213838D83C5B45484848C16DA74E9D529B366D52070E1C28F1F9644A4578787853C330C6123800000000B0113A0075C8FCF9F3576466660E7EF9E597B34B0A1E5E7BED35959D9D5D70BD61C3866AECD8B166E0307EFC7815141454709F7E3E737F998E51147B0D07C33046464646AEE45D0000000060237400EA98A54B97AECDC9C919326FDEBCACA282878D1B37AAC3870FABDCDCDC82DBBA74E9A2AEBCF24AF372CF9E3D55EFDEBDCD3358080927D2D3D3D59A356BCE782EE71A0E040E00000000BC113A0075506464E4EAD3A74FDF3E67CE9C2CE7E292292929321AC20C119CEEBFFFFE42D7C78D1B57E88C16494949EADD77DF35B73619E1F0D24B2F05EB8B23985201000000A0289C3213A8A32478183E7CF8ADB366CDFAF7C4891383E4749ACD9A3593DBCFFA58996E51D27E32C2C10E1CE475A86D000000004561A4035087C9548BD3A74FDF2A231EB66DDB965719CF2981837D960A02070000000025217400EA3847F070BAA2C1833DA5222F2FEF1EA65400000000381B4207A01E90E0212F2F6FA8040FD1D1D1E50A1EEC4523156B380000000028254207A09E90A910123CCC9C3953A65A6497E5B1CE4523995201000000A0B4081D807A4402839C9C9CDB66CF9E9D53DAE0410207C76931091C00000000941AA10350CFC8540B091E5E7AE9A5ECAD5BB7A697B4EFBE7DFBE267CE9C19A22F8E664A0500000080B2227400EA21091E0CC318367BF66CD7F6EDDB538BDA47D670080F0F0FD2FBC9088795D41A00000080B2227400EA29992A919B9B3B64D6AC59AE2D5BB6140A1E9C67A9207000000000505E840E403D26231E727373EF9833678E6BD5AA55A9CF3DF79CFAF8E38F93EC351C985201000000A022081D807ACE0E1EA2A2A21AEFD9B3472D5AB4A819810300000080CA40E80040356CD870A3E3F7813B3838782DB502000000A0A2081D00A8ACACACAB9CD74F9F3E3D805A010000005051840E0094CBE5FA93F3BA6118F7522B000000002A8AD00180F2783C3779DD3460D8B0618DA919000000001541E800D47361616137BA5CAE568E9B727569E9E7E77723B503000000A022081D807ACEE3F10CF2BAC9656D87503B000000002A82D001A8C7060C18E0AF37F779DDEC676D6F1B33664C10B504000000A0BC081D807AAC5DBB7657B95CAE33D66E300C235B6F1A9F3E7D9A291600000000CA8DD001A8C70CC3B8BFA8DB5D2E979F753F532C00000000941BA103504FC9D40AC3308A1BC960870E32C5A219B505000000A03C081D807AAA75EBD603BCCE5AE12D53DFDF2C3333B33FB505000000A03C081D80FADAF8DDEEB34D9D30CF62E172B946535B00000000CAD5EFA00A807AEB9EB3DC6F9EB9C2308C81D6592E00000000A04C081D807A68F8F0E103F5A64969F69529166DDAB4B9935A030000005056840E403DE472B9FA9571FF0BA8350000000065C59069A01E5AB264C98B7AF3A2F3B6D0D0D067F466AA2EE1515151CF504B000000002A8A910E0000000000C027081D0000000000804F103A0000000000009F20740000000000003E41E80000000000007C82D0010000000000F804A1030000000000F00942070000000000E013840E0000000000C027081D0000000000804F103A0000000000009F20740000000000003E41E80000000000007C82D0010000000000F804A1030000000000F00942070000000000E013840E0000000000C027081D0000000000804F103A0000000000009F20740000000000003E41E80000000000007C82D0010000000000F804A1030000000000F00942070000000000E013840E0000000000C027081D0000000000804F103A0000000000009F20740000000000003E41E80000000000007C82D0010000000000F804A1030000000000F00942070000000000E013840E0000000000C027081D0000000000804FF8530540E5330C23E8E0C183E3D3D2D246656464F4484F4F0FF2783C35FA98F5B1AA7DFBF6A9F3CF3F7FEABDF7DE3BB5261FABCBE5321A34687022303070734E4ECECCFEFDFBAFE75307000000D43C840E40253B78F0E05FB66EDD3A2B2B2BAB61DBB66D9594909010E576D7FC814583070FAE1575ECF1785C6969692D535353072724240CFCEAABAF7EC8CCCC1C3568D0A0183E8100000040CDC1F40AA012C5C5C5AD3C74E8D0AB2D5AB46878F9E597ABCE9D3BABA64D9BD68AC0A156FDE2D2F5D9A44913D5B16347D5AF5FBFC04E9D3AF591510FEBD6AD1B42ED0000000035E86F77AA00A81C1238E832E4A28B2E521D3A74902900544A1569DFBEBDEAD3A74FB0DBED7E6FEDDAB5B7502300000040CD40E8005402995271E0C081213D7AF430BF81F7763AED983A1CFD9EDAB7FE59B577DD332A6EFB3B2A2BF5081557891A356AA47AF7EE1DE272B9DEFBECB3CF2EA64600000080EA47E80054902C1A999898384BA652141738FCBC7D814A4BDCAB3C79D9CAF0E4AA8CA49F54DCB6B7091E2A99040F5DBB76F5F8F9F9CDA53600000080EA47E80054909CA542168D9421FE45493AF4B5CACD4E3FE3760920120F6EA0022B59C78E1D9BFBFBFBFFE6F3CF3FBF8ADA00000000AA17A1035041725A4C394345716B386496309A414641A0F2B56EDD3A416F86521300000040F52274002A282323A3879CA1A238465E4EF10F363C54A00FB46CD9B283DE0CA02600000080EAE54F150015939E9E1E1412124245D420FAFD68A737ADA809000000A07A31D201A8208FC7A3DC6E9A528DFAC596FF7E10AA02000000D5FDB7395500F85640F039C5DEE7DF80111200000000EA2E4207C0C79A77BE46F907363AE376BF8060D5BC4B7F2A08000000409D45E800F858E3563D55A3963D8ABC3DA4F5455410000000803A8BD001A80279399967DC967BFA141503000000A04E2374007C283BFDB88ADBF6B64A3BFEC319F7A59FD8AFE2B6BE69EE03000000007511A103E023278F6E5771DBDE5219C9078BDD2723E5908ADDFCAA4A8EFB461986874A0300000050A7704A39A092C9C88563FB3E3147329486272FDBDCFFD4F11F54EBF307ABA090765422000000803A81910E402593910BA50D1C9C6444C4A12DAF538100000000EA0C4207A092C9C885F2323CB95420000000803A83E9154025BB60E07354020000000028463A0000000000001F21740000000000003E41E800000EC3870F7F333434F4276A02000000A8384207C047BEFAEA2BB56EDDBA42E58D37DE50274E9CA8B4D778E699670A2ECF9F3F5FE5E69E7D21CAECEC6C75F8F06175FCF8F182DB3EF9E413F376DB6BAFBDA6F6EF2F7C068EF7DE7B4F1D3C78B0C8E74C4E4E561F7DF451A98F5BF69F376F5EC1F5AD5BB7AA65CB9695E96797634C4B4BAB701D0E1830A0B1153424E962B8DDEEFBF4CDE7F209060000002A8E8524011F59B870A17AFBEDB70BDDB668D12275FFFDF717BA4D3ACEA74F9F2EF6795E7EF965151616A67AF6EC695E97F0E2BCF3CE332FFFF8E38F2A2E2ECEBC2CDBA3478FAA848404B56AD52AF5FCF3CFAB9F7EFA49EDD9B347454747AB162D5AA8EEDDBBAB4D9B36A94B2FBD549D3C7952793C1E75CB2DB7A8BD7BF7AAC1830717BCE60F3FFCA0468D1A655E5EBD7AB5BAF1C61BD5860D1BD4B061C3CCD7090F0F2FF4B3454545A94E9D3AA98C8C0CF59FFFFCC77CFC15575C61DE377DFA74335090D7B74940D1A3478F82EB72FFA449930AEA434ADBB66DCDEBCE90468EB35DBB76AA4D9B366ACD9A35EA2F7FF94BB98306FD3CE18661C89BD1984F2B00000040E800D43ACED103423AF9DE52525294BFBFBF6ADC38BFEFBB62C50A151818A86EBEF966F3FAE38F3F6EDE6FFBFDEF7F6F6E65D4C4A0418354E7CE9DCDEB7FF8C31FCCCB52EC0EBB840C8D1A35525F7CF185190A487870F1C517ABEFBFFFDEBC5F6E1F3D7AB40A0E0E2EF2F8253C90D2B06143F3BADBED564B972E5553A74E2DD84746571C3870403DF0C0036AFBF6ED6630214183BC968C96D01DFC428183D8B871A39A366D9A591FBFFCF28B59071244C8B1CF9E3DDB0C66860E1D6AEE9B939353503772DCB2EFE6CD9BD5F8F1E30B9E4FC296F6EDDB9FF5FD080B0B5BA85F53D295968661F00105000000081D80DA49BEC997CEB5938400DE3A76EC58E87A5050906AD0A0414147DBDB975F7EA9323333CD4EFA5FFFFA57F5E8A38F9A230F4E9D3A65DE16131363060C77DF7DB7B9BF74CE251890E062E5CA95EAD0A143AA5BB76E858290C4C4C482CEBB8C8A9011149F7DF6996ADAB4A9D9F95FB06081F978194571F9E59717041D42A65D3CF1C413E69489E79E7B4EBDF9E69BEAD8B163E67D3205E2C9279F2C74FC1244C8317EF7DD77E6F3C96BBCFEFAEBE6F410198521E1C56DB7DD56B0BF1DA0080947A47E249891E3925118111111EAD65B6F5523468C2814CE88FBEEBBAF4D5A5ADA147D71B42E8D256870B95C7C38010000004207A0F6928E78870E1DCE18E9D0AF5F3F75C71D77A80F3FFCB0DCCF7DF5D557AB3973E6A8E5CB979B230E2470909111B286844CC5F8E31FFF58687F398E56AD5A99DB810307AA4F3FFD54AD5DBB56E5E5E599D321A4C36FAFEF20A305A4C8F39E7FFEF9E6940EE9D85F75D555E6D4100924A463FFE73FFFD90C176494C2BFFFFD6FD5A4491373DA87840C32AA418205998671E4C81133209030E3E9A79F365F43AE8786869ACF73CE39E798E1814CA7906914F1F1F1AA6FDFBE661022A32AC4EEDDBB0B4212095BF6EDDBA79A356B668EA410F2F38C1C39B2D0CF2CF52B534CB484F2D6B33EC6D81AFC11939F2B8B9606949FCBE58A360C23859A002A24222A2A2A966A0040E80054311959F09BDFFC46F5EFDFDF0C03A4536F4F1790CE7B794948208141565696D979971111FFFCE73FD5902143947C8B6F871CF21AB20E848C0A10212121E656D68E90E040B6729F5C96C7CA08039B2C3229A1812CEE281D7CFBB8ED4EBEF8E0830FCC6DEBD6ADCDF043AECBC80AB92E81818407322A61F1E2C5E60806FBB1B226C3EDB7DF6E0619C2CFCFCF0C2B6494844C23993973A64A4F4F37D793903045EAF085175E304774087BD4834C2B91639630243535F58C7A9220A41274A9C11FB12EB432A062F4EFCCDF510B40A578862A0040E80054A39F7FFEB9A0D35F51B2B6822CF828A3191E7AE82173ED041911201D7D59CC51A673CC9831434D9E3CD95CFB403AE9329D62ECD8B1E60804598F41A65EC814097B9D0699CAB07EFDFA82D79011021244C8DA0CDE0B611645C289808000D5BB776F33609151153212E2E38F3F567FFAD39FCCF517264C9860EE6B2F1E69870E32DA42D6A890911012328C1933C60C4E9C2317249890F0C69B3CBFD4AB2C8AE94DA65B58231D2AE2500D0E1BE4D862695D40B9D861C397BA6CA03A8072994A1500207400AA9174A66D72D607E9505716396DA52CEE288B37CA191C647145198D70E595579A1D7819E5602F362964EA858C3C9022677E9085196534C135D75C639E69C2494652B46CD9D29CBE20242C90A92212241445C28E71E3C69941884CB19045235F7DF555731A879C86538201799DE2485821A1858CDC90110D2FBEF8A2B91E848CDE286E4D0B9B8C2679E595570A2D6A6993292CF2732C59B2A4EDA953A7E6B8DDEEEB0DC36851967A8E8A8AEA5AD33E57A1A1A1CF587FE8C970D66768694085DAD106DA1150EE7644F00080D001A84EB238A47CAB2FD306A4432D5BE95C4BA7FCC1071FACD073CBC806091E64C4828C56B8F6DA6BD537DF7C634E35288A040DF6F406593B414600C8428EDEEB200899AA200B32CAF3D9AF652F48E91419195970FF8E1D3BCCCB32A2414ECF296B39C8CF2E6B36C8880A7B91CAE2C83A173242E3D9679F35C313794E197D21AFE10C3B64CA874C0791C538657443AF5EBDCC911BCE8526BDBDF5D65BB2A265985C96D364B669D366B1BE78ADCBE56ACAA7140000002074006A25E9E4CBC2888F3DF698FABFFFFB3F737146990A20D307642D05998A208181ACF5200B253A49C7DD790A4D598C51D64C90E913F25819DD20C1858C4290110572EA4CE9D8DB5317BCC9E3EDE90C1280C82807E7D92784BD1684B3032FA31864DD0499A6E1CD3EF5A74C8B9832658AB9F6C25D77DD658E9C90B369C859296414829C59E2CE3BEF5473E7CE3DE32C1D326542EA400287AE5DBB9AA7C9949F45D69B58B66C99B9C8A43879F2A4BAF7DE7BCD291332E543C8CFF3D34F3F99A7D7946F5B64DD08EFD3727ADBB061439ADE14ACB2A91FF78ACBE50A350CA3B9BECA292D000000004207A0E6938EBAACE32041809C4DC20E0FA4A32F675590DBB66FDF6E76BAE59BFC2BAEB8A2D05402E7D4089B3DDA40C2015927414622C87409211D76BB332EECB33ED86404843DD241A624C85927644A8498356B96B9F59ECA20FBC9B40D195120D333BCEDDAB5CBDC4A9822A7C494D107B2C0A52C12293F9B041B120808091B247C903528640A864D5E53C2090942E434A072DC72EA4DEFD793E7B78F434651C868070939EC9FE991471E314748482853D2A8076F7AFFF17A33DE0A20A61986F157464000000000840E408D26214271531DC4C30F3F5CE8FAD9D62E70B23BE432A5428A1D52C8C8089BACA9E024A32D0A1ABCDE6FF4E8D105C184FD38597CD249466794745C72A6099B040E42465DC80808E7592E840406DE8B3DDA534C64ED08795C499C7529FB7B9F1254EA5BD6CDA888A8A8A82725DFE0D30B000000542E3755005472A372576DB372060E455DF7669FB5A224650942CAF3B3DBFBD9A7F42C2DE7480900000000B5A07F44150000000000005F20740000000000003E41E80000000000007C82D0010000000000F804A1030000000000F00942070000000000E013840E0000000000C027081D0000000000804F103A0000000000009F20740000000000003E41E80000000000007C82D0010000000000F804A10350D146E4761B1E8F878AA841F4FB71486F72A909000000A09AFB4B54015031414141BF9C3A758A8AA84192939363F4269A9A00000000AA17A10350410101011B4F9E3C4945D420090909A97AB3819A00000000AA17A1035041595959D3E3E3E3730CC3A0326A86D8A4A4A43E7AFB015501000000542F4207A082AEBDF6EDE28E7C0000200049444154DACD8661EC3A7AF428955103C4C4C47CAEDF8FA3D75F7FFD266A03000000A85E840E4025C8CACA1A151B1B9B919A9A4A6554A394949455494949B77A3C9E49D40600000050FD081D804A3068D0A01F754777C89E3D7B4E123C540F091C76EFDEDDCBE572FD59BF1F31D40800000050FD081D804A3270E0C0B5B9B9B977EEDCB933352E2E2E89351EAA4C6C4C4CCC9BBB76EDBA525F7E58BF0F1F532500000040CD40E8005422091EF2F2F2AE8C8D8DDDFAEDB7DF1EDFBF7FFF8EE4E4E4048FC753E38FFDC08103EAC5175F543FFDF4538D3F565D9F874E9C38F19F3D7BF6447EFDF5D719494949DDF46DD7133800000000358B3F5500542E996A219B356BD6F48D8F8F1FAACB007DBD992E4135F9B83FFCF043959C9CACE6CC99A3860D1B56D3ABB9832EC775F94197B92C1A09000000D44C840E808FDC70C30DD17A135D1B8E75CC983141595959997259D6A458B468517044444416EF22000000808A607A050039FBC655CEEBA74F9F1E40AD00000000A82842070062ACF38A6118F75225000000002A8AD00180B8C9EBFA8061C38635A65A000000005404A10350CF858585DDA8372D1D37E5C9753F3FBF1BA91D000000001541E800D4738661788F727059DB21D40E000000808A207400EAB1010306C8196CEE2DE6F7C26D72560B6A090000004079113A00F558BB76EDE4AC158DBC6F370C235B6F1A9F3E7D9A291600000000CA8DD001A8DFFE52E42F06B75B464048F8C0140B00000000E546E800D45332B5C2E3F1DC50D47D8661B8ADAD4CB168466D01000000280F4207A09E6ADDBAF50097CBD5AA845DB2F4FDCD323333FB535B00000000CA83D001A8A7FCFCFC6E3FDB2EF28FCBE51A4D6D01000000280F4207A09EF2783C779F659700F9C7308C81D6592E00000000A04C081D807A68F8F0E1035D2E574869F69529166DDAB4B9935A030000005056840E403DE472B9FA9571FF0BA8350000000065C59069549A1123463CA13BA72F1473F7D4D0D0D0A9CE1BA2A2A25CD45AF558B264C98B7AF3A2F336FDFE3C23EF932EE1FABD79865A0200000050518C7440E57D98DCEE686A010000000050D04FA40A5059222323571B8671AA94BB1FA6C600000000A06E237440655B7E96FBF3E41FC3305653550000000050B7113AA0521986B1F82CBBE4C83F2E976B11B50500000000751BA1032A55C3860D37EA4D7209BB04E992989090B091DA0200000080BA8DD001952A222222CBE5727D52CCDD1EF9C7308C951B366CC8A5B600000000A06E237440A5330CE3AD62EE32D77370BBDD1F504B0000000050F7113AA0D2C9D409C330328AB82B4097C3F1F1F16BA92500000000A8FB081D50E964EA84DBED8EF0BAD99E5AB19AA91500000000503F103AC0273C1ECFA7CEEB866178AC8B5F503B00000000503F103AC0278E1D3BB65A6F12EDEB2E97CB5FAE7B3C9E8FA91D9FE8ADCBC58EEB724AD2A7A81600000000D589D0013E2153285C2ED7675E37AF5EB66C591AB5E313DF3B2EB7D0254B97E775795197CBAD72A52EBFA5AA0000000054154207F88CF7592C5C2E1767ADF01D5927C35EBC5382867BADCBDB74F9C52A0D75394C5501000000A82AFE54017C2528286853565656C1F5060D1A6CA056AAC402C765091D0E5997FD1C9701000000C0E718E9009F898888C8320C63AF5C76B95C07F4F5146AC5A76ED1E5EFBA64EAD25797CBA81200000000D589910EB594EECC071D3C78707C5A5ADAA88C8C8C1EE9E9E9411E8FA7C61D676262A2DABC79B3BAECB2CBCE1D3B76AC51D38ECFE572190D1A3438111818B83927276766FFFEFDD7D7E28F45675DAED665B1CA1FD510444B01000000509D081D6AA183070FFE65EBD6ADB3B2B2B21AB66DDB5649090909516E77CD1CB872C71D77D4D8BAF4783CAEB4B4B496A9A9A983131212067EF5D5573F6466668E1A3468504C2DFC68FC4B97777599AFF2473D8873693100000000AA0BD32B6A99B8B8B895870E1D7AB5458B160D2FBFFC72D5B97367D5B469D31A1B38D4F806A0EBAD499326AA63C78EAA5FBF7E819D3A75EA23A31ED6AD5B37A496FE48BB74794497A9D6F529BAFC68954F74D9CABB0E000000A0AA30D2A11691C0419721175D7491D95146E56BDFBEBD8438C1BB76ED7A6FEDDAB5770D1C38F0E35A74F876F2B44F9778957FB68A3FABFC335B78EF030000000055D649410D27532A0E1C3830A4478F1E45060EA7D38EA9C3D1EFA97DEB9F557BD73DA3E2B6BFA3B2528F5071E5D0A85123D5BB77EF1097CBF5DE679F7D76712D3AF4C68ECB6FE83246150E1C8487771800000040552174A80564D1C8C4C4C4593295A2B8C0E1E7ED0B545AE25EE5C9CB568627576524FDA4E2B6BD4DF0504E123C74EDDAD5E3E7E737B7161D76B4D7F57FF14E02000000A84E840EB5809CA542168D94A1FF45493AF4B5CACD4E3FE3760920120F6EA002CBA963C78ECDFDFDFD7FF3F9E79F5F456D0000000040D9113AD402725A4C394385CBE52AF2FECC124633C82808945FEBD6AD13F466283501000000006547E8500B646464F490335414C7C8CB29FEC10653F82BA265CB961DF4660035010000000065C7D92B6A81F4F4F4A09090102AA21AE87A6FA737ADA80900000000283B463AD4021E8F47B9DDBC55D5D240F2EB9D700E00000000CAD3A7A20A6ABF80E0738ABDCFBF0123240000000000D583D0A10E68DEF91AE51FD8E88CDBFD028255F32EFDA9200000000040B52074A8031AB7EAA91AB5EC51E4ED21AD2FA2820000000000D582D0A18EC8CBC93CE3B6DCD3A7A8180000000040B5A9D10BE4198611B47BF7EED13B76ECB82B3E3EBEEFD1A3471BA6A6A6FA676565297F7F7F23242424A779F3E6479A3469F28DDEFD9F7FFBDBDFF6D6B737303BFDB84AF8F12395917CF08CFBD24FEC57715BDF546D7BDEA6021B71020694AC7DFBF629BA8DA9CE9D3B935601000000A81435327490B0E1C30F3F7CE3B9E79E0B3B71E2847FCF9E3DD580010354A74E9D54F3E6CD55505090CACACA729D3A752AF0E79F7FEE161313D36DFBF6ED774D9A34292E3D3DFDB937DE78E3ADFAF0E69D3CBA5D1DFFDF672A373BBDD87D32520EA9D8CDAFAA56DD07AA669DAE522E17835B70A6A79F7E3A4CB7A55937DD7493DAB061C3F4279F7CF2C4B469D322A81900000000752A74D8B469D3D8E79F7FFE5F274F9E6C101A1AAAFAF4E9A3FCFCFCCED84F820729AD5AB552975E7AA9BAE79E7B5C3B77EEEC121515F5DAB871E31E4D4A4ABA75D9B265FFAB8B6F9A8C6E38B6EF137324436978F2B2CDFD4F1DFF41B53E7FB00A0A69C7271F05264F9E3C342E2EEEBD091326B8A52DE936E79E376FDE5B93264DCA9E3D7BF6626A080000004079D598AFBD0DC3F05FB56AD5BA888888B775A7A7C10B2FBC60860945050EC59180423FCEEFF6DB6FBF20242464D7FDF7DF7F5F5D7CD364E4426903072799827168CBEB7CEA514046382426262E9D3061829FB437BB1D3DFCF0C37EC9C9C9EF4E9A34E92E6A090000004079D588D04102872FBFFCF29BB56BD75EF7C8238FA85B6EB9A54C6183B741830649672AD8ED76CFBDEFBEFB1EAC6B6F9A8C5C28775D7B72F9D4C3141E1E3EFAE79F7F7E7FFCF8F16E3B70B0F5EAD54B4D9C38D10C1E1E7CF0C1DBA92D00000000E55123A6577CF4D1476BD6AE5D7BF9942953CCE91295A14B972EEAD9679F0DFEC73FFEF1625858D8C9C8C8C8F7EBCA9B76C1C0E7F8E4A2422470888D8D5DF0F0C30FBB65644351E4F6471E79C46FD6AC594BEEB9E79E61EFBEFBEE2A6A0E000000405954FB480759C3E1D34F3FBD6EC28409951638D8E4F99E7CF2C9C6010101F3C2C2C22EE0ED06CCC061E4D902079B8C7878F4D14703F4C5A5A3478FBE99DA030000005016D51A3AC8592AD6AC59F3EACD37DFAC7EF39BDFF8E43564C4C38811231AB8DDEE7778BB51DF4D9C38F1B683070F2E942915670B1C6C123C3CF6D863811E8F67455858D88DD42200000080D2AAD6D061E5CA956FCB692F650D065F1A3C787070D3A64DBBE90ED3A8FAFA463FF3CC330597E7CF9FAF7273CFBEB6437676B63A7CF8B03A7EFC78C16D9F7CF28979BBB7B8B83895909070D6E7FCE8A38FD4575F7D55E8B6E9D3A72BDDA12D727F79BDAD5BB796F9E77DEBADB78A3CCEFA4C4638A4A4A42C772E1A595A123C4C9E3C39C0DFDF7FC58811236EA13601000000D4E8D0414639C4C4C40C97D362060404F8FCF5C68D1B778EDBED7EB03EBDB9EBD6AD33C300293FFEF863C16529478F1E559B376F564F3DF594B9EF4F3FFD640602CF3EFBAC194AAC5EBD5A4D9B364D6DDFBEDDBCBC70E14275E2C409B577EF5E15181878C66B75EEDC59BE45576BD6AC29F198E6CD9BA7929292CCE77CEEB9E7CC633878F0A0192EC86DF6F1D86EBCF1C682C044821209129C45020CB95DC211A7468D1A9D115678EF539F4C993265546C6CECBBE5091C9CC1C3A38F3E1AA4DFFF65040F000000006A74E8B07BF7EED1BFFCF28B7F6987785754EFDEBD031B3468D02D3434B46B55FFACFA35FFA1CB9DC3860D6B5C95AFFBFBDFFFDE0C03A4332FA349E4B2943FFCE10FE6F68A2BAE9030C6DCB77BF7EEE67509161A366C6876F6EFBBEF3E151414A49A366D6A860F2D5AB450C1C1C1C5BE5E7878B88A8E8E2EB8BE69D3A642A31F962D5B668617A74E9D325F6FC890216670F0EAABAF9ACF7FF9E597ABE79F7FDEDC5746572C5AB4C80C31E438EEBDF75EF3B92464B8F5D65BD5C68D1BCDF2CF7FFED37CBEA8A8A882E0428AFE6CA994949482EB7FFFFBDFCD7DEA6BE070F8F0E185B286437903079BB4D7C99327133C0000000028956A3B7BC58E1D3BEE920E4C454E8D5956BD7AF54AF8EEBBEFEED4176756F18FFB4FB3B2FDFD3DA1A1A13BF5C58F74D9A03BF49B222222B27CF5A25F7EF9A5CACCCC344730FCF5AF7F956FA9CD60403AE9725B4C4C8CEAD4A993BAFBEEBBCDFDC78F1F6F8E1AD0C729535FD4A1438754B76EDD0A9E4FA640242626160A15E4BAEC2F64D4825C964EBEC8CACAFFD1DAB66D6B6EDBB469A3DAB76F6F861EB2DF0F3FFCA0DCEEFCDC4B8EA1418306EAE38F3F364F992A8B808E1C39D2BC4F465C3CF0C003AA63C78E66898C8C340315F1CE3BEFA873CE39C7BC3C78F0E0826393510DF2B3C9B7F3A2478F1E857E96FAC25A34726169168D2C433B328387E9D3A72F0D0B0BBB43BF1FABF9550A000000A046850EF1F1F17D070C1850A5AF79E5955736FBEEBBEF7E570DA183C9300CE9615F6295A9BA539E191A1AFA8DBEBC5A77BED71E3D7A3466C3860DB995F57A575F7DB59A33678E5ABE7CB99A3A75AA1938C8D408192DF0F2CB2FAB3FFEF18F85F6EFD0A183D9D997EDC08103D5A79F7EAAD6AE5DABF2F2F2544646867AFDF5D70BADEF70D55557157ABC8419121CC82889A2C82807093524BC90B0A171E3FC811F320D449E5FBCF1C61BE671CBA80A21C1C4912347CCD116B2F68304233275C2DB638F3D668613F637F9F2B8962D5B9A8FD59D6E959A9AAA1E7FFCF11ADD18F567C1D01B9913323F282868654444444A459ECF5E3472C284090581838CFE9000C7DBDCB9730B9D3D46DE0F195DE24DA6DE346FDEDC0C1E747D06EBF7E483B0B0B0A1040F000000008A526DD32B7407BBA19C59A22A9D7BEEB90DF5A66F0DAA7F99ABF0075D66E88EF88E76EDDA1DD11DB848DDF91C3372E4C88E157962E934CA8803196DB062C50A330C90A908B2CE816118056B22C848017B448208090931B7A74F9F36A74AC8564625C8657D7C66A7B52CC76093691B3272414628C8B489F3CE3BAFA048C8B178F162D5AF5F3F7304861D38242727AB050B1698C7B97EFD7A3358D8B56B97390DA328B22E85041E522EBEF8623338B12FCB6BD412FD747947BF27C7F5E7E01D5DFA95E7498A5B34B259B36666E82053680A7E09B8DDEAB5D75E2BF478097F9C6BADC8689251A346998183CD3AAB4543FDF8E54CB50000000050946A1BE9909A9AEA2F1DA0AAA43BC1AD74873B5777E49ED15765B18182DEB6EEF41FD69D27739481DE27CBE572152C46A02FA745464626FAFAF8F4EBB6D69B502932BA401F678EBEFCBD2CFA5856D2A994E906329AE1A1871E32470948E7524619C8DA06B21EC28C19336498BC1924C81408994E3176EC58B3D3BF74E952737A8274F0ED0EEA6DB7DD6676FE9D2440900EA93CB70413D25195D114F1F1F1E6A8087B74813CA73D2542020859CCD2263FAB7CCB6E4FC3B03E1FE6540B59E361CC9831EABBEFBE334740784FF9B0A767081945614FED90A923725CB226855C96C0A41639AD3F7301FAF330465F1EA33F071BF5E5F9C1C1C12B4B331D273C3C7C746C6CEC0219E150D41A0ED75E7BADB956868434D667DF5CCC530229097E64B1D0DDBB77AB9C9C9CFC5F12FEFEAA499326458E60911114FA3D0ED09FAFA8112346842E59B2E4637EAD02000000A8F6D041BE5D970E6155DAB66D9B0408F2334FF5BECFD979D5FB7887011200386F920022CD71BD5080A1C96912EC00A322D325E4ABE63E3B76ECF07EFD52918EA44C333870E080D9C9FCFEFBEFD5D0A143659A49C188033B0810765820453AE9D2E94C4F4F57D75C738DFACF7FFE53E46BD8EB2E88B34DAFB04900218B563AC302091E0AF5BA4F9F36D77990510E1248C8192CF6EFDF6F2E38A93BB7457E86A4736CBFB6FC0C32D241A6704891B0A23CE479ACD77CC20EA2642BC194B54BAC159C242E5BB62CAD923EAA0DE4336791F37EF6D7AFD95FFFBC69FA7310A15FEB65FD5AFF2B297038DB1A0E324D45CE14628F4691B53FE434A3B2F6859C61C4394A4542A7FBEFBFBFD8F55764915609972478080B0BBB93A91600000000AA3D74D09D534377A25C55193CF4EDDBF7C4F2E5CB9BEA0E9C9C22A18D2E418EA0A1A3EEE8D9F521B7B7753C54161F68E9B8DED2EB7AD7E25ED33BC0282B7D4CFFBBE4924BCE2BCF63254891E041462C48C751BEE1FEE69B6FCE588BC1264183DD694F4B4B53AB56AD324709388385CA2067A190751C9C222222CCE1FAF6BA02CEF505848C5A904528A5D8E49B7A390B86AD67CF9E458E74903A90CE7479C8629912FAE8F7F105C77B72C67ED221B782210923EC51321242243AC309EB7ABA5D15D6FECEFDBC053AC207F91C8ED7AF355EBFD6C7FA98DECECDCD5D6B871D4F3FFD745869020721A34AE4BD96753B2470101234C8C81219656293E93632C2E4DC73CF2DF1F92478983C7972DE8C193322478C187137231E00000000546BE8D0A449939C94949440E7907A5F6BD4A8D109DD51CB8C8A8A7AA622CF131616D652773C1B3B3AA16DF5F3161960C8C80AB95F5967B028817CD56F7F951CA31FF37A7070F0FBB298E07DF7DD6794E7386574C3830F3EA8264C98607EEB2FF3F4E56C13C575C065D145E799276494839C5AD349461E94968C60F8EF7FFFAB7EF7BBDF15BA5D8203EFD110723A4DEFA0C17E0E215300DE7FFF7DF5C4134FC87A20E6880A395B86337490351F6CCE910E1521018D8C92888E8E7ED17A1FCD3EBBFA35B0EA6A6D5B5AA140902A2184AA8040C7E7CBA38FE5162956D8F163D3A64D23E3E2E29E762E1A793677DC7147C1194E848C6C91692FCE5045468F0C1F3EBC54CFA75F37F8D1471FF5CC9C3973F1881123EE227800000000506DA143B366CDE27467EEBCAA0C1D76EFDEFD93D5B9AF106B7D07E737D3B1677B8CEE1816153AE4EA0EA4DB3AAB85040EAB75E77AD62FBFFCB2A1A267B19070E04F7FFA9339B2413AE066EFB86B57356CD8B0827D9C534AEC0EB61D064867FFCD37DF54E3C68D33AFCF9A35CBDCDA9D78F9365C1675748612B230A83CA7BD5E83840332B543BE2997A91B36399DA51D6ED824E0288A840DF29AB2FFC48913F37BFCFA33F3EAABAF2ADDA935D77D288A74A0254429EF08079B8CFE907511FEF6B7BFFDBD34FB8F193326282B2BCBFC504B30A5DFDF96C58413C21E6D638FA419509AD7B03E2F4E17E8F7235C4297A2D670288E04161248C9DA1E76FD3B0307597345D6F8702E3A7936975C7249A3C71F7F3C6DFAF4E9040F00000000AA75A4C397313131E7C9FA02554577C0A547F56535D7B9841E327EFD1CA97FDDA94ED11DD3B7F2F2F25E2F6E9E7E79D89D7C99522145C8FA0DF2CDB54D3AEE4ECE9102B2DFE8D1A30B8209FB71D241B5DE3FD5BF7FFF428FF71E1521D78B9ACA21A31AE4F14EC5AD032181830CF977926392111C524AE8FC170A3AAA8AB5D0636C791E6B9D32B3CCA43E64AD8EB2040E360965645A8B8C1A9180C7F99C1D3B763417962CAB3E7DFA349E3C7972D2F4E9D3178585858D608D07000000A0FEAAB653669E3C79F285E8E8688FF702823E94B57FFFFE0BF4767935D7B99F1538C8148A09C1C1C1DDA2A2A2265766E0501C67E050D4756F65F986BB2CBC03075FA88EC0A12AB85CAE137AB344973FF9F9F95D24B70D1A34C89C2A515E722A4CEF752AE4FAEDB7DF5EEEE7ECDBB76FF3FEFDFBA7EAE7F974CC9831CD14000000807AA9DA463A3CF7DC733F3DF2C8230777EEDCD9BD3CDFD096D59A356B3EF0783C5D74073FB69AEBBCD2A650A0EE286194838C9CD8A2CB476EB77BEDD1A347639C9F9BF0F0F031FAFA823E7DFA947A2D076F8B172F36173C75060F32D2411612BDF0C20BCBF59C3B76EC38B671E3C626FA796F92754978870100000042872A77F2E4C9BFEB0ECF62DD59F22FEE747C952465E1C28517EA0ED04BD5F8E34ECECBCB5B5915231A507BC92291DA1EBDFD505FDD101414B4C99AB251A4A953A72E7CF2C9273367CF9E1DF9D0430FB9CB1AE0EDDDBBD75C9BC339B542C80824594073EBD6AD659E622181C38C193382F5738E5CB26409532B000000004287EAF1F6DB6F2F1B376EDC944F3FFDB4D72DB7DCE2B3D7993973A68C72E891909010555D3F6B5454D44C3E6E28C1145D7E6CD0A0C1DAB28E0C98366DDAD289132766CF9B376FB9DEFA9576C483040BAFBCF28A797A549B73C4C3C99327D53BEFBC638E7628ED549BAD5BB71E7BE9A597ECC0814524010000807ACE5DDD07A03B367F5CB16245E6FEFDFB7DF2FCBB77EFFE68DBB66D37EBCED49F99CE809A2A2A2AEA395D9697772AC29C397356366BD6EC4EBDCDDBBE7D7BA91EF3E1871FAA8C8C8C82EB010101E6E29FB2B5C95940962E5D5AAAE7DBB76F5FFCECD9B303091C00000000D8AA3D74903516B2B3B3FF3C6BD6AC8CE3C78F57EA731F3972E4BF2FBEF8625F97CB35393232F247DE6ED465123C346AD468D8DCB97373CE163C24242498A72175860EC1C1C1EAA9A79E5221212105B79D3A754A6DDAB4C93CF56949644A4578787853C330C6123800000000B0B96BC241BCFFFEFB8BD2D2D226FCE31FFF48ABAC110F32C2E1F1C71FEF949797F76A6464E4FBBCD5A80FE6CF9FBF22333373F0CB2FBF9C5D52F0F0DA6BAFA9ECECEC82EB327D62ECD8B166E0307EFC7815141454709F7E3E73FFE2CE3463AFE16018C648DDD656F22E00000000B0B96BCA812C5AB468C1C99327FFFCECB3CFA6AE5AB52ABD02A7D24C79E9A59722A64D9B7685C7E399BA64C99217799B519F2C5DBA746D4E4ECE9079F3E66515153C6CDCB8511D3E7C58E5E6FE3ADBA84B972EEACA2BAF342FF7ECD953F5EEDDDB3C83859070223D3D5DCE0073C673C91A0EF6A291040E000000006A6CE820962C5912A53B427D74A7E9BB071F7CF0D88E1D3B32CBF0F0ACCF3FFF3CEAEEBBEFFEDF962D5BCE73B95CD745454545F016A33E8A8C8C5C7DFAF4E9DBE7CC9993B573E7CE82DB535252643484192238DD7FFFFD85AE8F1B37AED0192D929292D4BBEFBE6B6E6D32C241168DD4174730A5020000004051FC6BDA01C91A0F7AF387D0D0D03B67CE9CF940606060AF0B2EB8E078FFFEFD1B77EBD62DB079F3E66D65E8776666E631DD813AF9FDF7DFEFDFB871A3DFFEFDFB7BE4E5E575D48F9D9F9090F03E8B4682E02172F5F0E1C36F9D356BD6BF274E9C1824A7D36CD6AC99DC7ED6C7CA748B92F6B3CF52218183BC0EB50D000000A056840E8EF061B9DE2C1F397264C79D3B77DE191D1DFD5B7DBD9F2E59BAC884F3A6BAE4E822E7F7FB429707ACC0028045A65A48F03067CE9C7F3FFCF0C301975D76995F459F530207C7592A081C0000000014CBBFA61FE0A2458B0EEBCD1CAB00282347F0B06AE2C4890D2A123CD8532A382D2600000080D270530540DD27C1435E5EDED03973E69C8E8E8E2ED72AADF6A2918A351C000000009412A1436D7893DC6EC3B9A81FAA8EAEF7437A5327D60791B517247898397366D6B66DDBB2CBF258E7A291ACE100000000A0D4FDD96A78CD9774695586FD037579E82CFB9CABCB5FCEB2CF745D1AEBD25B97ABADDB6ED4A5454D7F938282827E3975EA149FD66A909C9C1CA337D175E5E791C0202727E7B6D9B367E794367890C0C1715A4C020700000000A55655A143982E83AD926D75F6E5F253BA7470EC778B2E5DAC62070DB2FFF9453CE7D58EE7BC40978B1DD7A5FCC96B7F0917D27491335CB4B16E1BA9CB899AFE260504046C3C79F2249FD66A90909090AA371BEAD2CF24532D247878E9A597B2B76EDD9A5ED2BEFBF6ED8B9F39736688BE389A2915000000006A6AE82021C32756794297F7ACCBED7439EED84F3A3587AC3257E59FA54246270458DB818E639EE4784E29B18ECBC7ACEBE25C2B849070E32147E020EC390B17D4E437292B2B6B7A7C7C7C8E61187C62AB566C5252521FBDFDA0AEFD60123CE8CFD3B0D9B367BBB66FDF9E5AD43EB2864378787890DE4F4638ACE4E300000000A0A6860E6E557814825DBA3AF6E9A0CE1CA930C40A1C12AC7D463B82827B74B95CE58F6090D2D371B9932EEBADFD0E5841C4CF56902181C465BA4CB18E4BA67AFC5D151E7151A35C7BEDB59B75C76FD7D1A347F9C456A1989898CF75BD1FBDFEFAEB37D5C59F4FA64AE4E6E60E99356B966BCB962D8582077B0D87BCBCBC7B081C00000000D4F4D0C1A30A8F4AB08B9C06D35EA42FDEBAAD97CA9F52F18E2E4B54FE693DFFA7F2A74664399E532ECB3A0EA7AC72DA71F9E6228E41464DDCA6F2473A6CD3E59FD671FD3F2BCC385293DFA8ACACAC51B1B1B119A9A9A97C6AAB404A4ACAAAA4A4A45B3D1ECFA4BAFC73CA8887DCDCDC3BE6CC99E3FAFCF3CF4F2E5FBE5CAD5FBF3ED15EC3812915000000006A43E8206401C73B54E1D10C72DB398E60C2DF0A05F6386EBF52FDBAEE82F7F1CA28858156E9ECB8ECDCEF77BA2CD4A5BD2EF28DED31AFE7F8B036BC5183060DFA51770287ECD9B3E724C183EF0387DDBB77F772B95C7FD6F51E53D77F5E3B7858B06041D0071F7CA0DE78E38D10020700000000B5297490C5EA3AAA33473CF4518517729405279F57F9A31E649149199D205321D658F71FF67ADE63AAE8351D9CE797FC4E977B55FE348B5A6DE0C081D239BC73E7CE9DA971717149ACF150E962636262DEDCB56B97045D0FEBFAAE379D6E091E5C2ED772B92C5B020700000000B525746855CA0EBF840B637419A6CB7556C0304217396D833D05A3A9D763646484737D08FB7282639F2CC7E39DAEB61E2F2E54F9A7E6AC15C1435E5EDE95B1B1B15BBFFD7568906D0000200049444154F6DBE3FBF7EFDF919C9C9CE0F178F8349783AEB743274E9CF8CF9E3D7B22BFFEFAEB8CA4A4A46EFAB6EBEB53E060330CE37FCE2D0000000054947F15BCC6EDBABCA6CBB5BAB456F9A7C3B435725CDE61850E3F5BD76521C889BABCA2F24F9979B888D0C1795A4C39DDE627D6E54F1CB7B7B0B6F66365F4C4FDD66373ADB0419E5F4662ACA90D6F9A4CB590CD9A356BFAC6C7C70FD56580BEDECCFAD95036B280A89C41E5075DE6D6D5452301000000A02E860E724ACC6F54FE2290D2B193E910871CF7AF705CF6380207393DA68414AF59C1801CE7E7BA3C58C26B651773BB4CDF90E9153BACEB5FEB22F3F4650AC7FFA9FCD114E2DBDAF6E6DD70C30DD17A13CDC718000000005013F93A7488B78AD852C4FD8B8A799C8414CED10ADFEBF2DBB3BCD6C412EE7BDB71F9B855ECE7FD9E8F01000000000095CF4D150000000000005F20740000000000003E41E800D45DF61938021DDB45540B00000080AA42E800D45D0B55FE194D7EB2AECB62ADFDA9160000000055C59F2A00EA84C774B947E59F86365DE59F29669C2E59BADCEAD82F93AA020000005055081D80BA41A64DBCA2CBEBBA8CD6E55CC77DA9D656A6579CA0AA0000000054154207A06EBB5CE507102DACED38AA040000004055614D07A06E4BD0E51B6B3B5E9718AA040000004055217400EAB69FAD226D7D06D501000000A02A31BD02A81BE4AC1453ADCB329A4142863FEAB25C970B7599ABCB6B541300000080AA44E800D40DCBACE2246B38DCA94B435D26EB32479789541500000080AAC2F40AA0EE6A686D337409D7E549F5EB680800000000F0394207A0EEF25E34D20E1F00000000A04A103A0000000000009F20740000000000003E41E80000000000007C82D0010000000000F804A1030000000000F00942070000000000E013840E0000000000C027081D0000000000804F103A0000000000009F20740000000000003E41E80000000000007C82D0010000000000F804A1030000000000F00942070000000000E013840E0000000000C027081D0000000000804FF8530540FD3362C488275C2ED70BC5DC3D35343474AAF386A8A82817B506000000A0AC18E900D4C786EF7647530B000000007CDEF7A00A80FA27323272B56118A74AB9FB616A0C0000004079103A00F5D7F2B3DC9F27FF1886B19AAA02000000501E840E403D6518C6E2B3EC9223FFB85CAE45D41600000080F2207400EAA9860D1B6ED49BE4127609D2253121216123B505000000A03C081D807A2A222222CBE5727D52CCDD1EF9C7308C951B366CC8A5B6000000009407A103508F1986F156317799EB39B8DDEE0FA82500000000E545E800D4633275C2308C8C22EE0AD0E5707C7CFC5A6A090000004079113A00F5984C9D70BBDD115E37DB532B5633B5020000004045103A00F59CC7E3F9D479DD300C8F75F10B6A070000004045103A00F5DCB163C756EB4DA27DDDE572F9CB758FC7F331B503000000A022081D807A4EA650B85CAECFBC6E5EBD6CD9B2346A070000004045103A0038E32C162E978BB35600000000A8304207002A28286893F37A83060D36502B000000002A8AD001808A8888C8320C63AF5C76B95C07F4F5146A050000004045F95305806FE84E7CD0C18307C7A7A5A58DCAC8C8E8919E9E1EE4F1786AECF1262626AACD9B37ABCB2EBBECDCB163C71A35F5385D2E97D1A04183138181819B73727266F6EFDF7F7D2DF948F456F9A7238DB1AE2FD2E57B5D9EA7B5D49D76545BD08E6847B423DA11ED8876443B02A103508BE9FF94FEB275EBD6595959590DDBB66DABA484848428B7BB660F2EBAE38E3B6A7CDDEAFFE05DFA3FFC96A9A9A983131212067EF5D5573F6466668E1A3468504C0D3F74F983EE02EB720B5DB2AC3FF05ED4C55E43C36DFD5EFE2FADA8F6B6A3DA8076443BA21DD18E6847B423DA11AA0A2D05A8647171712B0F1D3AF46A8B162D1A5E7EF9E5AA73E7CEAA69D3A6FCC75459BFB4743D3669D24475ECD851F5EBD72FB053A74E7D241D5FB76EDD901A7EE8B9BA645897E50FBB7BADCBDB74F9C52A0D7539CCBB4C3BA21DD18E6847B423DA11ED88760442070045FEC7A4CB908B2EBA4875E8D041868C51293ED6BE7D7BD5A74F9F60FD9FD67B6BD7AEBDA5961CF602C765F923EF9057A11DD18E6847B423DA11ED8876443BA21D81D001C0AF64E8DD81030786F4E8D1C34C6CBD9D4E3BA60E47BFA7F6AD7F56ED5DF78C8ADBFE8ECA4A3D42C55582468D1AA9DEBD7B87E83F06DEFBECB3CF2EAEC1872AFF79FE5D974C5DFAEA7219EF1EED8876443BA21DD18E6847B423D4CA76044207A0EAC8E242898989B364C85D71FF31FDBC7D814A4BDCAB3C79D9CAF0E4AA8CA49F54DCB6B7F90FAA12FF83EADAB5ABC7CFCF6F6E0D3ECCCED61F7AC9BAA45A7FEC8176443BA21DD18E6847B423DA116A5F3B02A1035075643563595C4886841525E9D0D72A373BFD8CDBE53FAAC4831BA8C04AD2B163C7E6FEFEFEBFF9FCF3CFAFAAA187F82F5D1ED065BE2E0754FE625EA01DD18E6847B423DA11ED887684DAD78E504A9CBD02A80472FA2459C9B8B8B97E9925A4DE9296A3F2B46EDD3AE1C8912343F5C54D35F41077E9F2882E537509D7658A2E573B3F4EBAF4A31DD18E6847B423DA11ED8876443BA21DD5F876044207A06AC8F99AE53FA7E2187939C53FD8E01CCF95A965CB961DF47F4E036AE8E1D9A3CBF6E912AFF25707FFB3CA5F49DC7B1FDA11ED8876443BA21DD18E6847B423DA51CD6D4728E32F1C0015909E9E1E24E76B46F5D3EF433B95BF28564DD4D871F90D5DC678FD81273CB423D08E6847B423DA11ED8876841ADF8E504A8C74002A81C7E3E17CCD3584F53ED4D4DF6DD15ED7FFC53B463BA21DD18E6847B423DA11ED08B5B21D9D61C488114FB85CAE178AB97B6A6868E854E70D515151F5E23CACB426A00A04049F53EC7DFE0D48D201DA11403B026847A8F59D6BB73B9A5A28A25EA802C0F79A77BE46F907363AE376BF8060D5BC4B7F2A08A01D01B4238076845A2E323272B5CA5F84B5340ED7977A217400AA40E3563D55A3963D8ABC3DA4F5455410403B02684700ED0875806118FF29E57EABEB4B9D103A0055242F27F38CDB724F9FA26200DA11403B026847A8230CC378EB2CBB64CB3F2E976B517DA9134207C0C7B2D38FABB86D6FABB4E33F9C715FFA89FD2A6EEB9BE63E00684700ED08A01DA1766BD8B0E14697CB55520215A84B624242C2464207001576F2E876FD1FD35B2A23F960B1FB64A41C52B19B5F55C971DF2883733B03B423807604D08E506B454444641986F15949FBE8FB576ED8B021B7BED409A7CC047C4012EE63FB3E3113EFD2F0E4659BFB9F3AFE836A7DFE6015649E9218A01DD18E00DA11403B422D345F973B8B081BF25C2E979FDBEDFEA03E5506231D001F9084BBB4FF313949727E68CBEB5420403B02684700ED08B5944C9D300CE38C853F2470D09BC3F1F1F16BEB537D103A003E20097779199E5C2A10A01D01B4238076845A4AA64EB85CAEC8223F1386B1BA3E4DAD104CAF007CE08281CF5109A874EDDBB74F397AF4A8EADCB9F329DA11403BA21D8176443B42CD6518C60A97CB35D671932CF2215FFA7F51DFEA82910E00500B3CFDF4D361C9C9C9B36EBAE92675FCF8F1E94F3EF9E4186A05A01D01B423A0663A76ECD86ABD49F6EA7B277A3C9E8FEB5B5D103A00400D3779F2E4A1717171EF8D1F3FDE7DCF3DF7A8871F7ED8ADFF237B6BD2A4497755E1615CA7CBFFF32A7FE1DD01ED887604DA11ED083893358562BDD7CDAB972D5B9646E80000A831E41BA5C4C4C4A513264CF0BBF4D24BCDDBFAF4E9237FE8F9252727BF5B857FE8DDAFCB775EE516DE21D08E6847A01DD18E8062CD735E71B95C1FD4C74A207400801A2A3C3C7CF4CF3FFFFCBE7CA364FF8167EBD5AB979A3871A2F987DE830F3E787B151DD240AF92C1BB04DA11ED08B423DA1150B4A0A0A04DCEEB0D1A34D840E80000A8317FE0C5C6C62E90A1ABDE7FE0D9E41BA6471E79C42F2D2D6DC93DF7DC33A40A0EEB13AF92C73B05DA11ED08B423DA11F0AB912347761C3162C4F8D0D0D065595959BB55FE0292C2D0D777E8FB56E8FB1E93FD081D0000D5F507DE48FB0F3CF943AE24F20DD3A38F3E1AA02F2E1D3D7AF4CD3E3EB4C15EE518EF166847B423D08E68478052616161FFBFBDF38093ABAA1EF09BD445918080888D222AD63F888820C542932208842452154144513006030A8228CD544151410C909800418220D214146C4068890D158294509300020924D9FFFDDECE9DDC7DCCCCCE66FBE6FB7EBFFBDBD999376FDEDCB9E7DD73CE3DE7DCBD43BB61F9F2E5FF29954AA455EC17DA2689CD5D0A6DC3F0DADEE1EFF7962D5BF6D0C891236F0AEF3950A7838888741BC71C73CCDE0F3CF0C08584B0B6A5E0A58ADED7BEF6B5216192BB224C5CBB76F2250D2F2B741797FF1F94ADD86EF9FAD08E0A6DBAF3892847CA912847CA91AC8A8C1C3972C330DEAF658BCCD0760C6D483BDEFE9170FCC5E11CB70C1F3E7C139D0E2222D2A5B0A2B468D1A2996991AE4641D11B3366CCE04183065D3162C488CE2CA87559D612BABA756837672D79B3C3B21521AD3F0A6D54B62274504439528E4439528E6495208CF19103060CB8B3B9B97997F8DCC08103F394A3238E38223BEBACB3B29FFCE427D9F4E9D3B39FFEF4A7D9F8F1E3B32057D9565B6D950D1E3C383DD5B6E17D77F5D7A8079D0E22DDCC8F7EF4A3EC81071EC8FEF9CF7F6637DE7863CDE3EEBCF3CEEC9A6BAEC9AEBDF6DA9AED073FF841CDF77373FBEF7FFFDBF075712DB366CDAAF9FA638F3D96DD73CF3D95FF79FCCB5FFEB2E6F17CC7C58B17E78FFFF7BFEA3B03CD9933E715CFF1BD962E5DBACA8D8B134F3CF1C079F3E65DB4320A5EAAE88D1E3DBA69C890219775B2A2B76E68FF97AD28D4C5FF1B642D21836785D6A41C2947CA51DF932311E548A4430E873D060C183075F9F2E56B4567C31E7BEC914D9C38311B3B766CF6D18F7E347BF39BDF9CBDE635AFC98F7FD5AB5E95BDE10D6FC8B6D9661B2289B2EF7FFFFBF9F1BCAFCCEA443D8C1A35EA733A1D4464A559B870217BF6661B6DB451F68E77BCA395B1F1D7BFFE357F3DF2F7BFFF3D0B37B26CD75D77AD346E566BAEB966FEF8631FFB583677EEDC9A9F356DDAB4ECE1871F6EF8DA1E7FBC7E3AE4EB5FFFFAEC820B2EC8EEB8E38EDCC89932654A166EB215C3ED139FF8442BE38CEBDC71C71DF3638E3DF6D8EC3FFFF94FFE3ADFF3DC73CFCD1F73AE279F7CB2D5E7BCF4D24BF9EBC0F56330D2171C7FFCF1C7674F3CF144BF54F0C277BDB05E91AE46C1B33E66CC98CE56F40EC95A4257DF53FE9F1FEDC1D0FE1DDAD7425BAC1C2947CA51DF922311E548A4430E07221C66353737E71E039C09A79F7E3A4524B375D75DB7A17330C7733CEFC3391109E73CAFBF453CE87410E9464E38E1846CD34D37AD1818F7DF7F7FE5312B9AAC82B665D02C5AB4A8A1CFBAEFBEFB1A3E16306A9A9A9A5EF15CCA37BEF18DDC7059B0604176D45147E5C773CCBBDEF5AEEC5BDFFA56F696B7BCA572EC5A6BAD957DF7BBDFCD0D228EC1407CED6B5F9BFDEB5FFFCA0DBD37BDE94DB97737DE986FBBEDB6FC358CC89D77DE395F31FEC73FFE917FE7D7BDEE75F9B99F7AEAA9FC717F8210D6A8E0359A33DB16E5D0D6A6C183075FDA0939B5EB87B65A68E784B661688785B669D67A3529CDAB558E9423E5A80FC891887224B27250C361E0C0813F8C0E07E6DC934F3EB995E3A03DF03EDE8FBC248E877383CC6CDA5FFA4CA114E9265869C4584879F9E5972B8F3114301E8A5C7DF5D5D9A0412DA28AE14188D60D37DC900D1F3EBCEEE7115A9DAEF81679FAE9A7B35B6EB9A56220B172BCD9669B555E674594D72FBEB8A55ED36F7FFBDB3C0C8CD071DEBBF6DA6B67A79D765A6EF8704D1FFAD0872AEFFDE31FFF981B4B3BECB043FEBE214386E4ABCDE1269D1D79E491B96178C51557E4461406247CF0831FCCCE3EFBECFC18DEFBA52F7D29FF9E3FFBD9CF2AE73CE49043FAD5988845BA8E3EFAE88A828781FB852F7CE115C7D2F7A9E7FC85175EC80E3BECB0571C47AA00E38C89EBB8E38E5BEDACB3CEBA3C4C5AFB4E9F3EFDDA95B8C4F542DB3EB453E370CC5A5698D8879DAACC6B8746B1245698C632EC9423E54839EAFD7224A21C89AC3C612E3E3FA65410E1307AF4E84A0AC5CA4214262917381F1E7AE8219E22D5E2BCF077BB7ED1670E1B91AE8795D7B7BDED6DD976DB6D57D3B0A975B3C280220C9C554B0C8C0F7CE00379119A7A618F845673DCB3CF3E5BF3188C9DBDF7DEBB1272CE35A05CC4FF37DC70C33CAC3B82C1168D3942B34F3AE9A4DCD0212CECDBDFFE766EE8905F0FE4AA1D7EF8E1790E3A06519A5B1E0D3FD860830D5A5DD33BDFF9CEECAEBBEECAAEBCF2CABCE84E1A66CE0D78DB6DB7ED3763A256912E42EDF81D987C92C92DAF619042FFA4058830300F3CF0C0560679B98AF8ABC2FB67AE64682BB90297148757F9B9C343DB87218ABE9A754348AB72A41C294722CA9172243D09DB628639F9E33CA616038E828E3A1C52C7034526931A0FDBF697340B9D0E22DD0079DC184B180E4CE8D12021349ABF18215B6FBD75DDC26FE3C68DCB572F1B81555142B5395FA3B9DBCF3FFF7C2B4386958B344C7CD8B061D9AB5FFDEABC0A2FABB91FF9C847720386C71839282265CF6C0E157A6FBDF5D66CFBEDB7AF7CAFF5D65BAFF2DD59914D3F8BB0F0B7BFFDED79D83C461437DCDB6FBF3D5F0D8EC65DBD15E7AE24F4FB379964C277EE94E8B0A0E01D52AF48177DB6FEFAEB57FE67DCB0AACD0A3D6094520F20AEF0F3BBADB1C61A79BF1661C5EAB8E38EA38AF88C4E2EE6D5E5FDA41C2947CA918872A41C492F1B1B5F8C0FA8C3B4B22915B5E07C69C4667373F3E7753A8848BBC068A09A3EB9E7AC68AEB3CE3A955C74C2C21F7DF4D1AAEFE3F5F7BDEF7DAD72BDEAF19BDFFC26FBE4273F99EDBBEFBEAF5891A80646CDC73FFEF156CF3DF7DC73AD3CB7280B184C6F7DEB5BF3304A6E8AAC02B36AFAA73FFD29FBE217BFD86A4597FC36BE1321E131A79DEF4778FC19679C911B47113CBB7CBFEBAFBF3EFBDBDFFE96E79C5F74D145B9B28391049CFBBCF3CEEBA99FEE54F65E0EC6DEC23059515578D7E1C387AFDE0105EF82B68A7411169FAE2EBDF8E28BD9F9E79F9FFF2E8C1D0CCCB4FFD89629F18CB722F4ED90A8E875C1BEE9D5FAE9D9D04F9777A49F9423E54839EA5A3982AEDE058673A70E3B7683A1186A3588648A866C51DE8B85521B8148A55A3006EABD1E8FA1F60AA43BCEB467371BE568D590A37A102A1F41461AD95588B14901E074DC237FE9984576991B5248E343E6AA81B3B9DE4E49B5E6B474D724D2F448D16B8BA263BB3DC5987BBB0C1D70C0016F0A7F3ECA63C6384E87AE00A75D123DB42D3524743A88489B307170B3671533E66C6338A405E6580DA5605C7112F9F39FFF9C4FE2D5560D6ADDEC99745020C8336385B378CE22E79C734EF699CF7CA6D57377DF7DF72B72E7B97E6E82184054F5FFF5AF7F5DC9334F6192A272FE33CF3C53F96EC0F7C3E879F0C107B3830F3E380F294F61B524AEE0F21D8AD57F518C8B45F9BA9352A9C4A4746098AC7E1DBEF34361A2BA90C9EAD0430F6D688BAE934E3A695454F0DA2AD2C5AA3EFDB0DA6AAB559E43B1A30FD3707F0C5A56F737DE78E3BAE743D11B33664CB8EC01D3BB7A8529F41317BD0FFD1426E5F9A18F2E6D4F3F2947CA9172D47572948EF1AEDE0586731F74D04115C385E8211C6ED5983A756A3EA6199B184FD1C9C11827252A822C721E1AB55A2EBCF0C22C8C858A1392EF815C4D9830A1A6D143B451D1C1513C06398A2B98EC1C130D3EAEA727E54739EA5D72540DC626CE291A857CE3631A7316CE620A0A034E38C62CE975382518C7D4F9898E75C637639EFB36F3442A93310285E30079E6393EA7586363C68C19B90CF3BB5D76D965F9E7458721F21BA3E152DEFDEE77B78A0CBCFCF2CBF37B45516E702612BDC7B552AFE8AB5FFD6A2B87244EAB5ACE90BE26434B972EDD3B168F446E8AF37B67C1BDB5E008DCAFAFDB42861C89740328FDAC98966F58F996753CF7C637BE3157ECC24DAEE2D94C6112A0281D1305377B26A6CF7DAEFED6BDDFFCE637B333CF3CB3F23F13DB5E7BED95E77757AB588F92C6AA44B1E23E21DEC5958FD4437FEFBDF7E69F1515CB94D5575F3D5748F9BCDFFDEE7779E13A264C3E8B0614B7A30F76DB6DB78A21560B26B53FFCE10F3557C87A68B25A334C3C07A3832E5EBCF8C530315F129EBB72FEFCF9578789FF154B1941C1DA37280217A745BADA629F7DF6C9FB8F5525207C1565227CEE8A9BF8A041D9FEFBEFDFD0F9C2E7AE367AF4E8E5E3C68DFB7950F43E7DC925975CDD0D5D452124AA350E0FFDB4248C75AC874B6AF59372A41C29475D2B479174171888BBC0C431CA582237BF16EC88522F8F19B9E3FD18E9C805BFC129A79C921B5D84DF33BE2318F4E1BB90F39F475C20CBFC26FC4E4432215B11A276B86E1C0E4421710D3815917B3EF3C31FFE702B432C1A5CA44A45F920FA8288A3780CD7C679F97CBE7BE8E3FC2FB2C239B9C744830F47443D39538E562D39AA06463C50EB62975D76A9EC4844241C8F69387200271C4E3022EB185B8CE3F7BCE73D79B41AF03CF7FED4E19382F381162351189B975E7A69BE13523AE720DFD4E7C0994101659C047C16CE74D2FC62345C2A93C8EFEEBBEF9E3BD990B7891327B6AADD01A43722AF38398E3BEEB8FCB9ABAEBA2A3F37730EAFE35847867A338DCA50786E87F8384D6FEC0A38FF5FFEF297F82F9F3BAE2FDB42463A887423283078975935210C1A258615CB2F7FF9CBF9AA4E71F58449808909A383890BE5804AF6B5F8CE77BE93AF2AA52B49BCF7D4534FCD5786098D4B43E59844783D4E90286218648467A318A65E756062C2E80BCA417E1D4C74ACC4923B5E5C05E6BB3239615491ABCE24C4E747658D49146F3ECA5D8455AEE81947A14D2735E0F8DEA6EC95411B389470BDF07B3D1526AB19A9B79C15A5279F7CF2925A39B3B520748F824228249154C1C313FED9CF7EB655D86B5B6CBEF9E6AF0E8A41299CFBE75DBDC25485A1E1FA4796FB6961E8A32B5766C54939528E94A38EC95123BBC030DE8A30D6E3D822528046D5760C9922A42404E336973F1C09D43B611C4F9E3C39FBD5AF7ED5EAD82953A6E4CE379C87186A44F72063279E7862EE442886A4137D845C0C1D3A34972F0C24AE89F3C728882238E662940663211A78349C1A381C0059426EB88F607491FE045C5B2AF718E13D551F4539EA3DF3513570CE301E9907A8C1838C30764847E139EEC11C13211280FB36D142440AE01C4FEFE98C45D2E520A6D7114171DD75D7658F3CF248EE7C63CCE3F4214D69CB2DB76CB5F532914363C78ECDC72BF31B8EB4383790A6415A5F11CEC31C8BD301E7013287BCE1B0686B5BEA08110FD52228FA00F564A8B23D555B113D1D8542D4099BF5751BC84807916E002384C984C9186309508E80554AB69F223F72BFFDF6CB4E3FFDF43C7C8D49261E13C1FB9DAE44A5E727CF0E2F76D15B0D1864182A784C512C3937131F45F9089F4B0D2B26160C190AD8A530E9F01D58D940090B0A42FE3CF9F1289C9FFFFCE773CF7954D050F0505C0937675244A1E31C78C29920816B8A2BC35C13CFC755EAA2511457B8DB828999EB0993C4C93DF4730F0B6D4498AC46A0347CFAD39F7E3CF4D9BAAC28B547C18B3016E863C23153639AFEC1888CFDDD1E82D1BDFAE1871FBEE8C73FFEF1CC3091CE0CD7FAEF1EE827569CF8513F493F85DFEB81B6F2B69523E54839EAB81CC55D60F8EE440814696B179838CE70F221738C358C7E42AB5B2998C10042D6AA451EA5293F5C03F28881CFF6B2A4292D59B2240F359F346952FE59184538F59097B8930B3248740461DB381E62A44374FEA5910EC80D865E1C3B38FA88A040A6E6CD9B97A708C4555A2230689C13C70CC760AC716D71A718CE45A448BD4810E5A87FCB513D483161ECCE9C39338F3820C287F1F4FBDFFF3E77BA15EFC34401C4A83DE619220370D42D5BB62C4F87087D53A9EFC0DC42E3BC140DC639C858C7214E5A11297DC81E3B1F51BF87790D6735D1453826703230BF31AF300F31BE495FC299C16E4A119C4BFCC6D17911FF32BFC5280D40F6392FF312F36F6A88F3FE6A73697BE961396A25437CADD4D1D69514CEBF8E4E07116993741534C2FFE90A28E1DE69C8372BAD6D111540CECFB67DF5604535AEEE72E3AC753C4A03F9BC4598E4E24A69119417269D540961028C79F7310790F7FFFCE73FAF1C83E21BC1684ABF335B1BC67E487703680B1443B60B0C7CAB37FCF6A14FD6C3485E19052FC2D66349885D0E2B4C9FFAD4A73A3289AF593ECF01BD444C3642918D86B472A41C29475D2347180C348C8EB80B0C90E71D1F337631EC6B8D994676814957C1ABFC9EADC638E90F8CFD6014E7C61546466A006174B15A8CD30103972822A280900514F334D2A1185914E1781C0580B302E30EE702C5F258652E3A38391E3963DCE05C888622EFE57A1A59D1578EFAAF1CD50227010E03E6078C79A2038892233D8F7E8AB54170109096101DC6D1D187C30DC7017F798DC7BC37751062E023BF441ADD77DF7D95EB4C1D7C444BC4790DE707FF330FF03FF2C738266583318E83AFD17A47459037E661EE1F71EEE5BBC539B233E8657254F1E477D63699B528DC639AB23E8E4E07911EA29662D4282858284D8D1A12E4E2B182CB24162739C2FBEA8599039E6B7272EB5D2F2B5CAC7E4445066595F71D79E4911DBF490D6ADF6D6ABBEDB6CB15C830419DD2893F5723135D2C2BDDAAA38282FCE4F3CF3FBFF63DF7DCD370EE6C11948252A9D44A8947F1A6BE0079CA2BC3DA6BAF4DACE66BC2793B7365A9917EE24B6071B42A6D1EAEE3FE60A86FDC1972C42A26AB3FAC5E92171B8DF622442960B0B0BB438428035645ABA51F30AE5122092F8D39DF69B83521AC186271F593EBC0782956714759A4E275BA5A5418339D2E77CA9172546D3CB37AC818634CC65D60A2B180429D8668A7730F694D848AD783BEC681C0F15126CB0666FEFE140C2BAE03D9C12863953556EB67BEBAE9A69B5A1980380A3937B28BE360D1A245AD221DB8F6E236B77CDFF8FD8836E2B338378FD32D217142E054E0759C2045E702C7369A42A01CAD5AF35134148950C349453410730AFD83A18F738DF1F5BDEF7D2F4F3D62DC320F3046484D212A807A0CA4FE902211C719CE6D6420425FE388602E2A46D35503E704E948C81DD1164455100941BA1451743858489D4959B060417E1F20C582E805E40D79A956D3A8DA3C85BCF1393828F30119647965F5DE2E90A39596A130369687319A2B08C5DDA93A9B7457186ECB3A1D44A447E0064E1E3813055E6F5678284487B2C6F34C14E9E470C10517E4CFA5060BF9805B6CB145AB825EB1F04F2456F9DE669B6D6A1EC3649ADE1C3170E284C52445F86BB1485E5781E28C11F6F5AF7FFDE4CE3A6730246B4D502F53A997FA0000160C4944415432F9844968689C98C2FF8BC2FF3786366DE8D0A1D74E993265F109279CB0FFC48913A70705A4DD21AD140EE4B72DD62920EC924998DFA6BD21AD61E27EFCBCF3CE5B2D5CEB7E4109BABA1BFA897E5916FA04C5AE848257AD9F82D2D5DC1993F4A1871E9A1B2C2870183BB59C0E1463246C3BE6A71315C058E5BD8C615657A8CE1E61A588E350F408496595086389E28C14B56415292D24C9EF86FCC46883D43991EEC1DD1BE54E39EABF7284F1C0F6AC8DEC0283032E8DA489BBC060ECB3B2598F4D36D924FF8BF14E8D068C7BCE873195D62EE173496DC0898E6CA55BDA2253C84BAD5558DECB6FC77B991363DA05055C7140A4F2827CC4F3A4910EB434D281ED6B69EC88D1563F167786518E9C8F807B2F730FC51BE316C638CDB6DA6AABDC294624401AB58731CE98A4E1D4620C530385FB7FB1FE09F77CC6550CBD470744466A8D457E2BD2F670849062414D217444C63F731D8E87749E8920F738DF782F0D470706769421528E8AE94538FAB86E2292D849837A2CDC6BF8BC8ED411EA6C39EA880C85F9750EB7375EC369D4954E07CE9FF0944E0711E956F04873A327D49A16F756A72810131A86162B49D5BCD111B637E2F834443BD29E2ADFD5AE0D430CA514A389F73279E259C773DFDED5D65ECAFFCA8A0AD5B45663C5A7FC1C1D7449F8FE370685A5D54C71DA69A75D7ACC31C7BC148CDC99E1EFC046579850E4C86F4E57D3D315261479F2F9F9BD1A5D790B4AE1E313264C582D2822077475B5F0709D4BCA93775656F0EAF65367407F517C2EE69112A24AFFA58E35C060C2F1466570EA31904B4B7FA21C512F026744D1D0410608F90E8A4FFE1928882874E137CDCF5F54B891A158832285F7211FA9D2B60ACA9D72D44372D41DBBC0302FC5106E3E032384C2A98031865380155A72CE391FA915FCE5D8B622F0622A052BC6BC87EB45F630C6083547A690C762BE75CC7D8734D20103B1B80D6035902BEA3F446EBFFDF6CAAE31CA91F3510AE39271C5FD373AE9A81754CB018EA321CA1BFD8B81CF182D6E870C44F0214F9C2F7E56B53442F4BCF87A3935219F2B489DA29603639EB90127602C5259CB915F2D420139250203E71B8E0B9C0D3859F88E38BB89FA23F20EA703EFC7F95274C0F7C5B9287CAFBBA3D381EF1BB7D5ED0AD2FB4DE06E9D0E22D2ADB0850E2BB4318C9BAAC76C9BC7640F4C4414B0AB0595C1D96E2C2A96D54815295657B9A9C6D52726AAB87ACAE488371B0514EF39A17B5C1F861BC7E09D662598F0BD7EC4EAC9443533B45F05C5F56A5646EABD69D2A449B38282B75FF83BB3D1AAE1BFF8C52F5AAD64131E494D00562563A579FE128EC9EA7E5B04857CFEC489139BBA43C12B2B7643DBDB4F1D81B1CA6A5B2C08072867E47153F02E858AE2F4255B98A178610845831F058E3C5C14A918918081C318675CEFB4D34EF9169A2895471D7554367BF6EC8AC383F7A450488F55D394B81D21464BAA84AD6272A71CF5B01C51B300C71B1170AC5E132ACC7822243CEEEA90AE4EC65D60805D6018FFD59C03184538E5304A7034C462ADB1682AE39674BF68E810F570C61967E4E7A6005FADA8863973E6E4F2C075E25C880E0B882BB538D3595DE55A393E2575D8A5910E4570BC6040C57C749C27C813D74D8A624C2B4146494FE9487D04E5A87FCE4718D838AE8942609CA17731DE6B39B7889C4B539B187FC5D4A6580B224DCB636C127D545811AFBC06FC3EC823910BA40B1139417D140ACA3267B1730CC59799238BF586A2033E92D668A03825F30EE300E73E8EF338BF51E4923932952F9C961D49B1E82D32D4DCDCFCBB3096F68B4E9CB652943B02E74FFD3C3A1D44A4DB61C506CF35CA0F93195EEB082B4851B92B82824411A8741502051185331A46EDADF28D5186C2C804C7E4CA04C724C44A1AE721E2A25AE85E5F8430BBF0E7E6A0E85E188CD29BDBBB3282A21726F0E16172BF2428F683EB297A28042821A992C76A3613395B5F11460F8C01940E5652EA6DDF4408EBB871E38651A8AB1B56943AD44F2B03CA0C860CB9B22938E68800623C9E7CF2C995718DB18572C4B8C57089CA112BAEB1CF912D8C20A20730B070D4E1D0E3BD54B58FC5B76295F062B83972C00A6C71D50F2707C7E220894E875549EE94A39E95A3AEDE0586106E56378179859C766AA1444328E6FDC71C728C21B6CB8C4E3522289011E49290F4F8191862380B19DBD18180214388780C2D27D419671EB0F24EB450B5BA1418C7C856352330EEA2813324DE17CE3CF3CC8A53909A2938F9714C76E52AA772D437E723E6221CBE2C00E1DC02B63E247528524C35203A203ADB9025E613521A60FCF8F195FB7ED1794DDA06BF5B35433ECA2B8E211CEF6C014D0412053FD1059127E64CC0D980F3018723F24B941C8E3D1CF0512E714832B790960BCC81CC39C85EAC2344FA0DE7261A90F300F3180B655C2BE7AA15EDD1576428DC9B662D5BB68C8E1BC4B6C08CFDE2F6C39D018EA4D9B3671346542A3F3553A78388741B4CF8288B6C931495478AD4A164C5BD9059E18961DB184A183D286228031C8F5185B2984E90E9FEECD09E2ADF28239C979B2E2B66845A522702C591EBA0181E06539C80FA2827964AA5794D4D4D333BBA32120CD52BF6DF7FFFDD264F9EFCABAF7CE52B436A297A6C6B1557360003814253FC9644B7A0C8C75587175F7C313F1E03A158B4302A78C11867DFE903A64F9F3EAB2FF4537BA01F5885A45F88004046507EA2924718370E02567530585096095B25A716E590EDCC22F425FF4F9830A112E540F8680C5F651515394C7FB7F4774A21F414E3290D4746E9C36988B1520CCD5E05E44E39EA0572D4D5BBC0A460641081D31669ED9146B7758DF35D23D7568495F87A2BAE5C437A1DA9ACAE6C957FE568D5988FE2B8C2F1128B14235F699A5B5126D2281C8EC3B91D1D13F17D45873A8EB06A913A9134E20F870330A7E0F82B8E617EF7B42031CEC2B4C07274484627452DF89CA2238FEBEC4F3ADDB469D31E1E356AD4CD61CEDD919423B637AD9606D35170F285DF223A1C6E9D3163C63C9D0E22D26D30D1134A3D75EAD44A181C37263CE218187152410160C241918BCA5C2C00C4E447AE5FBD148C46AB7CC3AC59B3B2238E38224FD94031C3AB8E9146C5622649143772DE8B4A6E5F22DCECBFD399E7BBF4D24B6F0C93D65E679F7DF615471F7D745351D1C3C82474375D3D647F7856EC01A3957180430905026590550B423AD91521A53B73663BBB9F1A05E52C4EFA8C77945E1C738C77FA87106FFA0CC7436A6401CEBA3452082502E52A0D61E57F7E0F9C029C935055522C5225B1487434B03A94C26A0F0A1DAB23ACFE107DB1AAC89D72D47BE5A817863CFB7D95A33E391F5535B60A73445B75761AA98951CFE1D0D67CD99E6BEDC8F7ECC7328432B1230F703AE0A0E9CCA8272296AFBAEAAA4A9443A954FA717FB8EF0EC844A4CF41AE6ACCB9259AA158B59855DE6275E954D9C2908945866A4D1CF1FC4445E0C8E071312C8ECFC0D88945FB78CCEA2BB97D78B709FF6615AA2F3B1CBA8AD0FFD72E59B2E45393264D5A4C885E84903A8C6394B6140CCC141C4DE96F8C117BD1451755C25C81152514BCF0704477E4CCF616030265378E3956DFEA19188C5DF25263A3A8165B9115616C93BB19B7118C2B45717BBF280FA97381FF514870824488B220E49BA884625148E54E3912518E447ABDBC10A173338F59A80872D3E616C28D4224E5E4C993970579AA4439CC9F3F7F467FE837231D44FA18F5BCD4AC46B07D1F2BB2F5A0C23E39B6E4A2B36A5BCC796DB4CA37859158518D452C717650C88B5C5D141542C41B2928B52A2B7AFBEFBFFF9EE3C78FBFEA98638EC95798A8B85ECF21146125A4DE71714509058FCF5955FA94B4037248635A0179ADC52881E2F1A41CA590DB4AC1BAD49917B7A8259D216EA587D380B40EF61047E682A250391E07061071C18E17319C963C709C14D556A9943BE548443912E91350A9990232EB505389DA1B14E8ECC8169A381C264D9AD4FCC8238FC4BCA4FF954AA5C36FBEF9E6A5FDC27E71CC88F43DC8EFC638A1616C4462CA05C57E8ACE09EA36906749713C0C270C260AE3EDBEFBEEF9AA2837CD08AF555B71A57277BA7A1AB7E5A47231DE5E0C238C2DD23B36DF7CF3DC08230790425F521D425B43FFEDC90AD3ECD9B39775C63951F042BF0F2184755552F0886A2065812D00E3AA1B0519E30E10D5204A208EF5D8700A14A38730FE0F3BECB0DCD08FE918441AE0D4A07604DB9051E53BD65689B01D1D95FEB90E140A9C1CB550EE942311E548A4F7438D85E6E666AAE1E60E019CFFA44B921AB132F0BE934E3A69D99C397362840369155F0832F38FFED2673A1D44FA18185354F48EC609D586535801AD56B59E8AE118268445B2820A1832A46AB03A8AF1558D58E5BB1EACC4B2824B913CB65122973C5E03C5A46EBAE9267FB8C614BD251D55F462086B30460F5E95425899F0D90AECD4534FCDA308C83FC6F970F1C517677BEEB967CDF7111D141D78B115438923444F10B540557CC63AD5C919DF51EE70E2F17C110A4A92EFC9AE0014BA8CF2570FE54E3912518E447A2F614C93F67078743CB07887DE316DDAB4AADB985683E3488D1C3B766C1AE14071E8E3A74F9F3EB53FF557C92123D2716EB8E186E662A5DFEE0623AB2B8AF834B2AF726FDB7B99ED9E76DA69A73E777F0B46EBAE03070EBC7CF4E8D14337DB6CB381ED7D7F5F0F61ED09395A991D1EE2369BED7DADAFC99D72A41C8972A41C8972549F1123468C0C7FCE2D954A6BC6E7D8B985484716FBD83E965425522F8878C4D1C056D8B367CFA62D5FB26449AA345085FAE81933664CE96FBFA1351D44FA8B307751D5E0468C9A55ADF2795781621614BD7DC78D1B37F3D8638F1DBCC5165B34DCB169912E43581B6765B694ACE754E80C878372A71C892847227D03221E468E1CF9E752A9741E5B69F21CA98F77DE7967DEDA522992C7B752C3A13FA554D4FAA22222D20B14BD975F7E79EF891327BE3C7BF6EC971A55F0D8F7DC9C5911E548443912E95EA8F110C63B7B690F2F954AE459B6A7F8E3ADA17DE6B1C71EFB687F7538E8741011E98590538BA23761C28497EEB8E38EE7EB1D7BDF7DF7CD1F376E1CE5920F316756443912518E447ACCF93013E7C3C08103372A954AC786A76686362FB4C5E543F8FB7068C8C798D0360AEFD98E748AFEB24B452D4CAF1011E9A58ADEA851A3864F9C38919CDA67DFFFFEF7BF220FA05C15BCA9B9B9F980F2BED122A21C892847223DC8B469D3702C4C2A37C98C741011E9B5109ABA74E9D2BDC68F1F5FBAFDF6DB9F4D5F4BAB82ABE089284722CA9188F456743A8888F46258610A8ADE3E93264D2ADD76DB6D0BA3821773660D6115518E449423914E6744681B24FF9321705603EFBBB6411B7BE3D08E6CE3183E6FF5D0DE17DAD6E5E7760D6D6D9D0E2222D2558ADEC01FFEF0870FABE089284722CA914897B25D680F26FF5373E155E5C7713797A6D0B6C85A9C13B15174F5CDC9FFDF0D6DADF2F1380E762BB74D437B4FF23FED33856BC0B9C0369A6F0A6DBDF2730784F6B44E071111E912452FFC1971CB2DB730F18C50C113518E449423912E61B3D07E16DADB43DBA3DC700A6C58FE7B7C68EB662D85216787F664D941417B3E79CCEBDF086D61F9BC1497BC2669F392C78F97FF878DCB9FF3C6D0BE9C381C6079F9EFA63A1D4444A4D321A7B6A9A9692DB72113518E449423912E812886CD439B13DA51A1DD9EB5EC36913A094E293B1A2257652BA215DE903C3EBB606F1F1CDA96594B0403ED9DC963A2236E2A1F777FF9731E0AEDFB65870411152796CF87C3E3F8B25342A7838888742E53A64C59642F88284722CA914897D054761C60D45F9EB5A4328C283B115E086DEFD00E2ABCE7896C45C4C2A3C963A2209627C711F9401D87E7CA6D49F278F71AD7C2E7AD573ED7A9E5F391FA7148688FF4954E75CB4C111111111111912C6377960B42FBBFD06EC95A221F7E5D7EFE9AF231EB16DEF3BAACC529C17BDE92B5D466203A61EB2AE7E7BD3B961FBF25799C0603EC10DA67B316E7C7ACF2B98724AFFFA2AF75AA4E071111111111119116A6867645689F0C8D1A266342FB53F935A20FDE9BB5A45844C6672D69184444FC376B2926794DF29E94C7B315CE8BDD92C79F4A8EF94B687F08EDDCFED2A13A1D444444444444445AD8256BD9AD025B99828DF313E7005B58BEBA70FC6F439B1CDA57433B27B4EB433B23B4936BD8DFBB951F6F983C7E2C3966718DEBDA3AB1DFDF15DABFB3160747AF47A783888888888888484B51479C07A4535047814807A210621A4453E178D2253E17DAD86CC52E151499FC49D692968143E2FCACC57101E9B698EC8A119D19D714AE0186259F7944F9BD384348B560670D7690B9BE2F74AA4E071111111111119196C2919784766FF2DCC3598BF3018874D832710E1009717A726C8C3C60070A8A4352E7617E8DCF7AA9CE351C16DA5DE5FFA92D31B77C9E33B396340EF8535FE9549D0E222222222222222DDC5BF8FF67C9E3FF652BB6B67CBAEC10484923195E68C331704C9DD77E9A3C7E325BB145E7DFCAAD4FE19699222222222222221D67B95DF04A743A888888888888884897A0D341A4330469C080E6E5CB756CF606C2EFF060D65264479423518E9423518E4439528EA4A765CA2E10E9384D4D4D4F3CF7DC7376442F60E1C28514DAB9DB9E508E4439528E443912E54839929E47A78348273078F0E05B9F79E6193BA217F0D8638FB1C5D1CDF6847224CA917224CA912847CA91F43C3A1D443A81C58B179F357FFEFC979B9B9BED8C9E65DE82050BD89AE872BB423912E5483912E5489423E5487A1E9D0E229DC0F6DB6F7F5B9898EE7DF4D147ED8C1E64EEDCB93784DFE1D19D76DAE9CFF6867224CA917224CA912847CA91F43C3A1D443A89C58B171F386FDEBC179E7DF6593BA30758B468D1950B162CD873F9F2E5C7DA1BCA912847CA9172A41C8972A41C49EF60A05D20D2394C9D3AF5A9830E3AE8B6A79F7E7AAF61C386350D1D3AD44EE9C68969CE9C39EF2D954A47EDBCF3CEB7DA23CA912847CA9172A41C8972A41C894E07917EC745175D74FF81071E78C7E38F3FBE77B8513EBFC61A6BAC16FEDA315DC7BCB973E75E366FDEBC8F3131EDB8E38E57DB25CA912847A21C2947A21C2947D27B506A44BA80EBAEBB6ED30103064C1E3468D0E6EBAEBBEEC3EBACB3CEFAC3860D7B7D78CECEE920ECD7CCF6495433A6B810B97E84DEEDB2CB2E73ED1DE5489423518E9423518E9423D1E920B2CA70FDF5D76F562A95F60D0F3F12DA07426BB2573ACCD2AC65BFE69B43BBDCE242CA912847A21C2947A21C294722222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222D2C7F97FC0D1C36C5E44BE220000000049454E44AE426082,
        NULL);

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`
(
    `NAME_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `REV_`   int(11)                                          NULL DEFAULT NULL,
    PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property`
VALUES ('next.dbid', '147501', 60);
INSERT INTO `act_ge_property`
VALUES ('schema.history', 'create(5.22.0.0)', 1);
INSERT INTO `act_ge_property`
VALUES ('schema.version', '5.22.0.0', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`
(
    `ID_`                varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `PROC_DEF_ID_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `PROC_INST_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `EXECUTION_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `ACT_ID_`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `TASK_ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ACT_NAME_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `ACT_TYPE_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `ASSIGNEE_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `START_TIME_`        datetime(0)                                      NOT NULL,
    `END_TIME_`          datetime(0)                                      NULL DEFAULT NULL,
    `DURATION_`          bigint(20)                                       NULL DEFAULT NULL,
    `TENANT_ID_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`          int(11)                                           NULL DEFAULT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `NAME_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `DESCRIPTION_`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `URL_`          varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `CONTENT_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TIME_`         datetime(0)                                       NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TIME_`         datetime(0)                                       NOT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `ACTION_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `MESSAGE_`      varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `FULL_MSG_`     longblob                                          NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `ACT_INST_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VAR_TYPE_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `REV_`          int(11)                                           NULL DEFAULT NULL,
    `TIME_`         datetime(0)                                       NOT NULL,
    `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DOUBLE_`       double                                            NULL DEFAULT NULL,
    `LONG_`         bigint(20)                                        NULL DEFAULT NULL,
    `TEXT_`         varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TEXT2_`        varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_TIME` (`TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_NAME` (`NAME_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `GROUP_ID_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`
(
    `ID_`                        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `PROC_INST_ID_`              varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `BUSINESS_KEY_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_DEF_ID_`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `START_TIME_`                datetime(0)                                       NOT NULL,
    `END_TIME_`                  datetime(0)                                       NULL DEFAULT NULL,
    `DURATION_`                  bigint(20)                                        NULL DEFAULT NULL,
    `START_USER_ID_`             varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `START_ACT_ID_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `END_ACT_ID_`                varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DELETE_REASON_`             varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TENANT_ID_`                 varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    `NAME_`                      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    UNIQUE INDEX `PROC_INST_ID_` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`
(
    `ID_`             varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `PROC_DEF_ID_`    varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_DEF_KEY_`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_INST_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXECUTION_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DESCRIPTION_`    varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `OWNER_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ASSIGNEE_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `START_TIME_`     datetime(0)                                       NOT NULL,
    `CLAIM_TIME_`     datetime(0)                                       NULL DEFAULT NULL,
    `END_TIME_`       datetime(0)                                       NULL DEFAULT NULL,
    `DURATION_`       bigint(20)                                        NULL DEFAULT NULL,
    `DELETE_REASON_`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PRIORITY_`       int(11)                                           NULL DEFAULT NULL,
    `DUE_DATE_`       datetime(0)                                       NULL DEFAULT NULL,
    `FORM_KEY_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CATEGORY_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TENANT_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`
(
    `ID_`                varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `PROC_INST_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXECUTION_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VAR_TYPE_`          varchar(100) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `REV_`               int(11)                                           NULL DEFAULT NULL,
    `BYTEARRAY_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DOUBLE_`            double                                            NULL DEFAULT NULL,
    `LONG_`              bigint(20)                                        NULL DEFAULT NULL,
    `TEXT_`              varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TEXT2_`             varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `CREATE_TIME_`       datetime(0)                                       NULL DEFAULT NULL,
    `LAST_UPDATED_TIME_` datetime(0)                                       NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`, `VAR_TYPE_`) USING BTREE,
    INDEX `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`
(
    `ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`  int(11)                                          NULL DEFAULT NULL,
    `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`
(
    `ID_`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`       int(11)                                          NULL DEFAULT NULL,
    `USER_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TYPE_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `KEY_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `VALUE_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PASSWORD_`  longblob                                         NULL,
    `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`
(
    `USER_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
    INDEX `ACT_FK_MEMB_GROUP` (`GROUP_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`
(
    `ID_`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`        int(11)                                          NULL DEFAULT NULL,
    `FIRST_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `LAST_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `EMAIL_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PWD_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `PROC_DEF_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `REV_`          int(11)                                         NULL DEFAULT NULL,
    `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
    INDEX `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
    INDEX `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`
(
    `ID_`          varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `NAME_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `CATEGORY_`    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TENANT_ID_`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
    `DEPLOY_TIME_` timestamp(0)                                     NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------
INSERT INTO `act_re_deployment`
VALUES ('135064', '流程审批测试流程', NULL, '', '2018-01-07 10:09:38');
INSERT INTO `act_re_deployment`
VALUES ('145001', 'new-process', NULL, '', '2018-01-09 11:32:28');

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`
(
    `ID_`                           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`                          int(11)                                           NULL DEFAULT NULL,
    `NAME_`                         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `KEY_`                          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CATEGORY_`                     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CREATE_TIME_`                  timestamp(0)                                      NULL DEFAULT NULL,
    `LAST_UPDATE_TIME_`             timestamp(0)                                      NULL DEFAULT NULL,
    `VERSION_`                      int(11)                                           NULL DEFAULT NULL,
    `META_INFO_`                    varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DEPLOYMENT_ID_`                varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EDITOR_SOURCE_VALUE_ID_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TENANT_ID_`                    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
    INDEX `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
    INDEX `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------
INSERT INTO `act_re_model`
VALUES ('142501', 8, 'new-process', 'process', NULL, '2018-01-08 08:10:30', '2018-01-09 11:32:30', 1,
        '{\"name\":\"new-process\",\"description\":\"\",\"revision\":1}', '145001', '142502', '142503', '');
INSERT INTO `act_re_model`
VALUES ('145005', 4, 'new-process', 'process', NULL, '2018-01-09 12:00:51', '2018-01-09 12:01:00', 1,
        '{\"name\":\"new-process\",\"description\":\"\",\"revision\":1}', NULL, '145006', '145007', '');
INSERT INTO `act_re_model`
VALUES ('57501', 31, '流程审批测试流程', 'test_audit02', NULL, '2017-11-12 00:42:13', '2018-01-07 10:09:38', 1,
        '{\"name\":\"流程审批测试流程\",\"revision\":1,\"description\":\"\"}', '135064', '57502', '62501', '');

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`
(
    `ID_`                     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`                    int(11)                                           NULL DEFAULT NULL,
    `CATEGORY_`               varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `NAME_`                   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `KEY_`                    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VERSION_`                int(11)                                           NOT NULL,
    `DEPLOYMENT_ID_`          varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `RESOURCE_NAME_`          varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DGRM_RESOURCE_NAME_`     varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DESCRIPTION_`            varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `HAS_START_FORM_KEY_`     tinyint(4)                                        NULL DEFAULT NULL,
    `HAS_GRAPHICAL_NOTATION_` tinyint(4)                                        NULL DEFAULT NULL,
    `SUSPENSION_STATE_`       int(11)                                           NULL DEFAULT NULL,
    `TENANT_ID_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    UNIQUE INDEX `ACT_UNIQ_PROCDEF` (`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------
INSERT INTO `act_re_procdef`
VALUES ('process:1:145004', 1, 'http://www.activiti.org/processdef', NULL, 'process', 1, '145001',
        'new-process.bpmn20.xml', 'new-process.process.png', NULL, 0, 1, 1, '');
INSERT INTO `act_re_procdef`
VALUES ('salary:3:135067', 1, 'http://www.activiti.org/test', '流程审批测试流程', 'salary', 3, '135064', '流程审批测试流程.bpmn20.xml',
        '流程审批测试流程.salary.png', NULL, 1, 1, 1, '');

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`
(
    `ID_`            varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`           int(11)                                          NULL     DEFAULT NULL,
    `EVENT_TYPE_`    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `EVENT_NAME_`    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `EXECUTION_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `PROC_INST_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `ACTIVITY_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `CREATED_`       timestamp(0)                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `PROC_DEF_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `TENANT_ID_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`) USING BTREE,
    INDEX `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`
(
    `ID_`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`              int(11)                                          NULL DEFAULT NULL,
    `PROC_INST_ID_`     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `BUSINESS_KEY_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PARENT_ID_`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_DEF_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `SUPER_EXEC_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ACT_ID_`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `IS_ACTIVE_`        tinyint(4)                                       NULL DEFAULT NULL,
    `IS_CONCURRENT_`    tinyint(4)                                       NULL DEFAULT NULL,
    `IS_SCOPE_`         tinyint(4)                                       NULL DEFAULT NULL,
    `IS_EVENT_SCOPE_`   tinyint(4)                                       NULL DEFAULT NULL,
    `SUSPENSION_STATE_` int(11)                                          NULL DEFAULT NULL,
    `CACHED_ENT_STATE_` int(11)                                          NULL DEFAULT NULL,
    `TENANT_ID_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
    `NAME_`             varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `LOCK_TIME_`        timestamp(0)                                     NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`) USING BTREE,
    INDEX `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_FK_EXE_PARENT` (`PARENT_ID_`) USING BTREE,
    INDEX `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`) USING BTREE,
    INDEX `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`          int(11)                                          NULL DEFAULT NULL,
    `GROUP_ID_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_DEF_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
    INDEX `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`) USING BTREE,
    INDEX `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`) USING BTREE,
    INDEX `ACT_FK_TSKASS_TASK` (`TASK_ID_`) USING BTREE,
    INDEX `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`
(
    `ID_`                  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`                 int(11)                                           NULL DEFAULT NULL,
    `TYPE_`                varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `LOCK_EXP_TIME_`       timestamp(0)                                      NULL DEFAULT NULL,
    `LOCK_OWNER_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `EXCLUSIVE_`           tinyint(1)                                        NULL DEFAULT NULL,
    `EXECUTION_ID_`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_DEF_ID_`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `RETRIES_`             int(11)                                           NULL DEFAULT NULL,
    `EXCEPTION_STACK_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXCEPTION_MSG_`       varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DUEDATE_`             timestamp(0)                                      NULL DEFAULT NULL,
    `REPEAT_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `HANDLER_TYPE_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `HANDLER_CFG_`         varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TENANT_ID_`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`
(
    `ID_`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`              int(11)                                           NULL DEFAULT NULL,
    `EXECUTION_ID_`     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_`     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_DEF_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`             varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PARENT_TASK_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DESCRIPTION_`      varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TASK_DEF_KEY_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `OWNER_`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ASSIGNEE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `DELEGATION_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PRIORITY_`         int(11)                                           NULL DEFAULT NULL,
    `CREATE_TIME_`      timestamp(0)                                      NULL DEFAULT NULL,
    `DUE_DATE_`         datetime(0)                                       NULL DEFAULT NULL,
    `CATEGORY_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `SUSPENSION_STATE_` int(11)                                           NULL DEFAULT NULL,
    `TENANT_ID_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    `FORM_KEY_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`) USING BTREE,
    INDEX `ACT_FK_TASK_EXE` (`EXECUTION_ID_`) USING BTREE,
    INDEX `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`          int(11)                                           NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `NAME_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DOUBLE_`       double                                            NULL DEFAULT NULL,
    `LONG_`         bigint(20)                                        NULL DEFAULT NULL,
    `TEXT_`         varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TEXT2_`        varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE,
    INDEX `ACT_FK_VAR_EXE` (`EXECUTION_ID_`) USING BTREE,
    INDEX `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_prohibited
-- ----------------------------
DROP TABLE IF EXISTS `b_prohibited`;
CREATE TABLE `b_prohibited`
(
    `prohibited_id` int(32) UNSIGNED                                       NOT NULL AUTO_INCREMENT,
    `code`          varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '违禁词',
    `created_time`  timestamp(0)                                           NULL DEFAULT NULL,
    `created_by`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `updated_time`  timestamp(0)                                           NULL DEFAULT NULL,
    `updated_by`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`prohibited_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '违禁词表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_prohibited
-- ----------------------------
INSERT INTO `b_prohibited`
VALUES (1, '我们', '2019-11-22 21:33:11', 'admin', '2019-11-23 10:55:03', 'admin');
INSERT INTO `b_prohibited`
VALUES (2, '逼', '2019-11-22 21:33:11', 'admin', '2019-11-23 11:03:19', 'admin');
INSERT INTO `b_prohibited`
VALUES (4, '操', '2019-11-22 21:34:01', 'admin', '2019-11-23 10:55:19', 'admin');
INSERT INTO `b_prohibited`
VALUES (5, '我', '2019-11-23 11:16:19', 'admin', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES (6, '操我', '2019-11-23 11:16:54', 'admin', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES (7, '了', '2019-11-23 11:44:31', '管理部老王', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES (8, '健', '2019-11-23 11:44:31', '管理部老王', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES (9, '康', '2019-11-23 11:44:31', '管理部老王', NULL, NULL);
INSERT INTO `b_prohibited`
VALUES (10, '和', '2019-11-23 11:44:31', '管理部老王', NULL, NULL);

-- ----------------------------
-- Table structure for blog_content
-- ----------------------------
DROP TABLE IF EXISTS `blog_content`;
CREATE TABLE `blog_content`
(
    `cid`           bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `title`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
    `slug`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `created`       bigint(20)                                              NULL DEFAULT NULL COMMENT '创建人id',
    `modified`      bigint(20)                                              NULL DEFAULT NULL COMMENT '最近修改人id',
    `content`       text CHARACTER SET utf8 COLLATE utf8_general_ci         NULL COMMENT '内容',
    `type`          varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '类型',
    `tags`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
    `categories`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
    `hits`          int(5)                                                  NULL DEFAULT NULL,
    `comments_num`  int(5)                                                  NULL DEFAULT 0 COMMENT '评论数量',
    `allow_comment` int(1)                                                  NULL DEFAULT 0 COMMENT '开启评论',
    `allow_ping`    int(1)                                                  NULL DEFAULT 0 COMMENT '允许ping',
    `allow_feed`    int(1)                                                  NULL DEFAULT 0 COMMENT '允许反馈',
    `status`        int(1)                                                  NULL DEFAULT NULL COMMENT '状态',
    `author`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
    `gtm_create`    datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `gtm_modified`  datetime(0)                                             NULL DEFAULT NULL COMMENT '修改时间',
    `user_id`       bigint(20)                                              NULL DEFAULT NULL COMMENT '用户id',
    PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 140
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '文章内容'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify`
(
    `id`          bigint(20)                                        NOT NULL AUTO_INCREMENT COMMENT '编号',
    `type`        char(1) CHARACTER SET utf8 COLLATE utf8_bin       NULL DEFAULT NULL COMMENT '类型',
    `title`       varchar(200) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT '标题',
    `content`     varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容',
    `files`       varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '附件',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_bin       NULL DEFAULT NULL COMMENT '状态',
    `create_by`   bigint(20)                                        NULL DEFAULT NULL COMMENT '创建者',
    `create_date` datetime(0)                                       NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL COMMENT '更新者',
    `update_date` datetime(0)                                       NULL DEFAULT NULL COMMENT '更新时间',
    `remarks`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT '备注信息',
    `del_flag`    char(1) CHARACTER SET utf8 COLLATE utf8_bin       NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `oa_notify_del_flag` (`del_flag`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 47
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '通知通告'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_notify
-- ----------------------------
INSERT INTO `oa_notify`
VALUES (41, '3', '十九大召开了', '十九大召开了，竟然没邀请我', '', '1', 1, NULL, NULL, '2017-10-10 17:21:11', '', NULL);
INSERT INTO `oa_notify`
VALUES (42, '3', '苹果发布新手机了', '有全面屏的iphoneX', '', '1', 1, NULL, NULL, '2017-10-10 18:51:14', '', NULL);
INSERT INTO `oa_notify`
VALUES (43, '1', '十九大要消灭贫困人口', '我还只有两三年的活头了', '', '1', 1, NULL, NULL, '2017-10-11 09:56:35', '', NULL);
INSERT INTO `oa_notify`
VALUES (44, '3', '骑士又输了', '捉急', '', '1', 1, NULL, NULL, '2017-10-26 13:59:34', '', NULL);
INSERT INTO `oa_notify`
VALUES (45, '3', '火箭5连败', '没有保罗不行呀', '', '1', 1, NULL, NULL, '2017-12-30 12:10:20', '', NULL);

-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record`
(
    `id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `notify_id` bigint(20) NULL DEFAULT NULL COMMENT '通知通告ID',
    `user_id`   bigint(20) NULL DEFAULT NULL COMMENT '接受人',
    `is_read`   tinyint(1) NULL DEFAULT 0 COMMENT '阅读标记',
    `read_date` date       NULL DEFAULT NULL COMMENT '阅读时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `oa_notify_record_notify_id` (`notify_id`) USING BTREE,
    INDEX `oa_notify_record_user_id` (`user_id`) USING BTREE,
    INDEX `oa_notify_record_read_flag` (`is_read`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '通知通告发送记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_notify_record
-- ----------------------------
INSERT INTO `oa_notify_record`
VALUES (18, 41, 1, 1, '2017-10-26');
INSERT INTO `oa_notify_record`
VALUES (19, 42, 1, 1, '2017-10-26');
INSERT INTO `oa_notify_record`
VALUES (20, 43, 136, 0, NULL);
INSERT INTO `oa_notify_record`
VALUES (21, 43, 133, 0, NULL);
INSERT INTO `oa_notify_record`
VALUES (22, 43, 130, 0, NULL);
INSERT INTO `oa_notify_record`
VALUES (23, 43, 1, 1, '2017-10-26');
INSERT INTO `oa_notify_record`
VALUES (24, 44, 1, 1, '2017-12-29');
INSERT INTO `oa_notify_record`
VALUES (25, 45, 1, 1, '2019-03-07');
INSERT INTO `oa_notify_record`
VALUES (26, 45, 135, 0, NULL);

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`
(
    `id`             varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT '编号',
    `PROC_INS_ID`    varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT '流程实例ID',
    `USER_ID`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT '变动用户',
    `OFFICE_ID`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT '归属部门',
    `POST`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '岗位',
    `AGE`            char(1) CHARACTER SET utf8 COLLATE utf8_bin      NULL     DEFAULT NULL COMMENT '性别',
    `EDU`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '学历',
    `CONTENT`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '调整原因',
    `OLDA`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '现行标准 薪酬档级',
    `OLDB`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '现行标准 月工资额',
    `OLDC`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '现行标准 年薪总额',
    `NEWA`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '调整后标准 薪酬档级',
    `NEWB`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '调整后标准 月工资额',
    `NEWC`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '调整后标准 年薪总额',
    `ADD_NUM`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '月增资',
    `EXE_DATE`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '执行时间',
    `HR_TEXT`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '人力资源部门意见',
    `LEAD_TEXT`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '分管领导意见',
    `MAIN_LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '集团主要领导意见',
    `create_by`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT '创建者',
    `create_date`    datetime(0)                                      NOT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT '更新者',
    `update_date`    datetime(0)                                      NOT NULL COMMENT '更新时间',
    `remarks`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '备注信息',
    `del_flag`       char(1) CHARACTER SET utf8 COLLATE utf8_bin      NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `OA_TEST_AUDIT_del_flag` (`del_flag`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '审批流程测试表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary`
VALUES ('825693cd6c1c4f6b86699fc3f1a54887', '', '136', '', '', '', '', '技能提高', '', '', '', '', '100', '', '', '', '同意',
        '同意', '总经理审批', '1', '2017-12-15 22:01:41', '1', '2017-12-15 22:01:41', NULL, '1');
INSERT INTO `salary`
VALUES ('a80e1d9ef35a4502bd65b0e5ba7eafff', '', 'cccc', 'ccc', 'ccccc', '', '', '', '', '', '', '', '', '', '', '', '',
        '', '', '', '2017-11-30 16:35:15', '', '2017-11-30 16:35:15', '', '');
INSERT INTO `salary`
VALUES ('b5d228f729f74833883917825749f0d5', '', '', '', '', '', '', '', '', '', '', '', '', '防守打法', '', '', '', '', '',
        '', '2017-11-30 19:58:36', '', '2017-11-30 19:58:36', '', '');
INSERT INTO `salary`
VALUES ('cc2e8083f9d8478f831b2ea852e5c17b', '', '', 'cc', 'cc', '', '', 'xxx', '', '', '', '', '', '', '', '', '', '',
        '', '', '2017-11-30 19:18:59', '', '2017-11-30 19:18:59', '', '');
INSERT INTO `salary`
VALUES ('cebdb316794b48be87d93dd4dbfb7d4b', '', '', '', '发的顺丰', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
        '', '2017-11-30 19:58:43', '', '2017-11-30 19:58:43', '', '');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`   bigint(20)                                             NOT NULL AUTO_INCREMENT,
    `parent_id` bigint(20)                                             NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
    `name`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
    `order_num` int(11)                                                NULL DEFAULT NULL COMMENT '排序',
    `del_flag`  tinyint(4)                                             NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '部门管理'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES (6, 0, '研发部', 1, 1);
INSERT INTO `sys_dept`
VALUES (7, 6, '研發一部', 1, 1);
INSERT INTO `sys_dept`
VALUES (8, 6, '研发二部', 2, 1);
INSERT INTO `sys_dept`
VALUES (9, 0, '销售部', 2, 1);
INSERT INTO `sys_dept`
VALUES (10, 9, '销售一部', 1, 1);
INSERT INTO `sys_dept`
VALUES (11, 0, '产品部', 3, 1);
INSERT INTO `sys_dept`
VALUES (12, 11, '产品一部', 1, 1);
INSERT INTO `sys_dept`
VALUES (13, 0, '市场部', 5, 1);
INSERT INTO `sys_dept`
VALUES (14, 13, '市场一部', 1, 1);
INSERT INTO `sys_dept`
VALUES (15, 13, '市场二部', 2, 1);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`
(
    `id`          bigint(64)                                       NOT NULL AUTO_INCREMENT COMMENT '编号',
    `name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
    `value`       varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
    `type`        varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
    `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
    `sort`        decimal(10, 0)                                   NULL DEFAULT NULL COMMENT '排序（升序）',
    `parent_id`   bigint(64)                                       NULL DEFAULT 0 COMMENT '父级编号',
    `create_by`   int(64)                                          NULL DEFAULT NULL COMMENT '创建者',
    `create_date` datetime(0)                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint(64)                                       NULL DEFAULT NULL COMMENT '更新者',
    `update_date` datetime(0)                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remarks`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
    `del_flag`    char(1) CHARACTER SET utf8 COLLATE utf8_bin      NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `sys_dict_value` (`value`) USING BTREE,
    INDEX `sys_dict_label` (`name`) USING BTREE,
    INDEX `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 123
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '字典表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict`
VALUES (1, '正常', '0', 'del_flag', '删除标记', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (3, '显示', '1', 'show_hide', '显示/隐藏', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (4, '隐藏', '0', 'show_hide', '显示/隐藏', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (5, '是', '1', 'yes_no', '是/否', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (6, '否', '0', 'yes_no', '是/否', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (7, '红色', 'red', 'color', '颜色值', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (8, '绿色', 'green', 'color', '颜色值', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (9, '蓝色', 'blue', 'color', '颜色值', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (10, '黄色', 'yellow', 'color', '颜色值', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (11, '橙色', 'orange', 'color', '颜色值', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (12, '默认主题', 'default', 'theme', '主题方案', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (13, '天蓝主题', 'cerulean', 'theme', '主题方案', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (14, '橙色主题', 'readable', 'theme', '主题方案', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (15, '红色主题', 'united', 'theme', '主题方案', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (16, 'Flat主题', 'flat', 'theme', '主题方案', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (17, '国家', '1', 'sys_area_type', '区域类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (18, '省份、直辖市', '2', 'sys_area_type', '区域类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (19, '地市', '3', 'sys_area_type', '区域类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (20, '区县', '4', 'sys_area_type', '区域类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (21, '公司', '1', 'sys_office_type', '机构类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (22, '部门', '2', 'sys_office_type', '机构类型', 70, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (23, '小组', '3', 'sys_office_type', '机构类型', 80, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (24, '其它', '4', 'sys_office_type', '机构类型', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (25, '综合部', '1', 'sys_office_common', '快捷通用部门', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (26, '开发部', '2', 'sys_office_common', '快捷通用部门', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (27, '人力部', '3', 'sys_office_common', '快捷通用部门', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (28, '一级', '1', 'sys_office_grade', '机构等级', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (29, '二级', '2', 'sys_office_grade', '机构等级', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (30, '三级', '3', 'sys_office_grade', '机构等级', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (31, '四级', '4', 'sys_office_grade', '机构等级', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (32, '所有数据', '1', 'sys_data_scope', '数据范围', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (33, '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (34, '所在公司数据', '3', 'sys_data_scope', '数据范围', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (35, '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (36, '所在部门数据', '5', 'sys_data_scope', '数据范围', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (37, '仅本人数据', '8', 'sys_data_scope', '数据范围', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (38, '按明细设置', '9', 'sys_data_scope', '数据范围', 100, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (39, '系统管理', '1', 'sys_user_type', '用户类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (40, '部门经理', '2', 'sys_user_type', '用户类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (41, '普通用户', '3', 'sys_user_type', '用户类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (42, '基础主题', 'basic', 'cms_theme', '站点主题', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (43, '蓝色主题', 'blue', 'cms_theme', '站点主题', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (44, '红色主题', 'red', 'cms_theme', '站点主题', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (45, '文章模型', 'article', 'cms_module', '栏目模型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (46, '图片模型', 'picture', 'cms_module', '栏目模型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (47, '下载模型', 'download', 'cms_module', '栏目模型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (48, '链接模型', 'link', 'cms_module', '栏目模型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (49, '专题模型', 'special', 'cms_module', '栏目模型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (50, '默认展现方式', '0', 'cms_show_modes', '展现方式', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (51, '首栏目内容列表', '1', 'cms_show_modes', '展现方式', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (52, '栏目第一条内容', '2', 'cms_show_modes', '展现方式', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (53, '发布', '0', 'cms_del_flag', '内容状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (54, '删除', '1', 'cms_del_flag', '内容状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (55, '审核', '2', 'cms_del_flag', '内容状态', 15, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (56, '首页焦点图', '1', 'cms_posid', '推荐位', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (57, '栏目页文章推荐', '2', 'cms_posid', '推荐位', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (58, '咨询', '1', 'cms_guestbook', '留言板分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (59, '建议', '2', 'cms_guestbook', '留言板分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (60, '投诉', '3', 'cms_guestbook', '留言板分类', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (61, '其它', '4', 'cms_guestbook', '留言板分类', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (62, '公休', '1', 'oa_leave_type', '请假类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (63, '病假', '2', 'oa_leave_type', '请假类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (64, '事假', '3', 'oa_leave_type', '请假类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (65, '调休', '4', 'oa_leave_type', '请假类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (66, '婚假', '5', 'oa_leave_type', '请假类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (67, '接入日志', '1', 'sys_log_type', '日志类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (68, '异常日志', '2', 'sys_log_type', '日志类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (69, '请假流程', 'leave', 'act_type', '流程类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (70, '审批测试流程', 'test_audit', 'act_type', '流程类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (71, '分类1', '1', 'act_category', '流程分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (72, '分类2', '2', 'act_category', '流程分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (73, '增删改查', 'crud', 'gen_category', '代码生成分类', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (74, '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (75, '树结构', 'tree', 'gen_category', '代码生成分类', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (76, '=', '=', 'gen_query_type', '查询方式', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (77, '!=', '!=', 'gen_query_type', '查询方式', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (78, '&gt;', '&gt;', 'gen_query_type', '查询方式', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (79, '&lt;', '&lt;', 'gen_query_type', '查询方式', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (80, 'Between', 'between', 'gen_query_type', '查询方式', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (81, 'Like', 'like', 'gen_query_type', '查询方式', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (82, 'Left Like', 'left_like', 'gen_query_type', '查询方式', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (83, 'Right Like', 'right_like', 'gen_query_type', '查询方式', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (84, '文本框', 'input', 'gen_show_type', '字段生成方案', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (85, '文本域', 'textarea', 'gen_show_type', '字段生成方案', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (86, '下拉框', 'select', 'gen_show_type', '字段生成方案', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (87, '复选框', 'checkbox', 'gen_show_type', '字段生成方案', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (88, '单选框', 'radiobox', 'gen_show_type', '字段生成方案', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (89, '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (90, '人员选择', 'userselect', 'gen_show_type', '字段生成方案', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (91, '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (92, '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (93, 'String', 'String', 'gen_java_type', 'Java类型', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (94, 'Long', 'Long', 'gen_java_type', 'Java类型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (95, '仅持久层', 'dao', 'gen_category', '代码生成分类', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (96, '男', '1', 'sex', '性别', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (97, '女', '2', 'sex', '性别', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (98, 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (99, 'Double', 'Double', 'gen_java_type', 'Java类型', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (100, 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (104, 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict`
VALUES (105, '会议通告', '1', 'oa_notify_type', '通知通告类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (106, '奖惩通告', '2', 'oa_notify_type', '通知通告类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (107, '活动通告', '3', 'oa_notify_type', '通知通告类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (108, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (109, '发布', '1', 'oa_notify_status', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (110, '未读', '0', 'oa_notify_read', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (111, '已读', '1', 'oa_notify_read', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict`
VALUES (112, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict`
VALUES (113, '删除', '0', 'del_flag', '删除标记', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict`
VALUES (118, '关于', 'about', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict`
VALUES (119, '交流', 'communication', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict`
VALUES (120, '文章', 'article', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict`
VALUES (121, '编码', 'code', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict`
VALUES (122, '绘画', 'painting', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`
(
    `id`          bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `type`        int(11)                                                 NULL DEFAULT NULL COMMENT '文件类型',
    `url`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
    `create_date` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 147
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '文件上传'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file`
VALUES (141, 0, '/files/4705e0d0-7daf-40ea-828a-e4f65e3368f6.jpg', '2019-03-04 11:19:49');
INSERT INTO `sys_file`
VALUES (142, 0, '/files/000be2fd-e356-4beb-aab6-d449aaf4d782.jpg', '2019-03-11 10:57:21');
INSERT INTO `sys_file`
VALUES (143, 0, '/files/2d4aec8c-3443-49ec-b687-098395ea4292.jpg', '2019-03-12 20:14:17');
INSERT INTO `sys_file`
VALUES (144, 0, '/files/57ceda0b-11cb-4c81-a5de-412022e43ef6.png', '2019-03-13 08:59:28');
INSERT INTO `sys_file`
VALUES (145, 0, '/files/02dcd5a6-8052-4d1e-8883-dce5b027dcf9.png', '2019-03-13 09:00:33');
INSERT INTO `sys_file`
VALUES (146, 0, '/files/e4ae82a6-f3bc-469a-a758-f6859c9a7076.png', '2019-03-13 09:00:41');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`
(
    `id`         bigint(20)                                               NOT NULL AUTO_INCREMENT,
    `user_id`    bigint(20)                                               NULL DEFAULT NULL COMMENT '用户id',
    `username`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '用户名',
    `operation`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '用户操作',
    `time`       int(11)                                                  NULL DEFAULT NULL COMMENT '响应时间',
    `method`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '请求方法',
    `params`     varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
    `ip`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT 'IP地址',
    `gmt_create` datetime(0)                                              NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2230
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '系统日志'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`      bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `parent_id`    bigint(20)                                              NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
    `name`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '菜单名称',
    `url`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
    `perms`        varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
    `type`         int(11)                                                 NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
    `icon`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '菜单图标',
    `order_num`    int(11)                                                 NULL DEFAULT NULL COMMENT '排序',
    `gmt_create`   datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `gmt_modified` datetime(0)                                             NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 134
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '菜单管理'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, 0, '基础管理', '', '', 0, 'fa fa-bars', 0, '2017-08-09 22:49:47', NULL);
INSERT INTO `sys_menu`
VALUES (2, 3, '系统菜单', 'sys/menu/', 'sys:menu:menu', 1, 'fa fa-th-list', 2, '2017-08-09 22:55:15', NULL);
INSERT INTO `sys_menu`
VALUES (3, 0, '系统管理', NULL, NULL, 0, 'fa fa-desktop', 1, '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu`
VALUES (6, 3, '用户管理', 'sys/user/', 'sys:user:user', 1, 'fa fa-user', 0, '2017-08-10 14:12:11', NULL);
INSERT INTO `sys_menu`
VALUES (7, 3, '角色管理', 'sys/role', 'sys:role:role', 1, 'fa fa-paw', 1, '2017-08-10 14:13:19', NULL);
INSERT INTO `sys_menu`
VALUES (12, 6, '新增', '', 'sys:user:add', 2, '', 0, '2017-08-14 10:51:35', NULL);
INSERT INTO `sys_menu`
VALUES (13, 6, '编辑', '', 'sys:user:edit', 2, '', 0, '2017-08-14 10:52:06', NULL);
INSERT INTO `sys_menu`
VALUES (14, 6, '删除', NULL, 'sys:user:remove', 2, NULL, 0, '2017-08-14 10:52:24', NULL);
INSERT INTO `sys_menu`
VALUES (15, 7, '新增', '', 'sys:role:add', 2, '', 0, '2017-08-14 10:56:37', NULL);
INSERT INTO `sys_menu`
VALUES (20, 2, '新增', '', 'sys:menu:add', 2, '', 0, '2017-08-14 10:59:32', NULL);
INSERT INTO `sys_menu`
VALUES (21, 2, '编辑', '', 'sys:menu:edit', 2, '', 0, '2017-08-14 10:59:56', NULL);
INSERT INTO `sys_menu`
VALUES (22, 2, '删除', '', 'sys:menu:remove', 2, '', 0, '2017-08-14 11:00:26', NULL);
INSERT INTO `sys_menu`
VALUES (24, 6, '批量删除', '', 'sys:user:batchRemove', 2, '', 0, '2017-08-14 17:27:18', NULL);
INSERT INTO `sys_menu`
VALUES (25, 6, '停用', NULL, 'sys:user:disable', 2, NULL, 0, '2017-08-14 17:27:43', NULL);
INSERT INTO `sys_menu`
VALUES (26, 6, '重置密码', '', 'sys:user:resetPwd', 2, '', 0, '2017-08-14 17:28:34', NULL);
INSERT INTO `sys_menu`
VALUES (27, 91, '系统日志', 'common/log', 'common:log', 1, 'fa fa-warning', 0, '2017-08-14 22:11:53', NULL);
INSERT INTO `sys_menu`
VALUES (28, 27, '刷新', NULL, 'sys:log:list', 2, NULL, 0, '2017-08-14 22:30:22', NULL);
INSERT INTO `sys_menu`
VALUES (29, 27, '删除', NULL, 'sys:log:remove', 2, NULL, 0, '2017-08-14 22:30:43', NULL);
INSERT INTO `sys_menu`
VALUES (30, 27, '清空', NULL, 'sys:log:clear', 2, NULL, 0, '2017-08-14 22:31:02', NULL);
INSERT INTO `sys_menu`
VALUES (48, 77, '代码生成', 'common/generator', 'common:generator', 1, 'fa fa-code', 3, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (49, 0, '博客管理', '', '', 0, 'fa fa-rss', 6, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (50, 49, '文章列表', 'blog/bContent', 'blog:bContent:bContent', 1, 'fa fa-file-image-o', 1, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (51, 50, '新增', '', 'blog:bContent:add', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (55, 7, '编辑', '', 'sys:role:edit', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (56, 7, '删除', '', 'sys:role:remove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (57, 91, '运行监控', '/druid/index.html', '', 1, 'fa fa-caret-square-o-right', 1, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (58, 50, '编辑', '', 'blog:bContent:edit', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (59, 50, '删除', '', 'blog:bContent:remove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (60, 50, '批量删除', '', 'blog:bContent:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (61, 2, '批量删除', '', 'sys:menu:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (62, 7, '批量删除', '', 'sys:role:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (68, 49, '发布文章', '/blog/bContent/add', 'blog:bContent:add', 1, 'fa fa-edit', 0, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (71, 1, '文件管理', '/common/sysFile', 'common:sysFile:sysFile', 1, 'fa fa-folder-open', 2, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (72, 77, '计划任务', 'common/job', 'common:taskScheduleJob', 1, 'fa fa-hourglass-1', 4, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (73, 3, '部门管理', '/system/sysDept', 'system:sysDept:sysDept', 1, 'fa fa-users', 3, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (74, 73, '增加', '/system/sysDept/add', 'system:sysDept:add', 2, NULL, 1, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (75, 73, '刪除', 'system/sysDept/remove', 'system:sysDept:remove', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (76, 73, '编辑', '/system/sysDept/edit', 'system:sysDept:edit', 2, NULL, 3, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (77, 0, '系统工具', '', '', 0, 'fa fa-gear', 4, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (78, 1, '数据字典', '/common/dict', 'common:dict:dict', 1, 'fa fa-book', 1, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (79, 78, '增加', '/common/dict/add', 'common:dict:add', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (80, 78, '编辑', '/common/dict/edit', 'common:dict:edit', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (81, 78, '删除', '/common/dict/remove', 'common:dict:remove', 2, '', 3, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (83, 78, '批量删除', '/common/dict/batchRemove', 'common:dict:batchRemove', 2, '', 4, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (84, 0, '办公管理', '', '', 0, 'fa fa-laptop', 5, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (85, 84, '通知公告', 'oa/notify', 'oa:notify:notify', 1, 'fa fa-pencil-square', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (86, 85, '新增', 'oa/notify/add', 'oa:notify:add', 2, 'fa fa-plus', 1, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (87, 85, '编辑', 'oa/notify/edit', 'oa:notify:edit', 2, 'fa fa-pencil-square-o', 2, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (88, 85, '删除', 'oa/notify/remove', 'oa:notify:remove', 2, 'fa fa-minus', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (89, 85, '批量删除', 'oa/notify/batchRemove', 'oa:notify:batchRemove', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (90, 84, '我的通知', 'oa/notify/selfNotify', '', 1, 'fa fa-envelope-square', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (91, 0, '系统监控', '', '', 0, 'fa fa-video-camera', 5, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (92, 91, '在线用户', 'sys/online', '', 1, 'fa fa-user', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (93, 0, '工作流程', '', '', 0, 'fa fa-print', 6, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (94, 93, '模型管理', 'activiti/model', '', 1, 'fa fa-sort-amount-asc', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (95, 94, '全部权限', '', 'activiti:model', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (96, 93, '流程管理', 'activiti/process', '', 1, 'fa fa-flag', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (97, 0, '图表管理', '', '', 0, 'fa fa-bar-chart', 7, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (98, 97, '百度chart', '/chart/graph_echarts.html', '', 1, 'fa fa-area-chart', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (99, 96, '所有权限', '', 'act:process', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (101, 93, '待办任务', 'activiti/task/todo', '', 1, '', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (102, 0, '周报', '', '', 0, 'fa fa-calendar', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (103, 102, '查询周报', 'weekly/weekly', 'weekly:weekly:weekly', 1, 'fa fa-bar-chart', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (106, 103, '查询', '', '', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (107, 104, '提交', '', '', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (111, 102, '周报列表', 'weekly/weekly/weeklyContent', 'weekly:weekly:weeklyPerson', 1, 'fa fa-bar-chart-o', NULL,
        NULL, NULL);
INSERT INTO `sys_menu`
VALUES (112, 111, '新增', '', 'weekly:weekly:add', 2, 'fa fa-bicycle', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (113, 111, '编辑', '', 'weekly:weekly:edit', 2, 'fa fa-barcode', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (114, 111, '删除', '', 'weekly:weekly:remove', 2, 'fa fa-bell-slash-o', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (115, 111, '批量删除', '', 'weekly:weekly:batchRemove', 2, 'fa fa-arrows-h', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (116, 0, '加班管理', '', '', 0, 'fa fa-calendar', 8, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (117, 116, '加班查询', '/work/overtime', 'work:overtime', 1, 'fa fa-calendar', 1, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (118, 116, '我的加班', '/work/myovertime', 'work:myovertime', 1, 'fa fa-calendar', 0, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (119, 117, '新增', '/work/overtime/add', 'work:overtime:add', 2, 'fa fa-calendar', 0, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (120, 117, '删除', '/work/overtime/remove', 'work:overtime:remove', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (121, 117, '编辑', '/work/overtime/edit', 'work:overtime:edit', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (122, 117, '批量添加', '/work/overtime/add', 'work:overtime:add', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (123, 118, '新增', '/work/myovertime/add', 'work:myovertime:add', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (124, 118, '删除', '/work/myovertime/remove', 'work:myovertime:remove', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (125, 118, '编辑', '/work/myovertime/edit', 'work:myovertime:remove', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (126, 102, '周报日历', 'weekly/weekly/calendar', '', 1, 'fa fa-certificate', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (127, 103, '导出Excel', '', '', 2, 'fa fa-barcode', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (130, 0, '敏感词管理', '', '', 0, 'fa fa-credit-card', 2, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (131, 130, '敏感词管理', '/community/prohibited', '', 1, 'fa fa-bolt', NULL, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (132, 0, '审查文本', '', '', 0, 'fa fa-bar-chart-o', 2, NULL, NULL);
INSERT INTO `sys_menu`
VALUES (133, 132, '审查文本', '/prohibited', '', 1, 'fa fa-refresh', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`        bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `role_name`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
    `role_sign`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
    `remark`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    `user_id_create` bigint(255)                                             NULL DEFAULT NULL COMMENT '创建用户id',
    `gmt_create`     datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `gmt_modified`   datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 64
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '超级用户角色', 'admin', '拥有最高权限', 2, '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role`
VALUES (62, '敏感词管理', NULL, '敏感词管理', NULL, NULL, NULL);
INSERT INTO `sys_role`
VALUES (63, '普通角色', NULL, '只能使用查询敏感词', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
    `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3867
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (367, 44, 1);
INSERT INTO `sys_role_menu`
VALUES (368, 44, 32);
INSERT INTO `sys_role_menu`
VALUES (369, 44, 33);
INSERT INTO `sys_role_menu`
VALUES (370, 44, 34);
INSERT INTO `sys_role_menu`
VALUES (371, 44, 35);
INSERT INTO `sys_role_menu`
VALUES (372, 44, 28);
INSERT INTO `sys_role_menu`
VALUES (373, 44, 29);
INSERT INTO `sys_role_menu`
VALUES (374, 44, 30);
INSERT INTO `sys_role_menu`
VALUES (375, 44, 38);
INSERT INTO `sys_role_menu`
VALUES (376, 44, 4);
INSERT INTO `sys_role_menu`
VALUES (377, 44, 27);
INSERT INTO `sys_role_menu`
VALUES (378, 45, 38);
INSERT INTO `sys_role_menu`
VALUES (379, 46, 3);
INSERT INTO `sys_role_menu`
VALUES (380, 46, 20);
INSERT INTO `sys_role_menu`
VALUES (381, 46, 21);
INSERT INTO `sys_role_menu`
VALUES (382, 46, 22);
INSERT INTO `sys_role_menu`
VALUES (383, 46, 23);
INSERT INTO `sys_role_menu`
VALUES (384, 46, 11);
INSERT INTO `sys_role_menu`
VALUES (385, 46, 12);
INSERT INTO `sys_role_menu`
VALUES (386, 46, 13);
INSERT INTO `sys_role_menu`
VALUES (387, 46, 14);
INSERT INTO `sys_role_menu`
VALUES (388, 46, 24);
INSERT INTO `sys_role_menu`
VALUES (389, 46, 25);
INSERT INTO `sys_role_menu`
VALUES (390, 46, 26);
INSERT INTO `sys_role_menu`
VALUES (391, 46, 15);
INSERT INTO `sys_role_menu`
VALUES (392, 46, 2);
INSERT INTO `sys_role_menu`
VALUES (393, 46, 6);
INSERT INTO `sys_role_menu`
VALUES (394, 46, 7);
INSERT INTO `sys_role_menu`
VALUES (598, 50, 38);
INSERT INTO `sys_role_menu`
VALUES (632, 38, 42);
INSERT INTO `sys_role_menu`
VALUES (737, 51, 38);
INSERT INTO `sys_role_menu`
VALUES (738, 51, 39);
INSERT INTO `sys_role_menu`
VALUES (739, 51, 40);
INSERT INTO `sys_role_menu`
VALUES (740, 51, 41);
INSERT INTO `sys_role_menu`
VALUES (741, 51, 4);
INSERT INTO `sys_role_menu`
VALUES (742, 51, 32);
INSERT INTO `sys_role_menu`
VALUES (743, 51, 33);
INSERT INTO `sys_role_menu`
VALUES (744, 51, 34);
INSERT INTO `sys_role_menu`
VALUES (745, 51, 35);
INSERT INTO `sys_role_menu`
VALUES (746, 51, 27);
INSERT INTO `sys_role_menu`
VALUES (747, 51, 28);
INSERT INTO `sys_role_menu`
VALUES (748, 51, 29);
INSERT INTO `sys_role_menu`
VALUES (749, 51, 30);
INSERT INTO `sys_role_menu`
VALUES (750, 51, 1);
INSERT INTO `sys_role_menu`
VALUES (1064, 54, 53);
INSERT INTO `sys_role_menu`
VALUES (1095, 55, 2);
INSERT INTO `sys_role_menu`
VALUES (1096, 55, 6);
INSERT INTO `sys_role_menu`
VALUES (1097, 55, 7);
INSERT INTO `sys_role_menu`
VALUES (1098, 55, 3);
INSERT INTO `sys_role_menu`
VALUES (1099, 55, 50);
INSERT INTO `sys_role_menu`
VALUES (1100, 55, 49);
INSERT INTO `sys_role_menu`
VALUES (1101, 55, 1);
INSERT INTO `sys_role_menu`
VALUES (1856, 53, 28);
INSERT INTO `sys_role_menu`
VALUES (1857, 53, 29);
INSERT INTO `sys_role_menu`
VALUES (1858, 53, 30);
INSERT INTO `sys_role_menu`
VALUES (1859, 53, 27);
INSERT INTO `sys_role_menu`
VALUES (1860, 53, 57);
INSERT INTO `sys_role_menu`
VALUES (1861, 53, 71);
INSERT INTO `sys_role_menu`
VALUES (1862, 53, 48);
INSERT INTO `sys_role_menu`
VALUES (1863, 53, 72);
INSERT INTO `sys_role_menu`
VALUES (1864, 53, 1);
INSERT INTO `sys_role_menu`
VALUES (1865, 53, 7);
INSERT INTO `sys_role_menu`
VALUES (1866, 53, 55);
INSERT INTO `sys_role_menu`
VALUES (1867, 53, 56);
INSERT INTO `sys_role_menu`
VALUES (1868, 53, 62);
INSERT INTO `sys_role_menu`
VALUES (1869, 53, 15);
INSERT INTO `sys_role_menu`
VALUES (1870, 53, 2);
INSERT INTO `sys_role_menu`
VALUES (1871, 53, 61);
INSERT INTO `sys_role_menu`
VALUES (1872, 53, 20);
INSERT INTO `sys_role_menu`
VALUES (1873, 53, 21);
INSERT INTO `sys_role_menu`
VALUES (1874, 53, 22);
INSERT INTO `sys_role_menu`
VALUES (2084, 56, 68);
INSERT INTO `sys_role_menu`
VALUES (2085, 56, 60);
INSERT INTO `sys_role_menu`
VALUES (2086, 56, 59);
INSERT INTO `sys_role_menu`
VALUES (2087, 56, 58);
INSERT INTO `sys_role_menu`
VALUES (2088, 56, 51);
INSERT INTO `sys_role_menu`
VALUES (2089, 56, 50);
INSERT INTO `sys_role_menu`
VALUES (2090, 56, 49);
INSERT INTO `sys_role_menu`
VALUES (2243, 48, 72);
INSERT INTO `sys_role_menu`
VALUES (2252, 64, 84);
INSERT INTO `sys_role_menu`
VALUES (2253, 64, 89);
INSERT INTO `sys_role_menu`
VALUES (2254, 64, 88);
INSERT INTO `sys_role_menu`
VALUES (2255, 64, 87);
INSERT INTO `sys_role_menu`
VALUES (2256, 64, 86);
INSERT INTO `sys_role_menu`
VALUES (2257, 64, 85);
INSERT INTO `sys_role_menu`
VALUES (2258, 65, 89);
INSERT INTO `sys_role_menu`
VALUES (2259, 65, 88);
INSERT INTO `sys_role_menu`
VALUES (2260, 65, 86);
INSERT INTO `sys_role_menu`
VALUES (2262, 67, 48);
INSERT INTO `sys_role_menu`
VALUES (2263, 68, 88);
INSERT INTO `sys_role_menu`
VALUES (2264, 68, 87);
INSERT INTO `sys_role_menu`
VALUES (2265, 69, 89);
INSERT INTO `sys_role_menu`
VALUES (2266, 69, 88);
INSERT INTO `sys_role_menu`
VALUES (2267, 69, 86);
INSERT INTO `sys_role_menu`
VALUES (2268, 69, 87);
INSERT INTO `sys_role_menu`
VALUES (2269, 69, 85);
INSERT INTO `sys_role_menu`
VALUES (2270, 69, 84);
INSERT INTO `sys_role_menu`
VALUES (2271, 70, 85);
INSERT INTO `sys_role_menu`
VALUES (2272, 70, 89);
INSERT INTO `sys_role_menu`
VALUES (2273, 70, 88);
INSERT INTO `sys_role_menu`
VALUES (2274, 70, 87);
INSERT INTO `sys_role_menu`
VALUES (2275, 70, 86);
INSERT INTO `sys_role_menu`
VALUES (2276, 70, 84);
INSERT INTO `sys_role_menu`
VALUES (2277, 71, 87);
INSERT INTO `sys_role_menu`
VALUES (2278, 72, 59);
INSERT INTO `sys_role_menu`
VALUES (2279, 73, 48);
INSERT INTO `sys_role_menu`
VALUES (2280, 74, 88);
INSERT INTO `sys_role_menu`
VALUES (2281, 74, 87);
INSERT INTO `sys_role_menu`
VALUES (2282, 75, 88);
INSERT INTO `sys_role_menu`
VALUES (2283, 75, 87);
INSERT INTO `sys_role_menu`
VALUES (2284, 76, 85);
INSERT INTO `sys_role_menu`
VALUES (2285, 76, 89);
INSERT INTO `sys_role_menu`
VALUES (2286, 76, 88);
INSERT INTO `sys_role_menu`
VALUES (2287, 76, 87);
INSERT INTO `sys_role_menu`
VALUES (2288, 76, 86);
INSERT INTO `sys_role_menu`
VALUES (2289, 76, 84);
INSERT INTO `sys_role_menu`
VALUES (2292, 78, 88);
INSERT INTO `sys_role_menu`
VALUES (2293, 78, 87);
INSERT INTO `sys_role_menu`
VALUES (2294, 78, NULL);
INSERT INTO `sys_role_menu`
VALUES (2295, 78, NULL);
INSERT INTO `sys_role_menu`
VALUES (2296, 78, NULL);
INSERT INTO `sys_role_menu`
VALUES (2308, 80, 87);
INSERT INTO `sys_role_menu`
VALUES (2309, 80, 86);
INSERT INTO `sys_role_menu`
VALUES (2310, 80, -1);
INSERT INTO `sys_role_menu`
VALUES (2311, 80, 84);
INSERT INTO `sys_role_menu`
VALUES (2312, 80, 85);
INSERT INTO `sys_role_menu`
VALUES (2328, 79, 72);
INSERT INTO `sys_role_menu`
VALUES (2329, 79, 48);
INSERT INTO `sys_role_menu`
VALUES (2330, 79, 77);
INSERT INTO `sys_role_menu`
VALUES (2331, 79, 84);
INSERT INTO `sys_role_menu`
VALUES (2332, 79, 89);
INSERT INTO `sys_role_menu`
VALUES (2333, 79, 88);
INSERT INTO `sys_role_menu`
VALUES (2334, 79, 87);
INSERT INTO `sys_role_menu`
VALUES (2335, 79, 86);
INSERT INTO `sys_role_menu`
VALUES (2336, 79, 85);
INSERT INTO `sys_role_menu`
VALUES (2337, 79, -1);
INSERT INTO `sys_role_menu`
VALUES (2338, 77, 89);
INSERT INTO `sys_role_menu`
VALUES (2339, 77, 88);
INSERT INTO `sys_role_menu`
VALUES (2340, 77, 87);
INSERT INTO `sys_role_menu`
VALUES (2341, 77, 86);
INSERT INTO `sys_role_menu`
VALUES (2342, 77, 85);
INSERT INTO `sys_role_menu`
VALUES (2343, 77, 84);
INSERT INTO `sys_role_menu`
VALUES (2344, 77, 72);
INSERT INTO `sys_role_menu`
VALUES (2345, 77, -1);
INSERT INTO `sys_role_menu`
VALUES (2346, 77, 77);
INSERT INTO `sys_role_menu`
VALUES (2974, 57, 93);
INSERT INTO `sys_role_menu`
VALUES (2975, 57, 99);
INSERT INTO `sys_role_menu`
VALUES (2976, 57, 95);
INSERT INTO `sys_role_menu`
VALUES (2977, 57, 101);
INSERT INTO `sys_role_menu`
VALUES (2978, 57, 96);
INSERT INTO `sys_role_menu`
VALUES (2979, 57, 94);
INSERT INTO `sys_role_menu`
VALUES (2980, 57, -1);
INSERT INTO `sys_role_menu`
VALUES (2981, 58, 93);
INSERT INTO `sys_role_menu`
VALUES (2982, 58, 99);
INSERT INTO `sys_role_menu`
VALUES (2983, 58, 95);
INSERT INTO `sys_role_menu`
VALUES (2984, 58, 101);
INSERT INTO `sys_role_menu`
VALUES (2985, 58, 96);
INSERT INTO `sys_role_menu`
VALUES (2986, 58, 94);
INSERT INTO `sys_role_menu`
VALUES (2987, 58, -1);
INSERT INTO `sys_role_menu`
VALUES (3604, 59, 115);
INSERT INTO `sys_role_menu`
VALUES (3605, 59, 114);
INSERT INTO `sys_role_menu`
VALUES (3606, 59, 113);
INSERT INTO `sys_role_menu`
VALUES (3607, 59, 112);
INSERT INTO `sys_role_menu`
VALUES (3608, 59, 111);
INSERT INTO `sys_role_menu`
VALUES (3609, 59, 126);
INSERT INTO `sys_role_menu`
VALUES (3610, 59, 116);
INSERT INTO `sys_role_menu`
VALUES (3611, 59, 125);
INSERT INTO `sys_role_menu`
VALUES (3612, 59, 124);
INSERT INTO `sys_role_menu`
VALUES (3613, 59, 123);
INSERT INTO `sys_role_menu`
VALUES (3614, 59, 122);
INSERT INTO `sys_role_menu`
VALUES (3615, 59, 121);
INSERT INTO `sys_role_menu`
VALUES (3616, 59, 120);
INSERT INTO `sys_role_menu`
VALUES (3617, 59, 119);
INSERT INTO `sys_role_menu`
VALUES (3618, 59, 118);
INSERT INTO `sys_role_menu`
VALUES (3619, 59, 117);
INSERT INTO `sys_role_menu`
VALUES (3620, 59, -1);
INSERT INTO `sys_role_menu`
VALUES (3621, 59, 102);
INSERT INTO `sys_role_menu`
VALUES (3622, 60, 115);
INSERT INTO `sys_role_menu`
VALUES (3623, 60, 114);
INSERT INTO `sys_role_menu`
VALUES (3624, 60, 113);
INSERT INTO `sys_role_menu`
VALUES (3625, 60, 112);
INSERT INTO `sys_role_menu`
VALUES (3626, 60, 106);
INSERT INTO `sys_role_menu`
VALUES (3627, 60, 111);
INSERT INTO `sys_role_menu`
VALUES (3628, 60, 103);
INSERT INTO `sys_role_menu`
VALUES (3629, 60, 116);
INSERT INTO `sys_role_menu`
VALUES (3630, 60, 125);
INSERT INTO `sys_role_menu`
VALUES (3631, 60, 124);
INSERT INTO `sys_role_menu`
VALUES (3632, 60, 123);
INSERT INTO `sys_role_menu`
VALUES (3633, 60, 122);
INSERT INTO `sys_role_menu`
VALUES (3634, 60, 121);
INSERT INTO `sys_role_menu`
VALUES (3635, 60, 120);
INSERT INTO `sys_role_menu`
VALUES (3636, 60, 119);
INSERT INTO `sys_role_menu`
VALUES (3637, 60, 118);
INSERT INTO `sys_role_menu`
VALUES (3638, 60, 117);
INSERT INTO `sys_role_menu`
VALUES (3639, 60, 126);
INSERT INTO `sys_role_menu`
VALUES (3640, 60, 102);
INSERT INTO `sys_role_menu`
VALUES (3641, 60, -1);
INSERT INTO `sys_role_menu`
VALUES (3642, 61, 115);
INSERT INTO `sys_role_menu`
VALUES (3643, 61, 114);
INSERT INTO `sys_role_menu`
VALUES (3644, 61, 113);
INSERT INTO `sys_role_menu`
VALUES (3645, 61, 112);
INSERT INTO `sys_role_menu`
VALUES (3646, 61, 106);
INSERT INTO `sys_role_menu`
VALUES (3647, 61, 111);
INSERT INTO `sys_role_menu`
VALUES (3648, 61, 103);
INSERT INTO `sys_role_menu`
VALUES (3649, 61, 116);
INSERT INTO `sys_role_menu`
VALUES (3650, 61, 125);
INSERT INTO `sys_role_menu`
VALUES (3651, 61, 124);
INSERT INTO `sys_role_menu`
VALUES (3652, 61, 123);
INSERT INTO `sys_role_menu`
VALUES (3653, 61, 122);
INSERT INTO `sys_role_menu`
VALUES (3654, 61, 121);
INSERT INTO `sys_role_menu`
VALUES (3655, 61, 120);
INSERT INTO `sys_role_menu`
VALUES (3656, 61, 119);
INSERT INTO `sys_role_menu`
VALUES (3657, 61, 118);
INSERT INTO `sys_role_menu`
VALUES (3658, 61, 117);
INSERT INTO `sys_role_menu`
VALUES (3659, 61, 126);
INSERT INTO `sys_role_menu`
VALUES (3660, 61, 102);
INSERT INTO `sys_role_menu`
VALUES (3661, 61, -1);
INSERT INTO `sys_role_menu`
VALUES (3820, 1, 131);
INSERT INTO `sys_role_menu`
VALUES (3821, 1, 126);
INSERT INTO `sys_role_menu`
VALUES (3822, 1, 115);
INSERT INTO `sys_role_menu`
VALUES (3823, 1, 114);
INSERT INTO `sys_role_menu`
VALUES (3824, 1, 113);
INSERT INTO `sys_role_menu`
VALUES (3825, 1, 112);
INSERT INTO `sys_role_menu`
VALUES (3826, 1, 127);
INSERT INTO `sys_role_menu`
VALUES (3827, 1, 106);
INSERT INTO `sys_role_menu`
VALUES (3828, 1, 92);
INSERT INTO `sys_role_menu`
VALUES (3829, 1, 72);
INSERT INTO `sys_role_menu`
VALUES (3830, 1, 48);
INSERT INTO `sys_role_menu`
VALUES (3831, 1, 76);
INSERT INTO `sys_role_menu`
VALUES (3832, 1, 75);
INSERT INTO `sys_role_menu`
VALUES (3833, 1, 74);
INSERT INTO `sys_role_menu`
VALUES (3834, 1, 62);
INSERT INTO `sys_role_menu`
VALUES (3835, 1, 56);
INSERT INTO `sys_role_menu`
VALUES (3836, 1, 55);
INSERT INTO `sys_role_menu`
VALUES (3837, 1, 15);
INSERT INTO `sys_role_menu`
VALUES (3838, 1, 26);
INSERT INTO `sys_role_menu`
VALUES (3839, 1, 25);
INSERT INTO `sys_role_menu`
VALUES (3840, 1, 24);
INSERT INTO `sys_role_menu`
VALUES (3841, 1, 14);
INSERT INTO `sys_role_menu`
VALUES (3842, 1, 13);
INSERT INTO `sys_role_menu`
VALUES (3843, 1, 12);
INSERT INTO `sys_role_menu`
VALUES (3844, 1, 61);
INSERT INTO `sys_role_menu`
VALUES (3845, 1, 22);
INSERT INTO `sys_role_menu`
VALUES (3846, 1, 21);
INSERT INTO `sys_role_menu`
VALUES (3847, 1, 20);
INSERT INTO `sys_role_menu`
VALUES (3848, 1, 130);
INSERT INTO `sys_role_menu`
VALUES (3849, 1, 111);
INSERT INTO `sys_role_menu`
VALUES (3850, 1, 103);
INSERT INTO `sys_role_menu`
VALUES (3851, 1, 102);
INSERT INTO `sys_role_menu`
VALUES (3852, 1, 77);
INSERT INTO `sys_role_menu`
VALUES (3853, 1, 73);
INSERT INTO `sys_role_menu`
VALUES (3854, 1, 7);
INSERT INTO `sys_role_menu`
VALUES (3855, 1, 6);
INSERT INTO `sys_role_menu`
VALUES (3856, 1, 2);
INSERT INTO `sys_role_menu`
VALUES (3857, 1, 3);
INSERT INTO `sys_role_menu`
VALUES (3858, 1, 132);
INSERT INTO `sys_role_menu`
VALUES (3859, 1, 133);
INSERT INTO `sys_role_menu`
VALUES (3860, 1, -1);
INSERT INTO `sys_role_menu`
VALUES (3861, 1, 91);
INSERT INTO `sys_role_menu`
VALUES (3862, 62, 130);
INSERT INTO `sys_role_menu`
VALUES (3863, 62, 131);
INSERT INTO `sys_role_menu`
VALUES (3864, 62, 132);
INSERT INTO `sys_role_menu`
VALUES (3865, 62, 133);
INSERT INTO `sys_role_menu`
VALUES (3866, 62, -1);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`
(
    `id`              bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
    `method_name`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
    `is_concurrent`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
    `description`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
    `update_by`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新者',
    `bean_class`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
    `create_date`     datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `job_status`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
    `job_group`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
    `update_date`     datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间',
    `create_by`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建者',
    `spring_bean`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
    `job_name`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task`
VALUES (2, '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.bootdo.common.task.WelcomeJob',
        '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', NULL, '', 'welcomJob');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`        bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `username`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '用户名',
    `name`           varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `password`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '密码',
    `dept_id`        bigint(20)                                              NULL DEFAULT NULL,
    `email`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `mobile`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
    `status`         tinyint(255)                                            NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
    `user_id_create` bigint(255)                                             NULL DEFAULT NULL COMMENT '创建用户id',
    `gmt_create`     datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `gmt_modified`   datetime(0)                                             NULL DEFAULT NULL COMMENT '修改时间',
    `sex`            bigint(32)                                              NULL DEFAULT NULL COMMENT '性别',
    `birth`          datetime(0)                                             NULL DEFAULT NULL COMMENT '出身日期',
    `pic_id`         bigint(32)                                              NULL DEFAULT NULL,
    `live_address`   varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居住地',
    `hobby`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
    `province`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
    `city`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
    `district`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 144
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 'admin', '超级管理员', '27bd386e70f280e24c2f4f2a549b82cf', 6, 'admin@example.com', '17699999999', 1, 1,
        '2017-08-15 21:40:39', '2017-08-15 21:41:00', 96, '2017-12-14 00:00:00', 141, 'ccc', '121;', '北京市', '北京市市辖区',
        '东城区');
INSERT INTO `sys_user`
VALUES (2, 'test', '临时用户', '6cf3bb3deba2aadbd41ec9a22511084e', 6, 'test@123.com', NULL, 1, 1, '2017-08-14 13:43:05',
        '2017-08-14 21:15:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES (36, 'ldh', '刘德华', 'bfd9394475754fbe45866eba97738c36', 7, 'ldh@134o.com', NULL, 1, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES (142, 'guanliyuan', '管理部老王', 'ef6bf523a3e9803d6218f23884f1ca7e', 6, 'test@123.com', NULL, 1, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES (143, 'shichangbu', '市场部小王', '4e5cd297b9c748ecdbea9b5144583134', 14, 'ldh@134o.com', NULL, 1, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_plus
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NOT NULL,
    `payment` double     NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
    `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 140
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (73, 30, 48);
INSERT INTO `sys_user_role`
VALUES (74, 30, 49);
INSERT INTO `sys_user_role`
VALUES (75, 30, 50);
INSERT INTO `sys_user_role`
VALUES (76, 31, 48);
INSERT INTO `sys_user_role`
VALUES (77, 31, 49);
INSERT INTO `sys_user_role`
VALUES (78, 31, 52);
INSERT INTO `sys_user_role`
VALUES (79, 32, 48);
INSERT INTO `sys_user_role`
VALUES (80, 32, 49);
INSERT INTO `sys_user_role`
VALUES (81, 32, 50);
INSERT INTO `sys_user_role`
VALUES (82, 32, 51);
INSERT INTO `sys_user_role`
VALUES (83, 32, 52);
INSERT INTO `sys_user_role`
VALUES (84, 33, 38);
INSERT INTO `sys_user_role`
VALUES (85, 33, 49);
INSERT INTO `sys_user_role`
VALUES (86, 33, 52);
INSERT INTO `sys_user_role`
VALUES (87, 34, 50);
INSERT INTO `sys_user_role`
VALUES (88, 34, 51);
INSERT INTO `sys_user_role`
VALUES (89, 34, 52);
INSERT INTO `sys_user_role`
VALUES (110, 1, 1);
INSERT INTO `sys_user_role`
VALUES (124, NULL, 48);
INSERT INTO `sys_user_role`
VALUES (136, 2, 1);
INSERT INTO `sys_user_role`
VALUES (138, 142, 62);
INSERT INTO `sys_user_role`
VALUES (139, 143, 63);

-- ----------------------------
-- Table structure for weekly
-- ----------------------------
DROP TABLE IF EXISTS `weekly`;
CREATE TABLE `weekly`
(
    `id`          int(11)                                         NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title`       char(20) CHARACTER SET utf8 COLLATE utf8_bin    NULL DEFAULT NULL COMMENT '周报摘要',
    `project`     varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '项目名称',
    `work_des`    text CHARACTER SET utf8 COLLATE utf8_bin        NULL COMMENT '工作内容描述',
    `problem`     text CHARACTER SET utf8 COLLATE utf8_bin        NULL COMMENT '遇到的问题及解决方案',
    `task`        varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务性质',
    `priority`    varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '优先级 低中高',
    `status`      varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '当前状态 新识别，跟踪处理，已解决',
    `user_id`     bigint(20)                                      NULL DEFAULT NULL COMMENT '提交的用户id',
    `is_read`     int(11)                                         NULL DEFAULT 0 COMMENT '是否被批阅：0  表示正常  1 表示被批阅',
    `create_time` date                                            NULL DEFAULT NULL COMMENT '创建周报时间',
    `update_time` datetime(4)                                     NULL DEFAULT NULL COMMENT '更改时间',
    `is_delete`   int(11)                                         NULL DEFAULT 0 COMMENT '是否被删除： 0 未删除  1 删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 125
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weekly
-- ----------------------------
INSERT INTO `weekly`
VALUES (1, '周二工作', 'ebo', 'wer ', NULL, NULL, 'wer ', NULL, 1, 0, '2019-03-04', '2019-03-05 19:10:48.0360', 0);
INSERT INTO `weekly`
VALUES (3, '周四', NULL, NULL, NULL, 'rt ', NULL, 'ert ', 2, 0, '2019-03-06', '2019-03-06 19:17:57.6620', 0);
INSERT INTO `weekly`
VALUES (4, '周五', NULL, NULL, 'asd ', NULL, NULL, NULL, 2, 0, '2019-03-07', '2019-03-07 16:07:14.4030', 0);
INSERT INTO `weekly`
VALUES (7, '周一工作内容', NULL, NULL, NULL, 'sdf', NULL, NULL, 2, 0, '2019-03-08', '2019-03-08 13:56:00.9490', 0);
INSERT INTO `weekly`
VALUES (19, '周八', NULL, NULL, NULL, NULL, '的方式', NULL, 1, 0, '2019-03-09', '2019-03-09 12:59:23.6730', 1);
INSERT INTO `weekly`
VALUES (35, '我是周日内容', '-啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '-啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊撒大声地', '发过火', '-啊啊啊啊',
        '啊啊啊', 139, 1, '2019-03-10', '2019-03-10 19:54:17.5840', 0);
INSERT INTO `weekly`
VALUES (69, '日本', '玩儿', '玩儿', '他', '儿童', NULL, '玩儿', 1, 1, '2019-03-07', '2019-03-12 16:06:41.5780', 1);
INSERT INTO `weekly`
VALUES (71, '咔咔咔咔咔咔扩', NULL, ' 玩儿', NULL, NULL, NULL, NULL, 1, 0, '2019-03-05', '2019-03-12 16:45:49.4460', 0);
INSERT INTO `weekly`
VALUES (79, '实打实', NULL, NULL, '让他', NULL, NULL, '玩儿', 1, 0, '2019-03-03', '2019-03-12 20:14:00.7850', 0);
INSERT INTO `weekly`
VALUES (80, 'aaa', 'aaa', 'aaa', 'gggggg', '算是', 'aaa也一样', 'aaa', 1, 1, '2019-03-13', '2019-03-13 09:15:54.3830', 1);
INSERT INTO `weekly`
VALUES (82, '打断点', 'EBO111', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发', '高啥啥啥', '新识别', 1, 1,
        '2019-03-17', '2019-03-17 19:31:04.0940', 0);
INSERT INTO `weekly`
VALUES (83, '打断点', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决', 1,
        1, '2019-03-18', '2019-03-18 15:29:56.8920', 1);
INSERT INTO `weekly`
VALUES (84, '测试测试', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决', 1,
        1, '2019-03-19', '2019-03-19 15:34:07.8180', 0);
INSERT INTO `weekly`
VALUES (85, '周一工作内容', 'EBO', '周报内容添加增加页和编辑页',
        '<div>问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前</div><div>撒傻傻的</div><div>sad</div><div>sad</div><div>。</div>',
        '开发/运维', '高/中/低', '新识别/跟踪处理/已解决', 1, 0, '2019-03-18', '2019-03-19 15:38:43.9830', 0);
INSERT INTO `weekly`
VALUES (86, '阿萨是多少', 'EBO', '周报内容添加增加页和编辑页', '少时诵诗书所所所所所所所所<br>', '开发', '高', '新识别', 1, 1, '2019-03-06',
        '2019-03-19 17:08:24.0920', 0);
INSERT INTO `weekly`
VALUES (87, 'sss', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决', 1,
        0, '2019-02-28', '2019-03-20 08:14:29.6310', 0);
INSERT INTO `weekly`
VALUES (88, 'aaaaaaaaaa', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低',
        '新识别/跟踪处理/已解决', 1, 1, '2019-03-07', '2019-03-20 08:33:15.6430', 0);
INSERT INTO `weekly`
VALUES (89, 'sssssssssss', 'EBO', '周报内容添加增加页和编辑页',
        '<div>问题：在实现根据指定时间查找相应的内容时，日期组件不能限asdasd阿斯顿阿斯顿阿斯顿阿斯顿撒旦阿斯顿撒打算打算大声道撒大声道</div><div>。', '开发/运维', '高/中/低',
        '新识别/跟踪处理/已解决', 1, 1, '2019-03-20', '2019-03-20 08:34:38.2390', 1);
INSERT INTO `weekly`
VALUES (90, '0000000000000', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低',
        '新识别/跟踪处理/已解决', 1, 1, '2019-03-14', '2019-03-20 09:37:48.7810', 0);
INSERT INTO `weekly`
VALUES (91, '我是首富', 'EBO', '我是测试呗编辑的编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决', 1,
        0, '2019-03-10', '2019-03-20 09:38:25.7410', 0);
INSERT INTO `weekly`
VALUES (92, '测测测测测测测测', 'EBO', '少时诵诗书所三生三世所', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 1, '2019-03-13', '2019-03-20 10:17:46.9140', 0);
INSERT INTO `weekly`
VALUES (93, '柔柔弱弱若若若若若若若若若若若', 'EBO', '周报内容添加增加页和编辑页', '阿斯顿阿斯顿阿斯顿阿斯顿按时打算', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决', 1, 1,
        '2019-03-15', '2019-03-20 10:24:59.3170', 0);
INSERT INTO `weekly`
VALUES (94, '测试测试', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决', 1,
        0, '2019-03-01', '2019-03-20 12:26:56.5450', 0);
INSERT INTO `weekly`
VALUES (95, '666666666666666', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低',
        '新识别/跟踪处理/已解决', 1, 1, '2019-03-20', '2019-03-20 12:37:46.7400', 0);
INSERT INTO `weekly`
VALUES (96, '我我我我我我', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 0, '2019-03-02', '2019-03-20 12:38:56.9440', 0);
INSERT INTO `weekly`
VALUES (97, '突突突突突突', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 0, '2019-03-11', '2019-03-20 12:39:07.3870', 0);
INSERT INTO `weekly`
VALUES (98, 'uuuuuu', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 1, '2019-03-12', '2019-03-20 12:39:23.3300', 0);
INSERT INTO `weekly`
VALUES (99, '999999', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 0, '2019-03-16', '2019-03-20 12:39:30.9440', 0);
INSERT INTO `weekly`
VALUES (100, 'wwww', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 0, '2019-02-25', '2019-03-20 13:07:12.4450', 0);
INSERT INTO `weekly`
VALUES (101, 'ooooo', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 0, '2019-02-26', '2019-03-20 13:07:26.9830', 0);
INSERT INTO `weekly`
VALUES (102, 'kkkk', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 0, '2019-02-27', '2019-03-20 13:07:54.6870', 0);
INSERT INTO `weekly`
VALUES (103, '9999', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 0, '2019-02-19', '2019-03-20 13:31:57.8060', 0);
INSERT INTO `weekly`
VALUES (104, '我是测试用户', 'EBO', '周报内容添加增加页和编辑页',
        '<div>问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。</div><div>你这厮，天气晴朗，多云转晴，日子过的有偿，</div><div>多么的商量。我还是喜欢你，</div><div>喜欢你的羊子</div><div>纸短情长啊<br></div>',
        '开发/运维', '高/中/低', '新识别/跟踪处理/已解决', 139, 1, '2019-03-20', '2019-03-20 14:11:50.8670', 0);
INSERT INTO `weekly`
VALUES (105, 'ppppp', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 0, '2019-03-08', '2019-03-20 14:23:13.2510', 0);
INSERT INTO `weekly`
VALUES (106, '噗噗噗噗噗', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        1, 0, '2019-03-09', '2019-03-20 14:23:22.0590', 0);
INSERT INTO `weekly`
VALUES (107, 'wwwww', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-12', '2019-03-20 15:08:43.2550', 0);
INSERT INTO `weekly`
VALUES (108, 'yyyy', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-13', '2019-03-20 15:08:52.6780', 0);
INSERT INTO `weekly`
VALUES (109, 'iiiiii', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-14', '2019-03-20 15:09:11.0880', 0);
INSERT INTO `weekly`
VALUES (110, 'uuuuuuu', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低',
        '新识别/跟踪处理/已解决', 139, 0, '2019-03-15', '2019-03-20 15:09:25.3920', 0);
INSERT INTO `weekly`
VALUES (111, 'uuuu', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-16', '2019-03-20 15:09:31.3750', 0);
INSERT INTO `weekly`
VALUES (112, 'njjjj', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-17', '2019-03-20 15:09:39.3690', 0);
INSERT INTO `weekly`
VALUES (113, 'mmmm', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-18', '2019-03-20 15:09:46.7270', 0);
INSERT INTO `weekly`
VALUES (114, 'jjjj', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-19', '2019-03-20 15:09:53.4240', 0);
INSERT INTO `weekly`
VALUES (115, '4444', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-02-25', '2019-03-20 15:10:12.8610', 0);
INSERT INTO `weekly`
VALUES (116, '5555', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-02-26', '2019-03-20 15:10:27.8850', 0);
INSERT INTO `weekly`
VALUES (117, '78', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-02-27', '2019-03-20 15:10:49.1050', 0);
INSERT INTO `weekly`
VALUES (118, '55555', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-01', '2019-03-20 15:10:57.9690', 0);
INSERT INTO `weekly`
VALUES (119, '63333', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-02', '2019-03-20 15:11:04.2310', 0);
INSERT INTO `weekly`
VALUES (120, '55555', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低', '新识别/跟踪处理/已解决',
        139, 0, '2019-03-04', '2019-03-20 15:11:11.9590', 0);
INSERT INTO `weekly`
VALUES (121, '1111222222222222', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低',
        '新识别/跟踪处理/已解决', 1, 1, '2019-03-21', '2019-03-21 20:53:38.1340', 1);
INSERT INTO `weekly`
VALUES (122, '1111111111222222222', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低',
        '新识别/跟踪处理/已解决', 1, 1, '2019-03-22', '2019-03-22 22:39:16.0830', 1);
INSERT INTO `weekly`
VALUES (123, '1111111', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低',
        '新识别/跟踪处理/已解决', 1, 1, '2019-03-21', '2019-03-22 22:42:07.0460', 0);
INSERT INTO `weekly`
VALUES (124, 'eeeeeeeeeeee', 'EBO', '周报内容添加增加页和编辑页', '问题：在实现根据指定时间查找相应的内容时，日期组件不能限定当前日期之前。', '开发/运维', '高/中/低',
        '新识别/跟踪处理/已解决', 1, 1, '2019-03-22', '2019-03-22 22:42:13.4030', 1);

-- ----------------------------
-- Table structure for work_overtime
-- ----------------------------
DROP TABLE IF EXISTS `work_overtime`;
CREATE TABLE `work_overtime`
(
    `work_id`     double                                           NOT NULL,
    `work_num`    double                                           NULL DEFAULT NULL,
    `name`        varchar(60) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `begin_time`  datetime(0)                                      NULL DEFAULT NULL,
    `end_time`    datetime(0)                                      NULL DEFAULT NULL,
    `state`       double                                           NULL DEFAULT NULL,
    `time_length` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `millisecond` double                                           NULL DEFAULT NULL,
    `dept_name`   varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `dept_id`     double                                           NULL DEFAULT NULL,
    `username`    varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`work_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
