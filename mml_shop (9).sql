-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 30, 2024 at 08:45 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mml_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `acc_id` int NOT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `acc_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `acc_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `acc_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `acc_status` tinyint NOT NULL DEFAULT '1' COMMENT '1: Hoạt động\r\n0: Không hoạt động',
  `acc_role` tinyint NOT NULL DEFAULT '0' COMMENT '0: Client\r\n1: Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`acc_id`, `acc_name`, `acc_password`, `acc_email`, `acc_phone`, `acc_image`, `acc_status`, `acc_role`) VALUES
(1, 'hung_admin', '123456', 'hungnt@gmail.com', '0987654321', '1722850058_DSCF1073.JPG', 1, 1),
(2, 'nguyenthuydung', '123456', 'dungnt@gmail.com', '0345678912', '', 1, 1),
(3, 'dungclient', '111111', 'thuydng2004@gmail.com', '0378296292', '', 1, 1),
(4, 'test', '123456', 't@gmail.com', '', '', 0, 0),
(5, 'test', '123456', 'h@gmail.com', '0321654987', '', 1, 0),
(6, 'hungnt', '123456', '1@gmail.com', '0987654321', '1722316487_IMG_2148.JPG', 1, 0),
(7, 'test2', '123456', '2@gmail.com', '', '', 1, 0),
(8, 'dung', '123456', 'd@gmail.com', '', '', 1, 0),
(9, 'hungdz', '000000', 'hdz@gmail.com', '0321654987', '1721903088_BXYO7825.JPG', 1, 0),
(10, 'thinh123', '123456', 'thinh07122002@gmail.com', '0946225868', '1722850132LDLN.webp', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_order` datetime NOT NULL,
  `bill_total` decimal(10,3) NOT NULL,
  `acc_id` int NOT NULL,
  `bill_status` int NOT NULL DEFAULT '0' COMMENT '0: chờ xác nhận\r\n1: đã xác nhận\r\n2: đang giao hàng\r\n3: giao hàng thành công\r\n4: đã huỷ ',
  `payment_status` tinyint NOT NULL DEFAULT '1' COMMENT '1:Chưa thanh toán\r\n0:Đã thanh toán',
  `voucher_id` int NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `fullname`, `phone`, `address`, `date_order`, `bill_total`, `acc_id`, `bill_status`, `payment_status`, `voucher_id`) VALUES
(1, 'Nguyễn Thùy Dung', '0378296292', 'Hạ Long, Quảng Ninh', '2024-07-03 15:58:31', '499.000', 3, 1, 1, 3),
(4, 'Phan Tất Quốc Thịnh', '0387544071', 'số 10 Thắng Lợi, xã Đồng Tháp, Đan Phượng, Hà Nội', '2024-07-17 16:42:00', '79.000', 1, 2, 0, 3),
(10, 'Nguyễn Hoài Linh', '0387544071', 'số 10 Thắng Lợi, xã Đồng Tháp, Đan Phượng, Hà Nội', '2024-07-18 13:21:00', '750.000', 7, 1, 1, 3),
(11, 'Ngô Thế Hưng', '0987654321', 'số 10 Thắng Lợi, xã Đồng Tháp, Đan Phượng, Hà Nội', '2024-07-18 13:37:00', '261.000', 1, 2, 1, 3),
(17, 'Nguyễn Hoài Linh', '0387544071', 'số 10 Thắng Lợi, xã Đồng Tháp, Đan Phượng, Hà Nội', '2024-07-18 13:52:00', '732.000', 6, 4, 1, 3),
(18, 'Nguyễn Hoài Linh', '0387544071', 'số 10 Thắng Lợi, xã Đồng Tháp, Đan Phượng, Hà Nội', '2024-07-18 13:57:00', '732.000', 6, 1, 0, 3),
(20, 'Ngô Thế Hưng', '0387544071', 'số 10 Thắng Lợi, xã Đồng Tháp, Đan Phượng, Hà Nội', '2024-07-18 14:02:00', '558.000', 6, 3, 1, 3),
(32, 'Nguyễn Văn A', '0987654123', 'số 10 Thắng Lợi, xã Đồng Tháp, Đan Phượng, Hà Nội', '2024-07-25 19:38:00', '706.000', 9, 1, 1, 3),
(43, 'Test voucher', '0123456987', 'Trịnh văn Bô', '2024-07-31 16:55:40', '1422.000', 7, 0, 1, 1),
(44, 'Ngô Thế Hưng', '0387544071', 'số 10 Thắng Lợi,', '2024-08-01 09:15:50', '737.000', 7, 0, 1, 1),
(45, 'Ngô Thế Hưng', '0387544071', 'số 10', '2024-08-01 09:16:30', '99.000', 7, 0, 1, 3),
(46, 'Ngô Thế Hưng', '0387544071', 'số 10 Thắng Lợi, xã Đồng Tháp, Đan Phượng, Hà Nội', '2024-08-01 09:26:00', '175.000', 7, 0, 1, 3),
(55, 'Hưng NT', '0123456987', 'Số 9 Trịnh Văn Bô Nam Từ Liêm', '2024-08-10 15:09:19', '69.000', 6, 3, 1, 3),
(61, 'Ngô Thế Hưng', '0387544071', 'số 10 Thắng Lợi, xã Đồng Tháp, Đan Phượng, Hà Nội', '2024-08-23 16:48:24', '145.000', 6, 2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_dt_id` int NOT NULL,
  `pro_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `quantity` int NOT NULL,
  `total` decimal(10,3) NOT NULL,
  `bill_id` int NOT NULL,
  `pro_dt_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`bill_dt_id`, `pro_name`, `price`, `quantity`, `total`, `bill_id`, `pro_dt_id`) VALUES
(1, 'Tủ đầu giường', '499.000', 1, '499.000', 1, 19),
(2, 'Đèn ngủ', '199.000', 2, '398.000', 10, 12),
(3, 'Bình thủy tinh', '88.000', 4, '352.000', 10, 15),
(4, 'Bình hoa nhỏ', '89.000', 1, '89.000', 11, 5),
(10, 'Gấu bông', '86.000', 2, '172.000', 1, 8),
(11, 'Đèn ngủ', '199.000', 2, '398.000', 17, 12),
(12, 'Đèn sân vườn', '167.000', 2, '334.000', 1, 13),
(13, 'Đèn ngủ', '199.000', 2, '398.000', 18, 12),
(14, 'Đèn sân vườn', '167.000', 2, '334.000', 18, 13),
(17, 'Tủ đầu giường', '499.000', 1, '499.000', 20, 19),
(18, 'Bình giữ nhiệt cà phê', '59.000', 1, '59.000', 20, 20),
(37, 'Tủ đầu giường', '499.000', 1, '499.000', 32, 19),
(53, 'Đèn ngủ', '199.000', 1, '199.000', 43, 12),
(54, 'Tủ đầu giường', '499.000', 1, '499.000', 43, 19),
(55, 'Bàn cafe', '399.000', 2, '798.000', 43, 18),
(56, 'Tủ đầu giường', '499.000', 1, '499.000', 44, 19),
(57, 'Đĩa xanh', '69.000', 4, '276.000', 44, 21),
(58, 'Bình hoa nhỏ', '99.000', 1, '99.000', 45, 4),
(59, 'Đồng hồ treo tường bằng gỗ', '175.000', 1, '175.000', 46, 11),
(66, 'Đĩa xanh', '69.000', 1, '69.000', 55, 21),
(75, 'Đèn treo', '66.000', 1, '66.000', 61, 16),
(76, 'Đèn neon', '79.000', 1, '79.000', 61, 14);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cate_id` int NOT NULL,
  `cate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cate_status` tinyint NOT NULL DEFAULT '1' COMMENT '1: Tồn tại\r\n0: Không tồn tại'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cate_id`, `cate_name`, `cate_status`) VALUES
(1, 'Đồ chơi', 1),
(2, 'Chiếu sáng', 1),
(3, 'Phụ kiện', 1),
(4, 'Đồng hồ', 1),
(5, 'Nội thất', 1),
(6, 'Test', 0),
(7, 'test1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `com_id` int NOT NULL,
  `com_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `com_date` datetime NOT NULL,
  `account_id` int NOT NULL,
  `pro_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`com_id`, `com_content`, `com_date`, `account_id`, `pro_id`) VALUES
(1, '10 điểm không có nhưng', '2024-07-03 16:05:04', 3, 14),
(2, 'có size lớn không shop????????', '2024-07-22 10:08:35', 1, 10),
(3, 'Có thỏ giận dữ không shop?', '2024-07-22 10:09:54', 9, 3),
(4, 'có size 20x60 cm không shop?', '2024-07-22 10:11:00', 9, 3),
(5, 'hehehe', '2024-08-11 16:49:58', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int NOT NULL,
  `news_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `news_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `news_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `news_img`, `news_content`) VALUES
(1, 'Thi công nội thất căn hộ Midtown M7 Phú Mỹ Hưng 115m2', 'news1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet sapien dignissim a elementum. Sociis metus, hendrerit mauris id in. Quis sit sit ultrices tincidunt euismod luctus diam. Turpis sodales orci etiam phasellus lacus id leo. Amet turpis nunc, nulla massa est viverra interdum'),
(2, 'Thi công nội thất nhà phố D7 An Thiên Lý Thủ Đức', 'news2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet sapien dignissim a elementum. Sociis metus, hendrerit mauris id in. Quis sit sit ultrices tincidunt euismod luctus diam. Turpis sodales orci etiam phasellus lacus id leo. Amet turpis nunc, nulla massa est viverra interdum'),
(3, 'Thi công nội thất nhà phố KDC Bến Lức quận 8', 'news3.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet sapien dignissim a elementum. Sociis metus, hendrerit mauris id in. Quis sit sit ultrices tincidunt euismod luctus diam. Turpis sodales orci etiam phasellus lacus id leo. Amet turpis nunc, nulla massa est viverra interdum'),
(4, 'Cách Tạo Không Gian Nội Thất Đẹp Theo Phong Cách Indochine', 'news4.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet sapien dignissim a elementum. Sociis metus, hendrerit mauris id in. Quis sit sit ultrices tincidunt euismod luctus diam. Turpis sodales orci etiam phasellus lacus id leo. Amet turpis nunc, nulla massa est viverra interdum'),
(5, '19 gam màu hứa hẹn dẫn đầu xu hướng trang trí nội thất 2022', 'news5.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet sapien dignissim a elementum. Sociis metus, hendrerit mauris id in. Quis sit sit ultrices tincidunt euismod luctus diam. Turpis sodales orci etiam phasellus lacus id leo. Amet turpis nunc, nulla massa est viverra interdum'),
(6, 'Thi công nội thất căn hộ Vinhomes Grand Park Q9 Block S202', 'news6.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet sapien dignissim a elementum. Sociis metus, hendrerit mauris id in. Quis sit sit ultrices tincidunt euismod luctus diam. Turpis sodales orci etiam phasellus lacus id leo. Amet turpis nunc, nulla massa est viverra interdum'),
(7, 'Thi công nội thất biệt thự Vinhomes Tân Cảng Bình Thạnh', 'news7.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet sapien dignissim a elementum. Sociis metus, hendrerit mauris id in. Quis sit sit ultrices tincidunt euismod luctus diam. Turpis sodales orci etiam phasellus lacus id leo. Amet turpis nunc, nulla massa est viverra interdum'),
(8, 'Thi công nội thất văn phòng Central Premium Tháp B - 40m2', 'news8.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet sapien dignissim a elementum. Sociis metus, hendrerit mauris id in. Quis sit sit ultrices tincidunt euismod luctus diam. Turpis sodales orci etiam phasellus lacus id leo. Amet turpis nunc, nulla massa est viverra interdum');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int NOT NULL,
  `pro_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pro_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pro_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cate_id` int NOT NULL,
  `pro_status` tinyint NOT NULL DEFAULT '1' COMMENT '1: Hoạt động\r\n0: Không hoạt động'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_image`, `pro_description`, `cate_id`, `pro_status`) VALUES
(1, 'Bình hoa nhỏ', 'binh-hoa-nho.jpg', 'Bình hoa nhỏ trang trí bàn.', 3, 1),
(2, 'Ghế gỗ', 'ghe-go.jpg', 'Ghế gỗ - Nội thất trang trí cho nhà ở.', 5, 1),
(3, 'Gấu bông', 'gau-bong.png', 'Gấu bông - Trang trí nhà ở. Đồ decor basic. Đồ chơi cho trẻ.', 1, 1),
(4, 'Đồng hồ gỗ', 'dong-ho-go.png', 'Đồng hồ gỗ treo tường, trang trí nhà ở. Nội thất nhà ở đơn giản, cổ điển.', 4, 1),
(5, 'Đồng hồ tròn đơn giản', 'dong-ho-tron-don-gian.jpg', 'Đồng hồ tròn đơn giản, hiện đại treo tường trang trí cho nhà ở.', 4, 1),
(6, 'Đồng hồ treo tường bằng gỗ', 'dong-ho-treo-tuong-bang-go.jpg', 'Đồng hồ treo tường bằng gỗ đơn giản, hiện đại phù hợp với mọi phong cách nội thất.', 4, 1),
(7, 'Đèn ngủ', 'den-ngu.jpg', 'Đèn ngủ cổ điển, sang trọng.', 2, 1),
(8, 'Đèn sân vườn', 'den-san-vuon.jpg', 'Đèn sân vườn - Nội thất hiện đại cho sân vườn của bạn.', 2, 1),
(9, 'Đèn neon', 'den-neon.jpg', 'Đèn neon đơn giản, hiện đại, sang trọng. Phù hợp cho cả nội thất và ngoại thất.', 2, 1),
(10, 'Bình thủy tinh', 'binh-thuy-tinh.jpg', 'Bình thủy tinh trang trí phòng khách, phòng ngủ đơn giản, hiện đại.', 3, 1),
(11, 'Đèn treo', 'den-treo.jpg', 'Đèn treo nhỏ cho phòng bếp hiện đại, ấm cúng.', 2, 1),
(12, 'Bình đựng nước', 'binh-dung-nuoc.jpg', 'Bình đựng nước cổ điển, trang trí bàn ăn, phòng khách ', 3, 1),
(13, 'Bàn cafe', 'ban-cafe.jpg', 'Bàn cafe bằng gỗ, thân thiện với môi trường, phù hợp cho trang trí nhà ở đơn giản, hiện đại', 5, 1),
(14, 'Tủ đầu giường', 'tu-dau-giuong.jpg', 'Tủ đầu giường phong cách cổ điển, đơn giản. Chất liệu gỗ thân thiện môi trường. Gỗ thơm dễ ngủ và điều hòa khí huyết.', 5, 1),
(15, 'Bình giữ nhiệt cà phê', 'binh-giu-nhiet-ca-phe.jpg', 'Bình giữ nhiệt cà phê thiết kế đơn giản dễ mang theo.', 3, 1),
(16, 'Đĩa xanh', 'dia-xanh.jpg', 'Đĩa xanh thiết kế đơn giản, sang trọng phù hợp cho nội thất phòng bếp. ', 3, 1),
(20, 'Test1', '', 'test', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `product_dt_id` int NOT NULL,
  `pro_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pro_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pro_price` decimal(10,3) NOT NULL,
  `pro_quantity` int NOT NULL,
  `pro_id` int DEFAULT NULL,
  `product_dt_status` tinyint NOT NULL DEFAULT '1' COMMENT '1: Đang bán\r\n0: Không bán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_detail`
--

INSERT INTO `product_detail` (`product_dt_id`, `pro_color`, `pro_size`, `pro_price`, `pro_quantity`, `pro_id`, `product_dt_status`) VALUES
(1, 'Màu đỏ', '16x16cm', '99.000', 2, 1, 1),
(2, 'Màu đỏ', '14x14cm', '89.000', 9, 1, 1),
(3, 'Màu đỏ', '12x12cm', '79.000', 12, 1, 1),
(4, 'Màu trắng', '16x16cm', '99.000', 23, 1, 1),
(5, 'Màu trắng', '14x14cm', '89.000', 20, 1, 1),
(6, 'Màu trắng', '12x12cm', '79.000', 19, 1, 1),
(7, 'Trắng', '1m', '199.000', 19, 2, 1),
(8, 'Hồng nude', '10x30cm', '86.000', 13, 3, 1),
(9, 'Vàng trắng', 'R20cm', '159.000', 28, 4, 1),
(10, 'Đỏ', 'R15cm', '99.000', 17, 5, 1),
(11, 'Nâu gỗ', 'R20cm', '175.000', 31, 6, 1),
(12, 'Trắng', 'R20cmxH30cm', '199.000', 19, 7, 1),
(13, 'Xanh ghi', '12x12cm', '167.000', 42, 8, 1),
(14, 'Xanh bơ', '5x50cm', '79.000', 35, 9, 1),
(15, 'Trắng sứ', 'R10xR15cm', '88.000', 14, 10, 1),
(16, 'Xám ghi', 'R8cm', '66.000', 42, 11, 1),
(17, 'Đen sứ', '1L', '78.000', 20, 12, 1),
(18, 'Nâu gỗ', 'R30xH50cm', '399.000', 18, 13, 1),
(19, 'Vàng gỗ', '30x20x50cm', '499.000', 14, 14, 1),
(20, 'Đen', '500ml', '59.000', 19, 15, 1),
(21, 'Xanh cổ vịt', 'R10cm', '69.000', 41, 16, 1),
(26, 'xanh', '11m', '12.000', 1, 20, 0),
(27, 'đỏ', '12cm', '99.000', 45, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` int NOT NULL,
  `voucher_name` varchar(255) NOT NULL,
  `value` int NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `voucher_status` tinyint NOT NULL DEFAULT '0' COMMENT '0: Không hoạt động\r\n1: Hoạt động',
  `voucher_quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`voucher_id`, `voucher_name`, `value`, `start_time`, `end_time`, `voucher_status`, `voucher_quantity`) VALUES
(1, 'Giảm 5% cho đơn hàng có giá trị trên 500k', 5, '2024-07-01 17:35:29', '2024-09-30 17:35:29', 1, 100),
(2, 'Giảm 8% cho đơn hàng có giá trị trên 1000k(Giảm tối đa 300k)', 8, '2024-07-01 17:36:19', '2024-09-30 17:36:19', 1, 50),
(3, 'Không đủ điều kiện nhận voucher', 0, NULL, NULL, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `fk_bill_acc` (`acc_id`),
  ADD KEY `voucher_id` (`voucher_id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_dt_id`),
  ADD KEY `fk_billdetail_bill` (`bill_id`),
  ADD KEY `fk_billdetail_prodetail` (`pro_dt_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `fk_cmt_acc` (`account_id`),
  ADD KEY `fk_cmt_pro` (`pro_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `fk_pro_cate` (`cate_id`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`product_dt_id`),
  ADD KEY `fk_prodetail_pro` (`pro_id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `acc_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `bill_dt_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cate_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `com_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pro_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `product_dt_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`voucher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_bill_acc` FOREIGN KEY (`acc_id`) REFERENCES `account` (`acc_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `fk_billdetail_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_billdetail_prodetail` FOREIGN KEY (`pro_dt_id`) REFERENCES `product_detail` (`product_dt_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_cmt_acc` FOREIGN KEY (`account_id`) REFERENCES `account` (`acc_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_cmt_pro` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_pro_cate` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `fk_prodetail_pro` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
