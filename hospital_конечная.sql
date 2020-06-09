-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 09 2020 г., 17:21
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hospital`
--

-- --------------------------------------------------------

--
-- Структура таблицы `card`
--

CREATE TABLE `card` (
  `card_id` int(255) NOT NULL,
  `patient` int(11) NOT NULL,
  `diagnose` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postup` int(55) NOT NULL,
  `data_postup` date NOT NULL,
  `hospital_ward` int(55) NOT NULL,
  `data_vip` date NOT NULL,
  `prichina_vip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `gender_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`gender_id`, `gender_name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `hair_color`
--

CREATE TABLE `hair_color` (
  `hair_color_id` int(11) NOT NULL,
  `Name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hair_color`
--

INSERT INTO `hair_color` (`hair_color_id`, `Name`) VALUES
(1, 'Рыжие'),
(2, 'Русые'),
(3, 'Черные'),
(4, 'Коричневые'),
(5, 'Каштановые'),
(6, 'Красные'),
(7, 'Синие'),
(8, 'Желтые'),
(9, 'Блондин'),
(10, 'Оранжевые'),
(11, 'Разноцветные'),
(12, 'Розовые'),
(13, 'Белые'),
(14, 'Седые');

-- --------------------------------------------------------

--
-- Структура таблицы `hospital_ward`
--

CREATE TABLE `hospital_ward` (
  `hospital_ward_id` int(11) NOT NULL,
  `number` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hospital_ward`
--

INSERT INTO `hospital_ward` (`hospital_ward_id`, `number`) VALUES
(1, 1223),
(2, 2332),
(3, 3453),
(4, 4533),
(5, 6445);

-- --------------------------------------------------------

--
-- Структура таблицы `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `hair_color` int(11) NOT NULL,
  `primeti` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `patient_neob`
--

CREATE TABLE `patient_neob` (
  `patient_id` int(11) NOT NULL,
  `lastname` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronomic` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `patient_ward`
--

CREATE TABLE `patient_ward` (
  `ward_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `hospital_ward_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `postup`
--

CREATE TABLE `postup` (
  `postup_id` int(11) NOT NULL,
  `Place_name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `postup`
--

INSERT INTO `postup` (`postup_id`, `Place_name`) VALUES
(1, 'Скорая помощь'),
(2, 'Направление из поликлиники'),
(3, 'Приведен в больницу свидетелем происшествия ');

-- --------------------------------------------------------

--
-- Структура таблицы `prichina_vip`
--

CREATE TABLE `prichina_vip` (
  `prichina_id` int(11) NOT NULL,
  `prichina` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `prichina_vip`
--

INSERT INTO `prichina_vip` (`prichina_id`, `prichina`) VALUES
(1, 'Отправлен на источники, для окончательного исцеления'),
(2, 'Отправлен в санаторий'),
(3, 'Полное выздоровление '),
(4, 'Осложнения, переведен в другую больницу'),
(5, 'Переведен в другую больницу, для окончательного выздоровления'),
(6, 'Отправлен в другую больницу, для прохождения обязательных процедур');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `gender` (`postup`),
  ADD KEY `patient` (`patient`),
  ADD KEY `patient_2` (`patient`),
  ADD KEY `hospital_ward` (`hospital_ward`),
  ADD KEY `prichina_vip` (`prichina_vip`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `hair_color`
--
ALTER TABLE `hair_color`
  ADD PRIMARY KEY (`hair_color_id`);

--
-- Индексы таблицы `hospital_ward`
--
ALTER TABLE `hospital_ward`
  ADD PRIMARY KEY (`hospital_ward_id`);

--
-- Индексы таблицы `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `gender` (`gender`),
  ADD KEY `hair_color` (`hair_color`),
  ADD KEY `hair_color_2` (`hair_color`);

--
-- Индексы таблицы `patient_neob`
--
ALTER TABLE `patient_neob`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Индексы таблицы `patient_ward`
--
ALTER TABLE `patient_ward`
  ADD PRIMARY KEY (`ward_id`),
  ADD KEY `patient_id` (`patient_id`,`hospital_ward_id`),
  ADD KEY `hospital_ward_id` (`hospital_ward_id`);

--
-- Индексы таблицы `postup`
--
ALTER TABLE `postup`
  ADD PRIMARY KEY (`postup_id`);

--
-- Индексы таблицы `prichina_vip`
--
ALTER TABLE `prichina_vip`
  ADD PRIMARY KEY (`prichina_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `card`
--
ALTER TABLE `card`
  MODIFY `card_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `hair_color`
--
ALTER TABLE `hair_color`
  MODIFY `hair_color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `hospital_ward`
--
ALTER TABLE `hospital_ward`
  MODIFY `hospital_ward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `patient_neob`
--
ALTER TABLE `patient_neob`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `patient_ward`
--
ALTER TABLE `patient_ward`
  MODIFY `ward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `postup`
--
ALTER TABLE `postup`
  MODIFY `postup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `prichina_vip`
--
ALTER TABLE `prichina_vip`
  MODIFY `prichina_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `card_ibfk_2` FOREIGN KEY (`postup`) REFERENCES `postup` (`postup_id`),
  ADD CONSTRAINT `card_ibfk_3` FOREIGN KEY (`hospital_ward`) REFERENCES `hospital_ward` (`hospital_ward_id`),
  ADD CONSTRAINT `card_ibfk_4` FOREIGN KEY (`prichina_vip`) REFERENCES `prichina_vip` (`prichina_id`);

--
-- Ограничения внешнего ключа таблицы `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`gender`) REFERENCES `gender` (`gender_id`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`hair_color`) REFERENCES `hair_color` (`hair_color_id`),
  ADD CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient_neob` (`patient_id`);

--
-- Ограничения внешнего ключа таблицы `patient_ward`
--
ALTER TABLE `patient_ward`
  ADD CONSTRAINT `patient_ward_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `patient_ward_ibfk_2` FOREIGN KEY (`hospital_ward_id`) REFERENCES `hospital_ward` (`hospital_ward_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
