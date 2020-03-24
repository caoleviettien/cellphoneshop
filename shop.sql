-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 09, 2018 lúc 11:55 AM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_order` datetime NOT NULL,
  `total` double NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `customer_id`, `date_order`, `total`, `note`, `created_at`, `updated_at`) VALUES
(1, 3, '2018-11-25 12:33:02', 25499000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_details`
--

CREATE TABLE `bill_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantily` int(11) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_details`
--

INSERT INTO `bill_details` (`id`, `bill_id`, `product_id`, `quantily`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 3, 8490000, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(1, 'clvt', 'admin@gmail.com', 'tphcm', '11111111111', NULL, NULL, NULL),
(2, 'clvtqqq', 'adminqq@gmail.com', 'tphcmqq', '0386366392111', NULL, NULL, NULL),
(3, 'clvt', 'admin@gmail.com', 'tphcm', '03863663921', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_11_22_150751_create_customers_table', 1),
(2, '2018_11_22_150801_create_bills_table', 1),
(3, '2018_11_22_150839_create_bill_details_table', 1),
(4, '2018_11_24_084504_comments', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `brand`, `name`, `details`, `price`, `img`, `date`) VALUES
(6, 'Apple', 'iPhone 6 32G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 7900000, 'iphone6.png', '2018-05-05 11:57:28'),
(7, 'Apple', 'iPhone 6 64G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 8490000, 'iphone6.png', '2018-05-05 11:57:28'),
(8, 'Apple', 'iPhone 6S 16G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 7690000, 'iphone6s.png', '2018-05-05 12:03:22'),
(9, 'Apple', 'iPhone 6S 16G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 8190000, 'iphone6s.png', '2018-05-05 12:03:22'),
(10, 'Apple', 'iPhone 7 16G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 8900000, 'iphone7.png', '2018-05-05 12:10:43'),
(11, 'Apple', 'iPhone 7 32G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 8490000, 'iphone7.png', '2018-05-05 12:10:43'),
(12, 'Apple', 'iPhone 7 Plus 32G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 19900000, 'iphone7Plus.png', '2018-05-05 12:13:24'),
(13, 'Apple', 'iPhone 7S Plus 64G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 21990000, 'iphone7Plus.png', '2018-05-05 12:13:24'),
(14, 'Apple', 'iPhone 8 64G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 20990000, 'iphone8.png', '2018-05-05 12:40:33'),
(15, 'Apple', 'iPhone 8 Plus 64G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 23990000, 'iphone8Plus.png', '2018-05-05 12:40:33'),
(17, 'Apple', 'iPhone 8 Plus 256GB', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 28790000, 'iphone8Plus.png', '2018-05-05 12:50:06'),
(18, 'Apple', 'iPhone X 64G', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 29990000, 'iphoneX.png', '2018-05-05 12:51:54'),
(20, 'Samsung', 'Samsung Galaxy J2 Pro', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 3290000, 'SamsungJ2Pro.png', '2018-05-05 13:35:21'),
(21, 'Samsung', 'Samsung Galaxy J3 Pro', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 3990000, 'SamsungJ3Pro.png', '2018-05-05 13:35:21'),
(22, 'Samsung', 'Samsung Galaxy J7 Prime', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 4990000, 'SamsungJ7Prime.png', '2018-05-05 13:38:37'),
(23, 'Samsung', 'Samsung Galaxy J7 Pro', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 6090000, 'SamsungJ7Pro.png', '2018-05-05 13:38:37'),
(25, 'Samsung', 'Samsung Galaxy A8', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 10990000, 'SamsungA8.png', '2018-05-05 13:42:16'),
(26, 'Samsung', 'Samsung Galaxy A8+', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 11390000, 'SamsungA8.png', '2018-05-05 13:45:07'),
(29, 'Samsung', 'Samsung Galaxy Note 8', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 22490000, 'SamsungNote8.png', '2018-05-05 13:50:43'),
(30, 'Samsung', 'Samsung Galaxy S9', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 19990000, 'SamsungS9.png', '2018-05-05 13:53:32'),
(31, 'Samsung', 'Samsung Galaxy S9+', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 23490000, 'SamsungS9+.png', '2018-05-05 13:53:32'),
(33, 'Xiaomi', 'Xiaomi Black Shark', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 15999000, 'XiaomiBlackShark.png', '2018-05-05 20:48:16'),
(34, 'Xiaomi', 'Xiaomi Mi 6', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 11490000, 'XiaomiMi6.png', '2018-05-05 20:50:25'),
(35, 'Xiaomi', 'Xiaomi Mi Mix', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 11490000, 'XiaomiMix.png', '2018-05-05 20:50:25'),
(39, 'Xiaomi', 'Xiaomi Mi Note 3', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 7890000, 'XiaomiNote3.png', '2018-05-05 20:53:29'),
(40, 'Xiaomi', 'Xiaomi Mi Max 2', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 6290000, 'XiaomiMax2.png', '2018-05-05 20:54:41'),
(41, 'Xiaomi', 'Xiaomi Mi Note Pro', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 6190000, 'XiaomiNotePro.png', '2018-05-05 20:54:41'),
(42, 'Xiaomi', 'Xiaomi Redmi Note 5 Pro', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 6190000, 'XiamiNote5Pro.png', '2018-05-05 20:55:52'),
(43, 'Xiaomi', 'Xiaomi Mi 4C', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 5990000, 'Xiami4C.png', '2018-05-05 20:55:52'),
(44, 'Xiaomi', 'Xiaomi Mi A1', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 5490000, 'XiaomiMiA1.png', '2018-05-05 20:57:26'),
(45, 'Xiaomi', 'Xiaomi Mi 5X', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 4290000, 'XiaomiMi5X.png', '2018-05-05 20:57:26'),
(46, 'Xiaomi', 'Xiaomi Mi 4S', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 3990000, 'Xiami4S.png', '2018-05-05 20:58:41'),
(47, 'Xiaomi', 'Xiaomi Redmi Note 4', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 3690000, 'XiaomiNote4.png', '2018-05-05 20:58:41'),
(49, 'Oppo', 'OPPO F5 6GB', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 8990000, 'OppoF5.png', '2018-05-05 21:01:42'),
(50, 'Oppo', 'OPPO F5 Youth', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 5990000, 'OppoF5Youth.png', '2018-05-05 21:02:24'),
(51, 'Oppo', 'OPPO F5 Youth', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 5990000, 'OppoF5Youth.png', '2018-05-05 21:02:59'),
(52, 'Oppo', 'OPPO A83', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 4990000, 'OppoA83.png', '2018-05-05 21:02:59'),
(53, 'Oppo', 'Oppo A71 32GB', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 4190000, 'OppoA71.png', '2018-05-05 21:03:50'),
(54, 'Oppo', 'OPPO F1 Plus', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 3990000, 'OppoF1Plus.png', '2018-05-05 21:04:54'),
(55, 'Oppo', 'OPPO F3', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 3990000, 'OppoF3.png', '2018-05-05 21:04:54'),
(56, 'Oppo', 'Oppo A71K', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 3590000, 'OppoA71K.png', '2018-05-05 21:06:00');
INSERT INTO `products` (`id`, `brand`, `name`, `details`, `price`, `img`, `date`) VALUES
(57, 'Oppo', 'Oppo F3 Lite', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 3490000, 'OppoF3Lite.png', '2018-05-05 21:06:00'),
(58, 'Oppo', 'OPPO A37 (Neo 9)', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 3290000, 'OppoA37.png', '2018-05-05 21:07:05'),
(59, 'Oppo', 'OPPO F3 Plus', 'iPhone 7 / 7 Plus được Apple giới thiệu vào ngày 07 tháng 9 năm 2016 là sản phẩm xuất hiện gần cuối trong lễ ra mắt, nhưng bộ đôi iPhone thế hệ mới của Apple lại gây được nhiều chú ý nhất.  Hệt như thông tin đồn thổi hàng tháng qua, hai mẫu iPhone thế hệ mới được trình làng với tên gọi iPhone 7 và iPhone 7 Plus. Apple cũng chính thức loại bỏ phiên bản dung lượng 16GB và thay thế bằng model thấp nhất 32GB. Bên cạnh đó, người dùng có hai lựa chọn dung lượng cao 128GB và 256GB, như máy tính bảng iPad Pro Camera là trang bị được Apple dành nhiều thời gian chia sẻ nhất trên iPhone 7. Hãng tự tin cho biết iPhone thế hệ mới có camera hàng đầu. Trong đó, iPhone 7 mang đến cho người dùng iPhone trải nghiệm chụp hình gần với máy ảnh chuyên nghiệp DSLR. Camera kép lần đầu được Apple sử dụng, nhưng chỉ có trên phiên bản Plus, đem lại tính năng Zoom như ống kính quang học trên máy ảnh, cho phép phóng 2x đến 10x. Tính năng làm mờ hậu cảnh tạo ra hiệu ứng bokeh khi chụp ảnh chân dung, cận cảnh... Tất cả có được nhờ vào hệ thống 2 camera cùng độ phân giải 12 megapixel nhưng một có tiêu cự 28 mm và một có tiêu cự 56 mm.', 7490000, 'OppoF3Plus.png', '2018-05-05 21:07:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$j9bckf7JHkn1trX3YbW7nOqq92hvwQqDQ1aJ6xTadSAYKgWOf0fNy', 'utxgZw2XUmStBbhfLmNUGq84GJVicQ0pvQuy1Y6mGrpslHNAon9xvpSodukU', '2018-11-11 08:58:58', '2018-11-11 08:58:58');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
