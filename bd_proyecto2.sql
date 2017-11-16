-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2017 a las 18:16:15
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_proyecto2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias`
--

CREATE TABLE `incidencias` (
  `id_incidencia` int(2) NOT NULL,
  `descripcion_incidencia` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_ini_incidencia` date NOT NULL,
  `fecha_fin_incidencia` date NOT NULL,
  `estado_incidencia` enum('Reparado','En reparacion') COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario` int(2) NOT NULL,
  `id_recursos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE `recursos` (
  `id_recursos` int(2) NOT NULL,
  `nombre_recursos` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_recurso` enum('Aula','Despacho','Sala de reuniones','Proyectores','Moviles','Portatiles') COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_recursos` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fotos_recursos` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `estado_recursos` enum('Disponible','Reservado') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recursos`
--

INSERT INTO `recursos` (`id_recursos`, `nombre_recursos`, `tipo_recurso`, `descripcion_recursos`, `fotos_recursos`, `estado_recursos`) VALUES
(1, 'Aula sin proyector', 'Aula', 'Aula pequeña sin proyector, en caso de necesitarlo, se puede coger el portatil y enchufarlo', 'img/recursos/aula_sin_proyector.jpg', 'Reservado'),
(2, 'Aula con proyector 1', 'Aula', 'Aula pequeña con proyector', 'img/recursos/aula_con_proyector2.jpg', 'Reservado'),
(3, 'Aula con proyector 2', 'Aula', 'Aula grande con proyector', 'img/recursos/aula_con_proyector.jpeg', 'Reservado'),
(4, 'Aula de informática 1', 'Aula', 'Aula de informática con 20 ordenadores', 'img/recursos/aula_informatica.jpg', 'Reservado'),
(5, 'Aula de informática 2', 'Aula', 'Aula de informática con 20 ordenadores', 'img/recursos/aula-informatica2.jpg', 'Disponible'),
(6, 'Despacho para entrevistas 1', 'Despacho', 'Despacho pequeño para entrevistas', 'img/recursos/despacho_pequeno1.jpg', 'Reservado'),
(7, 'Despacho para entrevistas 2', 'Despacho', 'Despacho grande para entrevistas', 'img/recursos/despacho_grande.jpg', 'Disponible'),
(8, 'Sala de reuniones', 'Sala de reuniones', 'Sala grande para reuniones. En caso de querer darle otra utilidad, tendrá que ser comunicado antes', 'img/recursos/salas-reuniones.jpg', 'Reservado'),
(9, 'Proyector portatil', 'Proyectores', 'Proyector portatil. Se puede utilizar en cualquiera de las aulas que vienen sin uno', 'img/recursos/proyector_portatil.jpg', 'Disponible'),
(10, 'Carro de portatiles', 'Portatiles', 'Carro con capacidad para llevar hasta 40 ordenadores portatiles', 'img/recursos/carro_portatiljpg.jpg', 'Reservado'),
(11, 'Ordenador portatil Toshiba', 'Portatiles', 'Ordenador portatil de la marca Toshiba', 'img/recursos/portatil_toshiba.jpg', 'Reservado'),
(12, 'Ordenador portatil HP', 'Portatiles', 'Ordenador portatil de la marca HP', 'img/recursos/portatil_hp.jpg', 'Reservado'),
(13, 'Ordenador portatil MSI', 'Portatiles', 'Ordenador portatil de la marca MSI', 'img/recursos/msi_portatil.jpg', 'Reservado'),
(14, 'Teléfono movil Samsung S7 edge', 'Moviles', 'Teléfono movil de última generación de la marca samsung', 'img/recursos/samsung_galaxy_s7_edge.jpg', 'Reservado'),
(15, 'Teléfono movil Huawei p8', 'Moviles', 'Teléfono movil Huawei', 'img/recursos/huawei-p8.jpg', 'Reservado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(2) NOT NULL,
  `fecha_in_reserva` date NOT NULL,
  `fecha_fin_reserva` date NOT NULL,
  `id_usuario` int(2) NOT NULL,
  `id_recursos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(2) NOT NULL,
  `nombre_usuario` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password_usuario` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_usuario` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `password_usuario`, `tipo_usuario`) VALUES
(1, 'Agnes', 'wsxWSX123', 'Usuario'),
(2, 'David', 'qazQAZ123', 'Usuario'),
(3, 'Erik', 'qweQWE123', 'Administrador'),
(4, 'Ignasi', 'rfvRFV123', 'Usuario'),
(5, 'Martinez', 'zxcZXC123', 'Administrador'),
(6, 'Ruben', 'asdASD123', 'Adminitrador'),
(7, 'Sergio', 'edcEDC123', 'Usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_recursos` (`id_recursos`);

--
-- Indices de la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`id_recursos`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_recursos` (`id_recursos`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  MODIFY `id_incidencia` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recursos`
--
ALTER TABLE `recursos`
  MODIFY `id_recursos` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD CONSTRAINT `incidencias_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `incidencias_ibfk_2` FOREIGN KEY (`id_recursos`) REFERENCES `recursos` (`id_recursos`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_recursos`) REFERENCES `recursos` (`id_recursos`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
