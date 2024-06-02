-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 02 2024 г., 12:04
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
-- Структура таблицы `friendlist`
--

CREATE TABLE `friendlist` (
  `person1` bigint(20) UNSIGNED NOT NULL,
  `person2` bigint(20) UNSIGNED NOT NULL,
  `friend_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `friendlist`
--

INSERT INTO `friendlist` (`person1`, `person2`, `friend_status`) VALUES
(11, 12, 1),
(14, 11, 1),
(12, 14, 1),
(18, 17, 1);

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
(10, '2023_12_27_134010_post_images', 5),
(13, '2024_06_01_134224_user_report', 6);

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
(7, 12, NULL, '2024-01-02 00:08:09', 'У меня в жизни вообще всё прекрасно, и быть лучше не может'),
(8, 11, NULL, '2024-01-03 13:59:50', 'у меня всё гуд'),
(30, 12, NULL, '2024-06-01 16:22:54', 'Тест фоточек'),
(31, 17, NULL, '2024-06-02 08:46:50', 'Пост очень крутой'),
(32, 18, NULL, '2024-06-02 08:48:33', 'dadada ya krutaya'),
(33, 18, NULL, '2024-06-02 08:48:59', '-На фоточке это я, дадая'),
(34, 14, NULL, '2024-06-02 10:02:56', 'Я пожилой админ, вопросы?');

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
(5, 7, 'Screenshot_11.png', 0, NULL),
(6, 8, 'brQE4YIBm8M.jpg', 0, '2024-01-03 13:59:50'),
(7, 8, 'cpbPTQR8pdo.jpg', 0, '2024-01-03 13:59:51'),
(37, 30, '0e1da24ccfe114e031e86bf15c2102eb.jpg', 0, '2024-06-01 16:22:54'),
(38, 30, '2eea8c267a7a4aebddb2dd55aeda6c93.jpg', 0, '2024-06-01 16:22:54'),
(39, 30, '21ddd0a71bd0d46832aa54281fadf906.jpg', 0, '2024-06-01 16:22:54'),
(40, 30, '47aa0ce301a80c332232ff3fa72949c4.jpg', 0, '2024-06-01 16:22:54'),
(41, 30, '1014e3141d5bc15bde5d8d5198f3e68d.jpg', 0, '2024-06-01 16:22:54'),
(42, 31, '265b6b098222cd761de85a7df781e68f.jpg', 0, '2024-06-02 08:46:50'),
(43, 31, '329d1930d11c21b608dda8b0f831c528.jpg', 0, '2024-06-02 08:46:50'),
(44, 31, '1014e3141d5bc15bde5d8d5198f3e68d.jpg', 0, '2024-06-02 08:46:50'),
(45, 31, '1132d8693a0090f5e792b488d1e6f355.jpg', 0, '2024-06-02 08:46:50'),
(46, 31, '27967b883281abe40d30b86a9afb6eb9.jpg', 0, '2024-06-02 08:46:50'),
(47, 32, '1014e3141d5bc15bde5d8d5198f3e68d.jpg', 0, '2024-06-02 08:48:33'),
(48, 32, '1132d8693a0090f5e792b488d1e6f355.jpg', 0, '2024-06-02 08:48:33'),
(49, 32, '27967b883281abe40d30b86a9afb6eb9.jpg', 0, '2024-06-02 08:48:33'),
(50, 32, 'd1ca9ab3fb5ad407597b302687762575.jpg', 0, '2024-06-02 08:48:33'),
(51, 32, 'dcf4cb201a2b37c45b4d026af7941b37.jpg', 0, '2024-06-02 08:48:33'),
(52, 33, 'd1ca9ab3fb5ad407597b302687762575.jpg', 0, '2024-06-02 08:48:59'),
(53, 34, '50bd1668d17c53d654642759a85a9791.jpg', 0, '2024-06-02 10:02:56');

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
-- Структура таблицы `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `report_sender` bigint(20) UNSIGNED NOT NULL,
  `report_offending` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reports`
--

INSERT INTO `reports` (`id`, `report_sender`, `report_offending`, `content`, `timestamp`) VALUES
(6, 14, 11, 'Подозрительный пользователь', '2024-06-01 16:15:56');

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
(11, 'Илья', 'test@g.c', NULL, '$2y$12$fRxweYUCMU9pOXNzsqfoDO5RS2muFWNNy2DvOq2yDsJzChPiTYVp.', 'M5Hr1hwwYEEWhdPkZWqiaK0Is7zXshvOBK4WfDXlRjLrONeZP4', NULL, NULL, 'Потапов', '@diabello', 'khrabroe-serdtse-uil-yam-uolles-oboi-3840x2400_9.jpg'),
(12, 'Максим', '111@g.c', NULL, '$2y$12$VpvCloU11G..l1iv9aDE4uMSMnblnSyKLJWh0XZijdJkHRujSJ0U6', 'laKQNWpcYOa23mlj0GG5dHUn27l0K2zVcVpw7OH0uBVTGYZiHt', NULL, NULL, 'Пиянзин', '@Nestepashkin', 'новый год.png'),
(14, 'admin', 'admin@g.c', NULL, '$2y$12$3VqL77Pi1vSAbOs4dI9DUOm5AVz9yiJ7.zfYVjjp95eBzHs2G72Tq', 'TmywCkKiSvKCzrGf9F9zEzQWSRZ5lqmEsNiK1KJmsj7LStODfJ', NULL, NULL, 'admin', '@admin', '21ddd0a71bd0d46832aa54281fadf906.jpg'),
(17, 'Алёша', 'kocheva@g.com', NULL, '$2y$12$tfUuo40Jd55mlI.HFddlvu6YQNl0bQOybkEX5s0/8mTGkj7VsY6yy', 'OlfIOMSoBINsUmF7f7I8yUiSSPDeBPRKUmUdTMU6JlzYGvXpd9', NULL, NULL, 'Понасенко', '@kocheva', '1132d8693a0090f5e792b488d1e6f355.jpg'),
(18, 'Настя', 'kakanastya@g.c', NULL, '$2y$12$1zGxCxSE9361J1h8ThgcZOThPzwQxqjg63miXtMHQq.thOBbhhY9K', 'hxFf3WUN8tYAq88XvIPlZSQhwkx0Po6oU1GtykPsnMkwrK3rSQ', NULL, NULL, 'Простая', '@kakanastya', 'd1ca9ab3fb5ad407597b302687762575.jpg');

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
(11, 'khrabroe-serdtse-uil-yam-uolles-oboi-3840x2400_9.jpg', 14, '2024-01-03 13:57:27', 0),
(14, '21ddd0a71bd0d46832aa54281fadf906.jpg', 17, '2024-06-01 13:02:49', 0),
(17, '1132d8693a0090f5e792b488d1e6f355.jpg', 18, '2024-06-02 08:46:31', 0),
(18, '329d1930d11c21b608dda8b0f831c528.jpg', 19, '2024-06-02 08:48:07', 0),
(18, 'd1ca9ab3fb5ad407597b302687762575.jpg', 20, '2024-06-02 08:48:17', 0);

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
-- Индексы таблицы `friendlist`
--
ALTER TABLE `friendlist`
  ADD KEY `friendlist_person1_foreign` (`person1`),
  ADD KEY `friendlist_person2_foreign` (`person2`);

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
-- Индексы таблицы `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_report_sender_foreign` (`report_sender`),
  ADD KEY `reports_report_offending_foreign` (`report_offending`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `post_images`
--
ALTER TABLE `post_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `publics`
--
ALTER TABLE `publics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `user_images`
--
ALTER TABLE `user_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `friendlist`
--
ALTER TABLE `friendlist`
  ADD CONSTRAINT `friendlist_person1_foreign` FOREIGN KEY (`person1`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friendlist_person2_foreign` FOREIGN KEY (`person2`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_public_id_foreign` FOREIGN KEY (`public_id`) REFERENCES `publics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `post_images`
--
ALTER TABLE `post_images`
  ADD CONSTRAINT `post_images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `publics`
--
ALTER TABLE `publics`
  ADD CONSTRAINT `publics_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_report_offending_foreign` FOREIGN KEY (`report_offending`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_report_sender_foreign` FOREIGN KEY (`report_sender`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_images`
--
ALTER TABLE `user_images`
  ADD CONSTRAINT `user_images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
