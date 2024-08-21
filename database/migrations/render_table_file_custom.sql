SET FOREIGN_KEY_CHECKS = 0;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET time_zone = "+00:00";

-- -- ===================================================================================================================================\
-- CREATE TABLE `users` (
--     `id` char(36) NOT NULL,
--     `code` varchar(100) NULL DEFAULT NULL COMMENT 'Mã',
--     `username` varchar(100) NULL DEFAULT NULL COMMENT 'Tài khoản',
--     `name` varchar(100) NULL DEFAULT NULL COMMENT 'Tên tài khoản',
--     `full_name` varchar(255) NULL DEFAULT NULL COMMENT 'Họ và tên',
--     `first_name` varchar(255) NULL DEFAULT NULL COMMENT 'Tên',
--     `last_name` varchar(255) NULL DEFAULT NULL COMMENT 'Họ',
--     `password` varchar(100) NULL DEFAULT NULL COMMENT 'Mật khẩu',
--     `password_old` text NULL DEFAULT NULL COMMENT 'Mật khẩu',
--     `image` char(36) NULL DEFAULT NULL COMMENT 'Ảnh',
--     `thumbnail` char(36) NULL DEFAULT NULL COMMENT 'thumbnail',
--     `email` varchar(100) NULL DEFAULT NULL COMMENT 'Email',
--     `phone` varchar(50) NULL DEFAULT NULL COMMENT 'Điện thoại',
--     `address` varchar(255) NULL DEFAULT NULL COMMENT 'Địa chỉ',
--     `gender` enum('male', 'female', 'other') NULL DEFAULT NULL COMMENT 'Giới tính',
--     `position` enum(
--         'boss',
--         'manager',
--         'deputy',
--         'staff',
--         'other'
--     ) NULL DEFAULT NULL COMMENT 'Chức vụ',
--     `position_text` varchar(100) NULL DEFAULT NULL COMMENT 'Chức vụ',
--     `description_short` varchar(255) NULL DEFAULT NULL COMMENT 'Mô tả ngắn',
--     `description` text NULL DEFAULT NULL COMMENT 'Mô tả',
--     `notes` text NULL DEFAULT NULL,
--     `remember_token` boolean NOT NULL DEFAULT true,
--     `gallery` text NULL DEFAULT NULL COMMENT 'Gallery',
--     `document` text NULL DEFAULT NULL COMMENT 'Document',
--     `user_create` char(36) NULL DEFAULT NULL COMMENT 'Người tạo',
--     `user_update` char(36) NULL DEFAULT NULL COMMENT 'Người sửa cuối',
--     `staff_create` char(36) NULL DEFAULT NULL COMMENT 'Nhân viên tạo',
--     `staff_update` char(36) NULL DEFAULT NULL COMMENT 'Nhân viên tạo sửa cuối',
--     `is_protected` boolean NOT NULL DEFAULT false COMMENT 'Thông tin về hồ sơ nhân viên được bảo vệ',
--     `is_active` boolean NOT NULL DEFAULT true,
--     `deleted_at` timestamp NULL DEFAULT NULL,
--     `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create',
--     `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'
-- ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Bảng lưu thông tin nhân viên';
-- ===================================================================================================================================

-- DROP TRIGGER IF EXISTS enterprises_before_insert;
-- CREATE TRIGGER enterprises_before_insert BEFORE INSERT ON  enterprises
--   FOR EACH ROW BEGIN
--     IF NEW.id IS NULL THEN
--       SET NEW.id=UUID();
--     END IF;
--   END;
-- ===================================================================================================================================
-- DROP TRIGGER IF EXISTS blog_posts_before_insert;
-- CREATE TRIGGER blog_posts_before_insert BEFORE INSERT ON blog_posts 
--   FOR EACH ROW BEGIN
--     IF NEW.id IS NULL THEN
--       SET NEW.id=UUID();
--     END IF;
--   END;


-- DROP TRIGGER IF EXISTS enterprises_before_insert;

-- DELIMITER //
-- CREATE TRIGGER enterprises_before_insert BEFORE INSERT ON  enterprises
--   FOR EACH ROW BEGIN
--     IF NEW.id IS NULL THEN
--       SET NEW.id=UUID();
--     END IF;
--   END;//
-- DELIMITER ;
-- -- ===================================================================================================================================
-- DROP TRIGGER IF EXISTS blog_posts_before_insert;
-- DELIMITER //
-- CREATE TRIGGER blog_posts_before_insert BEFORE INSERT ON blog_posts 
--   FOR EACH ROW BEGIN
--     IF NEW.id IS NULL THEN
--       SET NEW.id=UUID();
--     END IF;
--   END;//
-- DELIMITER ;
-- ===================================================================================================================================
SET FOREIGN_KEY_CHECKS = 1;

COMMIT;