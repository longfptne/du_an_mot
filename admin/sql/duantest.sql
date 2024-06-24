-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 24, 2024 lúc 10:02 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duantest`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `bill_name` varchar(255) NOT NULL,
  `bill_address` varchar(255) NOT NULL,
  `bill_tel` varchar(50) NOT NULL,
  `bill_pttt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 Thanh toán trực tiếp\r\n2 Chuyển khoản\r\n3 Thanh toán online',
  `ngaydathang` varchar(255) NOT NULL,
  `tatal` int(11) NOT NULL DEFAULT 0,
  `bill_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0.Đơn hàng mới\r\n1.Đang xử lý\r\n2.Đang giao hàng\r\n3.Đã giao hàng\r\n4 : Đã hủy đơn hàng',
  `note` varchar(255) DEFAULT NULL,
  `receive_name` varchar(255) NOT NULL,
  `receive_address` varchar(255) NOT NULL,
  `receive` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `iduser`, `bill_name`, `bill_address`, `bill_tel`, `bill_pttt`, `ngaydathang`, `tatal`, `bill_status`, `note`, `receive_name`, `receive_address`, `receive`) VALUES
(110, 3, 'cs', 'nhà anh Long', 'csc', 1, '1:14:47pm 29/11/2023', 60002, 3, 'cscs', '', '', ''),
(111, 3, 'cs', 'nhà thầy Long', 'csc', 1, '17:15:29pm 30/11/2023', 35001, 0, 'cs', '', '', ''),
(112, 3, 'cs', 'đâu cũng được', 'csdcsd', 1, '17:17:03pm 1/12/2023', 60002, 3, '', '', '', ''),
(113, 3, 'cs', 'quyen an cut cho', 'cdscv', 1, '17:19:10pm 2/12/2023', 35001, 0, '', '', '', ''),
(114, 8, 'quyenancut', 'quyen an cut', '0999999', 1, '15:21:56pm 29/11/2023', 35001, 5, '', '', '', ''),
(115, 8, 'quyenancut', 'quyen an cut', '0999999', 2, '15:10:45pm 04/12/2023', 60002, 0, 'oki', '', '', ''),
(116, 8, 'quyenancut', 'trường học', '0999999', 2, '15:11:51pm 04/12/2023', 40001, 2, '', '', '', ''),
(117, 10, 'longtien3', 'hanou', '04444444', 2, '14:52:03pm 06/12/2023', 51001, 2, 'oki', '', '', ''),
(118, 3, 'admin1', 'hoàng văn long', '033', 1, '21:18:23pm 08/12/2023', 226021, 3, 'dhurhighruihg', '', '', ''),
(119, 8, 'quyenancut', 'quyen an cut', '0999999', 2, '15:55:19pm 11/12/2023', 35001, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idpro` int(11) NOT NULL,
  `ngaybinhluan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `noidung`, `iduser`, `idpro`, `ngaybinhluan`) VALUES
(33, 'oki ', 3, 81, '14:56:02pm 06/12/2023'),
(34, 'ggg', 3, 80, '21:08:59pm 08/12/2023');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_giohang` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idpro` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `sugar` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `ice` int(11) NOT NULL,
  `topping` int(15) NOT NULL,
  `soluong` int(11) NOT NULL,
  `thanhtien` int(11) NOT NULL,
  `idbill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `id_giohang`, `iduser`, `idpro`, `img`, `name`, `price`, `sugar`, `size`, `ice`, `topping`, `soluong`, `thanhtien`, `idbill`) VALUES
(108, 235, 3, 81, 'upload/ts16.jpg', 'Trà sữa Panda', 25000, 0, 0, 1, 0, 1, 25001, 110),
(109, 236, 3, 80, 'upload/ts15.jpg', 'Trà Sữa Kim Cương Đen Okinawa', 25000, 0, 0, 1, 0, 1, 25001, 110),
(110, 237, 3, 81, 'upload/ts16.jpg', 'Trà sữa Panda', 25000, 0, 0, 1, 0, 1, 25001, 111),
(111, 235, 3, 81, 'upload/ts16.jpg', 'Trà sữa Panda', 25000, 0, 0, 1, 0, 1, 25001, 112),
(112, 236, 3, 80, 'upload/ts15.jpg', 'Trà Sữa Kim Cương Đen Okinawa', 25000, 0, 0, 1, 0, 1, 25001, 112),
(113, 236, 3, 80, 'upload/ts15.jpg', 'Trà Sữa Kim Cương Đen Okinawa', 25000, 0, 0, 1, 0, 1, 25001, 113),
(114, 244, 8, 78, 'upload/ts13.jpg', 'Trà sữa nhiệt đới', 25000, 0, 0, 1, 0, 1, 25001, 114),
(115, 245, 8, 80, 'upload/ts15.jpg', 'Trà Sữa Kim Cương Đen Okinawa', 25000, 0, 0, 1, 0, 1, 25001, 115),
(116, 247, 8, 81, 'upload/ts16.jpg', 'Trà sữa Panda', 25000, 0, 0, 1, 0, 1, 25001, 115),
(117, 248, 8, 78, 'upload/ts13.jpg', 'Trà sữa nhiệt đới', 25000, 0, 5000, 1, 0, 1, 30001, 116),
(118, 250, 10, 80, 'upload/ts15.jpg', 'Trà Sữa Kim Cương Đen Okinawa', 25000, 2000, 10000, 1, 4000, 1, 41001, 117),
(119, 246, 3, 80, 'upload/ts15.jpg', 'Trà Sữa Kim Cương Đen Okinawa', 25000, 0, 0, 1, 0, 1, 25001, 118),
(120, 251, 3, 81, 'upload/ts16.jpg', 'Trà sữa Panda', 25000, 2000, 5000, 3, 10000, 1, 42003, 118),
(121, 252, 3, 80, 'upload/ts15.jpg', 'Trà Sữa Kim Cương Đen Okinawa', 25000, 2000, 0, 4, 4000, 4, 124016, 118),
(122, 253, 3, 76, 'upload/ts14.jpg', 'Trà sữa ba anh em', 25000, 0, 0, 1, 0, 1, 25001, 118);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `name`) VALUES
(1, 'trà sữa trân châu'),
(2, 'trà sữa matcha'),
(3, 'trà sữa dâu tây'),
(4, 'trà sữa chocalate'),
(5, 'Trà Sữa Ô Long');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tensp` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sugar` int(15) NOT NULL,
  `size` int(15) NOT NULL,
  `ice` int(15) NOT NULL,
  `topping` int(15) NOT NULL,
  `gia` int(11) NOT NULL,
  `soluong` tinyint(11) NOT NULL DEFAULT 1,
  `thanhtien` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 : chưa thanh toán ,\r\n2 : đã thanh toán\r\n3 : hủy'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`id`, `idsp`, `id_user`, `tensp`, `image`, `sugar`, `size`, `ice`, `topping`, `gia`, `soluong`, `thanhtien`, `status`) VALUES
(235, 81, 3, 'Trà sữa Panda', 'upload/ts16.jpg', 0, 0, 1, 0, 25000, 1, 25001, 3),
(236, 80, 3, 'Trà Sữa Kim Cương Đen Okinawa', 'upload/ts15.jpg', 0, 0, 1, 0, 25000, 1, 25001, 2),
(237, 81, 3, 'Trà sữa Panda', 'upload/ts16.jpg', 0, 0, 1, 0, 25000, 1, 25001, 2),
(238, 78, 7, 'Trà sữa nhiệt đới', 'upload/ts13.jpg', 0, 5000, 1, 0, 25000, 20, 600000, 1),
(239, 77, 7, 'Ô long kem phô mai', 'upload/ts12.jpg', 0, 0, 1, 10000, 25000, 1, 35001, 1),
(240, 79, 7, 'Trà sữa hạnh phúc', 'upload/ts11.jpg', 0, 0, 1, 0, 25000, 1, 25001, 1),
(241, 75, 7, 'Tigar Sugar', 'upload/ts10.jpg', 0, 0, 1, 0, 35000, 1, 35001, 1),
(242, 68, 7, 'Sữa chua mận hạt sen ', 'upload/ts3.jpg', 0, 10000, 1, 0, 35000, 1, 45001, 1),
(243, 81, 7, 'Trà sữa Panda', 'upload/ts16.jpg', 0, 0, 1, 0, 25000, 1, 25001, 1),
(244, 78, 8, 'Trà sữa nhiệt đới', 'upload/ts13.jpg', 0, 0, 1, 0, 25000, 1, 25001, 2),
(245, 80, 8, 'Trà Sữa Kim Cương Đen Okinawa', 'upload/ts15.jpg', 0, 0, 1, 0, 25000, 1, 25001, 2),
(246, 80, 3, 'Trà Sữa Kim Cương Đen Okinawa', 'upload/ts15.jpg', 0, 0, 1, 0, 25000, 1, 25001, 2),
(247, 81, 8, 'Trà sữa Panda', 'upload/ts16.jpg', 0, 0, 1, 0, 25000, 1, 25001, 2),
(248, 78, 8, 'Trà sữa nhiệt đới', 'upload/ts13.jpg', 0, 5000, 1, 0, 25000, 1, 30001, 2),
(249, 80, 8, 'Trà Sữa Kim Cương Đen Okinawa', 'upload/ts15.jpg', 0, 0, 1, 0, 25000, 1, 25001, 1),
(250, 80, 10, 'Trà Sữa Kim Cương Đen Okinawa', 'upload/ts15.jpg', 2000, 10000, 1, 4000, 25000, 1, 41001, 2),
(251, 81, 3, 'Trà sữa Panda', 'upload/ts16.jpg', 2000, 5000, 3, 10000, 25000, 1, 42003, 2),
(252, 80, 3, 'Trà Sữa Kim Cương Đen Okinawa', 'upload/ts15.jpg', 2000, 0, 4, 4000, 25000, 4, 124016, 2),
(253, 76, 3, 'Trà sữa ba anh em', 'upload/ts14.jpg', 0, 0, 1, 0, 25000, 1, 25001, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lienhe`
--

CREATE TABLE `lienhe` (
  `id` int(11) NOT NULL,
  `hovaten` varchar(255) NOT NULL,
  `dienthoai` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `loinhan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lienhe`
--

INSERT INTO `lienhe` (`id`, `hovaten`, `dienthoai`, `email`, `diachi`, `loinhan`) VALUES
(2, 'Hoàng Văn Long', '0396277278', 'Longhvph42080@fpt.edu.vn', 'trai tim em', 'đẹp trai nhất'),
(12, 'Hoàng Thanh Tú', '0981896360', 'tuht@fpt', 'trịnh văn bô , xuân phơng', 'đẹp trai thua mỗi anh Long\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `mota` varchar(255) NOT NULL,
  `luotxem` int(11) NOT NULL,
  `iddm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `image`, `name`, `price`, `img`, `mota`, `luotxem`, `iddm`) VALUES
(67, '', 'Trà đào dâu tây kem phô mai ', 46000, 'ts2.jpg', 'good', 0, 3),
(68, '', 'Sữa chua mận hạt sen ', 35000, 'ts3.jpg', 'good', 0, 2),
(69, '', 'Trà mận hạt sen', 25000, 'ts4.jpg', 'good', 0, 1),
(70, '', 'Ô long xoài kem cà phê', 30000, 'ts5.jpg', 'good', 0, 5),
(71, '', 'Trà đào bưởi hồng trân châu baby', 25000, 'ts6.jpg', 'good', 0, 5),
(72, '', 'Trà xoài bưởi hồng', 25000, 'ts7.jpg', 'good', 0, 1),
(73, '', 'Choco ngũ cốc cà phê ', 35000, 'ts8.jpg', 'good', 0, 4),
(74, '', 'Hồng trà ngũ cốc kem cà phê', 30000, 'ts9.jpg', 'good', 0, 2),
(75, '', 'Tigar Sugar', 35000, 'ts10.jpg', 'good', 0, 1),
(76, '', 'Trà sữa ba anh em', 25000, 'ts14.jpg', 'good', 0, 4),
(77, '', 'Ô long kem phô mai', 25000, 'ts12.jpg', 'delicious', 0, 2),
(78, '', 'Trà sữa nhiệt đới', 25000, 'ts13.jpg', 'very good', 0, 3),
(79, '', 'Trà sữa hạnh phúc', 25000, 'ts11.jpg', 'good', 0, 4),
(80, '', 'Trà Sữa Kim Cương Đen Okinawa', 25000, 'ts15.jpg', 'good', 0, 5),
(81, '', 'Trà sữa Panda', 25000, 'ts16.jpg', '  good ', 0, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `user`, `pass`, `avatar`, `email`, `address`, `tel`, `role`) VALUES
(3, 'admin1', 'admin1', 'anh111.jpg', 'longtien@gmail.com', 'hoàng văn long', '033', 1),
(4, 'long12tuoi', '123456', '', 'dwsdw@gmail.com', NULL, NULL, 0),
(5, 'hahaha', '123456', '330845739_5779065388815784_80568.jpg', 'as@gmail.com', 'hhaha', '0363128962', 0),
(6, '1234565', '123456', '', 'tu@gmail.com', NULL, NULL, 0),
(7, 'longhoang', 'longhoang', '', 'longtienkaka@gmail.com', '', '', 2),
(8, 'quyenancut', 'quyenancut', 'z4926441285458_99f4aaa531f08c5dca07b564011dd5a8.jpg', 'tuhtph41989@fpt.edu.vn', 'quyen an cut', '0999999', 1),
(9, 'tututu', 'tututu', '', 'tuhtht@gmail.com', NULL, NULL, 0),
(10, 'longtien3', 'longtien3', '', 'longtienka@gmail.com', NULL, NULL, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_bill` (`idbill`),
  ADD KEY `cart_user` (`iduser`),
  ADD KEY `cart_sanpham` (`idpro`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giohang_sanpham` (`idsp`);

--
-- Chỉ mục cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_sanpham_danhmuc` (`iddm`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_bill` FOREIGN KEY (`idbill`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `cart_sanpham` FOREIGN KEY (`idpro`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `cart_user` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_sanpham` FOREIGN KEY (`idsp`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `lk_sanpham_danhmuc` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
