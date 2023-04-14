/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728 (5.7.28)
 Source Host           : localhost:3306
 Source Schema         : rbac_demo

 Target Server Type    : MySQL
 Target Server Version : 50728 (5.7.28)
 File Encoding         : 65001

 Date: 14/04/2023 20:47:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 'add_logentry', 1);
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 'change_logentry', 1);
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 'delete_logentry', 1);
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 'view_logentry', 1);
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 'add_permission', 2);
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 'change_permission', 2);
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 'delete_permission', 2);
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 'view_permission', 2);
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 'add_group', 3);
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 'change_group', 3);
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 'delete_group', 3);
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 'view_group', 3);
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 'add_contenttype', 4);
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 'change_contenttype', 4);
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 'delete_contenttype', 4);
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 'view_contenttype', 4);
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 'add_session', 5);
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 'change_session', 5);
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 'delete_session', 5);
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 'view_session', 5);
INSERT INTO `auth_permission` VALUES (21, 'Can add 用户表', 'add_userinfo', 6);
INSERT INTO `auth_permission` VALUES (22, 'Can change 用户表', 'change_userinfo', 6);
INSERT INTO `auth_permission` VALUES (23, 'Can delete 用户表', 'delete_userinfo', 6);
INSERT INTO `auth_permission` VALUES (24, 'Can view 用户表', 'view_userinfo', 6);
INSERT INTO `auth_permission` VALUES (25, 'Can add 部门表', 'add_dept', 7);
INSERT INTO `auth_permission` VALUES (26, 'Can change 部门表', 'change_dept', 7);
INSERT INTO `auth_permission` VALUES (27, 'Can delete 部门表', 'delete_dept', 7);
INSERT INTO `auth_permission` VALUES (28, 'Can view 部门表', 'view_dept', 7);
INSERT INTO `auth_permission` VALUES (29, 'Can add 岗位表', 'add_job', 8);
INSERT INTO `auth_permission` VALUES (30, 'Can change 岗位表', 'change_job', 8);
INSERT INTO `auth_permission` VALUES (31, 'Can delete 岗位表', 'delete_job', 8);
INSERT INTO `auth_permission` VALUES (32, 'Can view 岗位表', 'view_job', 8);
INSERT INTO `auth_permission` VALUES (33, 'Can add 菜单权限表', 'add_menu', 9);
INSERT INTO `auth_permission` VALUES (34, 'Can change 菜单权限表', 'change_menu', 9);
INSERT INTO `auth_permission` VALUES (35, 'Can delete 菜单权限表', 'delete_menu', 9);
INSERT INTO `auth_permission` VALUES (36, 'Can view 菜单权限表', 'view_menu', 9);
INSERT INTO `auth_permission` VALUES (37, 'Can add 角色表', 'add_rules', 10);
INSERT INTO `auth_permission` VALUES (38, 'Can change 角色表', 'change_rules', 10);
INSERT INTO `auth_permission` VALUES (39, 'Can delete 角色表', 'delete_rules', 10);
INSERT INTO `auth_permission` VALUES (40, 'Can view 角色表', 'view_rules', 10);
INSERT INTO `auth_permission` VALUES (41, 'Can add 角色表', 'add_roles', 11);
INSERT INTO `auth_permission` VALUES (42, 'Can change 角色表', 'change_roles', 11);
INSERT INTO `auth_permission` VALUES (43, 'Can delete 角色表', 'delete_roles', 11);
INSERT INTO `auth_permission` VALUES (44, 'Can view 角色表', 'view_roles', 11);
INSERT INTO `auth_permission` VALUES (45, 'Can add 用户来源表', 'add_client', 12);
INSERT INTO `auth_permission` VALUES (46, 'Can change 用户来源表', 'change_client', 12);
INSERT INTO `auth_permission` VALUES (47, 'Can delete 用户来源表', 'delete_client', 12);
INSERT INTO `auth_permission` VALUES (48, 'Can view 用户来源表', 'view_client', 12);

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `browser` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `client_user_id_af1c5063_fk_rbac_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `client_user_id_af1c5063_fk_rbac_user_id` FOREIGN KEY (`user_id`) REFERENCES `rbac_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 283 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (1, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (2, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (3, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (4, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (5, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (6, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (7, '127.0.0.1', 0, 1, NULL);
INSERT INTO `client` VALUES (8, '127.0.0.1', 0, 1, NULL);
INSERT INTO `client` VALUES (9, '127.0.0.1', 0, 1, NULL);
INSERT INTO `client` VALUES (10, '127.0.0.1', 0, 1, NULL);
INSERT INTO `client` VALUES (11, '127.0.0.1', 0, 1, NULL);
INSERT INTO `client` VALUES (12, '127.0.0.1', 0, 1, NULL);
INSERT INTO `client` VALUES (13, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (14, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (15, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (16, '127.0.0.1', 1, 0, NULL);
INSERT INTO `client` VALUES (17, '127.0.0.1', 1, 0, NULL);
INSERT INTO `client` VALUES (18, '127.0.0.1', 1, 0, NULL);
INSERT INTO `client` VALUES (19, '127.0.0.1', 1, 1, NULL);
INSERT INTO `client` VALUES (20, '127.0.0.1', 1, 1, NULL);
INSERT INTO `client` VALUES (21, '127.0.0.1', 1, 1, NULL);
INSERT INTO `client` VALUES (22, '127.0.0.1', 1, 1, NULL);
INSERT INTO `client` VALUES (23, '127.0.0.1', 3, 1, NULL);
INSERT INTO `client` VALUES (24, '127.0.0.1', 3, 1, NULL);
INSERT INTO `client` VALUES (25, '127.0.0.1', 3, 1, NULL);
INSERT INTO `client` VALUES (26, '127.0.0.1', 2, 1, NULL);
INSERT INTO `client` VALUES (27, '127.0.0.1', 2, 1, NULL);
INSERT INTO `client` VALUES (28, '127.0.0.1', 2, 1, NULL);
INSERT INTO `client` VALUES (29, '127.0.0.1', 2, 1, NULL);
INSERT INTO `client` VALUES (30, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (31, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (32, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (33, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (34, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (35, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (36, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (118, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (119, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (120, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (121, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (138, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (139, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (140, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (141, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (142, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (143, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (144, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (145, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (146, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (147, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (148, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (149, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (150, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (151, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (245, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (246, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (247, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (248, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (249, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (250, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (251, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (252, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (253, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (254, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (255, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (256, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (257, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (258, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (259, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (260, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (261, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (262, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (263, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (264, '127.0.0.1', 0, 0, NULL);
INSERT INTO `client` VALUES (265, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (266, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (267, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (268, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (269, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (270, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (271, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (272, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (273, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (274, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (275, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (276, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (277, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (278, '127.0.0.1', 0, 0, 16);
INSERT INTO `client` VALUES (279, '127.0.0.1', 0, 0, 16);
INSERT INTO `client` VALUES (280, '127.0.0.1', 0, 0, 16);
INSERT INTO `client` VALUES (281, '127.0.0.1', 0, 0, 1);
INSERT INTO `client` VALUES (282, '127.0.0.1', 0, 0, 1);

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dept_count` int(11) NULL DEFAULT NULL,
  `p_dept_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dept_p_dept_id_b3dedb80_fk_dept_id`(`p_dept_id`) USING BTREE,
  CONSTRAINT `dept_p_dept_id_b3dedb80_fk_dept_id` FOREIGN KEY (`p_dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (2, '2023-03-21 18:48:05.954623', '2023-03-30 21:02:26.285653', 0, '开发部', 1, NULL, 5);
INSERT INTO `dept` VALUES (3, '2023-03-21 18:50:10.852638', '2023-03-30 21:03:13.416056', 0, 'Python', 1, NULL, 2);
INSERT INTO `dept` VALUES (4, '2023-03-21 19:07:16.566007', '2023-03-27 16:32:20.314925', 0, '运维部', 1, NULL, 5);
INSERT INTO `dept` VALUES (5, '2023-03-27 16:27:08.501968', '2023-03-27 16:27:08.501968', 0, '总部', 1, NULL, NULL);
INSERT INTO `dept` VALUES (7, '2023-03-28 16:51:39.070130', '2023-03-30 21:03:42.575990', 0, '测试部门', 1, NULL, 5);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_rbac_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_rbac_user_id` FOREIGN KEY (`user_id`) REFERENCES `rbac_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'permission', 'dept');
INSERT INTO `django_content_type` VALUES (8, 'permission', 'job');
INSERT INTO `django_content_type` VALUES (9, 'permission', 'menu');
INSERT INTO `django_content_type` VALUES (11, 'permission', 'roles');
INSERT INTO `django_content_type` VALUES (10, 'permission', 'rules');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (6, 'user', 'userinfo');
INSERT INTO `django_content_type` VALUES (12, 'visit', 'client');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'permission', '0001_initial', '2023-03-20 19:21:32.425944');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2023-03-20 19:21:32.489827');
INSERT INTO `django_migrations` VALUES (3, 'contenttypes', '0002_remove_content_type_name', '2023-03-20 19:21:32.624443');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0001_initial', '2023-03-20 19:21:32.922799');
INSERT INTO `django_migrations` VALUES (5, 'user', '0001_initial', '2023-03-20 19:21:33.735367');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0001_initial', '2023-03-20 19:21:33.841570');
INSERT INTO `django_migrations` VALUES (7, 'admin', '0002_logentry_user', '2023-03-20 19:21:33.912417');
INSERT INTO `django_migrations` VALUES (8, 'sessions', '0001_initial', '2023-03-20 19:21:33.969674');
INSERT INTO `django_migrations` VALUES (9, 'permission', '0002_alter_menu_table', '2023-03-20 19:23:10.399437');
INSERT INTO `django_migrations` VALUES (10, 'permission', '0003_auto_20230320_1926', '2023-03-20 19:26:23.351522');
INSERT INTO `django_migrations` VALUES (11, 'user', '0002_auto_20230320_1926', '2023-03-20 19:26:23.592033');
INSERT INTO `django_migrations` VALUES (12, 'permission', '0004_auto_20230320_1926', '2023-03-20 19:26:23.952212');
INSERT INTO `django_migrations` VALUES (13, 'permission', '0005_rename_p_id_menu_p_menu', '2023-03-20 20:35:23.962275');
INSERT INTO `django_migrations` VALUES (14, 'user', '0003_alter_userinfo_avatar', '2023-03-20 21:22:31.154870');
INSERT INTO `django_migrations` VALUES (15, 'user', '0004_userinfo_is_del', '2023-03-21 16:44:08.083237');
INSERT INTO `django_migrations` VALUES (16, 'user', '0005_alter_userinfo_mobile', '2023-03-21 16:55:39.128612');
INSERT INTO `django_migrations` VALUES (17, 'permission', '0006_auto_20230321_1829', '2023-03-21 18:29:22.091360');
INSERT INTO `django_migrations` VALUES (18, 'permission', '0007_job_dept', '2023-03-21 19:10:50.285512');
INSERT INTO `django_migrations` VALUES (19, 'permission', '0008_auto_20230323_0944', '2023-03-23 09:44:29.216621');
INSERT INTO `django_migrations` VALUES (20, 'user', '0006_auto_20230323_1140', '2023-03-23 11:40:20.654205');
INSERT INTO `django_migrations` VALUES (21, 'permission', '0009_menu_title', '2023-03-23 16:42:52.859469');
INSERT INTO `django_migrations` VALUES (22, 'visit', '0001_initial', '2023-03-23 19:15:16.826386');
INSERT INTO `django_migrations` VALUES (23, 'user', '0007_rename_is_lock_userinfo_lock', '2023-03-23 21:01:28.709670');
INSERT INTO `django_migrations` VALUES (24, 'user', '0008_rename_lock_userinfo_status', '2023-03-23 21:03:16.842855');
INSERT INTO `django_migrations` VALUES (25, 'user', '0009_alter_userinfo_status', '2023-03-24 09:29:55.780342');
INSERT INTO `django_migrations` VALUES (26, 'user', '0010_alter_userinfo_gender', '2023-03-27 10:50:39.842009');
INSERT INTO `django_migrations` VALUES (27, 'permission', '0010_menu_permission', '2023-03-27 15:18:36.762917');
INSERT INTO `django_migrations` VALUES (28, 'permission', '0011_auto_20230328_0929', '2023-03-28 09:29:39.178843');
INSERT INTO `django_migrations` VALUES (29, 'permission', '0012_menu_status', '2023-03-28 21:03:16.601893');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_dept_id_2b8be776_fk_dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `job_dept_id_2b8be776_fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (1, '2023-03-21 19:12:21.648496', '2023-03-21 19:12:21.648496', 0, 'web开发', 1, 3);
INSERT INTO `job` VALUES (2, '2023-03-21 19:12:42.896792', '2023-03-21 19:12:42.896792', 0, '爬虫', 1, 3);
INSERT INTO `job` VALUES (3, '2023-03-21 19:18:14.418643', '2023-03-21 19:18:14.418643', 0, '数据库运维', 1, 4);
INSERT INTO `job` VALUES (4, '2023-03-21 19:18:29.045994', '2023-03-21 19:18:29.045994', 0, '系统运维', 1, 4);
INSERT INTO `job` VALUES (5, '2023-03-27 16:28:20.392338', '2023-03-29 21:38:15.307325', 0, '后台管理员', 1, 5);
INSERT INTO `job` VALUES (10, '2023-04-04 20:49:56.695402', '2023-04-04 20:49:56.695402', 0, '测试', 1, 7);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL,
  `p_menu_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permission` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `component`(`component`) USING BTREE,
  INDEX `menu_p_menu_id_bcebdfe1_fk_menu_id`(`p_menu_id`) USING BTREE,
  CONSTRAINT `menu_p_menu_id_bcebdfe1_fk_menu_id` FOREIGN KEY (`p_menu_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (12, '2023-03-23 15:26:18.893772', '2023-03-27 21:57:30.913004', 0, '权限目录', 0, NULL, NULL, 0, NULL, '权限目录', NULL, 1);
INSERT INTO `menu` VALUES (14, '2023-03-23 15:31:51.226891', '2023-03-27 15:32:52.641127', 0, 'user', 1, '/user', 'UserView', 0, 12, '用户管理', NULL, 1);
INSERT INTO `menu` VALUES (15, '2023-03-24 08:50:47.426021', '2023-03-24 08:50:47.426021', 0, 'user:add', 2, NULL, NULL, 0, 14, '新增用户', 'user:add', 1);
INSERT INTO `menu` VALUES (16, '2023-03-24 08:51:29.198417', '2023-03-24 08:51:29.198417', 0, 'user:mod', 2, NULL, NULL, 0, 14, '编辑用户', 'user:mod', 1);
INSERT INTO `menu` VALUES (17, '2023-03-24 08:51:40.840455', '2023-03-24 08:51:40.840455', 0, 'user:del', 2, NULL, NULL, 0, 14, '删除用户', 'user:del', 1);
INSERT INTO `menu` VALUES (18, '2023-03-27 08:42:23.387541', '2023-04-02 15:54:12.746420', 0, '系统目录', 0, NULL, NULL, 0, NULL, '系统目录', NULL, 1);
INSERT INTO `menu` VALUES (19, '2023-03-27 08:45:09.867874', '2023-03-27 08:46:13.469235', 0, 'role', 1, '/role', 'RoleView', 0, 12, '角色管理', NULL, 1);
INSERT INTO `menu` VALUES (20, '2023-03-27 09:34:17.758273', '2023-03-27 09:34:17.758273', 0, 'dept', 1, '/dept', 'DeptView', 0, 12, '部门管理', NULL, 1);
INSERT INTO `menu` VALUES (21, '2023-03-27 09:36:08.352827', '2023-03-27 09:36:08.352827', 0, 'menu', 1, '/menu', 'MenutView', 0, 12, '菜单管理', NULL, 1);
INSERT INTO `menu` VALUES (22, '2023-03-28 10:22:28.000000', '2023-03-28 10:22:30.000000', 0, 'role:add', 2, NULL, NULL, 0, 19, '新增角色', 'role:add', 1);
INSERT INTO `menu` VALUES (23, '2023-03-28 10:22:39.000000', '2023-03-28 10:22:41.000000', 0, 'role:del', 2, NULL, NULL, 0, 19, '删除角色', 'role:del', 1);
INSERT INTO `menu` VALUES (24, '2023-03-28 21:51:28.000000', '2023-03-28 21:51:30.000000', 0, 'role:mod', 2, NULL, NULL, 0, 19, '修改角色', 'role:mod', 1);
INSERT INTO `menu` VALUES (25, '2023-03-28 21:53:27.000000', '2023-03-28 21:53:28.000000', 0, 'dept:add', 2, NULL, NULL, 0, 20, '新增部门', 'dept:add', 1);
INSERT INTO `menu` VALUES (26, '2023-03-28 21:54:24.000000', '2023-03-28 21:54:26.000000', 0, 'dept:mod', 2, NULL, NULL, 0, 20, '修改部门', 'dept:mod', 1);
INSERT INTO `menu` VALUES (27, '2023-03-28 21:55:00.000000', '2023-04-02 15:54:42.345989', 0, 'dept:del', 2, NULL, NULL, 0, 20, '删除部门', 'dept:del', 0);
INSERT INTO `menu` VALUES (29, '2023-03-29 15:55:02.000000', '2023-03-29 15:55:03.000000', 0, 'menu:add', 2, NULL, NULL, 0, 21, '新增菜单', 'menu:add', 1);
INSERT INTO `menu` VALUES (30, '2023-03-29 15:56:14.000000', '2023-03-29 15:56:15.000000', 0, 'menu:mod', 2, NULL, NULL, 0, 21, '修改菜单', 'menu:mod', 1);
INSERT INTO `menu` VALUES (31, '2023-03-29 15:56:51.000000', '2023-03-29 15:56:52.000000', 0, 'menu:del', 2, NULL, NULL, 0, 21, '删除菜单', 'menu:del', 1);
INSERT INTO `menu` VALUES (32, '2023-03-29 20:53:14.984283', '2023-03-29 20:53:14.984283', 0, 'job', 1, '/job', 'JobView', 0, 12, '岗位管理', '', 1);
INSERT INTO `menu` VALUES (33, '2023-03-29 20:54:10.060137', '2023-03-29 20:54:10.060137', 0, 'job:add', 2, '', '', 0, 32, '新增岗位', 'job:add', 1);
INSERT INTO `menu` VALUES (37, '2023-03-29 20:57:55.000000', '2023-03-29 20:57:57.000000', 0, 'job:mod', 2, NULL, NULL, 0, 32, '修改岗位', 'job:mod', 1);
INSERT INTO `menu` VALUES (39, '2023-03-29 21:03:31.209304', '2023-03-29 21:03:31.209304', 0, 'job:del', 2, '', NULL, 0, 32, '删除岗位', 'job:del', 1);
INSERT INTO `menu` VALUES (40, '2023-04-04 20:48:44.056038', '2023-04-04 20:48:44.056038', 0, '测试目录', 0, '', NULL, 0, NULL, '测试目录', '', 1);
INSERT INTO `menu` VALUES (41, '2023-04-04 20:49:22.668305', '2023-04-04 20:49:22.668305', 0, '测试菜单', 1, '/test', 'TestView', 0, 40, '测试菜单', '', 1);

-- ----------------------------
-- Table structure for rbac_user
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user`;
CREATE TABLE `rbac_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `pwd_reset_time` datetime(6) NOT NULL,
  `is_login` tinyint(1) NOT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `rbac_user_dept_id_1b5bdb0d_fk_dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `rbac_user_dept_id_1b5bdb0d_fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rbac_user
-- ----------------------------
INSERT INTO `rbac_user` VALUES (1, 'pbkdf2_sha256$260000$IZ3X5Bz65302XmPRna8BGH$1KdbvTGJdLnkJvfYYK3jABEd9s8ELMad3+RLhzBoK7A=', NULL, 1, 'admin', '', '', '123@qq.com', 1, 1, '2023-03-20 20:09:13.600815', '119', 'avatar/444_bWLwH5W.jpg', '3', 1, '2023-03-20 20:09:13.764027', 0, 5, 0);
INSERT INTO `rbac_user` VALUES (6, 'pbkdf2_sha256$260000$af29fq8dFonC0NEYxtILAe$rNt8GnfyFknyG3aO5Ywt8uoKPLd4gKb4yO/J+U2+UCM=', NULL, 0, 'user2', '', '', '1234@qq.com', 0, 1, '2023-03-24 12:15:15.855869', '10086', 'avatar/default.png', '3', 1, '2023-03-24 12:15:16.015536', 0, 3, 0);
INSERT INTO `rbac_user` VALUES (8, 'pbkdf2_sha256$260000$WI5spEWRxvxDgwKijDsIIX$V4oVeBI+cMYbLTPFaLVPjz7+OK4n3MZXu5ntnnJM4lQ=', NULL, 0, 'user3', '', '', '9999@qq.com', 0, 1, '2023-03-27 10:32:04.061349', '111111', 'avatar/default.png', '1', 1, '2023-03-27 10:32:04.221095', 0, 4, 0);
INSERT INTO `rbac_user` VALUES (14, 'pbkdf2_sha256$260000$hjxbILT2K2VHI7PMOwr9me$fpaQdLcABn4S0VDlHnOw4SrgIw4V3ohqMvD3mT/tYu8=', NULL, 0, '测试用户', '', '', '', 0, 1, '2023-03-28 09:26:19.886071', '9999', 'avatar/default.png', '1', 1, '2023-03-28 09:26:20.064530', 0, 4, 0);
INSERT INTO `rbac_user` VALUES (16, 'pbkdf2_sha256$260000$QZ6uUxR7U38j2bVTZFISSW$fmItYHJziHepnQFK8XELZaCJKNynZ9s0xJIWUFZ18tc=', NULL, 0, '测试用户3', '', '', '', 0, 1, '2023-03-28 11:58:55.262758', '8979687', 'avatar/333_H6iXLgd.jpeg', '1', 1, '2023-03-28 11:58:55.429316', 0, 4, 0);

-- ----------------------------
-- Table structure for rbac_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user_groups`;
CREATE TABLE `rbac_user_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rbac_user_groups_userinfo_id_group_id_aa6534ce_uniq`(`userinfo_id`, `group_id`) USING BTREE,
  INDEX `rbac_user_groups_group_id_be08c84e_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `rbac_user_groups_group_id_be08c84e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rbac_user_groups_userinfo_id_e843d053_fk_rbac_user_id` FOREIGN KEY (`userinfo_id`) REFERENCES `rbac_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rbac_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for rbac_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user_user_permissions`;
CREATE TABLE `rbac_user_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rbac_user_user_permissio_userinfo_id_permission_i_b35463c3_uniq`(`userinfo_id`, `permission_id`) USING BTREE,
  INDEX `rbac_user_user_permi_permission_id_3019ece8_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `rbac_user_user_permi_permission_id_3019ece8_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rbac_user_user_permissions_userinfo_id_144925b6_fk_rbac_user_id` FOREIGN KEY (`userinfo_id`) REFERENCES `rbac_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rbac_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for role_dept
-- ----------------------------
DROP TABLE IF EXISTS `role_dept`;
CREATE TABLE `role_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roles_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_dept_roles_id_dept_id_b680f383_uniq`(`roles_id`, `dept_id`) USING BTREE,
  INDEX `role_dept_dept_id_81b4317d_fk_dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `role_dept_dept_id_81b4317d_fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_dept_roles_id_ce095c4f_fk_roles_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_dept
-- ----------------------------
INSERT INTO `role_dept` VALUES (1, 1, 2);
INSERT INTO `role_dept` VALUES (3, 3, 2);
INSERT INTO `role_dept` VALUES (15, 3, 5);
INSERT INTO `role_dept` VALUES (4, 4, 2);
INSERT INTO `role_dept` VALUES (8, 8, 5);
INSERT INTO `role_dept` VALUES (16, 9, 7);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roles_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_menu_roles_id_menu_id_11667f6f_uniq`(`roles_id`, `menu_id`) USING BTREE,
  INDEX `role_menu_menu_id_b54bc904_fk_menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `role_menu_menu_id_b54bc904_fk_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_menu_roles_id_376ef425_fk_roles_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (13, 1, 12);
INSERT INTO `role_menu` VALUES (14, 1, 14);
INSERT INTO `role_menu` VALUES (83, 1, 15);
INSERT INTO `role_menu` VALUES (81, 1, 16);
INSERT INTO `role_menu` VALUES (82, 1, 17);
INSERT INTO `role_menu` VALUES (15, 3, 12);
INSERT INTO `role_menu` VALUES (16, 3, 14);
INSERT INTO `role_menu` VALUES (17, 3, 15);
INSERT INTO `role_menu` VALUES (18, 3, 16);
INSERT INTO `role_menu` VALUES (19, 3, 17);
INSERT INTO `role_menu` VALUES (20, 3, 18);
INSERT INTO `role_menu` VALUES (21, 3, 19);
INSERT INTO `role_menu` VALUES (22, 3, 20);
INSERT INTO `role_menu` VALUES (23, 3, 21);
INSERT INTO `role_menu` VALUES (44, 3, 22);
INSERT INTO `role_menu` VALUES (45, 3, 23);
INSERT INTO `role_menu` VALUES (74, 3, 24);
INSERT INTO `role_menu` VALUES (75, 3, 25);
INSERT INTO `role_menu` VALUES (76, 3, 26);
INSERT INTO `role_menu` VALUES (77, 3, 27);
INSERT INTO `role_menu` VALUES (78, 3, 29);
INSERT INTO `role_menu` VALUES (79, 3, 30);
INSERT INTO `role_menu` VALUES (80, 3, 31);
INSERT INTO `role_menu` VALUES (70, 3, 32);
INSERT INTO `role_menu` VALUES (71, 3, 33);
INSERT INTO `role_menu` VALUES (72, 3, 37);
INSERT INTO `role_menu` VALUES (73, 3, 39);
INSERT INTO `role_menu` VALUES (24, 4, 12);
INSERT INTO `role_menu` VALUES (46, 4, 14);
INSERT INTO `role_menu` VALUES (47, 4, 15);
INSERT INTO `role_menu` VALUES (28, 8, 12);
INSERT INTO `role_menu` VALUES (48, 8, 18);
INSERT INTO `role_menu` VALUES (69, 8, 20);
INSERT INTO `role_menu` VALUES (66, 8, 25);
INSERT INTO `role_menu` VALUES (67, 8, 26);
INSERT INTO `role_menu` VALUES (68, 8, 27);
INSERT INTO `role_menu` VALUES (85, 9, 12);
INSERT INTO `role_menu` VALUES (86, 9, 14);
INSERT INTO `role_menu` VALUES (87, 9, 15);
INSERT INTO `role_menu` VALUES (84, 9, 19);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `msg` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '2023-03-23 10:31:25.846512', '2023-04-02 15:46:36.337094', 0, '用户权限角色', NULL, 1);
INSERT INTO `roles` VALUES (3, '2023-03-27 16:23:17.068877', '2023-04-02 15:46:13.582858', 0, '所有权限角色', NULL, 1);
INSERT INTO `roles` VALUES (4, '2023-03-27 18:55:21.375924', '2023-03-28 11:01:41.877761', 0, '测试角色', NULL, 1);
INSERT INTO `roles` VALUES (8, '2023-03-28 10:16:04.356974', '2023-04-04 20:50:30.451522', 0, '测试角色2', '测试', 1);
INSERT INTO `roles` VALUES (9, '2023-04-04 20:47:27.225737', '2023-04-04 20:47:27.225737', 0, '测试角色3', '测试', 1);

-- ----------------------------
-- Table structure for user_job
-- ----------------------------
DROP TABLE IF EXISTS `user_job`;
CREATE TABLE `user_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_job_userinfo_id_job_id_ca009757_uniq`(`userinfo_id`, `job_id`) USING BTREE,
  INDEX `user_job_job_id_9b2d5052_fk_job_id`(`job_id`) USING BTREE,
  CONSTRAINT `user_job_job_id_9b2d5052_fk_job_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_job_userinfo_id_6c201ecc_fk_rbac_user_id` FOREIGN KEY (`userinfo_id`) REFERENCES `rbac_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_job
-- ----------------------------
INSERT INTO `user_job` VALUES (8, 1, 5);
INSERT INTO `user_job` VALUES (4, 6, 1);
INSERT INTO `user_job` VALUES (6, 8, 3);
INSERT INTO `user_job` VALUES (17, 14, 3);
INSERT INTO `user_job` VALUES (20, 16, 3);

-- ----------------------------
-- Table structure for user_rules
-- ----------------------------
DROP TABLE IF EXISTS `user_rules`;
CREATE TABLE `user_rules`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_rules_userinfo_id_roles_id_0901f201_uniq`(`userinfo_id`, `roles_id`) USING BTREE,
  INDEX `user_rules_roles_id_3871482d_fk_roles_id`(`roles_id`) USING BTREE,
  CONSTRAINT `user_rules_roles_id_3871482d_fk_roles_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_rules_userinfo_id_f2a5d75c_fk_rbac_user_id` FOREIGN KEY (`userinfo_id`) REFERENCES `rbac_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_rules
-- ----------------------------
INSERT INTO `user_rules` VALUES (6, 1, 1);
INSERT INTO `user_rules` VALUES (5, 1, 3);
INSERT INTO `user_rules` VALUES (3, 6, 1);
INSERT INTO `user_rules` VALUES (17, 6, 3);
INSERT INTO `user_rules` VALUES (13, 8, 4);
INSERT INTO `user_rules` VALUES (11, 14, 4);
INSERT INTO `user_rules` VALUES (12, 14, 8);
INSERT INTO `user_rules` VALUES (15, 16, 8);

SET FOREIGN_KEY_CHECKS = 1;
