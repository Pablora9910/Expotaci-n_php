-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2021 a las 10:07:04
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comidarapida_php`
--
CREATE DATABASE IF NOT EXISTS `comidarapida_php` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;
USE `comidarapida_php`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `nombreEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `apellidosEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `dniEmpleado` varchar(9) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `tlfEmpleado` int(11) DEFAULT NULL,
  `dirrecionEmpleado` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `correoEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `dirigeEmpleado` int(11) DEFAULT NULL,
  `idLocalFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `nombreEmpleado`, `apellidosEmpleado`, `dniEmpleado`, `tlfEmpleado`, `dirrecionEmpleado`, `correoEmpleado`, `dirigeEmpleado`, `idLocalFK`) VALUES
(1, 'Alberto', 'Romero', '12345678L', 123456789, 'Avd Montesierra', 'alberto@gmail.com', NULL, 1),
(2, 'Alvaro', 'Cruz', '12345678L', 123456789, 'Avd Montesierra', 'alvaro@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indoor`
--

CREATE TABLE `indoor` (
  `idIndoor` int(11) NOT NULL,
  `nrepartidoresIndoor` int(11) NOT NULL,
  `idLocalFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `indoor`
--

INSERT INTO `indoor` (`idIndoor`, `nrepartidoresIndoor`, `idLocalFK`) VALUES
(1, 20, 1),
(2, 52, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locales`
--

CREATE TABLE `locales` (
  `idLocal` int(11) NOT NULL,
  `dirrecionLocal` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `mcuadradosLocal` decimal(6,2) NOT NULL,
  `mcuadradococinaLocal` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `locales`
--

INSERT INTO `locales` (`idLocal`, `dirrecionLocal`, `mcuadradosLocal`, `mcuadradococinaLocal`) VALUES
(1, 'Avd Kanssas City', '125.00', '30.00'),
(4, 'Avd Kanssas City', '50.60', '10.90'),
(5, 'Calle Fresas', '54.60', '8.60'),
(6, 'Avd JJJ', '98.00', '20.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `outdoor`
--

CREATE TABLE `outdoor` (
  `idOutdoor` int(11) NOT NULL,
  `nmesasOutdoor` int(11) DEFAULT NULL,
  `aforomaximoOutdoor` int(11) DEFAULT NULL,
  `idLocalFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `outdoor`
--

INSERT INTO `outdoor` (`idOutdoor`, `nmesasOutdoor`, `aforomaximoOutdoor`, `idLocalFK`) VALUES
(3, 30, 50, 5),
(4, 50, 80, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provee`
--

CREATE TABLE `provee` (
  `idProvee` int(11) NOT NULL,
  `idLocalFK` int(11) DEFAULT NULL,
  `idProveedorFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `provee`
--

INSERT INTO `provee` (`idProvee`, `idLocalFK`, `idProveedorFK`) VALUES
(1, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `productosProveedor` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `dirrecionProveedor` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `nombreProveedor`, `productosProveedor`, `dirrecionProveedor`) VALUES
(1, 'Pablo', 'Lechuga', 'Avd Andalucía');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idLocalFK` (`idLocalFK`),
  ADD KEY `dirigeEmpleado` (`dirigeEmpleado`);

--
-- Indices de la tabla `indoor`
--
ALTER TABLE `indoor`
  ADD PRIMARY KEY (`idIndoor`);

--
-- Indices de la tabla `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`idLocal`);

--
-- Indices de la tabla `outdoor`
--
ALTER TABLE `outdoor`
  ADD PRIMARY KEY (`idOutdoor`),
  ADD KEY `idLocalFK` (`idLocalFK`);

--
-- Indices de la tabla `provee`
--
ALTER TABLE `provee`
  ADD PRIMARY KEY (`idProvee`),
  ADD KEY `idLocalFK` (`idLocalFK`),
  ADD KEY `idProveedorFK` (`idProveedorFK`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `indoor`
--
ALTER TABLE `indoor`
  MODIFY `idIndoor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `locales`
--
ALTER TABLE `locales`
  MODIFY `idLocal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `outdoor`
--
ALTER TABLE `outdoor`
  MODIFY `idOutdoor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `provee`
--
ALTER TABLE `provee`
  MODIFY `idProvee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idLocalFK`) REFERENCES `locales` (`idLocal`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`dirigeEmpleado`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `outdoor`
--
ALTER TABLE `outdoor`
  ADD CONSTRAINT `outdoor_ibfk_1` FOREIGN KEY (`idLocalFK`) REFERENCES `locales` (`idLocal`);

--
-- Filtros para la tabla `provee`
--
ALTER TABLE `provee`
  ADD CONSTRAINT `provee_ibfk_1` FOREIGN KEY (`idLocalFK`) REFERENCES `locales` (`idLocal`),
  ADD CONSTRAINT `provee_ibfk_2` FOREIGN KEY (`idProveedorFK`) REFERENCES `proveedores` (`idProveedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
