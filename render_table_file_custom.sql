
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- ===================================================================================================================================
DELIMITER ;;
CREATE TRIGGER `blog_posts_before_insert` 
BEFORE INSERT ON `blog_posts` FOR EACH ROW 
BEGIN
  IF new.id IS NULL THEN
    SET new.id = uuid();
  END IF;
END;;
DELIMITER ;

-- ===================================================================================================================================
SET FOREIGN_KEY_CHECKS=1;
COMMIT;