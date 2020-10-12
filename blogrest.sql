-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2020 a las 04:02:43
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blogrest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `idmsj` int(11) NOT NULL,
  `idtema` int(11) NOT NULL,
  `mensaje` varchar(256) NOT NULL,
  `user` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`idmsj`, `idtema`, `mensaje`, `user`, `fecha`) VALUES
(1, 1, 'Excelente curso', 'admin', '2020-10-10 22:31:32'),
(2, 1, 'Me agrada el curso!', 'admin', '2020-10-10 22:31:45'),
(4, 3, 'Buen tema', 'admin', '2020-10-10 22:39:28'),
(5, 5, 'Hola mundo', 'admin', '2020-10-10 22:41:45'),
(6, 3, 'Hola videojuegos!!', 'admin', '2020-10-12 01:23:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE `temas` (
  `idtema` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`idtema`, `nombre`) VALUES
(1, 'Programacion'),
(3, 'Videojuego'),
(4, 'Redes'),
(5, 'Moviles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `user` varchar(20) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `tipo` char(1) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`user`, `pass`, `tipo`, `nombre`) VALUES
('admin', '123', 'A', 'Administrador'),
('ignacio', '123', 'A', 'Ignacio'),
('usuario1', '123', 'U', 'Fulanito');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`idmsj`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`idtema`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `idmsj` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
