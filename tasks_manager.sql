-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2023 a las 07:11:52
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tasks_manager`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `last_task_numbers`
--

CREATE TABLE `last_task_numbers` (
  `ID_proyect` int(11) NOT NULL,
  `last_task_number` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `last_task_numbers`
--

INSERT INTO `last_task_numbers` (`ID_proyect`, `last_task_number`) VALUES
(1, 0),
(2, 5),
(3, 3),
(4, 0),
(5, 0),
(6, 0),
(7, 1),
(8, 1),
(9, 14),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyects`
--

CREATE TABLE `proyects` (
  `ID` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL DEFAULT '""'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proyects`
--

INSERT INTO `proyects` (`ID`, `name`, `description`) VALUES
(19, 'Desarrollo Frontend', 'Tarea de la asignatura');

--
-- Disparadores `proyects`
--
DELIMITER $$
CREATE TRIGGER `tr_insert_proyect_numb` AFTER INSERT ON `proyects` FOR EACH ROW BEGIN
  INSERT INTO last_task_numbers (ID_proyect) VALUES (NEW.ID);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `ID_proyect` int(11) NOT NULL,
  `ID` int(11) NOT NULL DEFAULT 1,
  `name` varchar(200) NOT NULL,
  `finished` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`ID_proyect`, `ID`, `name`, `finished`) VALUES
(19, 1, 'Crear Base de datos', b'0'),
(19, 2, 'Crear operaciones de la base de datos con php', b'0'),
(19, 3, 'Crear documento html', b'0'),
(19, 4, 'Crear funciones AJAX', b'0');

--
-- Disparadores `tasks`
--
DELIMITER $$
CREATE TRIGGER `tr_insert_task` BEFORE INSERT ON `tasks` FOR EACH ROW BEGIN
  DECLARE task_number INT;
  SELECT last_task_number INTO task_number FROM last_task_numbers WHERE ID_proyect = NEW.ID_proyect;
  IF task_number IS NULL THEN
    SET task_number = 0;
  END IF;
  SET NEW.ID = task_number + 1;
  UPDATE last_task_numbers SET last_task_number = NEW.ID WHERE ID_proyect = NEW.ID_proyect;
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `last_task_numbers`
--
ALTER TABLE `last_task_numbers`
  ADD PRIMARY KEY (`ID_proyect`);

--
-- Indices de la tabla `proyects`
--
ALTER TABLE `proyects`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`ID`,`ID_proyect`),
  ADD KEY `FK_proyects` (`ID_proyect`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `proyects`
--
ALTER TABLE `proyects`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `FK_proyects` FOREIGN KEY (`ID_proyect`) REFERENCES `proyects` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
