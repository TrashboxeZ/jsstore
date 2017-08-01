-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.31 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных BeerShop
CREATE DATABASE IF NOT EXISTS `BeerShop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `BeerShop`;


-- Дамп структуры для таблица BeerShop.BRANDS
CREATE TABLE IF NOT EXISTS `BRANDS` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.BRANDS: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `BRANDS` DISABLE KEYS */;
INSERT INTO `BRANDS` (`id`, `name`, `description`) VALUES
	(1, 'FIRST DNIPRO BREWERY', 'Пиво'),
	(2, 'JOHN GASPAR', 'Пиво'),
	(3, 'МИКУЛИНЕЦКИЙ БРОВАР', 'Пиво'),
	(4, 'ПИВО «ВИСТ»', 'Пиво');
/*!40000 ALTER TABLE `BRANDS` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.CATEGORIES
CREATE TABLE IF NOT EXISTS `CATEGORIES` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.CATEGORIES: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `CATEGORIES` DISABLE KEYS */;
INSERT INTO `CATEGORIES` (`id`, `category`) VALUES
	(1, 'Пиво'),
	(2, 'Закуски');
/*!40000 ALTER TABLE `CATEGORIES` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.CITIES
CREATE TABLE IF NOT EXISTS `CITIES` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `region_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CITIES_REGIONS` (`region_id`),
  CONSTRAINT `FK_CITIES_REGIONS` FOREIGN KEY (`region_id`) REFERENCES `REGIONS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.CITIES: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `CITIES` DISABLE KEYS */;
INSERT INTO `CITIES` (`id`, `city`, `region_id`) VALUES
	(1, 'Днепропертровск', 1),
	(2, 'Киев', 2),
	(3, 'Москва', 3),
	(4, 'Минск', 4);
/*!40000 ALTER TABLE `CITIES` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.COUNTRIES
CREATE TABLE IF NOT EXISTS `COUNTRIES` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.COUNTRIES: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `COUNTRIES` DISABLE KEYS */;
INSERT INTO `COUNTRIES` (`id`, `country`) VALUES
	(1, 'Украина'),
	(2, 'Россия'),
	(3, 'Белоруссия');
/*!40000 ALTER TABLE `COUNTRIES` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.DELIVERY
CREATE TABLE IF NOT EXISTS `DELIVERY` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delivery` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.DELIVERY: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `DELIVERY` DISABLE KEYS */;
INSERT INTO `DELIVERY` (`id`, `delivery`) VALUES
	(1, 'Самовывоз'),
	(2, 'Доставка'),
	(3, 'Курьер');
/*!40000 ALTER TABLE `DELIVERY` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.ORDERS
CREATE TABLE IF NOT EXISTS `ORDERS` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `payment_id` int(11) unsigned NOT NULL,
  `delivery_id` int(11) unsigned NOT NULL,
  `address` varchar(50) NOT NULL,
  `status_id` int(11) unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ORDERS_USERS` (`user_id`),
  KEY `FK_ORDERS_PRODUCTS` (`product_id`),
  KEY `FK_ORDERS_PAYMENTS` (`payment_id`),
  KEY `FK_ORDERS_DELIVERY` (`delivery_id`),
  KEY `FK_ORDERS_STATUS` (`status_id`),
  CONSTRAINT `FK_ORDERS_DELIVERY` FOREIGN KEY (`delivery_id`) REFERENCES `DELIVERY` (`id`),
  CONSTRAINT `FK_ORDERS_PAYMENTS` FOREIGN KEY (`payment_id`) REFERENCES `PAYMENTS` (`id`),
  CONSTRAINT `FK_ORDERS_PRODUCTS` FOREIGN KEY (`product_id`) REFERENCES `PRODUCTS` (`id`),
  CONSTRAINT `FK_ORDERS_STATUS` FOREIGN KEY (`status_id`) REFERENCES `STATUS` (`id`),
  CONSTRAINT `FK_ORDERS_USERS` FOREIGN KEY (`user_id`) REFERENCES `USERS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.ORDERS: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
INSERT INTO `ORDERS` (`id`, `user_id`, `product_id`, `payment_id`, `delivery_id`, `address`, `status_id`, `date`) VALUES
	(1, 3, 2, 1, 1, 'ул.какая-то', 4, '2017-07-21'),
	(2, 5, 3, 2, 3, 'ул.какая-то', 1, '2017-07-22'),
	(3, 4, 1, 2, 2, 'ул.какая-то', 2, '2017-07-22'),
	(4, 6, 4, 1, 1, 'ул.какая-то', 3, '2017-07-22');
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.PAYMENTS
CREATE TABLE IF NOT EXISTS `PAYMENTS` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.PAYMENTS: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `PAYMENTS` DISABLE KEYS */;
INSERT INTO `PAYMENTS` (`id`, `payment`) VALUES
	(1, 'Наличкой'),
	(2, 'Безнал');
/*!40000 ALTER TABLE `PAYMENTS` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.PRODUCTS
CREATE TABLE IF NOT EXISTS `PRODUCTS` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `price` int(11) unsigned NOT NULL,
  `volume_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PRODUCTS_braNDS` (`brand_id`),
  KEY `FK_PRODUCTS_CATEGORIES` (`category_id`),
  KEY `FK_PRODUCTS_VOLUME` (`volume_id`),
  CONSTRAINT `FK_PRODUCTS_CATEGORIES` FOREIGN KEY (`category_id`) REFERENCES `CATEGORIES` (`id`),
  CONSTRAINT `FK_PRODUCTS_VOLUME` FOREIGN KEY (`volume_id`) REFERENCES `VOLUME` (`id`),
  CONSTRAINT `FK_PRODUCTS_braNDS` FOREIGN KEY (`brand_id`) REFERENCES `braNDS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.PRODUCTS: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `PRODUCTS` DISABLE KEYS */;
INSERT INTO `PRODUCTS` (`id`, `brand_id`, `category_id`, `price`, `volume_id`) VALUES
	(1, 1, 1, 50, 4),
	(2, 2, 1, 90, 5),
	(3, 3, 1, 50, 2),
	(4, 4, 1, 25, 1);
/*!40000 ALTER TABLE `PRODUCTS` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.PROFILE
CREATE TABLE IF NOT EXISTS `PROFILE` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(50) DEFAULT NULL,
  `age` int(2) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `address` varchar(50) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `gender` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PROFILE_USERS` (`user_id`),
  KEY `FK_PROFILE_CITIES` (`city_id`),
  CONSTRAINT `FK_PROFILE_CITIES` FOREIGN KEY (`city_id`) REFERENCES `CITIES` (`id`),
  CONSTRAINT `FK_PROFILE_USERS` FOREIGN KEY (`user_id`) REFERENCES `USERS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.PROFILE: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `PROFILE` DISABLE KEYS */;
INSERT INTO `PROFILE` (`id`, `avatar`, `age`, `tel`, `city_id`, `address`, `user_id`, `gender`) VALUES
	(1, NULL, 25, '0123456789', 1, 'ул. Метростроевская', 1, 'Мужской'),
	(2, NULL, 30, '9876543210', 2, 'ул. Улица', 2, 'Мужской'),
	(3, NULL, 20, '6547893212', 2, 'какая-то улица', 3, 'Женский'),
	(4, NULL, 21, '3217895640', 3, 'какая-то улица', 4, 'Мужской'),
	(5, NULL, 35, '8527419963', 4, 'какая-то улица', 5, 'Мужской'),
	(6, NULL, 24, '1236548541', 1, 'какая-то улица', 6, 'Мужской');
/*!40000 ALTER TABLE `PROFILE` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.REGIONS
CREATE TABLE IF NOT EXISTS `REGIONS` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(50) NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REGIONS_CoUNTRIES` (`country_id`),
  CONSTRAINT `FK_REGIONS_CoUNTRIES` FOREIGN KEY (`country_id`) REFERENCES `CoUNTRIES` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.REGIONS: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `REGIONS` DISABLE KEYS */;
INSERT INTO `REGIONS` (`id`, `region`, `country_id`) VALUES
	(1, 'Днепропетроская обл', 1),
	(2, 'Киевская обл', 1),
	(3, 'Московская обл', 2),
	(4, 'Минская обл', 3);
/*!40000 ALTER TABLE `REGIONS` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.ROLE
CREATE TABLE IF NOT EXISTS `ROLE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.ROLE: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` (`id`, `role`) VALUES
	(1, 'Администратор БД'),
	(2, 'Менеджер'),
	(3, 'Заказчик');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.STATUS
CREATE TABLE IF NOT EXISTS `STATUS` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.STATUS: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `STATUS` DISABLE KEYS */;
INSERT INTO `STATUS` (`id`, `status`) VALUES
	(1, 'Обрабатывается'),
	(2, 'В пути'),
	(3, 'Комплектуется'),
	(4, 'Готов');
/*!40000 ALTER TABLE `STATUS` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.USERS
CREATE TABLE IF NOT EXISTS `USERS` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `real_name` varchar(50) NOT NULL,
  `date` date NOT NULL DEFAULT '2017-07-21',
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USERS_ROLE` (`role_id`),
  CONSTRAINT `FK_USERS_ROLE` FOREIGN KEY (`role_id`) REFERENCES `ROLE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.USERS: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` (`id`, `email`, `password`, `real_name`, `date`, `role_id`) VALUES
	(1, 'ex@gmail.com', '123321', 'Вася', '2017-07-21', 1),
	(2, 'exampl@gmail.com', 'qwerty321', 'Петя', '2017-07-21', 2),
	(3, 'dasha@gmail.com', 'qwerty123', 'Даша', '2017-07-21', 3),
	(4, 'dima@gmail.com', 'qwerty432', 'Дима', '2017-07-21', 3),
	(5, 'sasha@gmail.com', 'qwerty234', 'Саша', '2017-07-21', 3),
	(6, 'pasha@gmail.com', 'qwertypasha', 'Паша', '2017-07-21', 3);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;


-- Дамп структуры для таблица BeerShop.VOLUME
CREATE TABLE IF NOT EXISTS `VOLUME` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `volume` float unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы BeerShop.VOLUME: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `VOLUME` DISABLE KEYS */;
INSERT INTO `VOLUME` (`id`, `volume`) VALUES
	(1, 0.5),
	(2, 1),
	(3, 1.5),
	(4, 2),
	(5, 2.5),
	(6, 3);
/*!40000 ALTER TABLE `VOLUME` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
