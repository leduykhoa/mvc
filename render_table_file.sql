
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

 CREATE TABLE `settings` (
      `id` int NOT NULL   ,
      `key` varchar(200) NOT NULL   ,
      `value` text NOT NULL   ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `website_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Website Id' ,
      `group_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Group Store Id' ,
      `store_id` tinyint NOT NULL DEFAULT 1  COMMENT 'Store Order' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin cấu hình chung hệ thống';

CREATE TABLE `menus` (
      `id` int NOT NULL   ,
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
      `menu_id` integer NOT NULL   ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin menu item';

CREATE TABLE `permissions` (
      `id` int UNSIGNED NOT NULL   COMMENT 'Id quyền của hệ thống' ,
      `key` varchar(50) NOT NULL DEFAULT 'default'  COMMENT 'key quyền của hệ thống' ,
      `name` varchar(100) NOT NULL DEFAULT 'default'  COMMENT 'Tên quyền của hệ thống' ,
      `description` varchar(255) NULL DEFAULT NULL  COMMENT 'Miêu tả quyền của hệ thống' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quyền của hệ thống';

CREATE TABLE `users` (
      `id` char(36) NOT NULL   ,
      `name` varchar(100) NULL DEFAULT NULL  COMMENT 'name' ,
      `full_name` varchar(255) NULL DEFAULT NULL  COMMENT 'full_name' ,
      `first_name` varchar(255) NULL DEFAULT NULL  COMMENT 'first_name' ,
      `last_name` varchar(255) NULL DEFAULT NULL  COMMENT 'last_name' ,
      `middle_name` varchar(255) NULL DEFAULT NULL  COMMENT 'middle_name' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Description' ,
      `email` varchar(100) NULL DEFAULT NULL  COMMENT 'email' ,
      `email_verified_at` timestamp NULL DEFAULT NULL  ,
      `password` varchar(100) NULL DEFAULT NULL  COMMENT 'password' ,
      `password_old` text NULL DEFAULT NULL  COMMENT 'password old' ,
      `token` text NULL DEFAULT NULL  COMMENT 'token' ,
      `type` enum('system','staff','user') NOT NULL DEFAULT 'user'  COMMENT 'User type' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Table store user of system';

CREATE TABLE `roles` (
      `id` int UNSIGNED NOT NULL   COMMENT 'Id các vai trò của hệ thống' ,
      `key` varchar(50) NOT NULL DEFAULT 'default'  COMMENT 'key các vai trò của hệ thống' ,
      `name` varchar(255) NOT NULL DEFAULT 'default'  COMMENT 'name' ,
      `description` varchar(255) NULL DEFAULT NULL  COMMENT 'Description' ,
      `type` enum('system','staff') NOT NULL DEFAULT 'system'  COMMENT 'Loại vai trò' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các vai trò của hệ thống';

CREATE TABLE `role_permissions` (
      `id` int UNSIGNED NOT NULL   COMMENT 'Id quan hệ vai trò và quyền' ,
      `role_id` integer NOT NULL   COMMENT 'Id vai trò của hệ thống' ,
      `permission_id` integer NOT NULL   COMMENT 'Id quyền của hệ thống' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quan hệ vai trò và quyền';

CREATE TABLE `role_permission_specials` (
      `id` int UNSIGNED NOT NULL   COMMENT 'Id nhóm hệ thống quản trị' ,
      `user_id` char(36) NOT NULL   COMMENT 'Id người dùng hệ thống' ,
      `permission_id` integer NOT NULL   COMMENT 'Id quyền của hệ thống' ,
      `type` enum('allow','deny') NOT NULL DEFAULT 'allow'  COMMENT 'Cho phép hay không' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quyền riêng biệt cho từng user';

CREATE TABLE `role_groups` (
      `id` int UNSIGNED NOT NULL   COMMENT 'Id nhóm hệ thống quản trị' ,
      `key` varchar(50) NOT NULL DEFAULT 'default'  COMMENT 'key nhóm hệ thống quản trị' ,
      `name` varchar(255) NOT NULL DEFAULT 'default'  COMMENT 'Tên nhóm hệ thống quản trị' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả nhóm hệ thống quản trị' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `parent` integer NULL DEFAULT NULL  COMMENT 'Tên nhóm hệ thống quản trị cha' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các nhóm hệ thống quản trị';

CREATE TABLE `role_group_roles` (
      `id` int UNSIGNED NOT NULL   COMMENT 'Id quan hệ nhóm hệ thống quản trị và vai trò' ,
      `role_group_id` integer NOT NULL   COMMENT 'Id nhóm hệ thống quản trị' ,
      `role_id` integer NOT NULL   COMMENT 'Id vai trò của hệ thống' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quan hệ nhóm hệ thống quản trị và vai trò';

CREATE TABLE `role_group_users` (
      `id` bigint UNSIGNED NOT NULL   COMMENT 'Id quan hệ nhóm vai trò và user hệ thống' ,
      `user_id` char(36) NOT NULL   COMMENT 'Id người dùng hệ thống' ,
      `role_group_id` integer NOT NULL   COMMENT 'Id nhóm hệ thống quản trị' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các quan hệ nhóm vai trò và user hệ thống';

CREATE TABLE `countries` (
      `id` int NOT NULL   ,
      `code` varchar(2) NOT NULL   COMMENT 'Mã nước' ,
      `iso2_code` varchar(2) NOT NULL   COMMENT 'Country ISO-2 format' ,
      `iso3_code` varchar(3) NOT NULL   COMMENT 'Country ISO-3 format' ,
      `name` varchar(100) NULL   COMMENT 'Tên nước' ,
      `year` varchar(4) NULL DEFAULT NULL  COMMENT 'Năm thành lập' ,
      `domain` varchar(10) NULL DEFAULT NULL  COMMENT 'Tên domain' ,
      `notes` text NULL DEFAULT NULL  ,
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
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về các xã/phường';

CREATE TABLE `tickets` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   ,
      `email` varchar(100) NULL DEFAULT NULL  ,
      `content` text NULL DEFAULT NULL  ,
      `file` varchar(255) NULL DEFAULT NULL  COMMENT 'Path of file' ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Parent' ,
      `user_support` char(36) NULL DEFAULT NULL  COMMENT 'User support' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Table store ticket';

CREATE TABLE `files` (
      `id` char(36) NOT NULL   ,
      `file` varchar(255) NOT NULL   COMMENT 'Đường dẫn file' ,
      `thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'Đường dẫn file ảnh tối ưu' ,
      `type` enum('image','document','video', 'audio') NOT NULL DEFAULT 'image'  COMMENT 'Loại file' ,
      `notes` text NULL DEFAULT NULL  ,
      `apply` varchar(25) NOT NULL DEFAULT 'file'  COMMENT 'Xác định là file dùng cho mục đích nào' ,
      `is_temp` boolean NOT NULL DEFAULT false  COMMENT 'Xác định là file tam hay không/Đối với file editor' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về file sử dụng';

CREATE TABLE `documents` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên tài liệu' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `type` enum('contract', 'document', 'law', 'certification', 'business_license', 'order', 'other') NOT NULL DEFAULT 'document'  COMMENT 'Loại tài liệu/contract.Hợp đồng/document.Tài liệu/law.Văn bản luật-Quy định/certification.Giấy chứng nhận/business_license.Giấy phép kinh doanh/order.Đơn hàng/other.Khác' ,
      `document` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `file` text NULL DEFAULT NULL  COMMENT 'Document' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về tài liệu, chứng nhận, hợp đồng, văn bản, hợp quy, quy chuẩn...,';

CREATE TABLE `blog_types` (
      `id` int NOT NULL   ,
      `code` varchar(200) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên loại' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `has_category` boolean NOT NULL DEFAULT true  ,
      `show_menu` boolean NOT NULL DEFAULT true  ,
      `show_comment` boolean NOT NULL DEFAULT true  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
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
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
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
      `seo_title` varchar(255) NOT NULL   COMMENT 'Seo title' ,
      `seo_keyword` varchar(255) NULL DEFAULT NULL  COMMENT 'Seo keyword' ,
      `seo_description` text NULL DEFAULT NULL  COMMENT 'Seo mô tả' ,
      `seo_image` varchar(255) NULL DEFAULT NULL  COMMENT 'Seo image' ,
      `seo_thumbnail` varchar(255) NULL DEFAULT NULL  COMMENT 'Seo thumbnail' ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Cha' ,
      `type_id` integer NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
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
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về nhận xét bài viết bài viết';

CREATE TABLE `addresses` (
      `id` char(36) NOT NULL   ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `type` enum('warehouse', 'office', 'store', 'billing', 'shipping') NOT NULL DEFAULT 'warehouse'  COMMENT 'Đối tượng áp dụng' ,
      `notes` text NULL DEFAULT NULL  ,
      `longitude` float NULL DEFAULT NULL  COMMENT 'Kinh độ' ,
      `latitude` float NULL DEFAULT NULL  COMMENT 'Vĩ độ độ' ,
      `address` varchar(255) NOT NULL   COMMENT 'Địa chỉ nhập' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `user_id` char(36) NULL DEFAULT NULL  COMMENT 'Id nhân viên' ,
      `country_id` integer NULL DEFAULT NULL  COMMENT 'Id quốc gia' ,
      `province_id` integer NULL DEFAULT NULL  COMMENT 'Id tỉnh' ,
      `district_id` integer NULL DEFAULT NULL  COMMENT 'Id quận/huyện' ,
      `ward_id` integer NULL DEFAULT NULL  COMMENT 'Id xã/phường' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về địa chỉ của hệ thống';

CREATE TABLE `locations` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `phone` varchar(100) NULL DEFAULT NULL  COMMENT 'Điện thoại' ,
      `open_time` varchar(50) NULL DEFAULT NULL  COMMENT 'Thời gian mở cửa hàng ngày' ,
      `open_always` boolean NOT NULL DEFAULT true  COMMENT 'Mở cửa 24/24 hay sản xuất liên tục' ,
      `type` enum('warehouse', 'branch', 'office', 'store', 'other') NOT NULL DEFAULT 'warehouse'  COMMENT 'Đối tượng áp dụng' ,
      `user_manager` char(36) NULL DEFAULT NULL  COMMENT 'Người quản lý/chủ' ,
      `address_id` char(36) NULL DEFAULT NULL  COMMENT 'Địa chỉ tham chiếu' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin vị trí/địa điểm của doanh nghiệp';

CREATE TABLE `oauths` (
      `id` char(36) NOT NULL   ,
      `name` varchar(100) NOT NULL   COMMENT 'Tên cho tài khoản' ,
      `consumer_key` varchar(100) NOT NULL   COMMENT 'Khóa công khai tài khoản' ,
      `consumer_secret` varchar(255) NOT NULL   COMMENT 'Khóa bí mật tài khoản' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin tài khoản khai thác dữ liệu hệ thống';

CREATE TABLE `brands` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin thương hiệu/nhãn hàng';

CREATE TABLE `categories` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên danh mục' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `position` integer NULL DEFAULT NULL  ,
      `parent` char(36) NULL DEFAULT NULL  COMMENT 'Danh mục cha' ,
      `can_select` boolean NOT NULL DEFAULT true  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về danh mục';

CREATE TABLE `product_sets` (
      `id` int NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về nhóm thuộc tính sản phẩm';

CREATE TABLE `product_attributes` (
      `id` smallint UNSIGNED NOT NULL   COMMENT 'Attribute Id' ,
      `code` varchar(50) NOT NULL   COMMENT 'Attribute Code' ,
      `backend_label` varchar(255) NULL DEFAULT NULL  COMMENT 'Backend Label' ,
      `backend_input` varchar(50) NULL DEFAULT NULL  COMMENT 'Backend Input' ,
      `backend_class` varchar(255) NULL DEFAULT NULL  COMMENT 'Backend Class' ,
      `pattern` varchar(255) NULL DEFAULT NULL  COMMENT 'Pattern' ,
      `default_value` text NULL DEFAULT NULL  COMMENT 'Default Value' ,
      `notes` text NULL DEFAULT NULL  COMMENT 'Note' ,
      `position` integer NULL DEFAULT NULL  ,
      `collection_class` varchar(255) NULL DEFAULT NULL  COMMENT 'Collection table' ,
      `use_for_variant` boolean NOT NULL DEFAULT false  COMMENT 'Use for variant' ,
      `is_required` boolean NOT NULL DEFAULT true  COMMENT 'Defines Is Required' ,
      `is_unique` boolean NOT NULL DEFAULT true  COMMENT 'Defines Is Unique' ,
      `is_single` boolean NOT NULL DEFAULT true  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các thuộc tính của sản phẩm/Eav Attribute';

CREATE TABLE `product_attribute_options` (
      `id` int UNSIGNED NOT NULL   COMMENT 'Id Value' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Name' ,
      `value` varchar(255) NULL DEFAULT NULL  COMMENT 'Value' ,
      `attribute_id` integer NOT NULL   COMMENT 'Id attribute' ,
      `position` integer NULL DEFAULT NULL  ,
      `is_default` boolean NOT NULL DEFAULT false  ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu các giá trị lựa chọn của thuộc tính Attribute Option Value';

CREATE TABLE `product_attribute_sets` (
      `id` int UNSIGNED NOT NULL   ,
      `set_id` char(36) NOT NULL   COMMENT 'Id bộ thuộc tính' ,
      `attribute_id` char(36) NOT NULL   COMMENT 'Id thuộc tính' ,
      `position` integer NULL DEFAULT NULL  COMMENT 'Số thứ tự' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin mối quan hệ giữa nhóm thuộc tính và thuộc tính';

CREATE TABLE `products` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `slug` varchar(255) NULL DEFAULT NULL  COMMENT 'slug' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `review` float NOT NULL DEFAULT 0  COMMENT 'Điểm số review' ,
      `set_id` integer NOT NULL   COMMENT 'Id nhóm thuộc tính' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
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

CREATE TABLE `product_groups` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `slug` varchar(255) NULL DEFAULT NULL  COMMENT 'slug' ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `image` char(36) NULL DEFAULT NULL  COMMENT 'Ảnh' ,
      `thumbnail` char(36) NULL DEFAULT NULL  COMMENT 'thumbnail' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `description_short` varchar(255) NULL DEFAULT NULL  COMMENT 'Mô tả ngắn' ,
      `description` text NULL DEFAULT NULL  COMMENT 'Mô tả' ,
      `notes` text NULL DEFAULT NULL  ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về sản phẩm';

CREATE TABLE `product_group_links` (
      `id` char(36) NOT NULL   ,
      `group_id` char(36) NOT NULL   COMMENT 'Id nhóm sản phẩm' ,
      `product_id` char(36) NOT NULL   COMMENT 'Id sản phẩm' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin mối quan hệ sản phẩm và nhóm';

CREATE TABLE `product_variants` (
      `id` char(36) NOT NULL   ,
      `price` float(12) NULL DEFAULT NULL  COMMENT 'Giá sản phẩm' ,
      `attribute_id` varchar(100) NULL DEFAULT NULL  ,
      `attribute_value` varchar(100) NULL DEFAULT NULL  ,
      `product_id` char(36) NOT NULL   COMMENT 'Id sản phẩm' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin biến thể/giá sản phẩm';

CREATE TABLE `product_variant_values` (
      `id` char(36) NOT NULL   ,
      `product_variant_id` char(36) NOT NULL   COMMENT 'Id sản phẩm biến thể' ,
      `attribute_id` varchar(100) NULL DEFAULT NULL  ,
      `attribute_value` varchar(100) NULL DEFAULT NULL  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin giá trị cấu hình các biến thể/giá sản phẩm';

CREATE TABLE `product_inventories` (
      `id` char(36) NOT NULL   ,
      `qty` integer NOT NULL   COMMENT 'Số lượng sản phẩm' ,
      `product_variant_id` char(36) NOT NULL   COMMENT 'Id sản phẩm biến thể' ,
      `location_id` char(36) NOT NULL   COMMENT 'Id của kho/cửa hàng' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin số lượng sản phẩm theo từng kho';

CREATE TABLE `product_sales` (
      `id` char(36) NOT NULL   ,
      `qty` integer NOT NULL   COMMENT 'Số lượng sản phẩm' ,
      `product_variant_id` char(36) NOT NULL   COMMENT 'Id sản phẩm biến thể' ,
      `product_id` char(36) NOT NULL   COMMENT 'Id sản phẩm' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin số lượng sản phẩm đã bán';

CREATE TABLE `product_reviews` (
      `id` char(36) NOT NULL   ,
      `name` varchar(255) NOT NULL   COMMENT 'Tên' ,
      `comment` text NULL DEFAULT NULL  COMMENT 'comment' ,
      `start` integer NOT NULL   COMMENT 'Rate start' ,
      `gallery` text NULL DEFAULT NULL  COMMENT 'Gallery' ,
      `product_id` char(36) NOT NULL   ,
      `user_approve` char(36) NULL DEFAULT NULL  COMMENT 'Người duyệt' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về nhận xét sản phẩm';

CREATE TABLE `product_values` (
      `id` char(36) NOT NULL   ,
      `product_id` char(36) NOT NULL   COMMENT 'Id sản phẩm' ,
      `attribute_id` char(36) NOT NULL   COMMENT 'Id thuộc tính' ,
      `input` varchar(255) NULL DEFAULT NULL  COMMENT 'Giá trị nhập' ,
      `input_text` text NULL DEFAULT NULL  COMMENT 'Giá trị nhập text' ,
      `option_id` integer NULL DEFAULT NULL  COMMENT 'Id attribute option' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin giá trị của thuộc tính sản phẩm';

CREATE TABLE `carts` (
      `id` char(36) NOT NULL   ,
      `notes` text NULL DEFAULT NULL  ,
      `discount` float NULL DEFAULT NULL  COMMENT 'Giảm giá' ,
      `discount_type` enum('persen','real') NULL DEFAULT NULL  COMMENT 'Loại hình giảm giá' ,
      `discount_code` float NULL DEFAULT NULL  COMMENT 'Mã giảm giá' ,
      `voucher` varchar(255) NULL DEFAULT NULL  COMMENT 'Voucher' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về giỏ hàng';

CREATE TABLE `cart_items` (
      `id` char(36) NOT NULL   ,
      `qty` integer NOT NULL   COMMENT 'Số lượng sản phẩm' ,
      `price` float NULL DEFAULT NULL  COMMENT 'Đơn giá' ,
      `discount` float NULL DEFAULT NULL  COMMENT 'Giảm giá' ,
      `discount_type` enum('persen','real') NULL DEFAULT 'real'  COMMENT 'Loại hình giảm giá' ,
      `discount_code` float NULL DEFAULT NULL  COMMENT 'Mã giảm giá' ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id sản phẩm' ,
      `product_variant_id` char(36) NOT NULL   COMMENT 'Id sản phẩm biến thể' ,
      `attribute` varchar(100) NULL DEFAULT NULL  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về chi tiết từng sản phẩm trong giỏ hàng';

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
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về đơn hàng';

CREATE TABLE `order_items` (
      `id` char(36) NOT NULL   ,
      `qty` integer NOT NULL   COMMENT 'Số lượng sản phẩm' ,
      `price` float NULL DEFAULT NULL  COMMENT 'Đơn giá' ,
      `discount` float NULL DEFAULT NULL  COMMENT 'Giảm giá' ,
      `discount_type` enum('persen','real') NULL DEFAULT 'real'  COMMENT 'Loại hình giảm giá' ,
      `discount_code` float NULL DEFAULT NULL  COMMENT 'Mã giảm giá' ,
      `product_id` char(36) NULL DEFAULT NULL  COMMENT 'Id sản phẩm' ,
      `product_variant_id` char(36) NOT NULL   COMMENT 'Id sản phẩm biến thể' ,
      `attribute` varchar(100) NULL DEFAULT NULL  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về chi tiết đơn hàng';

CREATE TABLE `transfers` (
      `id` char(36) NOT NULL   ,
      `code` varchar(100) NULL DEFAULT NULL  COMMENT 'Mã' ,
      `name` varchar(255) NULL DEFAULT NULL  COMMENT 'Tên' ,
      `type` enum('import','export', 'transfer') NOT NULL DEFAULT 'import'  COMMENT 'Nhập/Xuất/Di chuyển' ,
      `notes` text NULL DEFAULT NULL  ,
      `log` text NULL DEFAULT NULL  ,
      `date_start` datetime NULL DEFAULT NULL  COMMENT 'Ngày dự kiến băt đầu di chuyển' ,
      `date_end` datetime NULL DEFAULT NULL  COMMENT 'Ngày dự kiến kết thúc di chuyển' ,
      `date_start_real` datetime NULL DEFAULT NULL  COMMENT 'Ngày thực tế băt đầu di chuyển' ,
      `date_end_real` datetime NULL DEFAULT NULL  COMMENT 'Ngày thực tế kết thúc di chuyển' ,
      `status` enum('new','approved','moving','done', 'cancel') NULL DEFAULT 'new'  COMMENT 'Trạng thái' ,
      `location_import_id` char(36) NULL DEFAULT NULL  COMMENT 'Id của kho/cửa hàng - nhập' ,
      `location_export_id` char(36) NULL DEFAULT NULL  COMMENT 'Id của kho/cửa hàng - xuất' ,
      `user_create` char(36) NULL DEFAULT NULL  COMMENT 'User create' ,
      `user_update` char(36) NULL DEFAULT NULL  COMMENT 'User edit last' ,
      `user_approved` char(36) NULL DEFAULT NULL  COMMENT 'Người duyệt' ,
      `is_active` boolean NOT NULL DEFAULT true  ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về sự di chuyển sản phẩm trong hệ thống';

CREATE TABLE `transfer_items` (
      `id` char(36) NOT NULL   ,
      `product_variant_id` char(36) NOT NULL   COMMENT 'Id sản phẩm biến thể' ,
      `qty` integer NOT NULL   COMMENT 'Số lượng sản phẩm' ,
      `transfer_id` char(36) NULL DEFAULT NULL  COMMENT 'Tham chiếu tới bảng di chuyển' ,
      `deleted_at` timestamp NULL DEFAULT NULL,
      `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
      `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='Bảng lưu thông tin về chi tiết sự di chuyển sản phẩm trong hệ thống'; 

 ALTER TABLE`settings`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`settings`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`settings`
                ADD UNIQUE KEY`settings_key_unique`(`key`);
ALTER TABLE`menus`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`menus`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`menus`
                ADD UNIQUE KEY`menus_name_unique`(`name`);
ALTER TABLE`menu_items`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`menu_items`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`permissions`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`permissions`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`permissions`
                ADD UNIQUE KEY`permissions_key_unique`(`key`);
ALTER TABLE`users`
                ADD UNIQUE KEY`users_id_unique`(`id`);
ALTER TABLE`roles`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`roles`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`roles`
                ADD UNIQUE KEY`roles_key_unique`(`key`);
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
                ADD UNIQUE KEY`role_groups_name_unique`(`name`);
ALTER TABLE`role_group_roles`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`role_group_roles`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`role_group_users`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`role_group_users`
                MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`countries`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`countries`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`countries`
                ADD UNIQUE KEY`countries_code_unique`(`code`);
ALTER TABLE`countries`
                ADD UNIQUE KEY`countries_iso2_code_unique`(`iso2_code`);
ALTER TABLE`countries`
                ADD UNIQUE KEY`countries_iso3_code_unique`(`iso3_code`);
ALTER TABLE`countries`
                ADD UNIQUE KEY`countries_name_unique`(`name`);
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
ALTER TABLE`tickets`
                ADD UNIQUE KEY`tickets_id_unique`(`id`);
ALTER TABLE`files`
                ADD UNIQUE KEY`files_id_unique`(`id`);
ALTER TABLE`documents`
                ADD UNIQUE KEY`documents_id_unique`(`id`);
ALTER TABLE`blog_types`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`blog_types`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`blog_categories`
                ADD UNIQUE KEY`blog_categories_id_unique`(`id`);
ALTER TABLE`blog_posts`
                ADD UNIQUE KEY`blog_posts_id_unique`(`id`);
ALTER TABLE`blog_post_categories`
                ADD UNIQUE KEY`blog_post_categories_id_unique`(`id`);
ALTER TABLE`blog_post_comments`
                ADD UNIQUE KEY`blog_post_comments_id_unique`(`id`);
ALTER TABLE`addresses`
                ADD UNIQUE KEY`addresses_id_unique`(`id`);
ALTER TABLE`locations`
                ADD UNIQUE KEY`locations_id_unique`(`id`);
ALTER TABLE`oauths`
                ADD UNIQUE KEY`oauths_id_unique`(`id`);
ALTER TABLE`oauths`
                ADD UNIQUE KEY`oauths_name_unique`(`name`);
ALTER TABLE`brands`
                ADD UNIQUE KEY`brands_id_unique`(`id`);
ALTER TABLE`categories`
                ADD UNIQUE KEY`categories_id_unique`(`id`);
ALTER TABLE`product_sets`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`product_sets`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`product_sets`
                ADD UNIQUE KEY`product_sets_id_unique`(`id`);
ALTER TABLE`product_attributes`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`product_attributes`
                MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`product_attribute_options`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`product_attribute_options`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`product_attribute_sets`
                ADD PRIMARY KEY (`id`);
ALTER TABLE`product_attribute_sets`
                MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE`product_attribute_sets`
                ADD UNIQUE KEY`product_attribute_sets_id_unique`(`id`);
ALTER TABLE`products`
                ADD UNIQUE KEY`products_id_unique`(`id`);
ALTER TABLE`product_categories`
                ADD UNIQUE KEY`product_categories_id_unique`(`id`);
ALTER TABLE`product_groups`
                ADD UNIQUE KEY`product_groups_id_unique`(`id`);
ALTER TABLE`product_group_links`
                ADD UNIQUE KEY`product_group_links_id_unique`(`id`);
ALTER TABLE`product_variants`
                ADD UNIQUE KEY`product_variants_id_unique`(`id`);
ALTER TABLE`product_variant_values`
                ADD UNIQUE KEY`product_variant_values_id_unique`(`id`);
ALTER TABLE`product_inventories`
                ADD UNIQUE KEY`product_inventories_id_unique`(`id`);
ALTER TABLE`product_sales`
                ADD UNIQUE KEY`product_sales_id_unique`(`id`);
ALTER TABLE`product_reviews`
                ADD UNIQUE KEY`product_reviews_id_unique`(`id`);
ALTER TABLE`product_values`
                ADD UNIQUE KEY`product_values_id_unique`(`id`);
ALTER TABLE`carts`
                ADD UNIQUE KEY`carts_id_unique`(`id`);
ALTER TABLE`cart_items`
                ADD UNIQUE KEY`cart_items_id_unique`(`id`);
ALTER TABLE`orders`
                ADD UNIQUE KEY`orders_id_unique`(`id`);
ALTER TABLE`order_items`
                ADD UNIQUE KEY`order_items_id_unique`(`id`);
ALTER TABLE`transfers`
                ADD UNIQUE KEY`transfers_id_unique`(`id`);
ALTER TABLE`transfer_items`
                ADD UNIQUE KEY`transfer_items_id_unique`(`id`); 

SET FOREIGN_KEY_CHECKS=1;
COMMIT;