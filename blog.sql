-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2023 at 11:15 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', '2023-01-05 03:31:10', '2023-01-05 03:31:10'),
(2, 'Clothes', '2023-01-05 03:31:10', '2023-01-05 03:31:10'),
(3, 'Books', '2023-01-06 11:17:14', '2023-01-06 11:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'Heloo', 1, 1, '2023-01-05 04:46:17', '2023-01-05 04:46:17'),
(2, 'hello', 1, 1, '2023-01-05 04:46:23', '2023-01-05 04:46:23'),
(3, 'Hiiii', 2, 3, '2023-01-05 04:48:08', '2023-01-05 04:48:08'),
(4, 'hiii2', 2, 3, '2023-01-05 04:49:56', '2023-01-05 04:49:56'),
(5, 'gggg', 2, 3, '2023-01-05 04:51:38', '2023-01-05 04:51:38'),
(6, 'dfgdg', 2, 3, '2023-01-05 04:54:48', '2023-01-05 04:54:48'),
(7, 'hiiiknk', 2, 2, '2023-01-05 05:09:49', '2023-01-05 05:09:49'),
(8, 'helo111', 1, 4, '2023-01-06 00:02:49', '2023-01-06 00:02:49'),
(9, 'PP', 1, 5, '2023-01-06 00:03:06', '2023-01-06 00:03:06'),
(10, 'Price please', 2, 3, '2023-01-06 01:57:53', '2023-01-06 01:57:53'),
(11, 'Price please', 2, 2, '2023-01-06 07:30:59', '2023-01-06 07:30:59'),
(12, 'hiiii', 2, 2, '2023-01-06 07:32:14', '2023-01-06 07:32:14'),
(13, 'Price Please', 1, 4, '2023-01-09 05:20:10', '2023-01-09 05:20:10'),
(14, 'Inspirational novel', 3, 6, '2023-01-09 07:12:22', '2023-01-09 07:12:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_04_100726_create_categories_table', 1),
(12, '2023_01_05_033721_create_posts_table', 2),
(13, '2023_01_05_033747_create_comments_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `detail` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `detail`, `image`, `user_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Mobile', 'OnePlus 10 Pro 5G (Emerald Forest, 12GB RAM, 256GB Storage)', 'OnePlus 10 Pro 5G (12 GB RAM, 256 GB ROM, Emerald Forest)\r\nThe 8th generation snapdragon processor and the dual stereo speakers of Oneplus Mobile 10 Pro 12GB 256GB price is budget friendly and is the reason to never settle for anything less.\r\n', 'https://m.media-amazon.com/images/I/618hqM-yxtL._SL1500_.jpg', 1, 1, '2023-01-05 04:01:15', '2023-01-05 04:01:15'),
(2, 'Mobile', 'Apple iPhone 13 Pro (128GB) - Gold', 'In this year’s new iPhone Mobile range there are four models, two of which bear the “Pro” moniker, the iPhone 13 Pro and the iPhone 13 Pro Max. Unlike with the 12 Pro series, the camera set up in both the iPhone 13 Pro and the larger Max version is the same, so most of what is said in our review can also be applied to the bigger model.\r\n\r\n', 'https://m.media-amazon.com/images/I/61sDyXAepuL._SL1500_.jpg', 2, 1, '2023-01-05 04:02:44', '2023-01-05 04:02:44'),
(3, 'Denim', 'Get your denim rules in place', 'It is time to bid goodbye to your sweatpants and step out in a pair of stylish jeans. Denims are an integral part of any wardrobe and the post-pandemic love for comfort has changed the rules of wearing your blues. Wide legs, loose-cut, no-frills, high-waist styles have found their way in. The trend this year is effortless elegance.\r\n\r\nHere are the denim trends for fall/winter 2021.\r\n\r\nBaggy Jeans\r\n\r\n', 'https://blog.thecollective.in/wp-content/uploads/2021/09/mens-denim-trends-2021.jpeg', 1, 2, '2023-01-05 04:02:44', '2023-01-05 04:02:44'),
(4, 'Lehenga Skirt', 'Lehenga Skirt! We have come up with a guide for different types of lehenga that you can go for in a party or wedding.\r\n', 'Lehenga Skirt cloth – All you need to know\r\n\r\nLehenga Skirt! its a topic which is so misinterperated as most of us are not even aware as which Lehenga skirt should we opt. So, this time around we have come up with a different kind of write-up for you “lehenga Skirt” which is not specifically meant for the bride, instead of every other girl or woman attending an Indian wedding except of course the bride herself. We have come up with a guide for different types of lehenga that you can go for in a party or wedding.\r\n\r\n\r\n\r\n', 'https://getethnic.com/wp-content/uploads/2019/11/Lehenga-Skirt-2.jpg', 2, 2, '2023-01-05 04:08:36', '2023-01-05 04:08:36'),
(5, 'Anarkali Bridal Dresses', 'The flared kalis, the bodice resembling the peshwas and jagulfis worn by Mughal women look beautiful.', 'A long flowing kurta, the extensive flare achieved through stitching together vertical panels of cloth, paired with churidar bottoms and dupattas – and you have the anarkali or the kalidar dress! It is believed that this style of dress evolved in India during the time of the Mughal emperor Akbar and the name of the outfit was derived from a famous courtesan of the times– Anarkali.\r\nThough this history may be questionable, what is certain is that the anarkali suit or dress, is as grand and magnificent as an outfit belonging to the Mughal court should be! This is why anarkalis are extremely popular when it comes to wedding fashion or festive wear.\r\nAn anarkali kurta typically has a fitted bodice and a long, flowing frock-style skirt attached to it. It may be floor length or ankle length and even in some cases, calf length. They look grand and gorgeous and bring variation into a wedding trousseau which usually is filled up with sarees and lehengas.\r\n\r\nCeleb-Worthy Chikankari Anarkali\r\n\r\nThis one is the dreamiest of the lot! Fit for every festival or occasion, this one comes in a soothing pastel blue tone, blurred out with a layer of golden net! The zardozi and sequin work elevates the look to a level of celestial beauty. The bootas all over and the ornate borders make the outfit look breathtakingly beautiful!\r\n\r\nIf you are bored of the red lehenga look for your wedding and want a slight variation, a flared, floor length anarkali dress with dupatta is the perfect alternative. The gold embroidery on this bridal anarkali is detailed and extraordinary.\r\n\r\nA bit of thread work on the neckline and a thick band of gold in the lower hem – this is all that needs to make this white anarkali dress stunning! Anarkali dresses have an exquisite cut. The hundreds of kalis on her dress and the pleated flared look they create nullifies the need of embellishments for this one.\r\n\r\nAnother impressive maroon-esque red wedding anarkali! Paired with a flared skirt, this anarkali tells the story of an exotic royal garden, thread worked all the way round the kalis.\r\n\r\nA layered wedding anarkali dress in a pastel blue tone – replete with premium zardozi embroidery also showcasing the use of stones, crystals and sequins! This ensemble is perfect for receptions and even bridal wear!', 'https://getethnic.com/wp-content/uploads/2020/01/11.jpg', 1, 2, '2023-01-05 04:09:26', '2023-01-05 04:09:26'),
(6, 'Autobiography', 'Wings of Fire - An Autobiography  was written by Dr Kalam and Arun Tiwari', 'One of the most inspiring and popular autobiographies to read is Late Abdul Kalam’s Wings of Fire. In this book, the former president shares his personal experiences and minutest details of his life. It narrates his life, right from the former late president’s rise from humble beginnings to his vision for the country in the year 2020. It has been divided into four parts equally. The first part narrates his early life that includes his parents, teachers and other influential role models. The second part deals with Kalam’s further education, work experience and his involvement with the military projects. The third and the fourth parts are about his ISRO career and the last phase of his life, where he was bestowed upon with several awards and honours.', 'https://rukminim1.flixcart.com/image/416/416/juk4gi80/book/4/6/6/wings-of-fire-original-imaffmk4gx5pxqvf.jpeg?q=70', 1, 3, '2023-01-09 03:37:39', '2023-01-09 03:37:39'),
(7, 'Novel', 'Rich Dad Poor Dad by Robert T. Kiyosaki', 'Rich Dad, Poor Dad is one of the best-selling financial books in history, selling over 35 million copies. The premise: when growing up, author Robert Kiyosaki had two dads advising him:\r\n\r\n1) a Stanford-educated Ph.D. who followed traditional career thinking and was financially illiterate (the Poor Dad, his biological father);\r\n\r\n2) a high school dropout who built a business empire employing thousands (the Rich Dad, his best friend’s father).\r\n\r\nThe two dads are a parable for two approaches to wealth: Poor Dad recommends getting a secure job with good benefits and retiring with a pension. Rich Dad suggests amassing assets that make money for you, becoming financially literate, and practicing independent thinking.\r\nThis book teaches how to achieve financial independence, why it’s a terrible idea to see your home as your biggest investment, and how to overcome the biggest mental blocks to becoming wealthy.', 'https://literatureglobe.com/wp-content/uploads/2020/10/Rich-Dad-Poor-Dad-min-e1660818402187.jpeg', 2, 3, '2023-01-09 03:37:39', '2023-01-09 03:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Palak', 'palak@gmail.com', NULL, '$2y$10$pcJvizutQqiSYjcnqUx48OaC7sweyorokp7.MZpAoVgtOD88aXGRq', NULL, '2023-01-04 22:28:58', '2023-01-04 22:28:58'),
(2, 'Rajat', 'rajat@gmail.com', NULL, '$2y$10$qh0.kOXQ/EPZw1EWk6kvt..loPMsfOZWUmcR0CPtwjyAa1nFpHHLu', NULL, '2023-01-04 22:30:42', '2023-01-04 22:30:42'),
(3, 'Kumkum', 'kumkum@gmail.com', NULL, '$2y$10$6YLOaBpCp4RNPkvL17O.UOgPTECvINWwDQ7ROsT7JhIKbX1ue8UV.', NULL, '2023-01-09 07:05:39', '2023-01-09 07:05:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
