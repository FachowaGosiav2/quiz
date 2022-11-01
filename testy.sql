-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 06 Paź 2022, 15:08
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `quiz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `testy`
--

CREATE TABLE `testy` (
  `id` int(11) NOT NULL,
  `Numer_testu` varchar(45) NOT NULL,
  `Pytania_id` int(11) NOT NULL,
  `Odpowiedzi_id` int(11) NOT NULL,
  `Uczniowie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `testy`
--

INSERT INTO `testy` (`id`, `Numer_testu`, `Pytania_id`, `Odpowiedzi_id`, `Uczniowie_id`) VALUES
(1, '1', 1, 1, 1),
(2, '2', 2, 2, 2),
(3, '3', 3, 3, 3),
(4, '4', 4, 4, 4),
(5, '5', 5, 5, 5),
(6, '6', 6, 6, 6),
(7, '7', 7, 7, 7),
(8, '8', 8, 8, 8);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `testy`
--
ALTER TABLE `testy`
  ADD PRIMARY KEY (`id`,`Pytania_id`,`Odpowiedzi_id`,`Uczniowie_id`),
  ADD KEY `fk_Testy_Pytania` (`Pytania_id`),
  ADD KEY `fk_Testy_Odpowiedzi1` (`Odpowiedzi_id`),
  ADD KEY `fk_Testy_Uczniowie1` (`Uczniowie_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `testy`
--
ALTER TABLE `testy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `testy`
--
ALTER TABLE `testy`
  ADD CONSTRAINT `fk_Testy_Odpowiedzi1` FOREIGN KEY (`Odpowiedzi_id`) REFERENCES `odpowiedzi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Testy_Pytania` FOREIGN KEY (`Pytania_id`) REFERENCES `pytania` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Testy_Uczniowie1` FOREIGN KEY (`Uczniowie_id`) REFERENCES `uczniowie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
