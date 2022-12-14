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
  (2, '???????????? ????????????????????????');
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
  (4, '??++', 'lm;', '34.jpg', '2003', '351', 0, 0, NULL);
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
    '????++ ?? ???????????????????????? ??????????????',
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
  (7, '??++', ',m', '40.jpg', '2003', '351', 0, 0, NULL);
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
  (9, '??++', ', n  ', '35.jpg', '2003', '351', 0, 0, NULL);
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
  (10, '??++', 'l;m \'', '35.jpg', '2003', '351', 0, 0, NULL);
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
    '??++',
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
  (12, '??++', ' l;m', '35.jpg', '2003', '351', 0, 0, NULL);
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
  (13, '??++', 'lm;', '35.jpg', '2001', '351', 0, 0, NULL);
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
  (14, '??++', ', ;', '35.jpg', '2001', '351', 0, 0, NULL);
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
  (15, '??++', ', ;', '35.jpg', '2001', '351', 0, 0, NULL);
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
    '??????',
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
  (20, 'some', '??????', '34.jpg', '2003', '351', 0, 0, NULL);
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
  (21, 'some', '??????', '34.jpg', '2003', '351', 0, 0, NULL);
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
  (22, '??++', 'lm ', '35.jpg', '2003', '351', 0, 0, NULL);
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
  (23, '??++', 'lm ', '35.jpg', '2003', '351', 1, 1, NULL);
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
  (24, 'some', '??????', '34.jpg', '2003', '351', 0, 0, NULL);
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
  (28, '??++', ', ;', '35.jpg', '2001', '351', 0, 0, NULL);
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
    '??++',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '????++ ?? ???????????????????????? ??????????????',
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
    '??++6',
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
    '????++ ?? ???????????????????????? ??????????????',
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
