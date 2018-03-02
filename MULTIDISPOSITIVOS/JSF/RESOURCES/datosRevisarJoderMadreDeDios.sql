-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-02-2018 a las 16:06:45
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `Nif` varchar(9) NOT NULL,
  `nom_alumno` varchar(30) NOT NULL,
  `ape_alumno` varchar(40) NOT NULL,
  `foto` varchar(30) NOT NULL,
  `cod_curso` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`Nif`, `nom_alumno`, `ape_alumno`, `foto`, `cod_curso`) VALUES
('11111111a', 'Alumno 1', 'Martinez', 'tio1.jpg', '1H'),
('11111111b', 'Alumno 2', 'Ramírez', 'tio2.jpg', '1H'),
('11111111c', 'Alumno 3', 'Fernández', 'tio3.jpg', '2H'),
('11111111d', 'Alumno 4', 'Giménez', 'tio4.jpg', '2H'),
('22222222a', 'Alumna 5', 'Gómez', 'tia1.png', '1J'),
('22222222b', 'Alumna 6', 'Dalmau', 'tia2.png', '1J'),
('22222222c', 'Alumna 7', 'Redondo', 'tia3.png', '2J'),
('22222222d', 'Alumna 8', 'Yoldi', 'tia4.png', '2J');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `cod_asignatura` varchar(4) NOT NULL,
  `nom_asignatura` varchar(50) NOT NULL,
  `horas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`cod_asignatura`, `nom_asignatura`, `horas`) VALUES
('g1', 'Gorka I', 10),
('g2', 'Gorka II', 10),
('g3', 'Gorka III', 10),
('g4', 'Gorka 4', 20),
('g5', 'Gorka 5', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `cod_curso` varchar(2) NOT NULL,
  `nom_curso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`cod_curso`, `nom_curso`) VALUES
('1H', 'Desarrollo de Aplicaciones Multiplataforma'),
('1J', 'Primero J'),
('2H', 'Desarrollo de aplicaciones Multiplataforma'),
('2J', 'Segundo J');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursoasignatura`
--

CREATE TABLE `cursoasignatura` (
  `cod_curso` varchar(2) NOT NULL,
  `cod_asignatura` varchar(4) NOT NULL,
  `nif_profesor` varchar(9) NOT NULL,
  `aula` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cursoasignatura`
--

INSERT INTO `cursoasignatura` (`cod_curso`, `cod_asignatura`, `nif_profesor`, `aula`) VALUES
('1H', 'g1', '11111111A', 'a1'),
('1H', 'g2', '11111111A', 'a1'),
('1J', 'g2', '22222222B', 'b1'),
('1J', 'g3', '22222222B', 'b2'),
('2H', 'g3', '22222222B', 'a2'),
('2H', 'g4', '22222222B', 'a3'),
('2J', 'g4', '11111111A', 'b3'),
('2J', 'g5', '11111111A', 'b4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `Nif_alumno` varchar(9) NOT NULL,
  `cod_asignatura` varchar(4) NOT NULL,
  `calificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`Nif_alumno`, `cod_asignatura`, `calificacion`) VALUES
('11111111a', 'g1', 8),
('11111111a', 'g2', 6),
('11111111b', 'g1', 0),
('11111111b', 'g2', 10),
('11111111c', 'g3', 8),
('11111111c', 'g4', 9),
('11111111d', 'g3', 3),
('11111111d', 'g4', 4),
('22222222a', 'g2', 8),
('22222222a', 'g3', 7),
('22222222b', 'g2', 5),
('22222222b', 'g3', 5),
('22222222c', 'g4', 10),
('22222222c', 'g5', 10),
('22222222d', 'g4', 6),
('22222222d', 'g5', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `Nif` varchar(9) NOT NULL,
  `nom_profesor` varchar(30) NOT NULL,
  `ape_profesor` varchar(40) NOT NULL,
  `foto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`Nif`, `nom_profesor`, `ape_profesor`, `foto`) VALUES
('11111111A', 'Gorka', 'Terminator', 'gorka.jpg'),
('22222222B', 'No Gorka', 'wasfsdfsfsd', 'nogorka.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`Nif`),
  ADD KEY `cod_curso` (`cod_curso`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`cod_asignatura`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cod_curso`);

--
-- Indices de la tabla `cursoasignatura`
--
ALTER TABLE `cursoasignatura`
  ADD PRIMARY KEY (`cod_curso`,`cod_asignatura`),
  ADD KEY `cod_curso` (`cod_curso`),
  ADD KEY `cod_asignatura` (`cod_asignatura`),
  ADD KEY `nif_profesor` (`nif_profesor`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`Nif_alumno`,`cod_asignatura`),
  ADD KEY `Nif_alumno` (`Nif_alumno`),
  ADD KEY `cod_asignatura` (`cod_asignatura`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`Nif`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `cursoasignatura`
--
ALTER TABLE `cursoasignatura`
  ADD CONSTRAINT `cursoasignatura_ibfk_1` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cursoasignatura_ibfk_2` FOREIGN KEY (`cod_asignatura`) REFERENCES `asignatura` (`cod_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cursoasignatura_ibfk_3` FOREIGN KEY (`nif_profesor`) REFERENCES `profesor` (`Nif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`Nif_alumno`) REFERENCES `alumno` (`Nif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`cod_asignatura`) REFERENCES `asignatura` (`cod_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
