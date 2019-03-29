-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: bevc2jessjfwwvi2ekjy-mysql.services.clever-cloud.com:3306
-- Generation Time: Mar 29, 2019 at 07:44 PM
-- Server version: 8.0.13-3
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bevc2jessjfwwvi2ekjy`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrativos`
--

CREATE TABLE `administrativos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doctores`
--

CREATE TABLE `doctores` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `numero_profesional` int(11) NOT NULL,
  `super_doctor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctores`
--

INSERT INTO `doctores` (`id`, `usuario_id`, `numero_profesional`, `super_doctor`) VALUES
(1, 2, 1234, 1);

-- --------------------------------------------------------

--
-- Table structure for table `enfermeros`
--

CREATE TABLE `enfermeros` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enfermeros`
--

INSERT INTO `enfermeros` (`id`, `usuario_id`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `general`
--

CREATE TABLE `general` (
  `admin_nombre` varchar(60) NOT NULL,
  `admin_email` varchar(60) NOT NULL,
  `admin_telefono` varchar(20) NOT NULL,
  `balanza_clave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general`
--

INSERT INTO `general` (`admin_nombre`, `admin_email`, `admin_telefono`, `balanza_clave`) VALUES
('Denry Techera', 'denrytech@gmail.com', '091243955', 918273);

-- --------------------------------------------------------

--
-- Table structure for table `mutualistas`
--

CREATE TABLE `mutualistas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mutualistas`
--

INSERT INTO `mutualistas` (`id`, `nombre`) VALUES
(1, 'ASSE'),
(2, 'COMERO'),
(3, 'Médica Uruguaya');

-- --------------------------------------------------------

--
-- Table structure for table `nurses`
--

CREATE TABLE `nurses` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `super_nurse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nurses`
--

INSERT INTO `nurses` (`id`, `usuario_id`, `super_nurse`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pacientes`
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
-- Dumping data for table `pacientes`
--

INSERT INTO `pacientes` (`id`, `persona_id`, `mutualista_id`, `doctor_id`, `enfermero_id`, `altura`, `tipo_de_paciente`, `tipo_de_acceso_vascular`, `grupo_sanguineo`, `rh`, `primer_dialisis`, `diabetico`, `hta`, `alergico`, `numero_fnr`, `habilitar_lavado_capilar`, `tipo_de_puesto`) VALUES
(1, 4, 1, 1, 1, 182, 'ambulatorio', 'fistula_nativa', 'b', '+', '2008-07-09', 0, 1, 1, 211076, 1, 'normal'),
(2, 10, 3, 1, 1, 110, 'transitorio', 'fistula_nativa', 'a', '+', '2019-03-01', 1, 1, 1, 545455, 0, 'hvc+'),
(3, 11, 3, 1, 1, 185, 'transitorio ', 'cateter_transitorio ', 'a', '-', '2015-11-25', 0, 1, 0, 32150, 1, 'normal ');

-- --------------------------------------------------------

--
-- Table structure for table `personas`
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
-- Dumping data for table `personas`
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
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(66) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `persona_id`, `rol`, `usuario`, `clave`) VALUES
(1, 1, 'nurse', 'horaciososa', '$2b$12$CeLeYjngyHct.uVNfSC5QOf5xTQ21NI8SU1T.5mF.9nGYq5huKLdG'),
(2, 2, 'doctor', 'deliapereyra', '$2b$12$woHVfgJNimFb/Ts0rvvI5u6GLjudNVW3KMG7PKyS4Af5IhnJNS2Si'),
(3, 3, 'enfermero', 'bettinarey', '$2b$12$Zx8jDOABDhOfTki3h4kTae7D7xb9ixTw6Salbgi.XHBksajJqLtP.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrativos`
--
ALTER TABLE `administrativos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrativos_usuario_id` (`usuario_id`);

--
-- Indexes for table `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctores_usuario_id` (`usuario_id`),
  ADD UNIQUE KEY `doctores_numero_profesional` (`numero_profesional`);

--
-- Indexes for table `enfermeros`
--
ALTER TABLE `enfermeros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enfermeros_usuario_id` (`usuario_id`);

--
-- Indexes for table `mutualistas`
--
ALTER TABLE `mutualistas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nurses_usuario_id` (`usuario_id`);

--
-- Indexes for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pacientes_persona_id` (`persona_id`),
  ADD KEY `pacientes_mutualista_id` (`mutualista_id`),
  ADD KEY `pacientes_doctor_id` (`doctor_id`),
  ADD KEY `pacientes_enfermero_id` (`enfermero_id`);

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_email` (`email`),
  ADD UNIQUE KEY `personas_ci` (`ci`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_persona_id` (`persona_id`),
  ADD UNIQUE KEY `usuarios_usuario` (`usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrativos`
--
ALTER TABLE `administrativos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enfermeros`
--
ALTER TABLE `enfermeros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mutualistas`
--
ALTER TABLE `mutualistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nurses`
--
ALTER TABLE `nurses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrativos`
--
ALTER TABLE `administrativos`
  ADD CONSTRAINT `administrativos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `doctores`
--
ALTER TABLE `doctores`
  ADD CONSTRAINT `doctores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `enfermeros`
--
ALTER TABLE `enfermeros`
  ADD CONSTRAINT `enfermeros_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`mutualista_id`) REFERENCES `mutualistas` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctores` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_4` FOREIGN KEY (`enfermero_id`) REFERENCES `enfermeros` (`id`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
