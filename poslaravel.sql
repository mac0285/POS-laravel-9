/*
 Navicat Premium Data Transfer

 Source Server         : LOKAL-MARIA
 Source Server Type    : MariaDB
 Source Server Version : 100407
 Source Host           : 127.0.0.1:3306
 Source Schema         : poslaravel

 Target Server Type    : MariaDB
 Target Server Version : 100407
 File Encoding         : 65001

 Date: 04/06/2023 21:14:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customers_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'Haris', 'Rifai', 'moh.h.rifai@gmail.com', '08179730808', 'Tabanan Bali', 'customers/OlvAUM0XQ0VTkfORlyVdGaTBSnzoh0Sx2TDqOdmw.bmp', 1, '2023-06-04 03:24:33', '2023-06-04 03:24:33');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_04_19_081616_create_products_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_04_22_181602_add_quantity_to_products_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_04_24_170630_create_customers_table', 1);
INSERT INTO `migrations` VALUES (7, '2020_04_27_054355_create_settings_table', 1);
INSERT INTO `migrations` VALUES (8, '2020_04_30_053758_create_user_cart_table', 1);
INSERT INTO `migrations` VALUES (9, '2020_05_04_165730_create_orders_table', 1);
INSERT INTO `migrations` VALUES (10, '2020_05_04_165749_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (11, '2020_05_04_165822_create_payments_table', 1);
INSERT INTO `migrations` VALUES (12, '2022_03_21_125336_change_price_column', 1);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` decimal(14, 4) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 200000.0000, 25, 1, 4, '2023-06-04 03:25:46', '2023-06-04 03:25:46');
INSERT INTO `order_items` VALUES (2, 81000.0000, 3, 1, 5, '2023-06-04 03:25:46', '2023-06-04 03:25:46');
INSERT INTO `order_items` VALUES (3, 56000.0000, 2, 1, 6, '2023-06-04 03:25:46', '2023-06-04 03:25:46');
INSERT INTO `order_items` VALUES (4, 4200000.0000, 3, 1, 3, '2023-06-04 03:25:46', '2023-06-04 03:25:46');
INSERT INTO `order_items` VALUES (5, 4500000.0000, 3, 1, 2, '2023-06-04 03:25:46', '2023-06-04 03:25:46');
INSERT INTO `order_items` VALUES (6, 5100000.0000, 3, 1, 1, '2023-06-04 03:25:46', '2023-06-04 03:25:46');
INSERT INTO `order_items` VALUES (7, 14400000.0000, 6, 1, 7, '2023-06-04 03:25:46', '2023-06-04 03:25:46');
INSERT INTO `order_items` VALUES (8, 6800000.0000, 4, 3, 1, '2023-06-04 03:33:28', '2023-06-04 03:33:28');
INSERT INTO `order_items` VALUES (9, 3000000.0000, 2, 3, 2, '2023-06-04 03:33:28', '2023-06-04 03:33:28');
INSERT INTO `order_items` VALUES (10, 2800000.0000, 2, 3, 3, '2023-06-04 03:33:28', '2023-06-04 03:33:28');
INSERT INTO `order_items` VALUES (11, 16000.0000, 2, 3, 4, '2023-06-04 03:33:28', '2023-06-04 03:33:28');
INSERT INTO `order_items` VALUES (12, 27000.0000, 1, 3, 5, '2023-06-04 03:33:28', '2023-06-04 03:33:28');
INSERT INTO `order_items` VALUES (13, 1700000.0000, 1, 4, 1, '2023-06-04 12:50:38', '2023-06-04 12:50:38');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_customer_id_foreign`(`customer_id`) USING BTREE,
  INDEX `orders_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, NULL, 1, '2023-06-04 03:25:46', '2023-06-04 03:25:46');
INSERT INTO `orders` VALUES (2, NULL, 1, '2023-06-04 03:26:02', '2023-06-04 03:26:02');
INSERT INTO `orders` VALUES (3, NULL, 1, '2023-06-04 03:33:28', '2023-06-04 03:33:28');
INSERT INTO `orders` VALUES (4, NULL, 1, '2023-06-04 12:50:38', '2023-06-04 12:50:38');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` decimal(14, 4) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `payments_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `payments_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES (1, 28537000.0000, 1, 1, '2023-06-04 03:25:46', '2023-06-04 03:25:46');
INSERT INTO `payments` VALUES (2, 38537000.0000, 2, 1, '2023-06-04 03:26:02', '2023-06-04 03:26:02');
INSERT INTO `payments` VALUES (3, 22643000.0000, 3, 1, '2023-06-04 03:33:28', '2023-06-04 03:33:28');
INSERT INTO `payments` VALUES (4, 1700000.0000, 4, 1, '2023-06-04 12:50:38', '2023-06-04 12:50:38');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `barcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(14, 2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_barcode_unique`(`barcode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Kabel Cat 6', 'Network supplies', 'products/nqilviAGnhqxwSpNR9OfVEg7sxqflmEvaclJ62Uq.bmp', '234', 1700000.00, 92, 1, '2023-06-04 03:18:58', '2023-06-04 12:50:38');
INSERT INTO `products` VALUES (2, 'Kabel Cat 5', 'Network supplies', 'products/nqilviAGnhqxwSpNR9OfVEg7sxqflmEvaclJ62Uq.bmp', '231', 1500000.00, 95, 1, '2023-06-04 03:18:58', '2023-06-04 03:33:28');
INSERT INTO `products` VALUES (3, 'Kabel Cat 5e', 'Network supplies', 'products/nqilviAGnhqxwSpNR9OfVEg7sxqflmEvaclJ62Uq.bmp', '232', 1400000.00, 95, 1, '2023-06-04 03:18:58', '2023-06-04 03:33:28');
INSERT INTO `products` VALUES (4, 'Kabel Power 3', 'ME supplies', 'products/nqilviAGnhqxwSpNR9OfVEg7sxqflmEvaclJ62Uq.bmp', '233', 8000.00, 73, 1, '2023-06-04 03:18:58', '2023-06-04 03:33:28');
INSERT INTO `products` VALUES (5, 'Kabel Duck 5\"', 'ME  supplies', 'products/nqilviAGnhqxwSpNR9OfVEg7sxqflmEvaclJ62Uq.bmp', '2312', 27000.00, 96, 1, '2023-06-04 03:18:58', '2023-06-04 03:33:28');
INSERT INTO `products` VALUES (6, 'Kabel Duck 6\"', 'ME  supplies', 'products/nqilviAGnhqxwSpNR9OfVEg7sxqflmEvaclJ62Uq.bmp', '2313', 28000.00, 98, 1, '2023-06-04 03:18:58', '2023-06-04 03:25:46');
INSERT INTO `products` VALUES (7, 'Swicth 24 Port Aruba', 'Network supplies', 'products/nqilviAGnhqxwSpNR9OfVEg7sxqflmEvaclJ62Uq.bmp', '2400000', 2400000.00, 2399994, 1, '2023-06-04 03:18:58', '2023-06-04 03:25:46');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'app_name', 'E-POS System', '2023-06-04 03:13:52', '2023-06-04 03:28:11');
INSERT INTO `settings` VALUES (2, 'currency_symbol', 'IDR', '2023-06-04 03:13:52', '2023-06-04 03:13:52');
INSERT INTO `settings` VALUES (3, 'app_description', 'Online POS System', '2023-06-04 03:28:11', '2023-06-04 03:28:11');
INSERT INTO `settings` VALUES (4, 'warning_quantity', '10', '2023-06-04 03:28:11', '2023-06-04 03:28:11');

-- ----------------------------
-- Table structure for user_cart
-- ----------------------------
DROP TABLE IF EXISTS `user_cart`;
CREATE TABLE `user_cart`  (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  INDEX `user_cart_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `user_cart_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `user_cart_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_cart
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'CA', 'admin@mail.com', NULL, '$2y$10$giVzrmrsRydGkoVdLQWq0eyJhhDNuB1.Xw8fZb.FNrX/yfJ1hjViq', NULL, '2023-06-04 03:13:52', '2023-06-04 03:13:52');
INSERT INTO `users` VALUES (2, 'Haris', 'Rifai', 'moh.h.rifai@gmail.com', NULL, '$2y$10$m5dJr6qbDduIRStHm00y8u0JvS4IcYrat2CEs29tW.nZnbAhjUMjW', NULL, '2023-06-04 12:52:12', '2023-06-04 12:52:12');
INSERT INTO `users` VALUES (3, 'cahya', 'ibrahim', 'cahya.ibrahim.pa@gmail.com', NULL, '$2y$10$Q5sgz5epez2VZDiS3kypEu3ExwoubWWd91hkxmEyfGH4Z.xxPcuBK', NULL, '2023-06-04 12:53:18', '2023-06-04 12:53:18');

SET FOREIGN_KEY_CHECKS = 1;
