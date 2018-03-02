-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-02-2018 a las 13:23:23
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `Nif` varchar(9) NOT NULL,
  `nom_alumno` varchar(30) NOT NULL,
  `ape_alumno` varchar(40) NOT NULL,
  `foto` varchar(30) NOT NULL,
  `cod_curso` varchar(2) NOT NULL,
  PRIMARY KEY (`Nif`),
  KEY `cod_curso` (`cod_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE IF NOT EXISTS `asignatura` (
  `cod_asignatura` varchar(4) NOT NULL,
  `nom_asignatura` varchar(50) NOT NULL,
  `horas` int(11) NOT NULL,
  PRIMARY KEY (`cod_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `cod_curso` varchar(2) NOT NULL,
  `nom_curso` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`cod_curso`, `nom_curso`) VALUES
('2H', 'Desarrollo de aplicaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursoasignatura`
--

CREATE TABLE IF NOT EXISTS `cursoasignatura` (
  `cod_curso` varchar(2) NOT NULL,
  `cod_asignatura` varchar(4) NOT NULL,
  `nif_profesor` varchar(9) NOT NULL,
  `aula` varchar(4) NOT NULL,
  PRIMARY KEY (`cod_curso`,`cod_asignatura`),
  KEY `cod_curso` (`cod_curso`),
  KEY `cod_asignatura` (`cod_asignatura`),
  KEY `nif_profesor` (`nif_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
  `Nif_alumno` varchar(9) NOT NULL,
  `cod_asignatura` varchar(4) NOT NULL,
  `calificacion` int(11) NOT NULL,
  PRIMARY KEY (`Nif_alumno`,`cod_asignatura`),
  KEY `Nif_alumno` (`Nif_alumno`),
  KEY `cod_asignatura` (`cod_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE IF NOT EXISTS `profesor` (
  `Nif` varchar(9) NOT NULL,
  `nom_profesor` varchar(30) NOT NULL,
  `ape_profesor` varchar(40) NOT NULL,
  `foto` varchar(30) NOT NULL,
  PRIMARY KEY (`Nif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`cod_asignatura`) REFERENCES `asignatura` (`cod_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`Nif_alumno`) REFERENCES `alumno` (`Nif`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
