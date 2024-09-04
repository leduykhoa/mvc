
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

 CREATE TABLE `core_websites` (
      `id` smallint NOT NULL   ,
      `code` varchar(32) NOT NULL   ,
      `name` varchar(100) NOT NULL   ,
      `position` tinyint NULL   ,
      `default_group_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Default Group Id' ,
      `is_default` boolean NOT NULL DEFAULT true  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin core_website';

CREATE TABLE `core_store_groups` (
      `id` smallint NOT NULL   ,
      `name` varchar(100) NOT NULL   ,
      `position` tinyint NULL   ,
      `default_store_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Default store Id' ,
      `website_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Default Group Id' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin core_store_group';

CREATE TABLE `core_stores` (
      `id` smallint NOT NULL   ,
      `code` varchar(32) NOT NULL   ,
      `name` varchar(100) NOT NULL   ,
      `group_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Group Store Id' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin core_store';

CREATE TABLE `settings` (
      `id` int NOT NULL   ,
      `key` varchar(100) NOT NULL   ,
      `value` text NOT NULL   ,
      `website_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Website Id' ,
      `group_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Group Store Id' ,
      `store_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Store Id' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin cấu hình chung hệ thống';

CREATE TABLE `menus` (
      `id` smallint NOT NULL   ,
      `name` varchar(200) NOT NULL   ,
      `title` varchar(255) NOT NULL   ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin menu';

CREATE TABLE `menu_items` (
      `id` int NOT NULL   ,
      `name` varchar(255) NOT NULL   ,
      `title` varchar(255) NOT NULL   ,
      `route` varchar(255) NULL DEFAULT NULL  ,
      `href` varchar(255) NULL DEFAULT NULL  ,
      `icon` varchar(100) NULL DEFAULT NULL  ,
      `icon_second` varchar(100) NULL DEFAULT NULL  ,
      `sub_none` varchar(10) NULL DEFAULT NULL  ,
      `param` varchar(100) NULL DEFAULT NULL  ,
      `params` text NULL DEFAULT NULL  ,
      `type` varchar(10) NULL DEFAULT NULL  ,
      `permission` varchar(100) NULL DEFAULT NULL  ,
      `parent` integer NULL DEFAULT NULL  ,
      `menu_id` tinyint NOT NULL   ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin menu item';

CREATE TABLE `hashtags` (
      `id` char(36) NOT NULL   ,
      `hashtag` varchar(50) NOT NULL   ,
      `type` varchar(20) NULL DEFAULT NULL  ,
      `description` varchar(255) NULL DEFAULT NULL  COMMENT 'Miêu tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin các hashtag hệ thống';

CREATE TABLE `system_types` (
      `id` smallint NOT NULL   ,
      `key` varchar(50) NOT NULL   ,
      `name` varchar(255) NOT NULL   ,
      `description` varchar(255) NULL DEFAULT NULL  COMMENT 'Miêu tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin các loại đối tượng tham gia vào hệ thống';

CREATE TABLE `permissions` (
      `id` int NOT NULL   COMMENT 'Id quyền của hệ thống' ,
      `key` varchar(50) NOT NULL DEFAULT 'default'  COMMENT 'key quyền của hệ thống' ,
      `name` varchar(100) NOT NULL DEFAULT 'default'  COMMENT 'Tên quyền của hệ thống' ,
      `description` varchar(255) NULL DEFAULT NULL  COMMENT 'Miêu tả quyền của hệ thống' ,
      `system_type_id` tinyint NOT NULL   COMMENT 'Loại đối tượng hệ thống' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quyền của hệ thống';

CREATE TABLE `roles` (
      `id` int NOT NULL   COMMENT 'Id các vai trò của hệ thống' ,
      `key` varchar(50) NOT NULL DEFAULT 'default'  COMMENT 'key các vai trò của hệ thống' ,
      `name` varchar(255) NOT NULL DEFAULT 'default'  COMMENT 'Tên các vai trò của hệ thống' ,
      `description` varchar(255) NULL DEFAULT NULL  COMMENT 'Miêu tả vai trò của hệ thống' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `system_type_id` tinyint NOT NULL   COMMENT 'Loại đối tượng hệ thống' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_system` boolean NOT NULL DEFAULT true  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các vai trò của hệ thống';

CREATE TABLE `role_permissions` (
      `id` int NOT NULL   COMMENT 'Id quan hệ vai trò và quyền' ,
      `role_id` integer NOT NULL   COMMENT 'Id vai trò của hệ thống' ,
      `permission_id` integer NOT NULL   COMMENT 'Id quyền của hệ thống' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quan hệ vai trò và quyền';

CREATE TABLE `role_permission_specials` (
      `id` int NOT NULL   COMMENT 'Id nhóm hệ thống quản trị' ,
      `user_id` char(36) NOT NULL   COMMENT 'Id người dùng hệ thống' ,
      `permission_id` integer NOT NULL   COMMENT 'Id quyền của hệ thống' ,
      `type` enum('allow','deny') NOT NULL DEFAULT 'allow'  COMMENT 'Cho phép hay không' ,
      `notes` text NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quyền riêng biệt cho từng user';

CREATE TABLE `role_groups` (
      `id` int NOT NULL   COMMENT 'Id nhóm hệ thống quản trị' ,
      `key` varchar(50) NOT NULL DEFAULT 'default'  COMMENT 'key nhóm hệ thống quản trị' ,
      `name` varchar(255) NOT NULL DEFAULT 'default'  COMMENT 'Tên nhóm hệ thống quản trị' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả nhóm hệ thống quản trị' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `parent` integer NULL DEFAULT NULL  COMMENT 'Tên nhóm hệ thống quản trị cha' ,
      `param` varchar(100) NULL DEFAULT NULL  COMMENT 'Tham số thêm' ,
      `system_type_id` tinyint NOT NULL   COMMENT 'Loại đối tượng hệ thống' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_system` boolean NOT NULL DEFAULT true  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các nhóm hệ thống quản trị';

CREATE TABLE `role_group_roles` (
      `id` int NOT NULL   COMMENT 'Id quan hệ nhóm hệ thống quản trị và vai trò' ,
      `role_group_id` integer NOT NULL   COMMENT 'Id nhóm hệ thống quản trị' ,
      `role_id` integer NOT NULL   COMMENT 'Id vai trò của hệ thống' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quan hệ nhóm hệ thống quản trị và vai trò';

CREATE TABLE `role_group_users` (
      `id` bigint NOT NULL   COMMENT 'Id quan hệ nhóm vai trò và user hệ thống' ,
      `user_id` char(36) NOT NULL   COMMENT 'Id người dùng hệ thống' ,
      `role_group_id` integer NOT NULL   COMMENT 'Id nhóm hệ thống quản trị' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quan hệ nhóm vai trò và user hệ thống';

CREATE TABLE `users` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `username` varchar(100) NULL DEFAULT NULL  COMMENT 'Tài khoản' ,
      `name` varchar(100) NULL DEFAULT NULL  COMMENT 'Tên tài khoản' ,
      `full_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Họ và tên' ,
      `first_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `last_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Họ' ,
      `password` varchar(100) NULL DEFAULT NULL  COMMENT 'Mật khẩu' ,
      `password_old` text NULL DEFAULT NULL  COMMENT 'Mật khẩu' ,
      `email` varchar(100) NULL DEFAULT NULL  COMMENT 'Email' ,
      `phone` varchar(50) NULL DEFAULT NULL  COMMENT 'Điện thoại' ,
      `address` varchar(255) NULL DEFAULT NULL  COMMENT 'Địa chỉ' ,
      `gender` enum('male','female','other') NULL DEFAULT NULL  COMMENT 'Giới tính' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `position_title` varchar(100) NULL DEFAULT NULL  COMMENT 'Chức vụ' ,
      `position_text` varchar(100) NULL DEFAULT NULL  COMMENT 'Chức vụ' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `remember_token` boolean NOT NULL DEFAULT true  ,
      `system_type_id` tinyint NOT NULL   COMMENT 'Loại đối tượng hệ thống' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_protected` boolean NOT NULL DEFAULT false  COMMENT 'Thông tin về hồ sơ user được bảo vệ' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin user';

CREATE TABLE `countries` (
      `id` int NOT NULL   ,
      `code` varchar(2) NOT NULL   COMMENT 'Mã nước' ,
      `iso2_code` varchar(2) NOT NULL   COMMENT 'Country ISO-2 format' ,
      `iso3_code` varchar(3) NOT NULL   COMMENT 'Country ISO-3 format' ,
      `name` varchar(100) NULL   COMMENT 'Tên nước' ,
      `year` varchar(4) NULL DEFAULT NULL  COMMENT 'Năm thành lập' ,
      `domain` varchar(10) NULL DEFAULT NULL  COMMENT 'Tên domain' ,
      `notes` text NULL DEFAULT NULL  ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về các nước';

CREATE TABLE `country_units` (
      `id` int NOT NULL   ,
      `full_name` varchar(255) NOT NULL   COMMENT 'Tên phân cấp địa giới hành chính' ,
      `full_name_en` varchar(255) NOT NULL   COMMENT 'Tên phân cấp địa giới hành chính' ,
      `short_name` varchar(200) NOT NULL   COMMENT 'Tên rút gọn phân cấp địa giới hành chính' ,
      `short_name_en` varchar(200) NOT NULL   COMMENT 'Tên rút gọn phân cấp địa giới hành chính' ,
      `code_name` varchar(200) NOT NULL   COMMENT 'Mã phân cấp địa giới hành chính' ,
      `code_name_en` varchar(200) NOT NULL   COMMENT 'Mã phân cấp địa giới hành chính' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về các phân cấp địa giới hành chính';

CREATE TABLE `regions` (
      `id` int NOT NULL   ,
      `code_name` varchar(200) NULL DEFAULT NULL  COMMENT 'Mã vùng miền' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên vùng miền' ,
      `name_en` varchar(255) NOT NULL   COMMENT 'Tên vùng miền tiếng anh' ,
      `code_name_en` varchar(255) NOT NULL   COMMENT 'Tên vùng miền tiếng anh' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về các vùng miền';

CREATE TABLE `provinces` (
      `id` int NOT NULL   ,
      `code` varchar(10) NULL DEFAULT NULL  COMMENT 'Mã tỉnh' ,
      `code_gs1` varchar(10) NULL DEFAULT NULL  COMMENT 'Mã tỉnh theo GS1' ,
      `code_name` varchar(200) NULL DEFAULT NULL  COMMENT 'Mã tỉnh' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên tỉnh' ,
      `name_en` varchar(255) NOT NULL   COMMENT 'Tên tỉnh tiếng anh' ,
      `full_name` varchar(255) NOT NULL   COMMENT 'Tên tỉnh đầy đủ' ,
      `full_name_en` varchar(255) NOT NULL   COMMENT 'Tên tỉnh đầy đủ tiếng anh' ,
      `country_unit_id` integer NOT NULL   COMMENT 'Tham chiếu đến địa giới hành chính' ,
      `region_id` integer NOT NULL   COMMENT 'Tham chiếu đến vùng miền' ,
      `country_id` integer NULL DEFAULT NULL  COMMENT 'Tham chiếu đến quốc gia' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về các tỉnh';

CREATE TABLE `districts` (
      `id` int NOT NULL   ,
      `code` varchar(200) NULL DEFAULT NULL  COMMENT 'Mã quận/huyện' ,
      `code_name` varchar(200) NULL DEFAULT NULL  COMMENT 'Mã quận/huyện' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên quận/huyện đầy đủ' ,
      `name_en` varchar(255) NOT NULL   COMMENT 'Tên quận/huyện đầy đủ' ,
      `full_name` varchar(255) NOT NULL   COMMENT 'Tên quận/huyện đầy đủ' ,
      `full_name_en` varchar(255) NOT NULL   COMMENT 'Tên quận/huyện đầy đủ tiếng anh' ,
      `area` varchar(255) NULL DEFAULT NULL  ,
      `unit` varchar(255) NULL DEFAULT NULL  ,
      `country_unit_id` integer NOT NULL   COMMENT 'Tham chiếu đến địa giới hành chính' ,
      `province_code` varchar(20) NOT NULL   COMMENT 'Tham chiếu đến tỉnh' ,
      `province_id` integer NULL DEFAULT NULL  COMMENT 'Tham chiếu đến tỉnh' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về các quận/huyện';

CREATE TABLE `wards` (
      `id` int NOT NULL   ,
      `code` varchar(200) NULL DEFAULT NULL  COMMENT 'Mã xã/phường' ,
      `code_name` varchar(200) NULL DEFAULT NULL  COMMENT 'Mã xã/phường' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên xã/phường' ,
      `name_en` varchar(255) NOT NULL   COMMENT 'Tên xã/phường tiếng anh' ,
      `full_name` varchar(255) NOT NULL   COMMENT 'Tên xã/phường đầy đủ' ,
      `full_name_en` varchar(255) NOT NULL   COMMENT 'Tên xã/phường đầy đủ tiếng anh' ,
      `unit` varchar(255) NULL DEFAULT NULL  ,
      `country_unit_id` integer NOT NULL   COMMENT 'Tham chiếu đến địa giới hành chính' ,
      `district_code` varchar(20) NOT NULL   COMMENT 'Tham chiếu đến quận/huyện' ,
      `district_id` integer NULL DEFAULT NULL  COMMENT 'Tham chiếu đến quận/huyện' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về các xã/phường';

CREATE TABLE `blog_types` (
      `id` int NOT NULL   ,
      `code` varchar(200) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên loại' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `param` varchar(100) NULL DEFAULT NULL  COMMENT 'Tham số thêm' ,
      `has_category` boolean NOT NULL DEFAULT true  ,
      `show_menu` boolean NOT NULL DEFAULT true  ,
      `show_comment` boolean NOT NULL DEFAULT true  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về loại bài viết';

CREATE TABLE `blog_categories` (
      `id` char(36) NOT NULL   ,
      `slug` varchar(255) NULL DEFAULT NULL  COMMENT 'slug' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên danh mục' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `position` integer NULL DEFAULT NULL  ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Danh mục cha' ,
      `type_id` integer NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về danh mục bài viết';

CREATE TABLE `blog_posts` (
      `id` char(36) NOT NULL   ,
      `slug` varchar(255) NULL DEFAULT NULL  COMMENT 'slug' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `position` integer NULL DEFAULT NULL  ,
      `notes` text NULL DEFAULT NULL  ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `content` text NULL DEFAULT NULL  COMMENT 'Nội dung' ,
      `seo_title` varchar(255) NULL   COMMENT 'Seo title' ,
      `seo_keyword` varchar(255) NULL DEFAULT NULL  COMMENT 'Seo keyword' ,
      `seo_description` text NULL DEFAULT NULL  COMMENT 'Seo mô tả' ,
      `seo_image` varchar(255) NULL DEFAULT NULL  COMMENT 'Seo image' ,
      `seo_thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'Seo thumbnail' ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Cha' ,
      `type_id` integer NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về bài viết';

CREATE TABLE `blog_post_categories` (
      `id` char(36) NOT NULL   ,
      `post_id` char(36) NOT NULL   COMMENT 'Id bài viết' ,
      `category_id` char(36) NOT NULL   COMMENT 'Id danh mục' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin mối quan hệ bài viết và danh mục';

CREATE TABLE `blog_post_comments` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `comment` text NULL DEFAULT NULL  COMMENT 'comment' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `post_id` char(36) NOT NULL   ,
      `type_id` integer NULL DEFAULT NULL  ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Cha' ,
      `user_approve` char(36) NULL DEFAULT NULL  COMMENT 'Người duyệt' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về nhận xét bài viết bài viết';

CREATE TABLE `oauths` (
      `id` char(36) NOT NULL   ,
      `name` varchar(100) NOT NULL   COMMENT 'Tên cho tài khoản' ,
      `consumer_key` varchar(100) NOT NULL   COMMENT 'Khóa công khai tài khoản' ,
      `consumer_secret` varchar(255) NOT NULL   COMMENT 'Khóa bí mật tài khoản' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin tài khoản khai thác dữ liệu hệ thống';

CREATE TABLE `industries` (
      `id` char(36) NOT NULL   ,
      `level_first` varchar(1) NULL DEFAULT NULL  COMMENT 'Cấp 1' ,
      `level_second` varchar(2) NULL DEFAULT NULL  COMMENT 'Cấp 2' ,
      `level_third` varchar(3) NULL DEFAULT NULL  COMMENT 'Cấp 3' ,
      `level_four` varchar(4) NULL DEFAULT NULL  COMMENT 'Cấp 4' ,
      `level_five` varchar(5) NULL DEFAULT NULL  COMMENT 'Cấp 5' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên danh mục' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Danh mục cha' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Dm_NganhHang/Danh mục ngành hàng';

CREATE TABLE `field_of_activities` (
      `id` int NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Lĩnh vực hoạt động';

CREATE TABLE `manage_levels` (
      `id` int NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Cấp bậc quản lý';

CREATE TABLE `manage_departments` (
      `id` int NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Sở phụ trách';

CREATE TABLE `enterprise_categories` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên danh mục' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Danh mục cha' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Dm_ToChuc_HoSo/Danh mục doanh nghiệp';

CREATE TABLE `enterprise_types` (
      `id` int NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên loại hình doanh nghiệp' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Loại hình doanh nghiệp/Công ty cổ phần, công ty trách nhiệm hữu hạn một thành viên, Công ty trách nhiệm hữu hạn hai thành viên trở lên, công ty hợp danh, doanh nghiệp tư nhân';

CREATE TABLE `enterprise_type_profiles` (
      `id` int NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên loại doanh nghiệp' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Loại doanh nghiệp';

CREATE TABLE `enterprise_packages` (
      `id` int NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `notes` text NULL DEFAULT NULL  ,
      `param` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Gói doanh nghiệp';

CREATE TABLE `enterprises` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `slug` varchar(255) NULL DEFAULT NULL  COMMENT 'slug' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `name_short` varchar(100) NULL DEFAULT NULL  COMMENT 'Tên viết ngắn' ,
      `name_english` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên tiếng Anh' ,
      `tax_code` varchar(15) NOT NULL   COMMENT 'Mã số thuế' ,
      `business_license` varchar(20) NULL DEFAULT NULL  COMMENT 'Mã số kinh doanh/Mã số doanh nghiệp' ,
      `date_business_license` timestamp NULL DEFAULT NULL  COMMENT 'Ngày đăng ký Mã số kinh doanh/Mã số doanh nghiệp' ,
      `phone` varchar(20) NULL DEFAULT NULL  COMMENT 'Điện thoại' ,
      `hotline` varchar(20) NULL DEFAULT NULL  COMMENT 'hotline' ,
      `website` varchar(100) NULL DEFAULT NULL  COMMENT 'Website' ,
      `email` varchar(100) NULL DEFAULT NULL  COMMENT 'Email' ,
      `facebook` varchar(100) NULL DEFAULT NULL  COMMENT 'facebook' ,
      `youtube` varchar(100) NULL DEFAULT NULL  COMMENT 'youtube' ,
      `zalo` varchar(100) NULL DEFAULT NULL  COMMENT 'zalo' ,
      `skype` varchar(100) NULL DEFAULT NULL  COMMENT 'skype' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `confirm` text NULL DEFAULT NULL  ,
      `story` text NULL DEFAULT NULL  COMMENT 'story' ,
      `public_info` text NULL DEFAULT NULL  COMMENT 'Thông tin public' ,
      `date_joining` timestamp NULL DEFAULT NULL  COMMENT 'Ngày tham gia hệ thống' ,
      `date_signature_contract` timestamp NULL DEFAULT NULL  COMMENT 'Ngày ký hợp đồng' ,
      `date_render_gcp` timestamp NULL DEFAULT NULL  COMMENT 'Ngày cấp mã gcp' ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Doanh nghiệp cha' ,
      `type_gcp` enum('GCP-7','GCP-8','GCP-9', 'GCP-10') NULL DEFAULT NULL  COMMENT 'loại mã doanh nghiệp (GCP)' ,
      `gcp` varchar(10) NULL DEFAULT NULL  COMMENT 'Mã doanh nghiệp GS1' ,
      `type_id` integer NULL   COMMENT 'Loại hình doanh nghiệp' ,
      `type_enterprise` integer NULL   COMMENT '0.Chưa phân loại/1.Trồng trọt/2.Chăn nuôi/3.Thủy sản' ,
      `enterprise_type_profile_id` integer NULL   COMMENT 'Loại doanh nghiệp' ,
      `permission_edit` enum('default','self-determination') NULL DEFAULT 'default'  COMMENT 'Quyền sửa đổi' ,
      `manage_level_id` integer NULL   COMMENT 'Cấp độ quản lý' ,
      `manage_department_id` integer NULL   COMMENT 'Sở phụ trách' ,
      `max_of_product_create` integer NOT NULL DEFAULT 10  COMMENT 'Số sản phẩm được tạo' ,
      `max_of_tem_create_per_year` integer NOT NULL DEFAULT 10000  COMMENT 'Số tem được tạo trên năm' ,
      `boss_id` char(36) NULL DEFAULT NULL  COMMENT 'Chủ doanh nghiệp' ,
      `staff_id` char(36) NULL DEFAULT NULL  COMMENT 'Nhân viên' ,
      `staff_technical_id` char(36) NULL DEFAULT NULL  COMMENT 'Nhân viên kỹ thuật' ,
      `gln` char(36) NULL DEFAULT NULL  COMMENT 'Mã địa chỉ GS1/GTIN/GTIN-13 tham chiếu đến bảng gs1_gln' ,
      `enterprise_package_id` char(36) NULL DEFAULT NULL  ,
      `grai_prefix_index` integer NOT NULL DEFAULT 0  COMMENT 'GRAI-Prefix' ,
      `giai_index` varchar(50) NOT NULL DEFAULT '65|65|65|65|65|64'  ,
      `gsrn_index` integer NOT NULL DEFAULT 0  ,
      `gtin_index` integer NOT NULL DEFAULT 0  ,
      `sscc_index` integer NOT NULL DEFAULT 0  ,
      `plan_index` varchar(50) NOT NULL DEFAULT '65|65|65|65|65|64'  ,
      `order_index` varchar(50) NOT NULL DEFAULT '65|65|65|65|65|64'  ,
      `package_index` integer NOT NULL DEFAULT 0  ,
      `qr_code_index_year` integer NOT NULL DEFAULT 2013  ,
      `qr_code_index_prefix_product_unknown` varchar(2) NOT NULL DEFAULT 'AB'  ,
      `qr_code_index_prefix_package_unknown` varchar(2) NOT NULL DEFAULT 'CD'  ,
      `qr_code_index_prefix_product_real` varchar(1) NOT NULL DEFAULT 'X'  ,
      `qr_code_index_prefix_package_real` varchar(1) NOT NULL DEFAULT 'Y'  ,
      `is_show_sidebar` boolean NOT NULL DEFAULT false  ,
      `is_technical` boolean NOT NULL DEFAULT false  ,
      `is_logo_on_tem` boolean NOT NULL DEFAULT false  ,
      `is_system` boolean NOT NULL DEFAULT false  COMMENT 'true.Doanh nghiệp do hệ thống sinh ra.Do cập nhật từ các nguồn để lấy thông tin truy xuất.Thông tin chưa câp nhật đầy đủ' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_confirm` boolean NOT NULL DEFAULT false  COMMENT 'Trạng thái xác nhận' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `user_render_gcp` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo mã gcp' ,
      `user_confirm` char(36) NULL DEFAULT NULL  COMMENT 'Nguời duyệt' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về doanh nghiệp';

CREATE TABLE `enterprise_category_links` (
      `id` char(36) NOT NULL   ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `category_id` char(36) NULL DEFAULT NULL  COMMENT 'Id danh mục doanh nghiệp' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Mối quan hệ doanh nghiệp và danh mục';

CREATE TABLE `enterprise_field_of_activities` (
      `id` char(36) NOT NULL   ,
      `field_of_activity_id` integer NOT NULL   COMMENT 'Id lĩnh vực hoạt động' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Mối quan hệ Doanh nghiệp/Lĩnh vực hoạt động';

CREATE TABLE `enterprise_industries` (
      `id` char(36) NOT NULL   ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `industry_id` char(36) NOT NULL   COMMENT 'Id ngành' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Mối quan hệ Doanh nghiệp/Các ngành';

CREATE TABLE `enterprise_profiles` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên hồ sơ' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `type` enum('legal', 'communication_promotion', 'location', 'staff_production_households', 'agents_distribution') NOT NULL DEFAULT 'legal'  COMMENT 'Loại hồ sơ' ,
      `enterprise_id` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về hồ sơ doanh nghiệp';

CREATE TABLE `locations` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `public_info` text NULL DEFAULT NULL  COMMENT 'Thông tin public' ,
      `qty` varchar(255) NULL DEFAULT NULL  COMMENT 'Sản lượng nếu là vùng sản xuất' ,
      `acreage` varchar(255) NULL DEFAULT NULL  COMMENT 'Diện tích vùng sản xuất' ,
      `open_time` varchar(50) NULL DEFAULT NULL  COMMENT 'Thời gian mở cửa hàng ngày' ,
      `open_always` boolean NOT NULL DEFAULT true  COMMENT 'Mở cửa 24/24 hay sản xuất liên tục' ,
      `address` varchar(255) NULL DEFAULT NULL  COMMENT 'Địa chỉ' ,
      `gln` char(36) NULL DEFAULT NULL  COMMENT 'Mã địa chỉ GS1/GTIN/GTIN-13 tham chiếu đến bảng gs1_gln' ,
      `type` enum('enterprise', 'warehouse','production_area', 'factory', 'branch', 'office', 'store', 'market', 'super_market', 'harbor', 'village', 'fishing_ground','other') NOT NULL DEFAULT 'warehouse'  COMMENT 'Đối tượng áp dụng' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `user_manager` char(36) NULL DEFAULT NULL  COMMENT 'Người quản lý/chủ' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin vị trí/địa điểm của doanh nghiệp';

CREATE TABLE `location_staff` (
      `id` char(36) NOT NULL   ,
      `location_id` integer NOT NULL   COMMENT 'Id vị trí' ,
      `staff_id` char(36) NOT NULL   COMMENT 'Id nhân viên' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Mối quan hệ vị trí/địa điểm và nhân viên';

CREATE TABLE `departments` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Cha' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `manager_id` char(36) NULL DEFAULT NULL  COMMENT 'Trưởng phòng' ,
      `deputy_manager_id` char(36) NULL DEFAULT NULL  COMMENT 'Phó phòng' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin phòng ban';

CREATE TABLE `staff` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `username` varchar(100) NULL DEFAULT NULL  COMMENT 'Tài khoản' ,
      `name` varchar(100) NULL DEFAULT NULL  COMMENT 'Tên tài khoản' ,
      `full_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Họ và tên' ,
      `first_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `last_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Họ' ,
      `password` varchar(100) NULL DEFAULT NULL  COMMENT 'Mật khẩu' ,
      `password_old` text NULL DEFAULT NULL  COMMENT 'Mật khẩu' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `email` varchar(100) NULL DEFAULT NULL  COMMENT 'Email' ,
      `phone` varchar(50) NULL DEFAULT NULL  COMMENT 'Điện thoại' ,
      `address` varchar(255) NULL DEFAULT NULL  COMMENT 'Địa chỉ' ,
      `gender` enum('male','female','other') NULL DEFAULT NULL  COMMENT 'Giới tính' ,
      `position` enum('boss','manager','deputy','staff', 'other') NULL DEFAULT NULL  COMMENT 'Chức vụ' ,
      `position_text` varchar(100) NULL DEFAULT NULL  COMMENT 'Chức vụ' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `remember_token` boolean NOT NULL DEFAULT true  ,
      `position_hidden` enum('boss','represent','boss_represent', 'none') NOT NULL DEFAULT 'none'  COMMENT 'boss.Chủ doanh nghiệp/represent.Người đại diện/boss_represent.Chủ doanh nghiệp kiêm người đại diện/none.Nhân viên' ,
      `system_type` enum('default','staff','enterprise') NULL DEFAULT 'default'  COMMENT 'Loại nhân viên' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `department_id` char(36) NULL DEFAULT NULL  COMMENT 'Phòng ban' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_protected` boolean NOT NULL DEFAULT false  COMMENT 'Thông tin về hồ sơ nhân viên được bảo vệ' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin nhân viên';

CREATE TABLE `staff_role_permissions` (
      `id` char(36) NOT NULL   ,
      `staff_id` char(36) NOT NULL   COMMENT 'Id nhân viên' ,
      `role_permission_id` char(36) NULL DEFAULT NULL  COMMENT 'Id role' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='';

CREATE TABLE `files` (
      `id` char(36) NOT NULL   ,
      `file` varchar(255) NOT NULL   COMMENT 'Đường dẫn file' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'Đường dẫn file ảnh tối ưu' ,
      `type` enum('image','document','video', 'audio') NOT NULL DEFAULT 'image'  COMMENT 'Loại file' ,
      `notes` text NULL DEFAULT NULL  ,
      `apply` varchar(25) NOT NULL DEFAULT 'file'  COMMENT 'Xác định là file dùng cho mục đích nào' ,
      `enterprise_id` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp' ,
      `is_temp` boolean NOT NULL DEFAULT false  COMMENT 'Xác định là file tam hay không/Đối với file editor' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về  tập tin sử dụng';

CREATE TABLE `documents` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên tài liệu' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `type` enum('contract', 'document', 'law', 'certification', 'business_license', 'order', 'other') NOT NULL DEFAULT 'document'  COMMENT 'Loại tài liệu/contract.Hợp đồng/document.Tài liệu/law.Văn bản luật-Quy định/certification.Giấy chứng nhận/business_license.Giấy phép kinh doanh/order.Đơn hàng/other.Khác' ,
      `gdti` varchar(30) NULL DEFAULT NULL  COMMENT 'GS1 Mã toàn cầu phân định loại tài liệu/GS1 Global Document Type Identifier' ,
      `enterprise_id` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp' ,
      `for_a` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp A' ,
      `for_b` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp B' ,
      `for_c` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp C' ,
      `for_a_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên doanh nghiệp A' ,
      `for_b_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên doanh nghiệp B' ,
      `for_c_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên doanh nghiệp C' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `file` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về tài liệu, chứng nhận, hợp đồng, văn bản, hợp quy, quy chuẩn...,';

CREATE TABLE `agriculture_ingredient_categories` (
      `id` char(36) NOT NULL   ,
      `code` varchar(50) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên danh mục thuốc bảo vệ thực vật/Thuốc thú y/Phân bón/Thức ăn chăn nuôi' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn danh mục thuốc bảo vệ thực vật/Thuốc thú y/Phân bón/Thức ăn chăn nuôi' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả danh mục thuốc bảo vệ thực vật/Thuốc thú y/Phân bón/Thức ăn chăn nuôi' ,
      `notes` text NULL DEFAULT NULL  ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Danh mục cha' ,
      `type` enum('pesticides','veterinary_medicine','fertilizer','animal_feed') NOT NULL DEFAULT 'pesticides'  COMMENT 'pesticides.Thuốc bảo vệ thực vật/veterinary_medicine.Thuốc thú y/fertilizer.Phân bón/animal_feed.Thức ăn chăn nuôi' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Danh mục thuốc bảo vệ thực vật/Thuốc thú y/Phân bón/Thức ăn chăn nuôi(Nguyên vật liệu sản xuất NN)';

CREATE TABLE `agriculture_ingredients` (
      `id` char(36) NOT NULL   ,
      `type` enum('pesticides','veterinary_medicine','fertilizer','animal_feed') NOT NULL DEFAULT 'pesticides'  COMMENT 'pesticides.Thuốc bảo vệ thực vật/veterinary_medicine.Thuốc thú y/fertilizer.Phân bón/animal_feed.Thức ăn chăn nuôi' ,
      `code` varchar(50) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên thuốc bảo vệ thực vật/Thuốc thú y/Phân bón/Thức ăn chăn nuôi' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn thuốc bảo vệ thực vật/Thuốc thú y/Phân bón/Thức ăn chăn nuôi' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả thuốc bảo vệ thực vật/Thuốc thú y/Phân bón/Thức ăn chăn nuôi' ,
      `notes` text NULL DEFAULT NULL  ,
      `wiki` varchar(255) NULL DEFAULT NULL  COMMENT 'Link trên Wiki' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Thuốc bảo vệ thực vật/Thuốc thú y/Phân bón/Thức ăn chăn nuôi(Nguyên vật liệu sản xuất NN)';

CREATE TABLE `agriculture_ingredient_category_links` (
      `id` char(36) NOT NULL   ,
      `ingredient_id` char(36) NOT NULL   COMMENT 'Id sản phẩm nông nghiệp' ,
      `category_id` char(36) NULL DEFAULT NULL  COMMENT 'Id danh mục sản phẩm nông nghiệp' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Hồ sơ/Mối quan hệ giữa danh mục và sản phẩm nông nghiệp';

CREATE TABLE `agriculture_product_categories` (
      `id` char(36) NOT NULL   ,
      `code` varchar(50) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên danh mục sản phẩm nông nghiệp' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn danh mục sản phẩm nông nghiệp' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả danh mục sản phẩm nông nghiệp' ,
      `notes` text NULL DEFAULT NULL  ,
      `type` enum('plant','animal') NOT NULL DEFAULT 'animal'  COMMENT 'Thực vật hay động vật' ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Danh mục cha' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Hồ sơ/Danh mục sản phẩm nông nghiệp';

CREATE TABLE `agriculture_products` (
      `id` char(36) NOT NULL   ,
      `code` varchar(50) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên sản phẩm nông nghiệp' ,
      `science_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên khoa hoc' ,
      `slug` varchar(255) NULL DEFAULT NULL  COMMENT 'slug' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn sản phẩm nông nghiệp' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả sản phẩm nông nghiệp' ,
      `notes` text NULL DEFAULT NULL  ,
      `wiki` varchar(255) NULL DEFAULT NULL  COMMENT 'Link sản phẩm nông nghiệp trên Wiki' ,
      `type` enum('plant','animal') NOT NULL DEFAULT 'animal'  COMMENT 'Thực vật hay động vật' ,
      `live` enum('land','underwater', 'amphibians') NOT NULL DEFAULT 'land'  COMMENT 'Nơi sống/land.Trên cạn/amphibians.Dưới nước/amphibians.Lưỡng cư' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Hồ sơ/Sản phẩm nông nghiệp';

CREATE TABLE `agriculture_product_category_links` (
      `id` char(36) NOT NULL   ,
      `product_id` char(36) NOT NULL   COMMENT 'Id sản phẩm nông nghiệp' ,
      `category_id` char(36) NULL DEFAULT NULL  COMMENT 'Id danh mục sản phẩm nông nghiệp' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Hồ sơ/Mối quan hệ giữa danh mục và sản phẩm nông nghiệp';

CREATE TABLE `pandemic_categories` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên danh mục hồ sơ dịch bệnh' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Danh mục cha' ,
      `type` enum('plant','animal') NOT NULL DEFAULT 'animal'  COMMENT 'Thực vật hay động vật' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin danh mục hồ sơ dịch bệnh';

CREATE TABLE `pandemics` (
      `id` char(36) NOT NULL   ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên dịch bệnh' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `wiki` varchar(255) NULL DEFAULT NULL  COMMENT 'Link trên Wiki' ,
      `type` enum('plant','animal') NOT NULL DEFAULT 'animal'  COMMENT 'Thực vật hay động vật' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin hồ sơ dịch bệnh';

CREATE TABLE `pandemic_category_links` (
      `id` char(36) NOT NULL   ,
      `pandemic_id` char(36) NOT NULL   COMMENT 'Id hồ sơ dịch bệnh' ,
      `category_id` char(36) NULL DEFAULT NULL  COMMENT 'Id danh mục hồ sơ dịch bệnh' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Mối quan hệ giữa danh mục và hồ sơ dịch bệnh';

CREATE TABLE `natural_events` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `type` enum('disaster','pandemic') NOT NULL DEFAULT 'disaster'  COMMENT 'disaster.Thiên tai/pandemic.Dịch bệnh' ,
      `datetime` datetime NULL DEFAULT NULL  COMMENT 'Ngày diễn ra sự kiện' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `production_area_id` char(36) NULL DEFAULT NULL  COMMENT 'Id của vùng sản xuất nếu có' ,
      `qr_code_package_id` char(36) NULL DEFAULT NULL  COMMENT 'Id qr_code_package' ,
      `qr_code_id` char(36) NULL DEFAULT NULL  COMMENT 'Id qr_code' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Sự kiện thiên tai, dịch bệnh, thảm họa/Sự kiện tự nhiên';

CREATE TABLE `plans` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã lệnh sản xuất' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên lệnh sản xuất' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn lệnh sản xuất' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả lệnh sản xuất' ,
      `notes` text NULL DEFAULT NULL  ,
      `date_start` datetime NULL DEFAULT NULL  COMMENT 'Ngày dự kiến băt đầu sản xuất' ,
      `date_end` datetime NULL DEFAULT NULL  COMMENT 'Ngày dự kiến kết thúc sản xuất' ,
      `date_start_real` datetime NULL DEFAULT NULL  COMMENT 'Ngày thực tế băt đầu sản xuất' ,
      `date_end_real` datetime NULL DEFAULT NULL  COMMENT 'Ngày thực tế kết thúc sản xuất' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `staff_id` char(36) NULL DEFAULT NULL  COMMENT 'Người lên kế hoạch' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='LenhSanXuat/Lệnh sản xuất/Kế hoach sản xuất';

CREATE TABLE `plan_products` (
      `id` char(36) NOT NULL   ,
      `plan_id` char(36) NOT NULL   COMMENT 'Id kế hoạch' ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id sản phẩm' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Các sản phẩm của kế hoạch';

CREATE TABLE `plan_orders` (
      `id` char(36) NOT NULL   ,
      `plan_id` char(36) NOT NULL   COMMENT 'Id kế hoạch' ,
      `order_id` char(36) NULL DEFAULT NULL  COMMENT 'Id đơn hàng' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Các đơn hàng của kế hoạch';

CREATE TABLE `plan_locations` (
      `id` char(36) NOT NULL   ,
      `plan_id` char(36) NOT NULL   COMMENT 'Id kế hoạch' ,
      `location_id` char(36) NULL DEFAULT NULL  COMMENT 'Id địa điểm' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Các vùng canh tác/nuôi trồng/sản xuất/đánh bắt của kế hoạch';

CREATE TABLE `plan_staff` (
      `id` char(36) NOT NULL   ,
      `plan_id` char(36) NOT NULL   COMMENT 'Id kế hoạch' ,
      `staff_id` char(36) NULL DEFAULT NULL  COMMENT 'Id nhân viên' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `notes` varchar(255) NULL DEFAULT NULL  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Vai trò của các nhân viên trong kế hoạch';

CREATE TABLE `categories` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên danh mục' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `type` enum('agriculture', 'medical', 'science', 'trade', 'other') NOT NULL DEFAULT 'other'  COMMENT 'medical.Bộ y tế/agriculture.Bộ nông nghiệp và phát triển nông thôn/science.Bộ khoa học và công nghệ/trade.Bộ công thương/other.Khác' ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Danh mục cha' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `can_select` boolean NOT NULL DEFAULT true  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về danh mục';

CREATE TABLE `products` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `slug` varchar(255) NULL DEFAULT NULL  COMMENT 'slug' ,
      `sku` varchar(100) NULL DEFAULT NULL  COMMENT 'Sku' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `public_info` text NULL DEFAULT NULL  COMMENT 'Thông tin public' ,
      `price` float NULL DEFAULT NULL  ,
      `type` enum('product','service') NOT NULL DEFAULT 'product'  COMMENT 'Sản phẩm hay dịch vụ' ,
      `type_gtin` enum('GTIN-8','GTIN-12','GTIN-13', 'GTIN-14') NULL DEFAULT NULL  COMMENT 'Loại mã sản phẩm' ,
      `gtin` varchar(14) NULL DEFAULT NULL  COMMENT 'Mã sản phẩm GS1' ,
      `gsrn` varchar(18) NULL DEFAULT NULL  COMMENT 'Mã sản phẩm GS1/Mã toàn cầu phân định quan hệ dịch vụ' ,
      `sgtin_index` bigint NOT NULL DEFAULT 0  ,
      `qr_code_index` bigint NOT NULL DEFAULT 0  ,
      `enterprise_id` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp' ,
      `procedure_id` char(36) NULL DEFAULT NULL  COMMENT 'Id quy trình sản xuất/tiêu chuẩn sản xuất' ,
      `is_procedure_trash` boolean NOT NULL DEFAULT true  ,
      `agriculture_product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id hồ sơ chi tiết về sản phảm' ,
      `production_process_id` char(36) NULL DEFAULT NULL  COMMENT 'Id quy trình' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về sản phẩm';

CREATE TABLE `product_categories` (
      `id` char(36) NOT NULL   ,
      `product_id` char(36) NOT NULL   COMMENT 'Id sản phẩm' ,
      `category_id` char(36) NOT NULL   COMMENT 'Id danh mục' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin mối quan hệ sản phẩm và danh mục';

CREATE TABLE `product_materials` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `notes` varchar(255) NULL DEFAULT NULL  ,
      `product_id` char(36) NOT NULL   COMMENT 'Id sản phẩm' ,
      `source_id` char(36) NULL DEFAULT NULL  COMMENT 'Id sản phẩm nguyên liệu' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về quan hệ sản phẩm và nguyên liệu đầu vào/Tổng hợp sản phẩm';

CREATE TABLE `product_qr_code_indices` (
      `id` char(36) NOT NULL   ,
      `product_id` char(36) NOT NULL   COMMENT 'Id sản phẩm' ,
      `number` bigint NOT NULL DEFAULT 1  COMMENT 'Mã nhảy' ,
      `year` integer NULL DEFAULT 2023  COMMENT 'Giành cho sản phẩm chưa xác định/doanh nghiệp chưa xác định' ,
      `symbol` varchar(2) NULL DEFAULT NULL  COMMENT 'Ký tự phân định giành cho sản phẩm chưa xác định/doanh nghiệp chưa xác định' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về chỉ số index cho product và mã đinh danh';

CREATE TABLE `product_packages` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã lô sản phẩm' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên lô sản phẩm' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả lô sản phẩm' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả lô sản phẩm' ,
      `position` integer NULL DEFAULT NULL  ,
      `notes` text NULL DEFAULT NULL  ,
      `public_info` text NULL DEFAULT NULL  ,
      `price` float NULL DEFAULT NULL  ,
      `qty_unit` enum('pcs', 'box','package', 'pipe', 'bar') NULL DEFAULT NULL  COMMENT 'Đơn vị của số lượng' ,
      `qty` integer NULL DEFAULT NULL  COMMENT 'Số lượng' ,
      `size_unit` enum('mm','cm','m') NULL DEFAULT NULL  COMMENT 'Đơn vị của kích thước' ,
      `size` varchar(100) NULL DEFAULT NULL  COMMENT 'Kich thước gói hàng' ,
      `weight_unit` enum('g','kg','ton') NULL DEFAULT NULL  COMMENT 'Đơn vị của trọng lượng' ,
      `weight` varchar(100) NULL DEFAULT NULL  COMMENT 'Trọng lượng gói hàng' ,
      `sgtin` varchar(30) NULL DEFAULT NULL  COMMENT 'Mã lô sản phẩm GS1/SGTIN' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `product_id` char(36) NOT NULL   COMMENT 'Id sản phẩm' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về lô sản phẩm';

CREATE TABLE `orders` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã đơn hàng' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên đơn hàng' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `payment` varchar(255) NULL DEFAULT NULL  ,
      `shipping` varchar(255) NULL DEFAULT NULL  ,
      `payment_notes` text NULL DEFAULT NULL  ,
      `shipping_notes` text NULL DEFAULT NULL  ,
      `discount` float NULL DEFAULT NULL  COMMENT 'Giảm giá' ,
      `discount_type` enum('persen','real') NULL DEFAULT NULL  COMMENT 'Loại hình giảm giá' ,
      `discount_code` float NULL DEFAULT NULL  COMMENT 'Mã giảm giá' ,
      `voucher` varchar(255) NULL DEFAULT NULL  COMMENT 'Voucher' ,
      `status` tinyint(1) NULL DEFAULT 1  COMMENT 'Trạng thái đơn hàng/0.Đã hủy/1.Mới tạo/2.Đã duyệt/3.Lên kế hoach sản xuất/4.Đang sản xuất/5.Đã sản xuất/6.Đang giao/7.Trả lại/8.Đã trả lại/9.Đã hoàn thành' ,
      `staff_id` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo đơn' ,
      `enterprise_id` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp' ,
      `enterprise_id_owner_current` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp thực thi' ,
      `document_id` char(36) NULL DEFAULT NULL  COMMENT 'Tham chiếu tới hợp đồng' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về đơn hàng';

CREATE TABLE `order_items` (
      `id` char(36) NOT NULL   ,
      `order_id` char(36) NULL DEFAULT NULL  COMMENT 'Id đơn hàng' ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id sản phẩm' ,
      `package_id` char(36) NULL DEFAULT NULL  COMMENT 'Id lô sản phẩm' ,
      `qty` integer NOT NULL   COMMENT 'Số lượng sản phẩm' ,
      `price` float NULL DEFAULT NULL  COMMENT 'Đơn giá' ,
      `type` enum('package','product') NOT NULL DEFAULT 'product'  COMMENT 'Lô hay sản phẩm' ,
      `discount` float NULL DEFAULT NULL  COMMENT 'Giảm giá' ,
      `discount_type` enum('persen','real') NULL DEFAULT 'real'  COMMENT 'Loại hình giảm giá' ,
      `discount_code` float NULL DEFAULT NULL  COMMENT 'Mã giảm giá' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về chi tiết đơn hàng';

CREATE TABLE `transfers` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã đơn hàng' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên đơn hàng' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `enterprise_id` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp' ,
      `order_id` char(36) NULL DEFAULT NULL  COMMENT 'Di chuyển theo đơn hàng' ,
      `date_start` datetime NULL DEFAULT NULL  COMMENT 'Ngày dự kiến băt đầu di chuyển' ,
      `date_end` datetime NULL DEFAULT NULL  COMMENT 'Ngày dự kiến kết thúc di chuyển' ,
      `date_start_real` datetime NULL DEFAULT NULL  COMMENT 'Ngày thực tế băt đầu di chuyển' ,
      `date_end_real` datetime NULL DEFAULT NULL  COMMENT 'Ngày thực tế kết thúc di chuyển' ,
      `status` enum('new','done', 'cancel') NULL DEFAULT 'new'  COMMENT 'Trạng thái' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về sự di chuyển sản phẩm trong hệ thống';

CREATE TABLE `transfer_items` (
      `id` char(36) NOT NULL   ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id sản phẩm' ,
      `package_id` char(36) NULL DEFAULT NULL  COMMENT 'Id lô sản phẩm' ,
      `qty` integer NOT NULL   COMMENT 'Số lượng sản phẩm' ,
      `transfer_id` char(36) NULL DEFAULT NULL  COMMENT 'Tham chiếu tới bảng di chuyển' ,
      `tranporter_id` char(36) NULL DEFAULT NULL  COMMENT 'Id người vận chuyển' ,
      `tranporter_name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên người vận chuyển' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về chi tiết sự di chuyển sản phẩm trong hệ thống';

CREATE TABLE `qr_codes` (
      `id` char(36) NOT NULL   ,
      `public` varchar(24) NOT NULL   ,
      `secret` varchar(24) NULL DEFAULT NULL  COMMENT 'Tem bí mật' ,
      `serial` varchar(50) NOT NULL   ,
      `notes` text NULL DEFAULT NULL  ,
      `input_type` enum('default','custom','quick') NOT NULL DEFAULT 'default'  COMMENT 'Kiểu nhập dữ liệu' ,
      `date_of_manufacture` date NULL DEFAULT NULL  COMMENT 'Ngày sản xuất' ,
      `expiry_date` date NULL DEFAULT NULL  COMMENT 'Hạn sử dụng' ,
      `counter` bigint NOT NULL DEFAULT 0  ,
      `is_scanned` boolean NOT NULL DEFAULT false  ,
      `scanned_time` datetime NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `qr_code_package_id` char(36) NOT NULL   COMMENT 'Id Qr Code Package' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về qr code';

CREATE TABLE `qr_code_packages` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên lô mã' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn lô mã' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả lô mã' ,
      `notes` text NULL DEFAULT NULL  ,
      `qty` bigint NOT NULL DEFAULT 1  COMMENT 'Số lượng tem' ,
      `type` enum('public','secret') NOT NULL DEFAULT 'secret'  COMMENT 'Loại lô mã' ,
      `apply_for` enum('product','package') NOT NULL DEFAULT 'product'  COMMENT 'Áp dụng cho sản phẩm hay lô sản phẩm' ,
      `date_of_manufacture` date NULL DEFAULT NULL  COMMENT 'Ngày sản xuất' ,
      `expiry_date` date NULL DEFAULT NULL  COMMENT 'Hạn sử dụng' ,
      `expected_date_of_stamping` date NULL DEFAULT NULL  COMMENT 'Ngày dự kiến dán tem' ,
      `plan_id` char(36) NULL DEFAULT NULL  COMMENT 'Id kế hoạch hàng' ,
      `config` text NULL DEFAULT NULL  COMMENT 'Cấu hình cho nhập nguyên liệu' ,
      `object_id` char(36) NOT NULL   COMMENT 'Id của sản phẩm hoặc Id của lô sản phẩm' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về qr code package';

CREATE TABLE `qr_code_materials` (
      `id` char(36) NOT NULL   ,
      `qr_code_id` char(36) NOT NULL   COMMENT 'Id qr code' ,
      `product_material_id` char(36) NOT NULL   COMMENT 'Id nguyên liệu' ,
      `qr_code_reference` varchar(30) NULL DEFAULT NULL  COMMENT 'Qr Code tham chiếu' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu quan hệ về qr code và nguyên liệu';

CREATE TABLE `gs1_countries` (
      `id` int NOT NULL   ,
      `code` varchar(3) NOT NULL   COMMENT 'Mã quốc gia GS1' ,
      `notes` text NULL DEFAULT NULL  ,
      `country_id` integer NOT NULL   COMMENT 'Id quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về tiền tố mã quốc gia GS1';

CREATE TABLE `gs1_glns` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `gln` varchar(13) NULL DEFAULT NULL  COMMENT 'Mã gln GS1/GTIN/GTIN-13' ,
      `longitude` float NULL DEFAULT NULL  COMMENT 'Kinh độ' ,
      `latitude` float NULL DEFAULT NULL  COMMENT 'Vĩ độ độ' ,
      `address` varchar(255) NOT NULL   COMMENT 'Địa chỉ nhập' ,
      `type` enum('enterprise', 'warehouse','production_area', 'factory', 'branch', 'office', 'store', 'market', 'super_market', 'harbor', 'village', 'fishing_ground','other') NOT NULL DEFAULT 'warehouse'  COMMENT 'Đối tượng áp dụng' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `enterprise_id` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `staff_id` char(36) NULL DEFAULT NULL  COMMENT 'Id nhân viên' ,
      `country_id` integer NULL DEFAULT NULL  COMMENT 'Id quốc gia' ,
      `province_id` integer NULL DEFAULT NULL  COMMENT 'Id tỉnh' ,
      `district_id` integer NULL DEFAULT NULL  COMMENT 'Id quận/huyện' ,
      `ward_id` integer NULL DEFAULT NULL  COMMENT 'Id xã/phường' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về mã gln/GTIN-13';

CREATE TABLE `gs1_ssccs` (
      `id` char(36) NOT NULL   ,
      `sscc` varchar(18) NOT NULL   COMMENT 'Mã sscc' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id của sản phẩm' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `reason_for_not_using` varchar(255) NULL DEFAULT NULL  COMMENT 'Lý do hủy' ,
      `status` boolean NOT NULL DEFAULT true  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về mã sscc';

CREATE TABLE `gs1_grai_prefixes` (
      `id` char(36) NOT NULL   ,
      `grai_prefix_index` varchar(50) NOT NULL DEFAULT '65|65|65|65|65|64'  COMMENT 'GRAI-Prefix' ,
      `grai_prefix` varchar(13) NOT NULL   COMMENT 'Tiền tố mã grai(GTIN-13)' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id của sản phẩm' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='GRAI-Prefix/Loại tài sản công ty';

CREATE TABLE `gs1_grais` (
      `id` char(36) NOT NULL   ,
      `grai` varchar(30) NOT NULL   COMMENT 'Mã grai' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `grai_prefix` char(36) NULL DEFAULT NULL  COMMENT 'Id của GRAI prefix' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `reason_for_not_using` varchar(255) NULL DEFAULT NULL  COMMENT 'Lý do hủy' ,
      `status` boolean NOT NULL DEFAULT true  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về mã grai/base on GTIN-13 + X1 thay đổi X16';

CREATE TABLE `gs1_giais` (
      `id` char(36) NOT NULL   ,
      `giai` varchar(30) NOT NULL   COMMENT 'Mã giai' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id của sản phẩm' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `reason_for_not_using` varchar(255) NULL DEFAULT NULL  COMMENT 'Lý do hủy' ,
      `status` boolean NOT NULL DEFAULT true  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về mã giai';

CREATE TABLE `gs1_epcis` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `link` varchar(255) NULL DEFAULT NULL  COMMENT 'Link mô tả chi tiết' ,
      `type` enum('product-make','package-make','history', 'import', 'export', 'transfer', 'order', 'ship', 'plan', 'other') NOT NULL DEFAULT 'plan'  COMMENT 'Đối tượng áp dụng' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `history` text NULL DEFAULT NULL  COMMENT 'History' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `date_time_view` datetime NULL DEFAULT NULL  COMMENT 'Thời gian giành cho hiển thị' ,
      `sscc` char(36) NULL DEFAULT NULL  COMMENT 'Id mã sscc' ,
      `gln` char(36) NULL DEFAULT NULL  COMMENT 'Id mã gln' ,
      `grai` char(36) NULL DEFAULT NULL  COMMENT 'Id mã grai' ,
      `giai` char(36) NULL DEFAULT NULL  COMMENT 'Id mã giai' ,
      `gdti` char(36) NULL DEFAULT NULL  COMMENT 'Id mã gdti' ,
      `qr_code_id` char(36) NULL DEFAULT NULL  COMMENT 'Id mã định danh' ,
      `qr_code_package_id` char(36) NULL DEFAULT NULL  COMMENT 'Id lô mã định danh' ,
      `staff_id` char(36) NULL DEFAULT NULL  COMMENT 'Id nhân viên' ,
      `plan_id` char(36) NULL DEFAULT NULL  COMMENT 'Id kế hoạch' ,
      `order_id` char(36) NULL DEFAULT NULL  COMMENT 'Id đơn hàng' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id của sản phẩm' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin truy vẫn nguồn gốc';

CREATE TABLE `data_syncs` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `name_english` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên tiếng Anh' ,
      `link` varchar(255) NULL DEFAULT NULL  COMMENT 'Link mô tả chi tiết' ,
      `type` varchar(255) NULL DEFAULT NULL  COMMENT 'Loại' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `history` text NULL DEFAULT NULL  COMMENT 'History' ,
      `source` varchar(50) NULL DEFAULT NULL  COMMENT 'Source' ,
      `unit_manage` varchar(50) NULL DEFAULT NULL  COMMENT 'Đơn vị quản lý' ,
      `category` varchar(255) NULL DEFAULT NULL  COMMENT 'Danh mục' ,
      `parent` varchar(255) NULL DEFAULT NULL  ,
      `level` varchar(255) NULL DEFAULT NULL  COMMENT 'Cấp bậc' ,
      `supply` varchar(255) NULL DEFAULT NULL  COMMENT 'Nhà cung cấp' ,
      `phone` varchar(11) NULL DEFAULT NULL  COMMENT 'Phone' ,
      `email` varchar(100) NULL DEFAULT NULL  COMMENT 'Email' ,
      `reason` varchar(255) NULL DEFAULT NULL  COMMENT 'Lý do' ,
      `extra` text NULL DEFAULT NULL  COMMENT 'Tham số thêm' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin dữ liệu được đồng bộ';

CREATE TABLE `contract_types` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên loại hợp đồng' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin loại hợp đồng';

CREATE TABLE `contracts` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `contract_type_id` char(36) NULL DEFAULT NULL  COMMENT 'Id loại hợp đồng' ,
      `customer_id` char(36) NULL DEFAULT NULL  COMMENT 'Id khách hàng' ,
      `staff_id` char(36) NULL DEFAULT NULL  COMMENT 'Id nhân viên' ,
      `date_start` date NULL DEFAULT NULL  COMMENT 'Ngày hợp đồng' ,
      `date_end` date NULL DEFAULT NULL  COMMENT 'Thời hạn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `enterprise_id` char(36) NULL DEFAULT NULL  COMMENT 'Id doanh nghiệp' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về hợp đồng';

CREATE TABLE `system_histories` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `type` varchar(255) NULL DEFAULT NULL  COMMENT 'Loại' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `source` varchar(50) NULL DEFAULT NULL  COMMENT 'Source' ,
      `parent` varchar(255) NULL DEFAULT NULL  ,
      `reason` varchar(255) NULL DEFAULT NULL  COMMENT 'Lý do' ,
      `extra` text NULL DEFAULT NULL  COMMENT 'Tham số thêm' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin lịch sử thay đổi';

CREATE TABLE `networks` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `type` varchar(255) NULL DEFAULT NULL  COMMENT 'Loại' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `parent` varchar(255) NULL DEFAULT NULL  ,
      `extra` text NULL DEFAULT NULL  COMMENT 'Tham số thêm' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin mạng lưới';

CREATE TABLE `procedures` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin quy trình';

CREATE TABLE `procedure_steps` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `title` varchar(255) NULL DEFAULT NULL  COMMENT 'Tiêu đề' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `position` integer NULL DEFAULT NULL  ,
      `procedure_id` char(36) NOT NULL   COMMENT 'Id quy trình' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin các bước của quy trình';

CREATE TABLE `procedure_jobs` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `title` varchar(255) NULL DEFAULT NULL  COMMENT 'Tiêu đề' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `position` integer NULL DEFAULT NULL  ,
      `procedure_step_id` char(36) NOT NULL   COMMENT 'Id bước quy trình' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin các công việc';

CREATE TABLE `production_processes` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `id_reference` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến cổng quốc gia' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin quy trình sản xuất';

CREATE TABLE `production_process_steps` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `title` varchar(255) NULL DEFAULT NULL  COMMENT 'Tiêu đề' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `production_process_id` char(36) NOT NULL   COMMENT 'Id quy trình' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin các bước của quy trình sản xuất';

CREATE TABLE `meta_data_references` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `slug` varchar(100) NULL DEFAULT NULL  COMMENT 'slug' ,
      `namespace` varchar(100) NULL DEFAULT NULL  COMMENT 'namespace' ,
      `partition_key` varchar(100) NULL DEFAULT NULL  COMMENT 'partition_key' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `title` varchar(255) NULL DEFAULT NULL  COMMENT 'Tiêu đề' ,
      `type` varchar(100) NULL DEFAULT NULL  COMMENT 'Loại' ,
      `group` varchar(100) NULL DEFAULT NULL  COMMENT 'group' ,
      `value` varchar(100) NULL DEFAULT NULL  COMMENT 'value' ,
      `extra` text NULL DEFAULT NULL  COMMENT 'Tham số thêm' ,
      `notes` text NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `approved` boolean NOT NULL DEFAULT false  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin data tham chiếu của thông tin quản lý';

CREATE TABLE `meta_data_categories` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `slug` varchar(100) NULL DEFAULT NULL  COMMENT 'slug' ,
      `namespace` varchar(100) NULL DEFAULT NULL  COMMENT 'namespace' ,
      `partition_key` varchar(100) NULL DEFAULT NULL  COMMENT 'partition_key' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `title` varchar(255) NULL DEFAULT NULL  COMMENT 'Tiêu đề' ,
      `type` varchar(100) NULL DEFAULT NULL  COMMENT 'Loại' ,
      `group` varchar(100) NULL DEFAULT NULL  COMMENT 'group' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Cha' ,
      `template_list` varchar(100) NULL DEFAULT NULL  COMMENT 'template list' ,
      `template_form` varchar(100) NULL DEFAULT NULL  COMMENT 'template form' ,
      `icon` varchar(50) NULL DEFAULT NULL  COMMENT 'icon for menu' ,
      `validate` text NULL DEFAULT NULL  COMMENT 'validate' ,
      `extra` text NULL DEFAULT NULL  COMMENT 'Tham số thêm' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `content` text NULL DEFAULT NULL  COMMENT 'Nội dung' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `reference_id` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến bảng tham chiếu' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `show_on_menu` boolean NOT NULL DEFAULT false  ,
      `approved` boolean NOT NULL DEFAULT false  ,
      `is_data` boolean NOT NULL DEFAULT false  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin danh mục thông tin quản lý';

CREATE TABLE `meta_data` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `slug` varchar(100) NULL DEFAULT NULL  COMMENT 'slug' ,
      `namespace` varchar(100) NULL DEFAULT NULL  COMMENT 'namespace' ,
      `partition_key` varchar(100) NULL DEFAULT NULL  COMMENT 'partition_key' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `title` varchar(255) NULL DEFAULT NULL  COMMENT 'Tiêu đề' ,
      `type` varchar(100) NULL DEFAULT NULL  COMMENT 'Loại' ,
      `group` varchar(100) NULL DEFAULT NULL  COMMENT 'group' ,
      `image` varchar(255) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Cha' ,
      `extra` text NULL DEFAULT NULL  COMMENT 'Tham số thêm' ,
      `level_first` varchar(1) NULL DEFAULT NULL  COMMENT 'Cấp 1' ,
      `level_second` varchar(2) NULL DEFAULT NULL  COMMENT 'Cấp 2' ,
      `level_third` varchar(3) NULL DEFAULT NULL  COMMENT 'Cấp 3' ,
      `level_four` varchar(4) NULL DEFAULT NULL  COMMENT 'Cấp 4' ,
      `datetime_first` datetime NULL DEFAULT NULL  COMMENT 'Datetime lưu trữ 1' ,
      `datetime_second` datetime NULL DEFAULT NULL  COMMENT 'Datetime lưu trữ 2' ,
      `datetime_third` datetime NULL DEFAULT NULL  COMMENT 'Datetime lưu trữ 3' ,
      `datetime_four` datetime NULL DEFAULT NULL  COMMENT 'Datetime lưu trữ 4' ,
      `number_first` integer NULL DEFAULT NULL  COMMENT 'integer lưu trữ 1' ,
      `number_second` integer NULL DEFAULT NULL  COMMENT 'integer lưu trữ 2' ,
      `number_third` integer NULL DEFAULT NULL  COMMENT 'integer lưu trữ 3' ,
      `number_four` integer NULL DEFAULT NULL  COMMENT 'integer lưu trữ 4' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `content` text NULL DEFAULT NULL  COMMENT 'Nội dung' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `sscc` char(36) NULL DEFAULT NULL  COMMENT 'Id mã sscc' ,
      `gln` char(36) NULL DEFAULT NULL  COMMENT 'Id mã gln' ,
      `grai` char(36) NULL DEFAULT NULL  COMMENT 'Id mã grai' ,
      `giai` char(36) NULL DEFAULT NULL  COMMENT 'Id mã giai' ,
      `gdti` char(36) NULL DEFAULT NULL  COMMENT 'Id mã gdti' ,
      `qr_code_id` char(36) NULL DEFAULT NULL  COMMENT 'Id mã định danh' ,
      `qr_code_package_id` char(36) NULL DEFAULT NULL  COMMENT 'Id lô mã định danh' ,
      `staff_id` char(36) NULL DEFAULT NULL  COMMENT 'Id nhân viên' ,
      `plan_id` char(36) NULL DEFAULT NULL  COMMENT 'Id kế hoạch' ,
      `order_id` char(36) NULL DEFAULT NULL  COMMENT 'Id đơn hàng' ,
      `enterprise_id` char(36) NOT NULL   COMMENT 'Id doanh nghiệp' ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id của sản phẩm' ,
      `meta_data_category_id` char(36) NULL DEFAULT NULL  COMMENT 'Id category' ,
      `reference_id` char(36) NULL DEFAULT NULL  COMMENT 'Id tham chiếu đến bảng tham chiếu' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'Người tạo' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'Người sửa cuối' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin hệ thống cần quản lý'; 

 ALTER TABLE`core_websites`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`core_websites`
                MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`core_websites`
                ADD UNIQUE (`code`);
ALTER TABLE`core_store_groups`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`core_store_groups`
                MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`core_stores`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`core_stores`
                MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`core_stores`
                ADD UNIQUE (`code`);
ALTER TABLE`settings`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`settings`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`settings`
                ADD UNIQUE (`key`);
ALTER TABLE`menus`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`menus`
                MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`menus`
                ADD UNIQUE (`name`);
ALTER TABLE`menu_items`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`menu_items`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`hashtags`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`hashtags`
                ADD UNIQUE (`hashtag`);
ALTER TABLE`system_types`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`system_types`
                MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`system_types`
                ADD UNIQUE (`key`);
ALTER TABLE`permissions`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`permissions`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`permissions`
                ADD UNIQUE (`key`);
ALTER TABLE`roles`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`roles`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`roles`
                ADD UNIQUE (`key`);
ALTER TABLE`role_permissions`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`role_permissions`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`role_permission_specials`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`role_permission_specials`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`role_groups`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`role_groups`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`role_groups`
                ADD UNIQUE (`name`);
ALTER TABLE`role_group_roles`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`role_group_roles`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`role_group_users`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`role_group_users`
                MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`users`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`countries`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`countries`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`countries`
                ADD UNIQUE (`code`);
ALTER TABLE`countries`
                ADD UNIQUE (`iso2_code`);
ALTER TABLE`countries`
                ADD UNIQUE (`iso3_code`);
ALTER TABLE`countries`
                ADD UNIQUE (`name`);
ALTER TABLE`country_units`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`country_units`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`regions`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`regions`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`provinces`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`provinces`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`districts`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`districts`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`wards`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`wards`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`blog_types`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`blog_types`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`blog_categories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`blog_posts`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`blog_posts`
                ADD UNIQUE (`slug`);
ALTER TABLE`blog_post_categories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`blog_post_comments`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`oauths`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`oauths`
                ADD UNIQUE (`name`);
ALTER TABLE`industries`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`field_of_activities`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`field_of_activities`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`manage_levels`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`manage_levels`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`manage_departments`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`manage_departments`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`enterprise_categories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`enterprise_types`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`enterprise_types`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`enterprise_type_profiles`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`enterprise_type_profiles`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`enterprise_packages`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`enterprise_packages`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`enterprises`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`enterprises`
                ADD UNIQUE (`tax_code`);
ALTER TABLE`enterprise_category_links`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`enterprise_field_of_activities`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`enterprise_industries`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`enterprise_profiles`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`locations`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`location_staff`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`departments`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`staff`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`staff_role_permissions`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`files`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`documents`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`agriculture_ingredient_categories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`agriculture_ingredients`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`agriculture_ingredient_category_links`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`agriculture_product_categories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`agriculture_products`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`agriculture_product_category_links`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`pandemic_categories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`pandemics`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`pandemic_category_links`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`natural_events`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`plans`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`plan_products`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`plan_orders`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`plan_locations`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`plan_staff`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`categories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`products`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`product_categories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`product_materials`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`product_qr_code_indices`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`product_packages`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`orders`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`order_items`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`transfers`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`transfer_items`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`qr_codes`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`qr_codes`
                ADD UNIQUE (`public`);
ALTER TABLE`qr_code_packages`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`qr_code_materials`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`gs1_countries`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`gs1_countries`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`gs1_glns`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`gs1_ssccs`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`gs1_ssccs`
                ADD UNIQUE (`sscc`);
ALTER TABLE`gs1_grai_prefixes`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`gs1_grai_prefixes`
                ADD UNIQUE (`grai_prefix`);
ALTER TABLE`gs1_grais`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`gs1_grais`
                ADD UNIQUE (`grai`);
ALTER TABLE`gs1_giais`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`gs1_giais`
                ADD UNIQUE (`giai`);
ALTER TABLE`gs1_epcis`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`data_syncs`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`contract_types`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`contracts`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`system_histories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`networks`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`procedures`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`procedure_steps`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`procedure_jobs`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`production_processes`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`production_process_steps`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`meta_data_references`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`meta_data_categories`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`meta_data`
                ADD PRIMARY KEY (`id`); 

SET FOREIGN_KEY_CHECKS=1;
COMMIT;