/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(500) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(300) NOT NULL,
  `book_description` text,
  `book_img` varchar(300) DEFAULT NULL,
  `book_year` varchar(10) DEFAULT NULL,
  `count_pages` varchar(5) DEFAULT NULL,
  `book_views` int DEFAULT '0',
  `book_wants` int DEFAULT '0',
  `book_isDelete` bigint DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 117 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books_authors` (
  `book` int NOT NULL,
  `author` int NOT NULL,
  `book_isDelete` bigint DEFAULT NULL,
  KEY `book` (`book`),
  KEY `author` (`author`),
  CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`book`) REFERENCES `books` (`book_id`),
  CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`author`) REFERENCES `authors` (`author_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `migration_up` text NOT NULL,
  `migration_isDo` tinyint NOT NULL,
  `migration_down` text NOT NULL,
  PRIMARY KEY (`migration_id`),
  UNIQUE KEY `migration_id` (`migration_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: authors
# ------------------------------------------------------------

INSERT INTO
  `authors` (`author_id`, `author_name`)
VALUES
  (1, 'first');
INSERT INTO
  `authors` (`author_id`, `author_name`)
VALUES
  (2, 'Андрей Богуславский');
INSERT INTO
  `authors` (`author_id`, `author_name`)
VALUES
  (3, 'hd');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books
# ------------------------------------------------------------

INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    3,
    'some',
    'kvsnlvn',
    '38.jpg',
    '2000',
    '9999',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (4, 'с++', 'lm;', '34.jpg', '2003', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (5, 'knj', ';ln', '39.jpg', '2000', '325', 1, 1, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    6,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'vdsfb',
    '34.jpg',
    '2003',
    '325',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (7, 'с++', ',m', '40.jpg', '2003', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (8, 'SS', ' kslvd', '34.jpg', 'klv', 'ml', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (9, 'с++', ', n  ', '35.jpg', '2003', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (10, 'с++', 'l;m \'', '35.jpg', '2003', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    11,
    'с++',
    ',;\'v,d',
    '34.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (12, 'с++', ' l;m', '35.jpg', '2003', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (13, 'с++', 'lm;', '35.jpg', '2001', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (14, 'с++', ', ;', '35.jpg', '2001', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (15, 'с++', ', ;', '35.jpg', '2001', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    16,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'lm;m',
    '35.jpg',
    '2001',
    '325',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (17, 'SS', ', ,.', '33.jpg', '2001', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (18, 'SS', ', ,.', '33.jpg', '2001', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    19,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'лдт',
    '35.jpg',
    '2003',
    'nkl',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (20, 'some', 'бжє', '34.jpg', '2003', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (21, 'some', 'бжє', '34.jpg', '2003', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (22, 'с++', 'lm ', '35.jpg', '2003', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (23, 'с++', 'lm ', '35.jpg', '2003', '351', 1, 1, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (24, 'some', 'бжє', '34.jpg', '2003', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (25, 'SS', ', ,.', '33.jpg', '2001', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (26, 'SS', ', ,.', '33.jpg', '2001', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (27, 'SS', ', ,.', '33.jpg', '2001', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (28, 'с++', ', ;', '35.jpg', '2001', '351', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    29,
    'с++',
    ',;\'v,d',
    '34.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    30,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'vdsfb',
    '34.jpg',
    '2003',
    '325',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    31,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'vdsfb',
    '34.jpg',
    '2003',
    '325',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    32,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'vdsfb',
    '34.jpg',
    '2003',
    '325',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (33, 'SS', 'kmn;sc', '35.jpg', '2003', '325', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (34, 'SS', ' l;m', '35.jpg', '2003', '325', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (35, 'SS', 'kmn;sc', '35.jpg', '2003', '325', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (36, 'SS', 'kmn;sc', '35.jpg', '2003', '325', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (37, 'SS', 'kmn;sc', '35.jpg', '2003', '325', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (38, 'SS', 'kmn;sc', '35.jpg', '2003', '325', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    39,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    40,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    41,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    42,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    43,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    44,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    45,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    46,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    47,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    48,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    49,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    50,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    51,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    52,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    53,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    54,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    55,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    56,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    57,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    58,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    59,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    60,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    61,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    62,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    63,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    64,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    65,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    66,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    67,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    68,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    69,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    70,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    71,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    72,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    73,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    74,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    75,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    76,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    77,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    78,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    79,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    80,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    81,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    82,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    83,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    84,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    85,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    86,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    87,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    88,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    89,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    90,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    91,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    92,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    93,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    94,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    95,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    96,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    97,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    98,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    99,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    100,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    101,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    102,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    103,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    104,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    105,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    106,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    107,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    108,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    109,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    110,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    111,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'l;m',
    '40.jpg',
    '2001',
    '351',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (112, 'some', 'l;ml', '40.jpg', '2001', 'nkl', 0, 0, NULL);
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    113,
    'с++6',
    'dslv,',
    '35.jpg',
    '2001',
    'nkl',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    114,
    'SS',
    'v;s,fb\'',
    '34.jpg',
    '2000',
    '325',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    115,
    'somedf',
    'dbaa',
    '34.jpg',
    '2000',
    '325',
    0,
    0,
    NULL
  );
INSERT INTO
  `books` (
    `book_id`,
    `book_name`,
    `book_description`,
    `book_img`,
    `book_year`,
    `count_pages`,
    `book_views`,
    `book_wants`,
    `book_isDelete`
  )
VALUES
  (
    116,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'dvskpb',
    '34.jpg',
    '2001',
    '325',
    0,
    0,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

INSERT INTO
  `books_authors` (`book`, `author`, `book_isDelete`)
VALUES
  (116, 2, NULL);
INSERT INTO
  `books_authors` (`book`, `author`, `book_isDelete`)
VALUES
  (116, 3, NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

INSERT INTO
  `migrations` (
    `migration_id`,
    `migration_up`,
    `migration_isDo`,
    `migration_down`
  )
VALUES
  (1, '1_up.sql', 1, '1_down.sql');
INSERT INTO
  `migrations` (
    `migration_id`,
    `migration_up`,
    `migration_isDo`,
    `migration_down`
  )
VALUES
  (2, '2_up.sql', 1, '2_down.sql');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
