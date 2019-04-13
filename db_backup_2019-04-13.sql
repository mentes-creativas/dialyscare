-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-04-2019 a las 01:03:16
-- Versión del servidor: 5.7.25-0ubuntu0.18.04.2
-- Versión de PHP: 7.2.15-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dialyscare_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativos`
--

CREATE TABLE `administrativos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `fecha` date NOT NULL,
  `turno` char(1) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `puesto_id` int(11) NOT NULL,
  `peso_de_ingreso` int(11) NOT NULL,
  `peso_de_salida` int(11) NOT NULL,
  `falta` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capilares`
--

CREATE TABLE `capilares` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `tipo_de_capilar` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capilares_acciones`
--

CREATE TABLE `capilares_acciones` (
  `id` int(11) NOT NULL,
  `capilar_id` int(11) NOT NULL,
  `enfermero_id` int(11) NOT NULL,
  `accion` varchar(45) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `volumen_min` int(11) NOT NULL,
  `volumen_residual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capilares_recirculaciones`
--

CREATE TABLE `capilares_recirculaciones` (
  `capilar_id` int(11) NOT NULL,
  `recirculacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controles`
--

CREATE TABLE `controles` (
  `id` int(11) NOT NULL,
  `enfermero_id` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  `hora` time NOT NULL,
  `flujo_de_bomba` int(11) NOT NULL,
  `pv` int(11) NOT NULL,
  `tmp` int(11) NOT NULL,
  `flujo_de_banio` int(11) NOT NULL,
  `conductividad` int(11) NOT NULL,
  `presion_arterial_a` int(11) NOT NULL,
  `presion_arterial_b` int(11) NOT NULL,
  `frecuencia_cardiaca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinacion_de_estudios`
--

CREATE TABLE `coordinacion_de_estudios` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estudios` text NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `numero_profesional` int(11) NOT NULL,
  `super_doctor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`id`, `usuario_id`, `numero_profesional`, `super_doctor`) VALUES
(1, 2, 1234, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermeros`
--

CREATE TABLE `enfermeros` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `enfermeros`
--

INSERT INTO `enfermeros` (`id`, `usuario_id`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general`
--

CREATE TABLE `general` (
  `admin_nombre` varchar(60) NOT NULL,
  `admin_email` varchar(60) NOT NULL,
  `admin_telefono` varchar(20) NOT NULL,
  `balanza_clave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `general`
--

INSERT INTO `general` (`admin_nombre`, `admin_email`, `admin_telefono`, `balanza_clave`) VALUES
('Denry Techera', 'denrytech@gmail.com', '091243955', 918273);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicaciones`
--

CREATE TABLE `indicaciones` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `anio` date NOT NULL,
  `mes` date NOT NULL,
  `horas` time NOT NULL,
  `peso_seco` int(11) NOT NULL,
  `flujo_de_bomba` int(11) NOT NULL,
  `flujo_de_banio` int(11) NOT NULL,
  `bicarbonato` int(11) NOT NULL,
  `heparina_hbpm` int(11) NOT NULL,
  `lavados` varchar(45) NOT NULL,
  `tipo_de_capilar` varchar(20) NOT NULL,
  `epo_semanal` int(11) NOT NULL,
  `epo_sesion1` int(11) NOT NULL,
  `epo_sesion2` int(11) NOT NULL,
  `epo_sesion3` int(11) NOT NULL,
  `hierro` varchar(45) NOT NULL,
  `sodio` int(11) NOT NULL,
  `medicacion_post_hd` text NOT NULL,
  `vacunas` text NOT NULL,
  `examenes_de_laboratorio` text NOT NULL,
  `observaciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mutualistas`
--

CREATE TABLE `mutualistas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mutualistas`
--

INSERT INTO `mutualistas` (`id`, `nombre`) VALUES
(1, 'ASSE'),
(2, 'COMERO'),
(3, 'Médica Uruguaya');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nurses`
--

CREATE TABLE `nurses` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `super_nurse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nurses`
--

INSERT INTO `nurses` (`id`, `usuario_id`, `super_nurse`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `mutualista_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `enfermero_id` int(11) NOT NULL,
  `altura` int(11) NOT NULL,
  `tipo_de_paciente` varchar(20) NOT NULL,
  `tipo_de_acceso_vascular` varchar(20) NOT NULL,
  `grupo_sanguineo` varchar(2) NOT NULL,
  `rh` char(1) NOT NULL,
  `primer_dialisis` date NOT NULL,
  `diabetico` tinyint(1) NOT NULL,
  `hta` tinyint(1) NOT NULL,
  `alergico` tinyint(1) NOT NULL,
  `numero_fnr` int(11) NOT NULL,
  `habilitar_lavado_capilar` tinyint(1) NOT NULL,
  `tipo_de_puesto` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `persona_id`, `mutualista_id`, `doctor_id`, `enfermero_id`, `altura`, `tipo_de_paciente`, `tipo_de_acceso_vascular`, `grupo_sanguineo`, `rh`, `primer_dialisis`, `diabetico`, `hta`, `alergico`, `numero_fnr`, `habilitar_lavado_capilar`, `tipo_de_puesto`) VALUES
(1, 4, 1, 1, 1, 182, 'ambulatorio', 'fistula_nativa', 'b', '+', '2008-07-09', 0, 1, 1, 211076, 1, 'normal'),
(2, 10, 3, 1, 1, 110, 'transitorio', 'fistula_nativa', 'a', '+', '2019-03-01', 1, 1, 1, 545455, 0, 'hvc+'),
(3, 11, 3, 1, 1, 185, 'transitorio ', 'cateter_transitorio ', 'a', '-', '2015-11-25', 0, 1, 0, 32150, 1, 'normal ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_de_cambios`
--

CREATE TABLE `pedidos_de_cambios` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `pedido` text NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ci` int(11) NOT NULL,
  `telefono1` varchar(20) NOT NULL,
  `telefono2` varchar(20) DEFAULT NULL,
  `telefono3` varchar(20) DEFAULT NULL,
  `direccion` text NOT NULL,
  `localidad` varchar(40) NOT NULL,
  `departamento` varchar(40) NOT NULL,
  `pais` varchar(40) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `ingreso` datetime NOT NULL,
  `observaciones` text,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombres`, `apellidos`, `email`, `ci`, `telefono1`, `telefono2`, `telefono3`, `direccion`, `localidad`, `departamento`, `pais`, `fecha_de_nacimiento`, `sexo`, `ingreso`, `observaciones`, `estado`) VALUES
(1, 'Horacio', 'Sosa', 'horaciososa1@comero.com.uy', 1234560, '091111111', 'sin 2º telefono', 'sin 3er telefono', 'Ituzaingó 1234', 'Rocha', 'Rocha', 'Uruguay', '1965-06-01', 'm', '2019-03-27 12:41:06', 'Sin observaciones', 1),
(2, 'Delia', 'Pereyra', 'deliapereyra@comero.com.uy', 2345678, '092222222', 'sin 2º telefono', 'sin 3er telefono', 'General Artigas 1234', 'Rocha', 'Rocha', 'Uruguay', '1955-11-03', 'f', '2019-03-27 12:41:06', 'Sin observaciones', 1),
(3, 'Bettina', 'Rey', 'bettinarey@comero.com.uy', 3456789, '093333333', 'sin 2º telefono', 'sin 3er telefono', 'Martinez Rodriguez 1234', 'Rocha', 'Rocha', 'Uruguay', '1945-01-03', 'f', '2019-03-27 12:41:06', 'Sin observaciones', 1),
(4, 'Denry', 'Techera', 'denrytech@gmail.com', 46944361, '091243955', 'sin 2º telefono', 'sin 3er telefono', 'Eliseo Marzol 1234', 'Rocha', 'Rocha', 'Uruguay', '1985-02-09', 'm', '2019-03-27 12:41:06', 'Sin observaciones', 1),
(10, 'Fulanito', 'Gonzalez', 'fulanito@gmail.com', 12332155, '091233445', '987654321', '647382921', 'Lavalleja 999', 'Lascano', 'Maldonado', 'Argentina', '2019-03-28', 'm', '2019-03-27 13:26:23', 'fdsf dsf sdf sdfsd f', 1),
(11, 'Menganucho', 'Pérez', 'mp@gmail.com', 32145687, '098112355', '', '', '19 de abril 1234', 'Castillos', 'Rocha', 'Uruguay', '1980-04-28', 'm', '2019-03-28 17:52:36', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `id` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL,
  `puesto_especial` tinyint(1) NOT NULL,
  `tipo_de_puesto` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recirculacion`
--

CREATE TABLE `recirculacion` (
  `id` int(11) NOT NULL,
  `enfermero_id` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  `cualitest` tinyint(1) NOT NULL,
  `cuantitest` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE `sesiones` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `puesto_id` int(11) NOT NULL,
  `enfermero_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `dosis_de_anticoagulante` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `peso_seco` int(11) NOT NULL,
  `ufc` int(11) NOT NULL,
  `tipo_de_acceso_vascular` varchar(20) NOT NULL,
  `dializado` varchar(20) NOT NULL,
  `minutos` int(11) NOT NULL,
  `medicacion` text NOT NULL,
  `epo` tinyint(1) NOT NULL,
  `hierro` tinyint(1) NOT NULL,
  `hora_de_desconexión` time NOT NULL,
  `ktv` float NOT NULL,
  `presion_pre_a` int(11) NOT NULL,
  `presion_pre_b` int(11) NOT NULL,
  `presion_post_a` int(11) NOT NULL,
  `presion_post_b` int(11) NOT NULL,
  `temperatura` float NOT NULL,
  `flujo_de_banio` varchar(45) NOT NULL,
  `pre_conexion_paciente` tinyint(1) NOT NULL,
  `pre_conexion_puesto` tinyint(1) NOT NULL,
  `pre_conexion_capilar` tinyint(1) NOT NULL,
  `post_conexion_lineas` tinyint(1) NOT NULL,
  `post_conexion_bomba` tinyint(1) NOT NULL,
  `post_conexion_uf` tinyint(1) NOT NULL,
  `post_conexion_capilar` tinyint(1) NOT NULL,
  `post_conexion_heparina` tinyint(1) NOT NULL,
  `post_conexion_aire` tinyint(1) NOT NULL,
  `equipo` int(11) NOT NULL,
  `hierrodesinfeccionialisis_extra` tinyint(1) NOT NULL,
  `dialisis_extra_motivo` text NOT NULL,
  `paraclinica_intradialisis` text NOT NULL,
  `enviada_a_fnr` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(66) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `persona_id`, `rol`, `usuario`, `clave`) VALUES
(1, 1, 'nurse', 'horaciososa', '$2b$12$CeLeYjngyHct.uVNfSC5QOf5xTQ21NI8SU1T.5mF.9nGYq5huKLdG'),
(2, 2, 'doctor', 'deliapereyra', '$2b$12$woHVfgJNimFb/Ts0rvvI5u6GLjudNVW3KMG7PKyS4Af5IhnJNS2Si'),
(3, 3, 'enfermero', 'bettinarey', '$2b$12$Zx8jDOABDhOfTki3h4kTae7D7xb9ixTw6Salbgi.XHBksajJqLtP.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrativos_usuario_id` (`usuario_id`);

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`fecha`,`turno`,`paciente_id`),
  ADD KEY `agenda_paciente_id` (`paciente_id`),
  ADD KEY `agenda_puesto_id` (`puesto_id`);

--
-- Indices de la tabla `capilares`
--
ALTER TABLE `capilares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `capilares_paciente_id` (`paciente_id`);

--
-- Indices de la tabla `capilares_acciones`
--
ALTER TABLE `capilares_acciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `capilaresacciones_capilar_id` (`capilar_id`),
  ADD KEY `capilaresacciones_enfermero_id` (`enfermero_id`);

--
-- Indices de la tabla `capilares_recirculaciones`
--
ALTER TABLE `capilares_recirculaciones`
  ADD PRIMARY KEY (`capilar_id`,`recirculacion_id`),
  ADD KEY `capilaresrecirculaciones_capilar_id` (`capilar_id`),
  ADD KEY `capilaresrecirculaciones_recirculacion_id` (`recirculacion_id`);

--
-- Indices de la tabla `controles`
--
ALTER TABLE `controles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controles_enfermero_id` (`enfermero_id`),
  ADD KEY `controles_sesion_id` (`sesion_id`);

--
-- Indices de la tabla `coordinacion_de_estudios`
--
ALTER TABLE `coordinacion_de_estudios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coordinaciondeestudios_paciente_id` (`paciente_id`),
  ADD KEY `coordinaciondeestudios_usuario_id` (`usuario_id`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctores_usuario_id` (`usuario_id`),
  ADD UNIQUE KEY `doctores_numero_profesional` (`numero_profesional`);

--
-- Indices de la tabla `enfermeros`
--
ALTER TABLE `enfermeros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enfermeros_usuario_id` (`usuario_id`);

--
-- Indices de la tabla `indicaciones`
--
ALTER TABLE `indicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indicaciones_paciente_id` (`paciente_id`),
  ADD KEY `indicaciones_doctor_id` (`doctor_id`);

--
-- Indices de la tabla `mutualistas`
--
ALTER TABLE `mutualistas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nurses_usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pacientes_persona_id` (`persona_id`),
  ADD KEY `pacientes_mutualista_id` (`mutualista_id`),
  ADD KEY `pacientes_doctor_id` (`doctor_id`),
  ADD KEY `pacientes_enfermero_id` (`enfermero_id`);

--
-- Indices de la tabla `pedidos_de_cambios`
--
ALTER TABLE `pedidos_de_cambios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidosdecambios_paciente_id` (`paciente_id`),
  ADD KEY `pedidosdecambios_usuario_id` (`usuario_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_email` (`email`),
  ADD UNIQUE KEY `personas_ci` (`ci`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puestos_sala_id` (`sala_id`);

--
-- Indices de la tabla `recirculacion`
--
ALTER TABLE `recirculacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recirculacion_enfermero_id` (`enfermero_id`),
  ADD KEY `recirculacion_sesion_id` (`sesion_id`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sesiones_paciente_id` (`paciente_id`),
  ADD KEY `sesiones_puesto_id` (`puesto_id`),
  ADD KEY `sesiones_enfermero_id` (`enfermero_id`),
  ADD KEY `sesiones_doctor_id` (`doctor_id`),
  ADD KEY `sesiones_nurse_id` (`nurse_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_persona_id` (`persona_id`),
  ADD UNIQUE KEY `usuarios_usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrativos`
--
ALTER TABLE `administrativos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `capilares`
--
ALTER TABLE `capilares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `capilares_acciones`
--
ALTER TABLE `capilares_acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `controles`
--
ALTER TABLE `controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `coordinacion_de_estudios`
--
ALTER TABLE `coordinacion_de_estudios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `enfermeros`
--
ALTER TABLE `enfermeros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `indicaciones`
--
ALTER TABLE `indicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mutualistas`
--
ALTER TABLE `mutualistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `nurses`
--
ALTER TABLE `nurses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `pedidos_de_cambios`
--
ALTER TABLE `pedidos_de_cambios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `recirculacion`
--
ALTER TABLE `recirculacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD CONSTRAINT `administrativos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`puesto_id`) REFERENCES `puestos` (`id`);

--
-- Filtros para la tabla `capilares`
--
ALTER TABLE `capilares`
  ADD CONSTRAINT `capilares_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `capilares_acciones`
--
ALTER TABLE `capilares_acciones`
  ADD CONSTRAINT `capilares_acciones_ibfk_1` FOREIGN KEY (`capilar_id`) REFERENCES `capilares` (`id`),
  ADD CONSTRAINT `capilares_acciones_ibfk_2` FOREIGN KEY (`enfermero_id`) REFERENCES `enfermeros` (`id`);

--
-- Filtros para la tabla `capilares_recirculaciones`
--
ALTER TABLE `capilares_recirculaciones`
  ADD CONSTRAINT `capilares_recirculaciones_ibfk_1` FOREIGN KEY (`capilar_id`) REFERENCES `capilares` (`id`),
  ADD CONSTRAINT `capilares_recirculaciones_ibfk_2` FOREIGN KEY (`recirculacion_id`) REFERENCES `recirculacion` (`id`);

--
-- Filtros para la tabla `controles`
--
ALTER TABLE `controles`
  ADD CONSTRAINT `controles_ibfk_1` FOREIGN KEY (`enfermero_id`) REFERENCES `enfermeros` (`id`),
  ADD CONSTRAINT `controles_ibfk_2` FOREIGN KEY (`sesion_id`) REFERENCES `sesiones` (`id`);

--
-- Filtros para la tabla `coordinacion_de_estudios`
--
ALTER TABLE `coordinacion_de_estudios`
  ADD CONSTRAINT `coordinacion_de_estudios_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `coordinacion_de_estudios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD CONSTRAINT `doctores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `enfermeros`
--
ALTER TABLE `enfermeros`
  ADD CONSTRAINT `enfermeros_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `indicaciones`
--
ALTER TABLE `indicaciones`
  ADD CONSTRAINT `indicaciones_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `indicaciones_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctores` (`id`);

--
-- Filtros para la tabla `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`mutualista_id`) REFERENCES `mutualistas` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctores` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_4` FOREIGN KEY (`enfermero_id`) REFERENCES `enfermeros` (`id`);

--
-- Filtros para la tabla `pedidos_de_cambios`
--
ALTER TABLE `pedidos_de_cambios`
  ADD CONSTRAINT `pedidos_de_cambios_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `pedidos_de_cambios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD CONSTRAINT `puestos_ibfk_1` FOREIGN KEY (`sala_id`) REFERENCES `salas` (`id`);

--
-- Filtros para la tabla `recirculacion`
--
ALTER TABLE `recirculacion`
  ADD CONSTRAINT `recirculacion_ibfk_1` FOREIGN KEY (`enfermero_id`) REFERENCES `enfermeros` (`id`),
  ADD CONSTRAINT `recirculacion_ibfk_2` FOREIGN KEY (`sesion_id`) REFERENCES `sesiones` (`id`);

--
-- Filtros para la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD CONSTRAINT `sesiones_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `sesiones_ibfk_2` FOREIGN KEY (`puesto_id`) REFERENCES `puestos` (`id`),
  ADD CONSTRAINT `sesiones_ibfk_3` FOREIGN KEY (`enfermero_id`) REFERENCES `enfermeros` (`id`),
  ADD CONSTRAINT `sesiones_ibfk_4` FOREIGN KEY (`doctor_id`) REFERENCES `doctores` (`id`),
  ADD CONSTRAINT `sesiones_ibfk_5` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
