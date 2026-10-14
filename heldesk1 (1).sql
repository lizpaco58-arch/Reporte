-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2026 a las 14:22:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `heldesk1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Hardware', NULL),
(2, 'Software Hospitalario', NULL),
(3, 'Red', NULL),
(4, 'Impresoras', NULL),
(5, 'Correo Institucional', NULL),
(6, 'Base de Datos', NULL),
(7, 'Equipos Biomédicos', NULL),
(8, 'Sistema HIS', NULL),
(9, 'lis', 'Sofware');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `nombre`, `descripcion`) VALUES
(1, 'Hardware', NULL),
(2, 'Software Hospitalario', NULL),
(3, 'Redes', NULL),
(4, 'Base de Datos', NULL),
(5, 'Seguridad Informática', NULL),
(6, 'Equipos Biomédicos', NULL),
(7, 'lis', 'Hadware');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre`) VALUES
(1, 'Pendiente'),
(2, 'Asignada'),
(3, 'En Proceso'),
(4, 'Resuelta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

CREATE TABLE `incidencia` (
  `id_incidencia` int(11) NOT NULL,
  `ticket` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `prioridad` varchar(20) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tecnico_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incidencia`
--

INSERT INTO `incidencia` (`id_incidencia`, `ticket`, `fecha`, `hora`, `titulo`, `descripcion`, `prioridad`, `usuario_id`, `tecnico_id`, `categoria_id`, `estado_id`) VALUES
(1, 'INC-0001', '2026-10-01', '08:15:00', 'PC de recepción no enciende', 'No da imagen al encender', 'Alta', 3, 2, 1, 3),
(2, 'INC-0002', '2026-10-01', '09:30:00', 'Sin internet en consultorio 3', 'Cable de red dañado', 'Media', 2, 1, 3, 2),
(3, 'INC-0003', '2026-10-02', '10:05:00', 'Impresora atascada', 'Papel atascado en bandeja', 'Baja', 1, NULL, 4, 1),
(4, 'INC-0004', '2026-10-02', '11:20:00', 'Error en sistema HIS', 'No guarda historias clínicas', 'Crítica', 5, 3, 8, 3),
(5, 'INC-0005', '2026-10-03', '14:00:00', 'Correo institucional bloqueado', 'No puede iniciar sesión', 'Media', 4, 3, 5, 4),
(6, 'INC-0006', '2026-10-03', '15:45:00', 'Respaldo de base de datos falló', 'Backup nocturno incompleto', 'Alta', 5, 4, 6, 2),
(7, 'INC-0007', '2026-10-04', '08:50:00', 'Monitor de signos vitales sin software', 'Falla de comunicación', 'Crítica', 2, 5, 7, 3),
(8, 'INC-0008', '2026-10-05', '09:10:00', 'Lentitud en software hospitalario', 'Responde muy lento', 'Media', 6, NULL, 2, 1),
(9, 'INC-0009', '2026-10-06', '13:25:00', 'Teclado defectuoso', 'Varias teclas no responden', 'Baja', 1, 2, 1, 4),
(10, 'INC-0010', '2026-10-07', '16:40:00', 'Impresora de laboratorio sin tinta', 'Requiere cambio de cartucho', 'Baja', 4, NULL, 4, 1),
(11, 'INC-0011', '2026-10-13', '20:01:26', 'Cpu', 'Error en el hadwar', 'Media', 4, 3, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` varchar(100) NOT NULL,
  `tecnico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id_login`, `usuario`, `password`, `rol`, `tecnico_id`) VALUES
(1, 'admin', '123456', 'Administrador', 1),
(2, 'cmendoza', '123456', 'Tecnico', 1),
(3, 'mgutierrez', '123456', 'Tecnico', 2),
(4, 'lfernandez', '123456', 'Tecnico', 3),
(5, 'psuarez', '123456', 'Tecnico', 4),
(6, 'jrivera', '123456', 'Tecnico', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id_tecnico` int(11) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `especialidad_id` int(11) NOT NULL,
  `turno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id_tecnico`, `nombres`, `apellidos`, `correo`, `telefono`, `especialidad_id`, `turno`) VALUES
(1, 'Carlos', 'Mendoza', 'cmendoza@hospital.bo', 76543210, 1, 'Mañana'),
(2, 'María', 'Gutiérrez', 'mgutierrez@hospital.bo', 76543211, 2, 'Mañana'),
(3, 'Luis', 'Fernández', 'lfernandez@hospital.bo', 76543212, 3, 'Mañana'),
(4, 'Patricia', 'Suárez', 'psuarez@hospital.bo', 76543213, 4, 'Mañana'),
(5, 'Jorge', 'Rivera', 'jrivera@hospital.bo', 76543214, 6, 'Mañana'),
(6, 'lis', 'paco', 'lis@78gamil.com', 67487898, 1, 'Mañana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `cargo` varchar(80) NOT NULL,
  `area` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombres`, `apellidos`, `correo`, `telefono`, `cargo`, `area`) VALUES
(1, 'Ana', 'Rojas', 'ana.rojas@hospital.bo', 70000001, 'Enfermera', 'Emergencias'),
(2, 'Miguel', 'Pérez', 'miguel.perez@hospital.bo', 70000002, 'Médico', 'Consulta Externa'),
(3, 'Sandra', 'Flores', 'sandra.flores@hospital.bo', 70000003, 'Bioquímica', 'Laboratorio'),
(4, 'Diego', 'Vargas', 'diego.vargas@hospital.bo', 70000004, 'Farmacéutico', 'Farmacia'),
(5, 'Carla', 'Mamani', 'carla.mamani@hospital.bo', 70000005, 'Recepcionista', 'Admisión'),
(6, 'José', 'López', 'jose.lopez@hospital.bo', 70000006, 'Técnico', 'Radiología');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD UNIQUE KEY `ticket` (`ticket`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `tecnico_id` (`tecnico_id`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id_tecnico`),
  ADD KEY `especialidad_id` (`especialidad_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id_tecnico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id_tecnico`);

--
-- Filtros para la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `tecnico_ibfk_1` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidad` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
