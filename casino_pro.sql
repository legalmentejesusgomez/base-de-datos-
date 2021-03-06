-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2021 a las 23:27:08
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `casino_pro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `Id_poducto` varchar(15) DEFAULT NULL,
  `tipo_de_pago` varchar(5) DEFAULT NULL,
  `fecha_hora_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imventarios`
--

CREATE TABLE `imventarios` (
  `id_producto` varchar(15) DEFAULT NULL,
  `valor_producto_individual` int(15) DEFAULT NULL,
  `valor_compra_por_mayor` int(15) DEFAULT NULL,
  `gasto_casino` int(45) NOT NULL,
  `precio_de_venta` int(7) DEFAULT NULL,
  `cantidad_original` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` varchar(45) NOT NULL,
  `descripcion` varchar(65) DEFAULT NULL,
  `precio` int(7) DEFAULT NULL,
  `cantidad` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumen`
--

CREATE TABLE `resumen` (
  `total_compra` int(8) DEFAULT NULL,
  `gasto_casino` int(7) DEFAULT NULL,
  `ganacias` int(15) DEFAULT NULL,
  `total_deuda` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_pago`
--

CREATE TABLE `tipo_de_pago` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD KEY `Id_poducto` (`Id_poducto`),
  ADD KEY `tipo_de_pago` (`tipo_de_pago`);

--
-- Indices de la tabla `imventarios`
--
ALTER TABLE `imventarios`
  ADD PRIMARY KEY (`gasto_casino`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `resumen`
--
ALTER TABLE `resumen`
  ADD KEY `gasto_casino` (`gasto_casino`);

--
-- Indices de la tabla `tipo_de_pago`
--
ALTER TABLE `tipo_de_pago`
  ADD PRIMARY KEY (`codigo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`Id_poducto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`tipo_de_pago`) REFERENCES `tipo_de_pago` (`codigo`);

--
-- Filtros para la tabla `imventarios`
--
ALTER TABLE `imventarios`
  ADD CONSTRAINT `imventarios_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `resumen`
--
ALTER TABLE `resumen`
  ADD CONSTRAINT `resumen_ibfk_1` FOREIGN KEY (`gasto_casino`) REFERENCES `imventarios` (`gasto_casino`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
