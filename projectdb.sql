-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 19 2022 г., 21:29
-- Версия сервера: 5.5.62
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `projectdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `password` text NOT NULL,
  `salt` text NOT NULL,
  `email` text NOT NULL,
  `isemail` int(11) NOT NULL DEFAULT '0',
  `skin` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `hp` int(11) NOT NULL DEFAULT '100',
  `weapons` varchar(64) NOT NULL DEFAULT '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0',
  `ammos` varchar(64) NOT NULL DEFAULT '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0',
  `warns` int(11) NOT NULL,
  `warn_active` int(11) NOT NULL,
  `warn_time` int(11) NOT NULL,
  `regip` text NOT NULL,
  `geton_ip` text NOT NULL,
  `date_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `geton_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `salt`, `email`, `isemail`, `skin`, `gender`, `level`, `money`, `hp`, `weapons`, `ammos`, `warns`, `warn_active`, `warn_time`, `regip`, `geton_ip`, `date_reg`, `geton_date`) VALUES
(56, 'Daniel_Nelson', '4AAB553F602E5D795AEFE76092FBB0C180572E5701B11FA6921EEF5C9B0A45B2', '0KYlC|w7z5', '', 0, 137, 1, 1, 50000000, 100, '0', '0', 0, 0, 0, '127.0.0.1', '127.0.0.1', '2022-09-13 14:00:17', '2022-09-13 17:53:07'),
(57, 'admin', 'E4DF06DA406C811604897FE19D3D410F93367FF7D8866EC413BF57930FC9FFEC', 'UjW8PJElJe', '', 0, 304, 1, 1, 50000424, 69, '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0', '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0', 0, 0, 0, '127.0.0.1', '127.0.0.1', '2022-09-13 14:01:02', '2022-09-19 16:34:10'),
(58, 'Danil_Nilson', '8A3BE6FE1036867EC61157BF65B175439E106BE601A773F610AB20C804E15771', 'NkdCU`<>95', '', 0, 136, 1, 1, 50000000, 100, '0', '0', 0, 0, 0, '127.0.0.1', '127.0.0.1', '2022-09-13 18:49:07', '2022-09-18 13:58:38');

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

CREATE TABLE `admins` (
  `admin` int(11) UNSIGNED NOT NULL,
  `alevel` int(5) NOT NULL DEFAULT '1',
  `apass` text NOT NULL,
  `fd` int(11) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `avigs` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admins`
--

INSERT INTO `admins` (`admin`, `alevel`, `apass`, `fd`, `date`, `avigs`) VALUES
(57, 13, 'B771D40CABB9FE03B433099B89BA1F15B1A65D4C03322F940F696D6D54860BC9', 1, '2022-09-13 14:02:31', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `admin_log`
--

CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL,
  `admin_name` text NOT NULL,
  `type` text NOT NULL,
  `player_name` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin_log`
--

INSERT INTO `admin_log` (`id`, `admin_name`, `type`, `player_name`, `date`) VALUES
(1, 'admin', 'снял с поста администратора', 'admin', '2022-09-10 01:24:18'),
(2, 'admin', 'назначил на пост администратора, уровень 12', 'Daniel_Nelson', '2022-09-10 01:32:44'),
(3, 'admin', 'снял с поста администратора', 'Daniel_Nelson', '2022-09-10 01:58:47'),
(4, 'admin', 'назначил на пост администратора, уровень 1', 'Daniel_Nelson', '2022-09-10 02:02:21'),
(5, 'admin', 'назначил на пост администратора, уровень 12', 'Daniel_Nelson', '2022-09-10 11:06:42'),
(6, 'admin', 'назначил на пост администратора, уровень 5', 'Daniel_Nelson', '2022-09-10 13:20:53'),
(7, 'admin', 'назначил на пост администратора, уровень 1', 'Daniel_Prigman', '2022-09-10 16:05:51'),
(8, 'admin', 'назначил на пост администратора, уровень 4', 'Daniel_Nelson', '2022-09-13 14:04:27'),
(9, 'admin', 'выдал варн с причиной: тест причина', 'Danil_Nilson', '2022-09-18 02:09:07'),
(10, 'admin', 'выдал варн с причиной: тест причина', 'Danil_Nilson', '2022-09-18 02:09:33'),
(11, 'admin', 'разбанил', 'Danil_Nilson', '2022-09-18 02:12:38'),
(12, 'admin', 'разбанил', 'Danil_Nilson', '2022-09-18 02:20:23');

-- --------------------------------------------------------

--
-- Структура таблицы `baniplog`
--

CREATE TABLE `baniplog` (
  `id` int(11) NOT NULL,
  `ip` text NOT NULL,
  `date` text NOT NULL,
  `unbandate` text NOT NULL,
  `reason` text NOT NULL,
  `bandate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `banlog`
--

CREATE TABLE `banlog` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `admin` text NOT NULL,
  `date` text NOT NULL,
  `unbandate` text NOT NULL,
  `reason` text NOT NULL,
  `bandate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin`);

--
-- Индексы таблицы `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `baniplog`
--
ALTER TABLE `baniplog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `banlog`
--
ALTER TABLE `banlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `baniplog`
--
ALTER TABLE `baniplog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `banlog`
--
ALTER TABLE `banlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
