-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 03, 2023 lúc 10:48 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tthuoc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `IDCHITIETHOADON` int(100) NOT NULL,
  `IDTHUOC` int(100) NOT NULL,
  `IDHOADON` int(100) NOT NULL,
  `LieuLuong` varchar(255) NOT NULL,
  `SoLan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctor`
--

CREATE TABLE `doctor` (
  `IDDoctor` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `age` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `doctor`
--

INSERT INTO `doctor` (`IDDoctor`, `name`, `sex`, `age`, `position`, `phone`, `password`, `image`) VALUES
(5, 'quocthi', 'nam', '60', 'khoa noi', '0903543956', '356a192b7913b04c5457', 'Screenshot (1343).png'),
(6, 'nguyễn Văn Quốc Thi', 'Nam', '60', 'Ngoại', '0903543956', '356a192b7913b04c5457', 'quocthi1.jpg'),
(7, 'Nguyễn Nam Ngu', 'Nữ', '20', 'Thang dien', '03123123145', '356a192b7913b04c5457', 'quocthi1.jpg'),
(8, '131232341523qweqweq', '1', '1', '1', '1', '356a192b7913b04c5457', 'quocthi1.jpg'),
(9, 'dá', 'đá', 'ád', 'ads', '12', '356a192b7913b04c5457', 'Screenshot (1363).png'),
(10, 'adsd', '1', '1', '1', '1', '356a192b7913b04c5457', 'Screenshot (1335).png'),
(11, 'adasdas', 'đá', 'adsdas', 'đâs', '1', '356a192b7913b04c5457', 'Screenshot (1351).png'),
(12, 'đâsdá', '1', '1', '1', '1', '356a192b7913b04c5457', 'Screenshot (1329).png'),
(13, 'r131231', '1', '1', '1', '1', '356a192b7913b04c5457', 'quocthi1.jpg'),
(14, '1`3123', '12312', '123123', '312312', 'thi312312', '356a192b7913b04c5457', 'quocthi1.jpg'),
(15, '1312', '1', '1', '1', 'thi', '356a192b7913b04c5457', 'quocthi1.jpg'),
(16, 'nam ngu', 'nam', '20', '1', '1', '356a192b7913b04c5457', 'Screenshot (1339).png'),
(17, 'đâs', 'đâs', 'đâs', 'adsda', '131312', '356a192b7913b04c5457', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `IDHOADON` int(100) NOT NULL,
  `IDDoctor` int(100) NOT NULL,
  `IDPatinet` int(100) NOT NULL,
  `DATE` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `patinet`
--

CREATE TABLE `patinet` (
  `IDPatinet` int(100) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoc`
--

CREATE TABLE `thuoc` (
  `IDTHUOC` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `LieuLuongToiDa` varchar(255) NOT NULL,
  `LieuLuongToiThieu` varchar(255) NOT NULL,
  `SoLan` varchar(255) NOT NULL,
  `LieuLuongToiDaNgay` varchar(255) NOT NULL,
  `LieuLuongToiThieuNgay` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`IDCHITIETHOADON`),
  ADD KEY `IDTHUOC` (`IDTHUOC`),
  ADD KEY `IDHOADON` (`IDHOADON`);

--
-- Chỉ mục cho bảng `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`IDDoctor`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`IDHOADON`),
  ADD KEY `IDDoctor` (`IDDoctor`),
  ADD KEY `IDPatinet` (`IDPatinet`);

--
-- Chỉ mục cho bảng `patinet`
--
ALTER TABLE `patinet`
  ADD PRIMARY KEY (`IDPatinet`);

--
-- Chỉ mục cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  ADD PRIMARY KEY (`IDTHUOC`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  MODIFY `IDCHITIETHOADON` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `doctor`
--
ALTER TABLE `doctor`
  MODIFY `IDDoctor` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `IDHOADON` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `patinet`
--
ALTER TABLE `patinet`
  MODIFY `IDPatinet` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  MODIFY `IDTHUOC` int(100) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `CHiTIETHOADON_ibfk_1` FOREIGN KEY (`IDTHUOC`) REFERENCES `thuoc` (`IDTHUOC`),
  ADD CONSTRAINT `CHiTIETHOADON_ibfk_2` FOREIGN KEY (`IDHOADON`) REFERENCES `hoadon` (`IDHOADON`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `HOADON_ibfk_1` FOREIGN KEY (`IDDoctor`) REFERENCES `doctor` (`IDDoctor`),
  ADD CONSTRAINT `HOADON_ibfk_2` FOREIGN KEY (`IDPatinet`) REFERENCES `patinet` (`IDPatinet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
