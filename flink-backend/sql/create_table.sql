CREATE DATABASE
    IF
    NOT EXISTS flink;
USE flink;
CREATE TABLE tag (
                     id BIGINT auto_increment COMMENT 'id' PRIMARY KEY,
                     tagName VARCHAR ( 256 ) NULL COMMENT '标签名称',
                     userId BIGINT NULL COMMENT '用户 id',
                     parentId BIGINT NULL COMMENT '父标签 id',
                     isParent TINYINT NULL COMMENT '0 - 非父标签，1 - 父标签',
                     createTime datetime DEFAULT CURRENT_TIMESTAMP NULL COMMENT '创建时间',
                     updateTime datetime DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
                     isDelete TINYINT DEFAULT 0 NOT NULL COMMENT '是否删除',
                     CONSTRAINT uniIdx_tagName UNIQUE ( tagName )
) COMMENT '标签';
CREATE TABLE USER (
                      username VARCHAR ( 256 ) NULL COMMENT '用户昵称',
                      id BIGINT auto_increment COMMENT 'id' PRIMARY KEY,
                      userAccount VARCHAR ( 256 ) NULL COMMENT '账号',
                      avatarUrl VARCHAR ( 1024 ) NULL COMMENT '用户头像',
                      gender TINYINT NULL COMMENT '性别',
                      userPassword VARCHAR ( 512 ) NOT NULL COMMENT '密码',
                      phone VARCHAR ( 128 ) NULL COMMENT '电话',
                      email VARCHAR ( 512 ) NULL COMMENT '邮箱',
                      userStatus INT DEFAULT 0 NOT NULL COMMENT '0 - 正常',
                      createTime datetime DEFAULT CURRENT_TIMESTAMP NULL COMMENT '创建时间',
                      updateTime datetime DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
                      isDelete TINYINT DEFAULT 0 NOT NULL COMMENT '是否删除',
                      userRole INT DEFAULT 0 NOT NULL COMMENT '0 - 普通用户，1 - 管理员',
                      secretCode VARCHAR ( 512 ) NULL COMMENT '特殊编号',
                      tags VARCHAR ( 1024 ) NULL COMMENT '标签 json 列表'
) COMMENT '用户';
CREATE TABLE team (
                      id BIGINT auto_increment COMMENT 'id' PRIMARY KEY,
                      NAME VARCHAR ( 256 ) NOT NULL COMMENT '队伍名称',
                      description VARCHAR ( 1024 ) NULL COMMENT '描述',
                      maxNum INT DEFAULT 1 NOT NULL COMMENT '最大人数',
                      expireTime datetime NULL COMMENT '过期时间',
                      userId BIGINT COMMENT '用户id（队长 id）',
                      STATUS INT DEFAULT 0 NOT NULL COMMENT '0 - 公开，1 - 私有，2 - 加密',
                      PASSWORD VARCHAR ( 512 ) NULL COMMENT '密码',
                      createTime datetime DEFAULT CURRENT_TIMESTAMP NULL COMMENT '创建时间',
                      updateTime datetime DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
                      isDelete TINYINT DEFAULT 0 NOT NULL COMMENT '是否删除'
) COMMENT '队伍';
CREATE TABLE user_team (
                           id BIGINT auto_increment COMMENT 'id' PRIMARY KEY,
                           userId BIGINT COMMENT '用户id',
                           teamId BIGINT COMMENT '队伍id',
                           joinTime datetime NULL COMMENT '加入时间',
                           createTime datetime DEFAULT CURRENT_TIMESTAMP NULL COMMENT '创建时间',
                           updateTime datetime DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
                           isDelete TINYINT DEFAULT 0 NOT NULL COMMENT '是否删除'
) COMMENT '用户队伍关系';
CREATE INDEX idx_userId ON tag ( userId );
