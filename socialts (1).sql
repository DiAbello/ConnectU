-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 01 2024 г., 13:48
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `socialts`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_09_161330_users', 2),
(6, '2023_12_18_143728_user_images', 3),
(7, '2023_12_19_163501_update_user_images', 4),
(8, '2023_12_27_132344_publics', 5),
(9, '2023_12_27_134003_posts', 5),
(10, '2023_12_27_134010_post_images', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
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
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `public_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `public_id`, `created_at`, `content`) VALUES
(3, 11, NULL, '2024-01-01 21:47:49', 'крутой пост про меня любимого'),
(4, 11, NULL, '2024-01-01 21:48:36', 'дада это я'),
(5, 10, NULL, '2024-01-02 00:01:35', 'Самый крутой пост, правда он тестовый :((('),
(7, 12, NULL, '2024-01-02 00:08:09', 'У меня в жизни вообще всё прекрасно, и быть лучше не может'),
(8, 11, NULL, '2024-01-03 13:59:50', 'у меня всё гуд');

-- --------------------------------------------------------

--
-- Структура таблицы `post_images`
--

CREATE TABLE `post_images` (
  `id` int(11) NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_images`
--

INSERT INTO `post_images` (`id`, `post_id`, `image_name`, `like_count`, `created_at`) VALUES
(1, 3, 'Screenshot_1.png', 0, NULL),
(2, 4, 'Screenshot_1.png', 0, NULL),
(3, 4, 'Screenshot_2.png', 0, NULL),
(4, 5, '988021.jpg', 0, NULL),
(5, 7, 'Screenshot_11.png', 0, NULL),
(6, 8, 'brQE4YIBm8M.jpg', 0, '2024-01-03 13:59:50'),
(7, 8, 'cpbPTQR8pdo.jpg', 0, '2024-01-03 13:59:51');

-- --------------------------------------------------------

--
-- Структура таблицы `publics`
--

CREATE TABLE `publics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `public_tag` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `public_photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `surname` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `profile_photo` varchar(255) NOT NULL DEFAULT 'def.svg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `surname`, `tag`, `profile_photo`) VALUES
(10, 'Полина', 'ahaha@g.c', NULL, '$2y$12$fazL1rnOfeTMkLHrpEkU1.iaaoALbVyP1XQ7oLWK3B4iPb2yMfaYa', '1X5hga6od6O6s6XF87Hp90sLtNyx3o7jXKKWPi0Si8bZJmSQWH', NULL, NULL, 'Мардамшина', '@privet', 'Screenshot_1.png'),
(11, 'Илья', 'test@g.c', NULL, '$2y$12$fRxweYUCMU9pOXNzsqfoDO5RS2muFWNNy2DvOq2yDsJzChPiTYVp.', 'M5Hr1hwwYEEWhdPkZWqiaK0Is7zXshvOBK4WfDXlRjLrONeZP4', NULL, NULL, 'Потапов', '@diabello', 'khrabroe-serdtse-uil-yam-uolles-oboi-3840x2400_9.jpg'),
(12, 'Максим', '111@g.c', NULL, '$2y$12$VpvCloU11G..l1iv9aDE4uMSMnblnSyKLJWh0XZijdJkHRujSJ0U6', 'laKQNWpcYOa23mlj0GG5dHUn27l0K2zVcVpw7OH0uBVTGYZiHt', NULL, NULL, 'Пиянзин', '@Nestepashkin', 'новый год.png');

-- --------------------------------------------------------

--
-- Структура таблицы `user_images`
--

CREATE TABLE `user_images` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `like_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_images`
--

INSERT INTO `user_images` (`user_id`, `image_name`, `id`, `created_at`, `like_count`) VALUES
(10, 'Screenshot_1.png', 1, '2023-12-19 16:38:33', 0),
(11, 'Andrew_Garfield_as_Spider-Man.jpg', 2, '2023-12-19 16:38:33', 0),
(11, 'фото.png', 3, '2023-12-19 16:38:33', 0),
(11, 'Screenshot_1.png', 4, '2023-12-19 16:38:33', 0),
(11, 'tapl drop me like.png', 5, '2023-12-19 16:38:33', 0),
(11, 'плита.jpg', 6, '2023-12-19 16:38:33', 0),
(11, 'Screenshot_1.png', 7, '2023-12-19 16:38:33', 0),
(11, 'GOruahYKFFLIMumRcRE_nQ.jpeg', 8, '2023-12-19 16:38:33', 0),
(12, 'cV1YJAibe20.jpg', 9, '2023-12-24 17:09:29', 0),
(12, '2bcd7fdff86df57e59e4e46e00ad00c5.jpg', 10, '2023-12-24 17:13:16', 0),
(12, 'новый год.png', 11, '2023-12-24 17:13:35', 0),
(11, '0ELTe3m_-U4.jpg', 12, '2023-12-24 17:15:12', 0),
(11, 'Screenshot_2.png', 13, '2023-12-24 17:18:27', 0),
(11, 'khrabroe-serdtse-uil-yam-uolles-oboi-3840x2400_9.jpg', 14, '2024-01-03 13:57:27', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_public_id_foreign` (`public_id`);

--
-- Индексы таблицы `post_images`
--
ALTER TABLE `post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_images_post_id_foreign` (`post_id`);

--
-- Индексы таблицы `publics`
--
ALTER TABLE `publics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `publics_public_tag_unique` (`public_tag`),
  ADD KEY `publics_created_by_foreign` (`created_by`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_tag_unique` (`tag`);

--
-- Индексы таблицы `user_images`
--
ALTER TABLE `user_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_images_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `post_images`
--
ALTER TABLE `post_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `publics`
--
ALTER TABLE `publics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `user_images`
--
ALTER TABLE `user_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_public_id_foreign` FOREIGN KEY (`public_id`) REFERENCES `publics` (`id`),
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `post_images`
--
ALTER TABLE `post_images`
  ADD CONSTRAINT `post_images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Ограничения внешнего ключа таблицы `publics`
--
ALTER TABLE `publics`
  ADD CONSTRAINT `publics_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_images`
--
ALTER TABLE `user_images`
  ADD CONSTRAINT `user_images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
