-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-05-2019 a las 19:28:29
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

--
-- Volcado de datos para la tabla `administrativos`
--

INSERT INTO `administrativos` (`id`, `usuario_id`) VALUES
(1, 4),
(2, 6);

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
(1, 2, 1234, 1),
(2, 7, 56980, 0);

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
(1, 3),
(2, 5);

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
(2, 10, 3, 1, 1, 110, 'transitorio', 'fistula_nativa', 'a', '+', '2019-03-01', 1, 1, 1, 545455, 0, ''),
(3, 11, 1, 1, 1, 180, 'ambulatorio', 'cateter_transitorio', 'b', '+', '2015-11-25', 0, 1, 0, 32150, 1, 'normal');

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
(10, 'Pedro', 'Gonzalez', 'pedrito@gmail.com', 12332155, '091233445', '987654321', '647382921', 'Lavalleja 999', 'Lascano', 'Maldonado', 'Argentina', '1981-08-15', 'm', '2019-03-27 13:26:23', '', 1),
(11, 'José María', 'Pérez Rosas', 'jmp@gmail.com', 32145687, '098112355', '', '', '19 de abril 1234', 'Castillos', 'Rocha', 'Uruguay', '1980-04-28', 'm', '2019-03-28 17:52:36', '', 1),
(12, 'Sile', 'Ainley', 'sainley0@about.me', 30530048, '36855421', NULL, NULL, '8 Lindbergh Center', 'Los Cerrillos', 'Durazno', 'Uruguay', '1972-03-26', 'F', '2011-07-22 00:00:00', NULL, 1),
(13, 'Ave', 'Goatcher', 'agoatcher1@t.co', 45089030, '20623130', NULL, NULL, '77928 3rd Avenue', 'Rivera', 'Florida', 'Uruguay', '1993-07-26', 'M', '2018-03-24 00:00:00', NULL, 0),
(14, 'Clarence', 'Hunnaball', 'chunnaball2@narod.ru', 54847496, '39940123', NULL, NULL, '47438 Waubesa Terrace', 'Baltasar Brum', 'Rocha', 'Uruguay', '1970-06-20', 'M', '2015-01-03 00:00:00', NULL, 1),
(15, 'Ruthanne', 'Carbry', 'rcarbry3@loc.gov', 41962578, '28844085', NULL, NULL, '78 Macpherson Alley', 'Migues', 'Soriano', 'Uruguay', '1956-05-27', 'F', '2018-12-29 00:00:00', NULL, 0),
(16, 'Reider', 'Mahaddie', 'rmahaddie4@state.tx.us', 46696900, '26034221', NULL, NULL, '49 Thackeray Alley', 'Santiago Vázquez', 'Florida', 'Uruguay', '1960-12-20', 'M', '2017-05-28 00:00:00', NULL, 1),
(17, 'Kamilah', 'Bushrod', 'kbushrod5@mayoclinic.com', 31546374, '41357294', NULL, NULL, '46 Lillian Plaza', 'Progreso', 'Salto', 'Uruguay', '1963-07-05', 'F', '2013-05-15 00:00:00', NULL, 1),
(18, 'Jennica', 'Proughten', 'jproughten6@e-recht24.de', 48050616, '35255664', NULL, NULL, '9783 Blue Bill Park Lane', 'Colonia Nicolich', 'Paysandú', 'Uruguay', '1981-03-25', 'F', '2010-06-08 00:00:00', NULL, 0),
(19, 'Ilario', 'Nono', 'inono7@paginegialle.it', 57534590, '46963933', NULL, NULL, '52256 Lotheville Place', 'Santa Catalina', 'Maldonado', 'Uruguay', '1978-12-26', 'M', '2011-09-09 00:00:00', NULL, 1),
(20, 'Lawton', 'Kleinschmidt', 'lkleinschmidt8@usatoday.com', 42645478, '26270058', NULL, NULL, '73410 Moose Plaza', 'Dolores', 'Lavalleja', 'Uruguay', '1994-03-24', 'M', '2014-09-29 00:00:00', NULL, 0),
(21, 'Deny', 'Durden', 'ddurden9@virginia.edu', 50842480, '47980220', NULL, NULL, '35 Mariners Cove Lane', 'La Floresta', 'Florida', 'Uruguay', '1978-02-16', 'F', '2011-10-19 00:00:00', NULL, 1),
(22, 'Zonnya', 'McCollum', 'zmccolluma@hubpages.com', 44946544, '42290795', NULL, NULL, '38855 Moland Hill', 'Durazno', 'Colonia', 'Uruguay', '1958-03-19', 'F', '2015-10-25 00:00:00', NULL, 0),
(23, 'Abelard', 'Vasiltsov', 'avasiltsovb@360.cn', 38158017, '37724502', NULL, NULL, '42 Manufacturers Crossing', 'Florida', 'Paysandú', 'Uruguay', '1970-01-12', 'M', '2017-03-13 00:00:00', NULL, 1),
(24, 'Thia', 'Goathrop', 'tgoathropc@wiley.com', 35539364, '20002588', NULL, NULL, '855 Loomis Parkway', 'La Floresta', 'Flores', 'Uruguay', '1971-06-28', 'F', '2013-11-11 00:00:00', NULL, 1),
(25, 'Vivi', 'Dearth', 'vdearthd@ning.com', 32242523, '24411901', NULL, NULL, '668 Stone Corner Junction', 'Barra de Carrasco', 'Durazno', 'Uruguay', '1969-05-16', 'F', '2017-11-29 00:00:00', NULL, 1),
(26, 'Willard', 'Geratt', 'wgeratte@xinhuanet.com', 41867314, '27178847', NULL, NULL, '44886 Fremont Circle', 'Castillos', 'Tacuarembó', 'Uruguay', '1979-10-18', 'M', '2016-04-29 00:00:00', NULL, 1),
(27, 'Shermie', 'Illyes', 'sillyesf@topsy.com', 52717441, '30146086', NULL, NULL, '3680 Pond Crossing', 'Young', 'Colonia', 'Uruguay', '1996-03-14', 'M', '2015-02-21 00:00:00', NULL, 0),
(28, 'Wesley', 'Murrison', 'wmurrisong@mlb.com', 57394714, '27866687', NULL, NULL, '7775 Pine View Court', 'Bella Unión', 'Rocha', 'Uruguay', '1973-08-13', 'M', '2011-10-03 00:00:00', NULL, 1),
(29, 'Cally', 'Whissell', 'cwhissellh@facebook.com', 44050652, '43441805', NULL, NULL, '37 Clemons Street', 'Bella Unión', 'Flores', 'Uruguay', '1992-11-18', 'F', '2017-07-09 00:00:00', NULL, 1),
(30, 'Atlanta', 'Sheddan', 'asheddani@mozilla.com', 31379654, '41276215', NULL, NULL, '7 Duke Plaza', 'Castillos', 'San José', 'Uruguay', '1973-07-04', 'F', '2014-01-01 00:00:00', NULL, 0),
(31, 'Chantal', 'Pouton', 'cpoutonj@stanford.edu', 30053893, '32681625', NULL, NULL, '3 Lillian Street', 'Vergara', 'Artigas', 'Uruguay', '1987-06-26', 'F', '2017-11-16 00:00:00', NULL, 1),
(32, 'Jay', 'Bonson', 'jbonsonk@chronoengine.com', 51218879, '48516634', NULL, NULL, '44 Columbus Alley', 'Barra de Carrasco', 'Río Negro', 'Uruguay', '1959-02-14', 'M', '2011-03-16 00:00:00', NULL, 0),
(33, 'Lela', 'Temple', 'ltemplel@issuu.com', 59840787, '45632095', NULL, NULL, '1 David Crossing', 'Migues', 'Colonia', 'Uruguay', '1966-03-13', 'F', '2013-03-05 00:00:00', NULL, 0),
(34, 'Hamnet', 'Glandfield', 'hglandfieldm@adobe.com', 43484006, '28347991', NULL, NULL, '10 Stuart Avenue', 'Rafael Perazza', 'Rivera', 'Uruguay', '1964-03-30', 'M', '2016-12-02 00:00:00', NULL, 0),
(35, 'Yolane', 'Nickell', 'ynickelln@whitehouse.gov', 59010167, '34699225', NULL, NULL, '04 Summerview Way', 'Barra de Carrasco', 'Colonia', 'Uruguay', '1965-11-22', 'F', '2013-08-11 00:00:00', NULL, 1),
(36, 'Rosco', 'Bees', 'rbeeso@weibo.com', 46086535, '46799297', NULL, NULL, '5187 North Hill', 'Fray Bentos', 'Treinta y Tres', 'Uruguay', '1971-02-23', 'M', '2015-03-22 00:00:00', NULL, 1),
(37, 'Berke', 'Wewell', 'bwewellp@discuz.net', 33010514, '41260017', NULL, NULL, '90 Stone Corner Pass', 'Dolores', 'Rocha', 'Uruguay', '1953-05-07', 'M', '2018-10-28 00:00:00', NULL, 0),
(38, 'Irita', 'Morrott', 'imorrottq@google.co.uk', 55700382, '25826411', NULL, NULL, '2326 Forest Run Road', 'Porvenir', 'Rivera', 'Uruguay', '1994-05-07', 'F', '2014-05-09 00:00:00', NULL, 1),
(39, 'Culley', 'Goodding', 'cgooddingr@instagram.com', 46388058, '25492685', NULL, NULL, '281 Vidon Street', 'Vichadero', 'Río Negro', 'Uruguay', '1971-06-14', 'M', '2010-10-25 00:00:00', NULL, 1),
(40, 'Loralyn', 'Ghelerdini', 'lghelerdinis@foxnews.com', 41036844, '46012020', NULL, NULL, '524 Mitchell Pass', 'Santa Bernardina', 'Montevideo', 'Uruguay', '1973-11-23', 'F', '2017-01-31 00:00:00', NULL, 1),
(41, 'Dion', 'Erskine', 'derskinet@ed.gov', 53973765, '38143307', NULL, NULL, '3605 Loomis Point', 'Barra de Carrasco', 'Montevideo', 'Uruguay', '1977-04-13', 'F', '2018-10-27 00:00:00', NULL, 1),
(42, 'Gloriana', 'Jenken', 'gjenkenu@i2i.jp', 48036726, '46834094', NULL, NULL, '68 Drewry Parkway', 'Migues', 'Flores', 'Uruguay', '1997-10-07', 'F', '2017-08-30 00:00:00', NULL, 0),
(43, 'Selig', 'Bather', 'sbatherv@scientificamerican.com', 56518330, '47645744', NULL, NULL, '13190 Bay Circle', 'Sauce', 'Rivera', 'Uruguay', '1977-06-10', 'M', '2015-06-11 00:00:00', NULL, 1),
(44, 'Juliet', 'Garrould', 'jgarrouldw@kickstarter.com', 39307661, '40996701', NULL, NULL, '25689 Arkansas Trail', 'Treinta y Tres', 'Tacuarembó', 'Uruguay', '1968-09-25', 'F', '2010-08-07 00:00:00', NULL, 1),
(45, 'Padriac', 'Hounsham', 'phounshamx@about.com', 37350073, '24257389', NULL, NULL, '2 Cherokee Lane', 'Tala', 'Artigas', 'Uruguay', '1978-02-17', 'M', '2015-01-19 00:00:00', NULL, 1),
(46, 'Leela', 'Akrigg', 'lakriggy@cmu.edu', 53029307, '27861179', NULL, NULL, '3 Bowman Hill', 'San Bautista', 'Paysandú', 'Uruguay', '1975-08-01', 'F', '2016-09-12 00:00:00', NULL, 1),
(47, 'Ruprecht', 'Daout', 'rdaoutz@t.co', 35009431, '41381400', NULL, NULL, '19 Comanche Place', 'Nueva Helvecia', 'Tacuarembó', 'Uruguay', '1955-03-30', 'M', '2017-10-16 00:00:00', NULL, 1),
(48, 'Herbert', 'Rosewell', 'hrosewell10@shutterfly.com', 49748458, '22382689', NULL, NULL, '81 Thompson Plaza', 'La Floresta', 'Treinta y Tres', 'Uruguay', '1989-12-06', 'M', '2011-12-13 00:00:00', NULL, 1),
(49, 'Oriana', 'Duferie', 'oduferie11@dion.ne.jp', 59326776, '38552118', NULL, NULL, '430 Larry Lane', 'Florencio Sánchez', 'Treinta y Tres', 'Uruguay', '1979-10-25', 'F', '2016-07-18 00:00:00', NULL, 0),
(50, 'Mia', 'Vooght', 'mvooght12@livejournal.com', 52583708, '34622336', NULL, NULL, '44 Dovetail Plaza', 'Ecilda Paullier', 'Paysandú', 'Uruguay', '1955-11-14', 'F', '2017-01-11 00:00:00', NULL, 1),
(51, 'Karel', 'Andriolli', 'kandriolli13@netlog.com', 56349389, '45710916', NULL, NULL, '53261 Sheridan Center', 'Fray Bentos', 'Cerro Largo', 'Uruguay', '1985-01-08', 'F', '2013-11-02 00:00:00', NULL, 1),
(52, 'Lowrance', 'Skeermer', 'lskeermer14@theatlantic.com', 52143818, '28797437', NULL, NULL, '289 Old Shore Court', 'Santa Catalina', 'Rocha', 'Uruguay', '1989-08-22', 'M', '2018-09-27 00:00:00', NULL, 0),
(53, 'Malissia', 'Lapsley', 'mlapsley15@rambler.ru', 52711855, '20726986', NULL, NULL, '8 5th Avenue', 'Santa Bernardina', 'Maldonado', 'Uruguay', '1977-05-11', 'F', '2017-09-12 00:00:00', NULL, 1),
(54, 'Chandler', 'Frape', 'cfrape16@quantcast.com', 38614992, '41148414', NULL, NULL, '4172 Norway Maple Crossing', 'Santiago Vázquez', 'Canelones', 'Uruguay', '1991-05-23', 'M', '2013-04-27 00:00:00', NULL, 1),
(55, 'Lena', 'De Freitas', 'ldefreitas17@cnn.com', 57553575, '29008403', NULL, NULL, '3 Division Plaza', 'Ecilda Paullier', 'Rivera', 'Uruguay', '1959-02-04', 'F', '2015-04-05 00:00:00', NULL, 0),
(56, 'Nedda', 'Speedin', 'nspeedin18@ca.gov', 52536275, '33100107', NULL, NULL, '9 Debs Road', 'Durazno', 'Tacuarembó', 'Uruguay', '1980-10-14', 'F', '2016-08-26 00:00:00', NULL, 0),
(57, 'Isac', 'Verbeke', 'iverbeke19@discovery.com', 42147162, '46423011', NULL, NULL, '7 Lotheville Junction', 'Young', 'Río Negro', 'Uruguay', '1979-12-25', 'M', '2015-09-13 00:00:00', NULL, 1),
(58, 'Orson', 'Gosnell', 'ogosnell1a@bizjournals.com', 48396827, '26470077', NULL, NULL, '992 Ronald Regan Plaza', 'Florencio Sánchez', 'Cerro Largo', 'Uruguay', '1981-07-19', 'M', '2012-01-12 00:00:00', NULL, 0),
(59, 'Conn', 'Reavey', 'creavey1b@taobao.com', 42848015, '40386169', NULL, NULL, '685 Bunting Street', 'Santiago Vázquez', 'Florida', 'Uruguay', '1969-02-09', 'M', '2014-01-27 00:00:00', NULL, 1),
(60, 'Beatrice', 'Clementel', 'bclementel1c@godaddy.com', 55874605, '43736795', NULL, NULL, '3 Eagle Crest Parkway', 'Rafael Perazza', 'Paysandú', 'Uruguay', '1990-04-23', 'F', '2016-12-10 00:00:00', NULL, 0),
(61, 'Valma', 'Georgeon', 'vgeorgeon1d@biblegateway.com', 59644302, '44892975', NULL, NULL, '55755 Corry Place', 'Durazno', 'Paysandú', 'Uruguay', '1997-11-28', 'F', '2017-09-15 00:00:00', NULL, 0),
(62, 'Harrison', 'Bendik', 'hbendik1e@webs.com', 42230062, '28651363', NULL, NULL, '461 Pond Pass', 'Progreso', 'Montevideo', 'Uruguay', '1998-06-23', 'M', '2018-07-13 00:00:00', NULL, 1),
(63, 'Lockwood', 'Breakwell', 'lbreakwell1f@miibeian.gov.cn', 56417434, '27586138', NULL, NULL, '2 Buell Pass', 'Progreso', 'Lavalleja', 'Uruguay', '1978-09-02', 'M', '2013-02-11 00:00:00', NULL, 1),
(64, 'Elaine', 'Tschursch', 'etschursch1g@apache.org', 44479756, '35600523', NULL, NULL, '946 Wayridge Circle', 'Ecilda Paullier', 'Soriano', 'Uruguay', '1984-08-26', 'F', '2018-07-05 00:00:00', NULL, 0),
(65, 'Terence', 'Winterflood', 'twinterflood1h@prnewswire.com', 42977409, '44289301', NULL, NULL, '18 Division Crossing', 'Durazno', 'Soriano', 'Uruguay', '1982-09-04', 'M', '2017-04-17 00:00:00', NULL, 0),
(66, 'Kynthia', 'Stother', 'kstother1i@howstuffworks.com', 53341779, '36863418', NULL, NULL, '708 Autumn Leaf Hill', 'Santa Bernardina', 'Montevideo', 'Uruguay', '1992-12-21', 'F', '2010-09-04 00:00:00', NULL, 1),
(67, 'Juan', 'Alans', 'jalans1j@sourceforge.net', 48687852, '45070218', NULL, NULL, '98 Hazelcrest Place', 'San Ramón', 'Lavalleja', 'Uruguay', '1959-08-01', 'M', '2018-05-12 00:00:00', NULL, 0),
(68, 'Dolly', 'Blankley', 'dblankley1k@tuttocitta.it', 52874779, '38868836', NULL, NULL, '14136 Linden Court', 'Porvenir', 'Rivera', 'Uruguay', '1966-04-02', 'F', '2017-10-23 00:00:00', NULL, 1),
(69, 'Caye', 'Enrdigo', 'cenrdigo1l@vinaora.com', 34211092, '46105872', NULL, NULL, '7060 Garrison Street', 'Mercedes', 'Cerro Largo', 'Uruguay', '1982-01-08', 'F', '2014-12-24 00:00:00', NULL, 0),
(70, 'Lacy', 'Mowsdale', 'lmowsdale1m@abc.net.au', 32200517, '47896574', NULL, NULL, '09307 Susan Court', 'Nuevo Berlín', 'Canelones', 'Uruguay', '1990-08-12', 'F', '2016-09-08 00:00:00', NULL, 0),
(71, 'Kane', 'Wellbelove', 'kwellbelove1n@cdc.gov', 34416448, '45108455', NULL, NULL, '2718 Monica Park', 'Rafael Perazza', 'Colonia', 'Uruguay', '1993-04-17', 'M', '2017-10-20 00:00:00', NULL, 1),
(72, 'Shanna', 'Mathen', 'smathen1o@theglobeandmail.com', 51776115, '38034214', NULL, NULL, '56 Sunfield Way', 'Los Cerrillos', 'Montevideo', 'Uruguay', '1982-03-17', 'F', '2011-09-21 00:00:00', NULL, 1),
(73, 'Jarad', 'Lampett', 'jlampett1p@pcworld.com', 54705513, '45312437', NULL, NULL, '97628 Garrison Lane', 'Tupambaé', 'Soriano', 'Uruguay', '1976-12-15', 'M', '2016-07-09 00:00:00', NULL, 1),
(74, 'Avrit', 'Dockerty', 'adockerty1q@parallels.com', 40113178, '25719710', NULL, NULL, '81758 Acker Center', 'Paso de Carrasco', 'Rivera', 'Uruguay', '1999-01-19', 'F', '2018-04-10 00:00:00', NULL, 1),
(75, 'Templeton', 'Leavey', 'tleavey1r@fastcompany.com', 55351892, '40565721', NULL, NULL, '9319 Canary Lane', 'Nueva Helvecia', 'Montevideo', 'Uruguay', '1994-09-19', 'M', '2013-06-07 00:00:00', NULL, 0),
(76, 'Stanislas', 'Killeen', 'skilleen1s@arizona.edu', 59173489, '47146172', NULL, NULL, '754 Jackson Pass', 'Nueva Helvecia', 'Canelones', 'Uruguay', '1964-12-10', 'M', '2014-12-23 00:00:00', NULL, 1),
(77, 'Lexy', 'Rayman', 'lrayman1t@cafepress.com', 59382907, '38837575', NULL, NULL, '7851 Golf View Parkway', 'Villa del Carmen', 'Rocha', 'Uruguay', '1986-08-06', 'F', '2018-04-04 00:00:00', NULL, 1),
(78, 'Max', 'Fulun', 'mfulun1u@noaa.gov', 30955751, '44604931', NULL, NULL, '15155 Marcy Road', 'Santa Rosa', 'Montevideo', 'Uruguay', '1992-06-22', 'F', '2016-03-30 00:00:00', NULL, 1),
(79, 'Verge', 'Pierrepoint', 'vpierrepoint1v@yandex.ru', 59761648, '26760778', NULL, NULL, '8 Schlimgen Street', 'Nueva Helvecia', 'Treinta y Tres', 'Uruguay', '1953-04-07', 'M', '2012-01-10 00:00:00', NULL, 1),
(80, 'Eleni', 'Seefeldt', 'eseefeldt1w@cbsnews.com', 50751574, '41639456', NULL, NULL, '3 Lunder Road', 'Castillos', 'Lavalleja', 'Uruguay', '1989-11-02', 'F', '2014-08-20 00:00:00', NULL, 0),
(81, 'Ynez', 'Darville', 'ydarville1x@alexa.com', 49371334, '33261061', NULL, NULL, '825 Texas Trail', 'Santa Bernardina', 'Rocha', 'Uruguay', '1989-02-07', 'F', '2018-07-19 00:00:00', NULL, 1),
(82, 'Frankie', 'Corrie', 'fcorrie1y@linkedin.com', 41921620, '37973168', NULL, NULL, '34 Gerald Crossing', 'Joaquín Suárez', 'Montevideo', 'Uruguay', '1972-01-28', 'M', '2011-11-19 00:00:00', NULL, 0),
(83, 'Johan', 'Crease', 'jcrease1z@howstuffworks.com', 38686124, '20527074', NULL, NULL, '2 Pine View Junction', 'Progreso', 'Cerro Largo', 'Uruguay', '1972-01-11', 'M', '2016-12-30 00:00:00', NULL, 1),
(84, 'Heinrick', 'Brinicombe', 'hbrinicombe20@mlb.com', 37457635, '34387272', NULL, NULL, '50 Fair Oaks Hill', 'Pan de Azúcar', 'Canelones', 'Uruguay', '1969-03-08', 'M', '2010-10-01 00:00:00', NULL, 1),
(85, 'Romona', 'Rabley', 'rrabley21@exblog.jp', 49584746, '32639277', NULL, NULL, '23172 Moose Road', 'Progreso', 'Cerro Largo', 'Uruguay', '1991-07-17', 'F', '2012-03-01 00:00:00', NULL, 1),
(86, 'Danita', 'Pavek', 'dpavek22@cornell.edu', 42625499, '39099613', NULL, NULL, '59880 Cherokee Trail', 'Villa del Carmen', 'Flores', 'Uruguay', '1983-08-25', 'F', '2013-08-02 00:00:00', NULL, 1),
(87, 'Ludovico', 'Etherington', 'letherington23@mlb.com', 30241286, '28422761', NULL, NULL, '16 Novick Plaza', 'San Javier', 'Salto', 'Uruguay', '1954-06-11', 'M', '2016-09-23 00:00:00', NULL, 1),
(88, 'Marley', 'Leele', 'mleele24@fc2.com', 45840250, '30065047', NULL, NULL, '712 Walton Circle', 'Villa del Carmen', 'Rocha', 'Uruguay', '1997-02-20', 'F', '2012-12-21 00:00:00', NULL, 1),
(89, 'Kippy', 'Mowles', 'kmowles25@google.de', 34429681, '29291789', NULL, NULL, '17745 Sage Crossing', 'Florida', 'Salto', 'Uruguay', '1987-12-31', 'M', '2016-04-01 00:00:00', NULL, 1),
(90, 'Dominga', 'Boud', 'dboud26@umn.edu', 58615681, '41810178', NULL, NULL, '22896 Crowley Park', 'Bella Unión', 'Lavalleja', 'Uruguay', '1984-10-06', 'F', '2012-10-06 00:00:00', NULL, 0),
(91, 'Frances', 'Dehmel', 'fdehmel27@tumblr.com', 36889813, '23421269', NULL, NULL, '47 Meadow Vale Parkway', 'Barra de Carrasco', 'Colonia', 'Uruguay', '1992-07-26', 'F', '2015-07-27 00:00:00', NULL, 1),
(92, 'Sorcha', 'Ovize', 'sovize28@cafepress.com', 45198766, '28947942', NULL, NULL, '9395 Mifflin Alley', 'Dolores', 'Tacuarembó', 'Uruguay', '1982-02-18', 'F', '2017-08-16 00:00:00', NULL, 0),
(93, 'Jayson', 'Twomey', 'jtwomey29@bandcamp.com', 31967057, '45869395', NULL, NULL, '86741 Summerview Place', 'Santa Rosa', 'Cerro Largo', 'Uruguay', '1956-12-02', 'M', '2015-06-12 00:00:00', NULL, 1),
(94, 'Maddie', 'Manton', 'mmanton2a@disqus.com', 47307794, '24461930', NULL, NULL, '96 Declaration Way', 'Colonia Nicolich', 'Artigas', 'Uruguay', '1990-11-10', 'F', '2013-01-19 00:00:00', NULL, 1),
(95, 'Vladimir', 'Gatchell', 'vgatchell2b@elegantthemes.com', 38294744, '47460977', NULL, NULL, '16 Lunder Court', 'Santiago Vázquez', 'Cerro Largo', 'Uruguay', '1968-08-29', 'M', '2018-08-08 00:00:00', NULL, 0),
(96, 'Rockwell', 'Kasbye', 'rkasbye2c@si.edu', 44359459, '27839080', NULL, NULL, '5 Di Loreto Drive', 'Tupambaé', 'Artigas', 'Uruguay', '1960-03-23', 'M', '2016-04-21 00:00:00', NULL, 0),
(97, 'Kerk', 'Juste', 'kjuste2d@github.com', 58556645, '41695630', NULL, NULL, '259 Brickson Park Court', 'San Javier', 'Artigas', 'Uruguay', '1980-05-02', 'M', '2018-09-23 00:00:00', NULL, 1),
(98, 'Agnella', 'Simanek', 'asimanek2e@google.ca', 30359306, '25990688', NULL, NULL, '45913 Roth Parkway', 'Salto', 'Cerro Largo', 'Uruguay', '1982-09-29', 'F', '2010-06-07 00:00:00', NULL, 0),
(99, 'Dilly', 'Clail', 'dclail2f@scribd.com', 47039600, '23619251', NULL, NULL, '6 Weeping Birch Pass', 'Young', 'Florida', 'Uruguay', '1972-06-14', 'M', '2018-09-30 00:00:00', NULL, 1),
(100, 'Frannie', 'Drewes', 'fdrewes2g@sitemeter.com', 49346095, '25528263', NULL, NULL, '875 Transport Pass', 'Santiago Vázquez', 'Soriano', 'Uruguay', '1987-10-02', 'F', '2017-01-15 00:00:00', NULL, 0),
(101, 'Wilek', 'Howerd', 'whowerd2h@reuters.com', 46098718, '20252929', NULL, NULL, '628 Waxwing Crossing', 'La Paloma', 'Río Negro', 'Uruguay', '1994-12-17', 'M', '2012-04-08 00:00:00', NULL, 0),
(102, 'Joya', 'Paske', 'jpaske2i@cyberchimps.com', 57662907, '42925839', NULL, NULL, '1 Hoepker Park', 'Mariscala', 'Soriano', 'Uruguay', '1974-09-10', 'F', '2015-02-10 00:00:00', NULL, 0),
(103, 'Symon', 'Perelli', 'sperelli2j@instagram.com', 46303632, '39338242', NULL, NULL, '508 Thackeray Avenue', 'Los Cerrillos', 'Paysandú', 'Uruguay', '1992-12-21', 'M', '2010-08-16 00:00:00', NULL, 0),
(104, 'Teirtza', 'Thexton', 'tthexton2k@addtoany.com', 56513589, '42644185', NULL, NULL, '4003 Evergreen Park', 'La Paloma', 'Rivera', 'Uruguay', '1961-08-06', 'F', '2012-05-03 00:00:00', NULL, 0),
(105, 'Scott', 'Fancet', 'sfancet2l@typepad.com', 40702959, '23861675', NULL, NULL, '858 Dovetail Place', 'Florencio Sánchez', 'Maldonado', 'Uruguay', '1985-01-21', 'M', '2017-10-26 00:00:00', NULL, 1),
(106, 'Annmarie', 'Castelletto', 'acastelletto2m@ezinearticles.com', 47065102, '31093684', NULL, NULL, '7 Tennessee Crossing', 'La Floresta', 'Flores', 'Uruguay', '1976-05-19', 'F', '2013-02-21 00:00:00', NULL, 1),
(107, 'Guglielmo', 'Kubach', 'gkubach2n@go.com', 41387953, '21331916', NULL, NULL, '391 Chinook Hill', 'Colonia Nicolich', 'Canelones', 'Uruguay', '1954-03-29', 'M', '2016-06-12 00:00:00', NULL, 0),
(108, 'Dee dee', 'Haine', 'dhaine2o@cpanel.net', 53089140, '23993664', NULL, NULL, '1709 Springview Parkway', 'Cardal', 'Tacuarembó', 'Uruguay', '1977-09-21', 'F', '2012-06-13 00:00:00', NULL, 1),
(109, 'Mignon', 'Scranny', 'mscranny2p@blinklist.com', 44340663, '41119722', NULL, NULL, '13034 Graedel Park', 'Palmitas', 'Salto', 'Uruguay', '1951-12-12', 'F', '2013-08-14 00:00:00', NULL, 1),
(110, 'Ulrick', 'Outram', 'uoutram2q@artisteer.com', 37206460, '37038869', NULL, NULL, '13514 Karstens Junction', 'Tupambaé', 'Montevideo', 'Uruguay', '1991-04-01', 'M', '2011-06-16 00:00:00', NULL, 1),
(111, 'Petronia', 'Phettis', 'pphettis2r@sina.com.cn', 54424447, '37678126', NULL, NULL, '3 Elmside Court', 'Joaquín Suárez', 'Río Negro', 'Uruguay', '1986-05-11', 'F', '2017-11-20 00:00:00', NULL, 0),
(112, 'Fraser', 'Sommerscales', 'fsommerscales2s@washington.edu', 57420282, '42160664', NULL, NULL, '723 Hovde Lane', 'Santa Bernardina', 'Maldonado', 'Uruguay', '1951-04-06', 'M', '2013-03-06 00:00:00', NULL, 0),
(113, 'Holly', 'Mockford', 'hmockford2t@moonfruit.com', 43185919, '31578774', NULL, NULL, '56 Quincy Place', 'Treinta y Tres', 'Rocha', 'Uruguay', '1960-06-27', 'F', '2011-08-21 00:00:00', NULL, 0),
(114, 'Britteny', 'Sapsed', 'bsapsed2u@feedburner.com', 47876305, '37091549', NULL, NULL, '362 Boyd Parkway', 'Baltasar Brum', 'Treinta y Tres', 'Uruguay', '1982-01-23', 'F', '2012-09-20 00:00:00', NULL, 0),
(115, 'Rusty', 'Brisse', 'rbrisse2v@tiny.cc', 49833833, '44028979', NULL, NULL, '74621 Colorado Place', 'Porvenir', 'Colonia', 'Uruguay', '1958-02-14', 'M', '2019-01-06 00:00:00', NULL, 0),
(116, 'Maggie', 'Mullally', 'mmullally2w@jugem.jp', 31222891, '31771065', NULL, NULL, '1838 Westport Terrace', 'Palmitas', 'Maldonado', 'Uruguay', '1967-08-06', 'F', '2014-11-07 00:00:00', NULL, 0),
(117, 'Aprilette', 'Vardie', 'avardie2x@nyu.edu', 49077524, '32558375', NULL, NULL, '4609 Dahle Parkway', 'Delta del Tigre', 'Tacuarembó', 'Uruguay', '1972-09-26', 'F', '2012-03-17 00:00:00', NULL, 0),
(118, 'Jessica', 'Padilla', 'jpadilla2y@flavors.me', 38826975, '48286887', NULL, NULL, '86 Holy Cross Trail', 'Tupambaé', 'Cerro Largo', 'Uruguay', '1975-09-14', 'F', '2010-06-26 00:00:00', NULL, 0),
(119, 'Gilemette', 'Cundict', 'gcundict2z@phoca.cz', 42467854, '40038823', NULL, NULL, '1631 Lakewood Gardens Junction', 'San Ramón', 'Soriano', 'Uruguay', '1960-03-03', 'F', '2018-06-14 00:00:00', NULL, 1),
(120, 'Donia', 'Tortis', 'dtortis30@woothemes.com', 51610851, '31953358', NULL, NULL, '81166 Green Terrace', 'Soriano', 'Rivera', 'Uruguay', '1997-02-23', 'F', '2014-01-13 00:00:00', NULL, 0),
(121, 'Rourke', 'Gladdin', 'rgladdin31@pcworld.com', 56480997, '37169834', NULL, NULL, '255 Morning Plaza', 'Ecilda Paullier', 'Cerro Largo', 'Uruguay', '1984-01-13', 'M', '2011-06-25 00:00:00', NULL, 0),
(122, 'Roma', 'Reynault', 'rreynault32@opera.com', 30158007, '39838971', NULL, NULL, '871 Eggendart Terrace', 'Baltasar Brum', 'Soriano', 'Uruguay', '1961-08-22', 'M', '2015-10-29 00:00:00', NULL, 1),
(123, 'Don', 'Cicetti', 'dcicetti33@meetup.com', 59642106, '31324436', NULL, NULL, '52 Lake View Crossing', 'Vergara', 'Colonia', 'Uruguay', '1961-05-29', 'M', '2017-03-30 00:00:00', NULL, 0),
(124, 'Brooke', 'Formoy', 'bformoy34@reuters.com', 38346792, '46045436', NULL, NULL, '65 Randy Trail', 'San Ramón', 'Colonia', 'Uruguay', '1985-11-07', 'M', '2012-11-21 00:00:00', NULL, 1),
(125, 'Chucho', 'Bruineman', 'cbruineman35@yellowbook.com', 56644597, '47621336', NULL, NULL, '4 Vidon Hill', 'Soriano', 'Canelones', 'Uruguay', '1972-10-30', 'M', '2017-10-11 00:00:00', NULL, 0),
(126, 'Artur', 'Farrent', 'afarrent36@gmpg.org', 36938270, '27920301', NULL, NULL, '05881 Monica Point', 'Maldonado', 'Montevideo', 'Uruguay', '1978-01-01', 'M', '2011-05-30 00:00:00', NULL, 0),
(127, 'Alissa', 'Adrien', 'aadrien37@virginia.edu', 44695595, '28657528', NULL, NULL, '27 Holmberg Avenue', 'Colonia Nicolich', 'Rivera', 'Uruguay', '1976-10-03', 'F', '2017-04-20 00:00:00', NULL, 1),
(128, 'Glenden', 'Halpeine', 'ghalpeine38@taobao.com', 58836433, '23906569', NULL, NULL, '10022 Eastlawn Park', 'La Paz', 'Cerro Largo', 'Uruguay', '1975-02-28', 'M', '2012-10-04 00:00:00', NULL, 0),
(129, 'Maudie', 'Garnul', 'mgarnul39@storify.com', 59123894, '25223282', NULL, NULL, '1 Karstens Terrace', 'Villa del Carmen', 'Lavalleja', 'Uruguay', '1985-04-24', 'F', '2014-03-13 00:00:00', NULL, 0),
(130, 'Danni', 'Dusting', 'ddusting3a@jimdo.com', 36352910, '22280683', NULL, NULL, '85286 Vernon Center', 'Santiago Vázquez', 'Cerro Largo', 'Uruguay', '1990-02-20', 'F', '2018-08-29 00:00:00', NULL, 0),
(131, 'Andromache', 'Alelsandrowicz', 'aalelsandrowicz3b@buzzfeed.com', 50753864, '47209494', NULL, NULL, '2 Carey Avenue', 'Barra de Carrasco', 'Florida', 'Uruguay', '1986-12-07', 'F', '2013-06-12 00:00:00', NULL, 1),
(132, 'Ingaborg', 'Sabie', 'isabie3c@smh.com.au', 35475858, '31774029', NULL, NULL, '2 Ridgeview Hill', 'Florida', 'Durazno', 'Uruguay', '1973-06-26', 'F', '2010-07-11 00:00:00', NULL, 0),
(133, 'Dorry', 'Ebenezer', 'debenezer3d@google.com', 42258817, '46341448', NULL, NULL, '0054 Vermont Lane', 'Tarariras', 'Treinta y Tres', 'Uruguay', '1968-08-12', 'F', '2018-10-03 00:00:00', NULL, 0),
(134, 'Filide', 'Beeble', 'fbeeble3e@guardian.co.uk', 59727258, '35696485', NULL, NULL, '3 Bonner Circle', 'Punta del Este', 'Salto', 'Uruguay', '1971-08-26', 'F', '2012-05-24 00:00:00', NULL, 1),
(135, 'Kincaid', 'Filliskirk', 'kfilliskirk3f@instagram.com', 42449748, '27229082', NULL, NULL, '196 Fisk Avenue', 'Mariscala', 'Florida', 'Uruguay', '1998-08-06', 'M', '2017-12-24 00:00:00', NULL, 1),
(136, 'Ulrike', 'Gasker', 'ugasker3g@gizmodo.com', 55234597, '36814203', NULL, NULL, '63067 Ruskin Avenue', 'Punta del Este', 'Cerro Largo', 'Uruguay', '1965-12-22', 'F', '2013-12-17 00:00:00', NULL, 0),
(137, 'Darrelle', 'Reay', 'dreay3h@census.gov', 35588819, '29177127', NULL, NULL, '6 Upham Junction', 'Florencio Sánchez', 'Flores', 'Uruguay', '1952-03-14', 'F', '2017-08-11 00:00:00', NULL, 1),
(138, 'Ursulina', 'Cuttler', 'ucuttler3i@irs.gov', 58846286, '31259612', NULL, NULL, '6 Golf Course Road', 'Florida', 'Salto', 'Uruguay', '1990-10-13', 'F', '2011-06-17 00:00:00', NULL, 1),
(139, 'Teriann', 'Jacqueminot', 'tjacqueminot3j@smh.com.au', 43831888, '30941347', NULL, NULL, '3 Beilfuss Road', 'Soriano', 'Rocha', 'Uruguay', '1976-04-04', 'F', '2013-11-18 00:00:00', NULL, 0),
(140, 'Raine', 'Ovenden', 'rovenden3k@webnode.com', 50880222, '38856247', NULL, NULL, '6 Onsgard Center', 'Castillos', 'Florida', 'Uruguay', '1989-01-11', 'F', '2016-05-29 00:00:00', NULL, 1),
(141, 'Gardener', 'McReynolds', 'gmcreynolds3l@discovery.com', 35156574, '29279002', NULL, NULL, '2353 Independence Trail', 'Maldonado', 'Salto', 'Uruguay', '1985-09-19', 'M', '2014-01-22 00:00:00', NULL, 0),
(142, 'Harlene', 'Favela', 'hfavela3m@wp.com', 39676533, '21895048', NULL, NULL, '93 Eagan Point', 'Treinta y Tres', 'Montevideo', 'Uruguay', '1966-04-15', 'F', '2013-10-19 00:00:00', NULL, 1),
(143, 'Edan', 'Snoden', 'esnoden3n@w3.org', 52905649, '25626350', NULL, NULL, '26 Ridge Oak Court', 'Durazno', 'Treinta y Tres', 'Uruguay', '1957-12-11', 'M', '2014-05-08 00:00:00', NULL, 1),
(144, 'Wendie', 'Quin', 'wquin3o@meetup.com', 54439771, '44199559', NULL, NULL, '83246 Arizona Trail', 'Punta del Este', 'Canelones', 'Uruguay', '1976-03-19', 'F', '2014-12-18 00:00:00', NULL, 0),
(145, 'Debi', 'Adolfson', 'dadolfson3p@shop-pro.jp', 54733506, '44598162', NULL, NULL, '1141 Merchant Parkway', 'Florida', 'Paysandú', 'Uruguay', '1971-06-13', 'F', '2018-04-17 00:00:00', NULL, 0),
(146, 'Bartie', 'Yell', 'byell3q@telegraph.co.uk', 36915943, '28183454', NULL, NULL, '6 Hintze Parkway', 'Barra de Carrasco', 'Salto', 'Uruguay', '1997-06-07', 'M', '2010-11-01 00:00:00', NULL, 1),
(147, 'Gareth', 'Kiddy', 'gkiddy3r@mapquest.com', 50238569, '41217479', NULL, NULL, '283 Eagan Lane', 'Quebracho', 'Maldonado', 'Uruguay', '1955-09-19', 'M', '2017-02-08 00:00:00', NULL, 1),
(148, 'Chastity', 'Sawdon', 'csawdon3s@census.gov', 46124151, '45432830', NULL, NULL, '00 Old Shore Hill', 'San Javier', 'Canelones', 'Uruguay', '1998-06-21', 'F', '2015-07-02 00:00:00', NULL, 0),
(149, 'Kati', 'Croxford', 'kcroxford3t@latimes.com', 55251758, '46709656', NULL, NULL, '090 Sunfield Center', 'Vichadero', 'Tacuarembó', 'Uruguay', '1975-06-08', 'F', '2017-06-30 00:00:00', NULL, 1),
(150, 'Eal', 'Sturr', 'esturr3u@boston.com', 31537366, '35288877', NULL, NULL, '1 Elka Center', 'Lascano', 'Río Negro', 'Uruguay', '1990-01-24', 'M', '2017-12-05 00:00:00', NULL, 1),
(151, 'Violante', 'Stansby', 'vstansby3v@unblog.fr', 36106517, '33169132', NULL, NULL, '908 Thompson Point', 'Quebracho', 'Flores', 'Uruguay', '1976-04-06', 'F', '2014-12-26 00:00:00', NULL, 0),
(152, 'Douglass', 'Grumley', 'dgrumley3w@scribd.com', 30948983, '46694176', NULL, NULL, '47669 Westport Junction', 'Juan L. Lacaze', 'Artigas', 'Uruguay', '1952-03-21', 'M', '2010-05-22 00:00:00', NULL, 0),
(153, 'Nari', 'Kovalski', 'nkovalski3x@ted.com', 34176879, '22727250', NULL, NULL, '58484 Annamark Terrace', 'Santa Catalina', 'Salto', 'Uruguay', '1973-06-04', 'F', '2011-07-12 00:00:00', NULL, 1),
(154, 'Neall', 'Tames', 'ntames3y@msn.com', 45405478, '40789514', NULL, NULL, '9083 Susan Parkway', 'Aguas Corrientes', 'Flores', 'Uruguay', '1981-01-18', 'M', '2017-01-26 00:00:00', NULL, 1),
(155, 'Trace', 'Rodgerson', 'trodgerson3z@360.cn', 41589817, '27325689', NULL, NULL, '521 Towne Drive', 'Florencio Sánchez', 'Maldonado', 'Uruguay', '1999-02-22', 'M', '2018-01-05 00:00:00', NULL, 1),
(156, 'Beauregard', 'Nisard', 'bnisard40@weibo.com', 36014367, '24285366', NULL, NULL, '04125 Harbort Center', 'Vergara', 'Artigas', 'Uruguay', '1951-10-24', 'M', '2010-05-14 00:00:00', NULL, 0),
(157, 'Marchall', 'Daglish', 'mdaglish41@cam.ac.uk', 59299676, '41177177', NULL, NULL, '78 Hagan Hill', 'Santa Catalina', 'Durazno', 'Uruguay', '1970-04-26', 'M', '2018-03-17 00:00:00', NULL, 1),
(158, 'Sibyl', 'Peak', 'speak42@youku.com', 58249502, '27371681', NULL, NULL, '86 Londonderry Way', 'Santa Bernardina', 'Canelones', 'Uruguay', '1977-09-22', 'M', '2012-01-23 00:00:00', NULL, 1),
(159, 'Conway', 'Readwing', 'creadwing43@unicef.org', 43261183, '33040155', NULL, NULL, '33 Brentwood Drive', 'Palmitas', 'Soriano', 'Uruguay', '1983-11-10', 'M', '2015-04-15 00:00:00', NULL, 1),
(160, 'Jenni', 'Fairbank', 'jfairbank44@nyu.edu', 57874253, '42645709', NULL, NULL, '55526 Springs Circle', 'Cerro Colorado', 'Rivera', 'Uruguay', '1983-05-21', 'F', '2018-09-04 00:00:00', NULL, 1),
(161, 'Koren', 'Bonass', 'kbonass45@springer.com', 49706953, '36771539', NULL, NULL, '793 Sauthoff Avenue', 'Lascano', 'Salto', 'Uruguay', '1968-07-24', 'F', '2010-06-01 00:00:00', NULL, 0),
(162, 'Meg', 'Persent', 'mpersent46@weebly.com', 55284514, '33571718', NULL, NULL, '56 Blaine Avenue', 'Santa Rosa', 'Maldonado', 'Uruguay', '1962-02-18', 'F', '2011-11-30 00:00:00', NULL, 1),
(163, 'Ansley', 'Varran', 'avarran47@aboutads.info', 35575846, '31154487', NULL, NULL, '5329 Scofield Terrace', 'Colonia Nicolich', 'Salto', 'Uruguay', '1969-10-12', 'F', '2014-06-25 00:00:00', NULL, 0),
(164, 'Waylin', 'Stennes', 'wstennes48@apple.com', 36600527, '36956674', NULL, NULL, '11903 Redwing Crossing', 'Salto', 'Lavalleja', 'Uruguay', '1988-01-13', 'M', '2014-09-01 00:00:00', NULL, 1),
(165, 'Stephani', 'Jeffery', 'sjeffery49@epa.gov', 40720551, '23455992', NULL, NULL, '48 Marquette Street', 'Sauce', 'Artigas', 'Uruguay', '1989-11-22', 'F', '2011-10-22 00:00:00', NULL, 0),
(166, 'Laughton', 'Bramall', 'lbramall4a@who.int', 45400898, '44427811', NULL, NULL, '4 Granby Junction', 'Vichadero', 'Maldonado', 'Uruguay', '1982-10-04', 'M', '2012-10-01 00:00:00', NULL, 0),
(167, 'Zeb', 'Kelshaw', 'zkelshaw4b@nba.com', 57106030, '32513621', NULL, NULL, '1067 Emmet Alley', 'Punta del Este', 'Treinta y Tres', 'Uruguay', '1992-08-25', 'M', '2017-09-29 00:00:00', NULL, 0),
(168, 'Shaun', 'Caroll', 'scaroll4c@cafepress.com', 41483715, '27408572', NULL, NULL, '2 Bowman Park', 'Fray Bentos', 'Treinta y Tres', 'Uruguay', '1986-01-09', 'M', '2013-03-09 00:00:00', NULL, 0),
(169, 'Drusilla', 'Dyerson', 'ddyerson4d@wufoo.com', 51331621, '44087312', NULL, NULL, '6 Chive Hill', 'Rivera', 'Colonia', 'Uruguay', '1966-01-21', 'F', '2018-10-15 00:00:00', NULL, 1),
(170, 'Gorden', 'Nockells', 'gnockells4e@aol.com', 44219801, '40008926', NULL, NULL, '0021 Karstens Hill', 'Cardal', 'Río Negro', 'Uruguay', '1969-05-14', 'M', '2012-06-07 00:00:00', NULL, 1),
(171, 'Daniella', 'Mighele', 'dmighele4f@unc.edu', 30925134, '23300134', NULL, NULL, '32 Pond Hill', 'Santa Rosa', 'Colonia', 'Uruguay', '1959-08-14', 'F', '2017-05-01 00:00:00', NULL, 1),
(172, 'Derrick', 'Seid', 'dseid4g@de.vu', 52855866, '38826698', NULL, NULL, '10821 Moose Drive', 'Bella Unión', 'Rivera', 'Uruguay', '1988-12-13', 'M', '2015-12-11 00:00:00', NULL, 1),
(173, 'Lavina', 'Hutfield', 'lhutfield4h@wired.com', 30019786, '44832917', NULL, NULL, '20087 Blaine Circle', 'Joaquín Suárez', 'Río Negro', 'Uruguay', '1954-02-24', 'F', '2012-02-14 00:00:00', NULL, 1),
(174, 'Sofie', 'Artis', 'sartis4i@reuters.com', 34563232, '40266387', NULL, NULL, '03979 Stang Way', 'San Bautista', 'Maldonado', 'Uruguay', '1979-04-08', 'F', '2017-09-09 00:00:00', NULL, 1),
(175, 'Halsy', 'Dable', 'hdable4j@bravesites.com', 36392190, '22425793', NULL, NULL, '4 Sauthoff Court', 'Santa Catalina', 'Durazno', 'Uruguay', '1978-03-12', 'M', '2014-10-28 00:00:00', NULL, 1),
(176, 'Ida', 'Renwick', 'irenwick4k@yolasite.com', 52965195, '46357505', NULL, NULL, '162 Beilfuss Crossing', 'Castillos', 'Durazno', 'Uruguay', '1997-08-25', 'F', '2015-04-14 00:00:00', NULL, 1),
(177, 'Iris', 'Corbet', 'icorbet4l@twitpic.com', 39126295, '46427720', NULL, NULL, '3965 Mockingbird Road', 'San Ramón', 'Flores', 'Uruguay', '1979-07-11', 'F', '2011-07-10 00:00:00', NULL, 0),
(178, 'Kath', 'Chezelle', 'kchezelle4m@bbb.org', 47030940, '42327310', NULL, NULL, '8185 Schlimgen Point', 'Bella Unión', 'Soriano', 'Uruguay', '1973-01-08', 'F', '2011-01-30 00:00:00', NULL, 0),
(179, 'Nickie', 'Le Jean', 'nlejean4n@nytimes.com', 53854252, '32124160', NULL, NULL, '00 Comanche Point', 'Delta del Tigre', 'Treinta y Tres', 'Uruguay', '1988-07-10', 'F', '2014-09-28 00:00:00', NULL, 1),
(180, 'Arabel', 'Geleman', 'ageleman4o@dailymotion.com', 55459291, '46558435', NULL, NULL, '4 Hoffman Road', 'Delta del Tigre', 'Río Negro', 'Uruguay', '1979-10-24', 'F', '2010-10-19 00:00:00', NULL, 1),
(181, 'Ursulina', 'Timberlake', 'utimberlake4p@auda.org.au', 35008277, '44149611', NULL, NULL, '88003 Claremont Junction', 'Joaquín Suárez', 'Rivera', 'Uruguay', '1974-05-01', 'F', '2017-02-27 00:00:00', NULL, 0),
(182, 'Thorsten', 'Treadaway', 'ttreadaway4q@bbc.co.uk', 58482452, '25136824', NULL, NULL, '33 Maryland Terrace', 'Vichadero', 'Montevideo', 'Uruguay', '1960-09-24', 'M', '2010-08-06 00:00:00', NULL, 1),
(183, 'Lila', 'Pellew', 'lpellew4r@feedburner.com', 51206050, '31945621', NULL, NULL, '30 Ohio Hill', 'Delta del Tigre', 'San José', 'Uruguay', '1986-03-02', 'F', '2011-08-13 00:00:00', NULL, 0),
(184, 'Emilia', 'Dunkinson', 'edunkinson4s@altervista.org', 31374692, '48045475', NULL, NULL, '04 Cambridge Pass', 'Florida', 'Soriano', 'Uruguay', '1996-07-24', 'F', '2012-09-25 00:00:00', NULL, 1),
(185, 'Rosette', 'Halward', 'rhalward4t@home.pl', 41470745, '43879171', NULL, NULL, '617 Packers Center', 'San José de Mayo', 'Colonia', 'Uruguay', '1990-10-17', 'F', '2011-11-16 00:00:00', NULL, 0),
(186, 'Pavel', 'Panton', 'ppanton4u@answers.com', 36329327, '37682688', NULL, NULL, '77456 Merrick Place', 'Juan L. Lacaze', 'Río Negro', 'Uruguay', '1965-03-05', 'M', '2015-01-04 00:00:00', NULL, 1),
(187, 'Joli', 'Gallymore', 'jgallymore4v@is.gd', 54164996, '37908008', NULL, NULL, '4 Pine View Junction', 'Progreso', 'Artigas', 'Uruguay', '1988-09-27', 'F', '2016-12-05 00:00:00', NULL, 1),
(188, 'Craggie', 'Profit', 'cprofit4w@answers.com', 41703809, '44052824', NULL, NULL, '20908 Artisan Road', 'Progreso', 'Treinta y Tres', 'Uruguay', '1971-04-05', 'M', '2015-08-14 00:00:00', NULL, 0),
(189, 'Hunt', 'Bellhanger', 'hbellhanger4x@github.io', 31422212, '47567670', NULL, NULL, '7286 Maryland Lane', 'Santiago Vázquez', 'Río Negro', 'Uruguay', '1983-02-16', 'M', '2011-03-25 00:00:00', NULL, 1),
(190, 'Peggi', 'Kiefer', 'pkiefer4y@uiuc.edu', 45975924, '23991405', NULL, NULL, '284 Sauthoff Trail', 'Los Cerrillos', 'Rivera', 'Uruguay', '1963-02-24', 'F', '2011-10-18 00:00:00', NULL, 1),
(191, 'Gregorius', 'Weich', 'gweich4z@nationalgeographic.com', 30470594, '35133594', NULL, NULL, '74413 Merry Circle', 'Cerro Colorado', 'Rocha', 'Uruguay', '1966-11-14', 'M', '2010-06-28 00:00:00', NULL, 0),
(192, 'Reuben', 'Conduit', 'rconduit50@weather.com', 59896132, '40564946', NULL, NULL, '89180 Homewood Lane', 'Delta del Tigre', 'Maldonado', 'Uruguay', '1966-05-22', 'M', '2013-07-25 00:00:00', NULL, 0),
(193, 'Horatia', 'Dumphries', 'hdumphries51@facebook.com', 32992129, '23018817', NULL, NULL, '8416 Waxwing Road', 'Mariscala', 'Soriano', 'Uruguay', '1988-05-25', 'F', '2012-01-28 00:00:00', NULL, 1),
(194, 'Darelle', 'Kem', 'dkem52@mashable.com', 38129163, '41012155', NULL, NULL, '5347 Lakeland Hill', 'Pan de Azúcar', 'Florida', 'Uruguay', '1976-03-13', 'F', '2013-09-19 00:00:00', NULL, 0),
(195, 'Gun', 'Batalle', 'gbatalle53@google.co.jp', 46202323, '42190676', NULL, NULL, '565 Dennis Plaza', 'Florida', 'San José', 'Uruguay', '1954-04-24', 'M', '2012-05-22 00:00:00', NULL, 1),
(196, 'Bar', 'Cruft', 'bcruft54@huffingtonpost.com', 47651352, '42355695', NULL, NULL, '3595 Manitowish Road', 'Dolores', 'Paysandú', 'Uruguay', '1962-03-04', 'M', '2015-03-27 00:00:00', NULL, 1),
(197, 'Neron', 'Hannent', 'nhannent55@blogtalkradio.com', 46175859, '37158638', NULL, NULL, '8788 Brentwood Hill', 'Rivera', 'Treinta y Tres', 'Uruguay', '1989-02-19', 'M', '2015-06-02 00:00:00', NULL, 0),
(198, 'Kristin', 'Mariault', 'kmariault56@loc.gov', 33727856, '37713539', NULL, NULL, '1968 Hoepker Drive', 'Vichadero', 'Salto', 'Uruguay', '1994-09-29', 'F', '2016-08-10 00:00:00', NULL, 1),
(199, 'Persis', 'Hilbourne', 'philbourne57@wikimedia.org', 39286061, '41599709', NULL, NULL, '53278 Pennsylvania Pass', 'Quebracho', 'San José', 'Uruguay', '1966-01-28', 'F', '2016-10-18 00:00:00', NULL, 1),
(200, 'Emmy', 'Rasher', 'erasher58@quantcast.com', 53569454, '20892348', NULL, NULL, '337 Anzinger Lane', 'Fray Bentos', 'Maldonado', 'Uruguay', '1983-07-30', 'M', '2010-07-14 00:00:00', NULL, 1),
(201, 'Adi', 'Beattie', 'abeattie59@godaddy.com', 43033489, '30742313', NULL, NULL, '524 Shasta Avenue', 'Young', 'Treinta y Tres', 'Uruguay', '1990-02-20', 'F', '2010-06-19 00:00:00', NULL, 0),
(202, 'Brad', 'Bim', 'bbim5a@utexas.edu', 42397606, '44407931', NULL, NULL, '5 Esker Terrace', 'Los Cerrillos', 'Rocha', 'Uruguay', '1963-02-01', 'M', '2010-07-20 00:00:00', NULL, 0),
(203, 'Judi', 'Boobier', 'jboobier5b@privacy.gov.au', 58248866, '38004763', NULL, NULL, '89298 Menomonie Terrace', 'Durazno', 'Salto', 'Uruguay', '1971-05-30', 'F', '2012-02-02 00:00:00', NULL, 0),
(204, 'Maurits', 'Isaac', 'misaac5c@moonfruit.com', 49655864, '31824220', NULL, NULL, '5701 Oakridge Point', 'Aguas Corrientes', 'San José', 'Uruguay', '1954-12-31', 'M', '2012-04-23 00:00:00', NULL, 1),
(205, 'Byran', 'Brady', 'bbrady5d@uiuc.edu', 35033475, '38022263', NULL, NULL, '05177 Elgar Plaza', 'San José de Mayo', 'Durazno', 'Uruguay', '1958-04-06', 'M', '2018-07-13 00:00:00', NULL, 1),
(206, 'Willyt', 'Gerardi', 'wgerardi5e@ebay.co.uk', 39254107, '31152107', NULL, NULL, '01671 Sage Road', 'Santa Catalina', 'Treinta y Tres', 'Uruguay', '1995-12-12', 'F', '2017-05-24 00:00:00', NULL, 1),
(207, 'Jillana', 'Thornewill', 'jthornewill5f@about.com', 55154356, '27475157', NULL, NULL, '55 Fairfield Alley', 'Fray Bentos', 'Tacuarembó', 'Uruguay', '1991-09-17', 'F', '2012-12-13 00:00:00', NULL, 1),
(208, 'Coleen', 'Innot', 'cinnot5g@altervista.org', 46071748, '39504104', NULL, NULL, '305 Little Fleur Point', 'Barra de Carrasco', 'Rocha', 'Uruguay', '1973-04-27', 'F', '2010-10-31 00:00:00', NULL, 1),
(209, 'Elaina', 'Doe', 'edoe5h@apple.com', 53364435, '28284842', NULL, NULL, '4 Park Meadow Junction', 'Florida', 'Lavalleja', 'Uruguay', '1963-11-27', 'F', '2015-03-10 00:00:00', NULL, 0),
(210, 'Lorain', 'Rowlinson', 'lrowlinson5i@deviantart.com', 35571683, '25915756', NULL, NULL, '9 Aberg Drive', 'Juan L. Lacaze', 'Salto', 'Uruguay', '1957-08-27', 'F', '2016-07-21 00:00:00', NULL, 1),
(211, 'Valenka', 'Spiaggia', 'vspiaggia5j@rediff.com', 31081453, '30220902', NULL, NULL, '39929 Myrtle Trail', 'Castillos', 'San José', 'Uruguay', '1962-01-18', 'F', '2015-03-28 00:00:00', NULL, 1),
(212, 'Kendal', 'Batcheldor', 'kbatcheldor5k@pinterest.com', 51160834, '29570554', NULL, NULL, '195 Schlimgen Parkway', 'Santiago Vázquez', 'Lavalleja', 'Uruguay', '1995-01-08', 'M', '2013-02-02 00:00:00', NULL, 0),
(213, 'Tybalt', 'Duer', 'tduer5l@cafepress.com', 51019634, '21213114', NULL, NULL, '45451 Kennedy Trail', 'Aguas Corrientes', 'Rocha', 'Uruguay', '1983-11-08', 'M', '2018-05-15 00:00:00', NULL, 1),
(214, 'Armin', 'Key', 'akey5m@sakura.ne.jp', 31668572, '37476581', NULL, NULL, '5117 Ridgeview Avenue', 'Rivera', 'San José', 'Uruguay', '1951-11-29', 'M', '2018-07-01 00:00:00', NULL, 1),
(215, 'Jobye', 'Spurgeon', 'jspurgeon5n@eepurl.com', 39755314, '48203123', NULL, NULL, '0301 Arrowood Alley', 'Porvenir', 'Tacuarembó', 'Uruguay', '1991-07-06', 'F', '2012-06-13 00:00:00', NULL, 1),
(216, 'Elias', 'McLemon', 'emclemon5o@live.com', 52909607, '31997874', NULL, NULL, '08 Meadow Vale Way', 'Castillos', 'Salto', 'Uruguay', '1976-03-12', 'M', '2015-05-27 00:00:00', NULL, 0),
(217, 'Lissy', 'Stratiff', 'lstratiff5p@google.co.uk', 43661820, '33100954', NULL, NULL, '11530 Sachs Plaza', 'Paso de Carrasco', 'Durazno', 'Uruguay', '1960-05-19', 'F', '2014-08-12 00:00:00', NULL, 0),
(218, 'Hetty', 'Hallut', 'hhallut5q@usa.gov', 54897647, '35922299', NULL, NULL, '8612 Ohio Street', 'Tala', 'Salto', 'Uruguay', '1981-10-17', 'F', '2013-04-07 00:00:00', NULL, 1),
(219, 'Kelci', 'Sheach', 'ksheach5r@ocn.ne.jp', 58731711, '38232416', NULL, NULL, '51 Spaight Parkway', 'Tupambaé', 'Colonia', 'Uruguay', '1973-07-29', 'F', '2010-11-29 00:00:00', NULL, 0),
(220, 'Antonin', 'Sendley', 'asendley5s@netscape.com', 43507405, '35598832', NULL, NULL, '215 Center Place', 'Nueva Helvecia', 'Tacuarembó', 'Uruguay', '1956-09-03', 'M', '2018-06-24 00:00:00', NULL, 0),
(221, 'Costa', 'Bonde', 'cbonde5t@youtu.be', 37829023, '41038794', NULL, NULL, '738 Toban Terrace', 'Tala', 'Salto', 'Uruguay', '1995-02-28', 'M', '2017-07-11 00:00:00', NULL, 1),
(222, 'Hervey', 'Corker', 'hcorker5u@dmoz.org', 53880173, '42540635', NULL, NULL, '1074 Killdeer Park', 'La Floresta', 'Paysandú', 'Uruguay', '1968-08-05', 'M', '2010-07-24 00:00:00', NULL, 0),
(223, 'Matthias', 'Reboulet', 'mreboulet5v@mozilla.com', 57071071, '34106018', NULL, NULL, '99 Pennsylvania Road', 'Soca', 'Cerro Largo', 'Uruguay', '1958-07-03', 'M', '2010-07-22 00:00:00', NULL, 0),
(224, 'Heinrick', 'Varnam', 'hvarnam5w@tripadvisor.com', 42912403, '29268336', NULL, NULL, '87545 Cambridge Terrace', 'Lascano', 'Paysandú', 'Uruguay', '1971-02-21', 'M', '2017-04-19 00:00:00', NULL, 1),
(225, 'Augustina', 'Eary', 'aeary5x@webnode.com', 37682651, '21614013', NULL, NULL, '886 Sloan Parkway', 'Sauce', 'Soriano', 'Uruguay', '1961-11-05', 'F', '2011-04-26 00:00:00', NULL, 1),
(226, 'Henderson', 'Whall', 'hwhall5y@multiply.com', 51103050, '45191352', NULL, NULL, '4 Red Cloud Alley', 'San José de Mayo', 'Soriano', 'Uruguay', '1982-01-30', 'M', '2016-09-03 00:00:00', NULL, 1),
(227, 'Meade', 'Dearden', 'mdearden5z@ucsd.edu', 39218075, '37131007', NULL, NULL, '922 Lien Drive', 'Punta del Este', 'Salto', 'Uruguay', '1998-06-15', 'M', '2013-01-27 00:00:00', NULL, 0),
(228, 'Elvis', 'Wayne', 'ewayne60@pcworld.com', 50651679, '45621489', NULL, NULL, '73624 Esch Circle', 'Baltasar Brum', 'Paysandú', 'Uruguay', '1961-04-22', 'M', '2018-10-25 00:00:00', NULL, 0),
(229, 'Carley', 'Learmouth', 'clearmouth61@liveinternet.ru', 58627526, '35210454', NULL, NULL, '17 Spaight Court', 'Salto', 'Río Negro', 'Uruguay', '1994-06-24', 'F', '2013-03-14 00:00:00', NULL, 1),
(230, 'Peria', 'Gudgen', 'pgudgen62@theguardian.com', 48637648, '44836258', NULL, NULL, '539 Vera Circle', 'Salto', 'Soriano', 'Uruguay', '1951-01-23', 'F', '2015-07-03 00:00:00', NULL, 1),
(231, 'Jacintha', 'Dowry', 'jdowry63@nhs.uk', 49972992, '32512297', NULL, NULL, '489 Fieldstone Avenue', 'Treinta y Tres', 'Treinta y Tres', 'Uruguay', '1993-01-04', 'F', '2015-05-22 00:00:00', NULL, 1),
(232, 'Felicio', 'Garforth', 'fgarforth64@elegantthemes.com', 31389591, '29118674', NULL, NULL, '6 West Street', 'Tarariras', 'Flores', 'Uruguay', '1986-06-11', 'M', '2010-11-12 00:00:00', NULL, 1),
(233, 'Huntley', 'Ashleigh', 'hashleigh65@barnesandnoble.com', 58442332, '38022437', NULL, NULL, '31 Green Ridge Place', 'Los Cerrillos', 'Rocha', 'Uruguay', '1994-12-27', 'M', '2013-01-02 00:00:00', NULL, 0),
(234, 'Leonore', 'Colvine', 'lcolvine66@globo.com', 56500161, '32505401', NULL, NULL, '1591 Anderson Alley', 'Nueva Helvecia', 'Treinta y Tres', 'Uruguay', '1962-11-15', 'F', '2010-05-11 00:00:00', NULL, 1),
(235, 'Jennifer', 'Dummigan', 'jdummigan67@yale.edu', 40517059, '23412401', NULL, NULL, '49 Algoma Place', 'Punta del Este', 'Montevideo', 'Uruguay', '1975-04-30', 'F', '2014-03-11 00:00:00', NULL, 1),
(236, 'Shirlee', 'Ditter', 'sditter68@elpais.com', 52642621, '40531769', NULL, NULL, '8 Killdeer Alley', 'Cerro Colorado', 'Montevideo', 'Uruguay', '1962-01-19', 'F', '2011-06-03 00:00:00', NULL, 0),
(237, 'Elke', 'Willan', 'ewillan69@ucla.edu', 34168160, '46900281', NULL, NULL, '8 Shoshone Lane', 'Mariscala', 'Montevideo', 'Uruguay', '1961-11-11', 'F', '2018-02-12 00:00:00', NULL, 0),
(238, 'Dell', 'Bruckstein', 'dbruckstein6a@nationalgeographic.com', 33997227, '41109779', NULL, NULL, '74 Mayer Way', 'Pando', 'Montevideo', 'Uruguay', '1970-03-14', 'M', '2010-08-23 00:00:00', NULL, 1),
(239, 'Nicol', 'Higgen', 'nhiggen6b@webs.com', 48558772, '33700690', NULL, NULL, '73 Waxwing Crossing', 'Nueva Helvecia', 'Durazno', 'Uruguay', '1988-04-04', 'M', '2012-12-18 00:00:00', NULL, 0),
(240, 'Ruben', 'Indgs', 'rindgs6c@wp.com', 32641641, '21390660', NULL, NULL, '0 Moland Court', 'Vichadero', 'Soriano', 'Uruguay', '1991-03-08', 'M', '2017-04-09 00:00:00', NULL, 0),
(241, 'Adolphus', 'Hunsworth', 'ahunsworth6d@altervista.org', 30272376, '47356417', NULL, NULL, '92317 Browning Avenue', 'Ecilda Paullier', 'Rivera', 'Uruguay', '1975-09-19', 'M', '2011-02-05 00:00:00', NULL, 1),
(242, 'Edwin', 'Barracks', 'ebarracks6e@patch.com', 59562716, '27370044', NULL, NULL, '63 Mayfield Circle', 'Nuevo Berlín', 'Soriano', 'Uruguay', '1998-11-09', 'M', '2018-01-03 00:00:00', NULL, 0),
(243, 'Luce', 'Colrein', 'lcolrein6f@earthlink.net', 51654466, '43536562', NULL, NULL, '4 Grover Terrace', 'Belén', 'Lavalleja', 'Uruguay', '1974-04-08', 'F', '2011-07-03 00:00:00', NULL, 0),
(244, 'Harvey', 'Elders', 'helders6g@indiatimes.com', 46263761, '44189727', NULL, NULL, '5281 Gulseth Plaza', 'Vichadero', 'Maldonado', 'Uruguay', '1973-09-18', 'M', '2015-09-02 00:00:00', NULL, 1),
(245, 'Hedi', 'Felderer', 'hfelderer6h@eepurl.com', 52516659, '34356949', NULL, NULL, '17 Pennsylvania Plaza', 'Soriano', 'Paysandú', 'Uruguay', '1987-01-29', 'F', '2015-07-26 00:00:00', NULL, 1),
(246, 'Merwin', 'Meedendorpe', 'mmeedendorpe6i@time.com', 57045110, '45609636', NULL, NULL, '2438 Vernon Circle', 'Durazno', 'Paysandú', 'Uruguay', '1976-11-17', 'M', '2012-12-20 00:00:00', NULL, 1),
(247, 'Lois', 'Buckwell', 'lbuckwell6j@lulu.com', 49081965, '34959484', NULL, NULL, '9 Rigney Lane', 'San José de Mayo', 'Rivera', 'Uruguay', '1973-04-27', 'F', '2015-06-08 00:00:00', NULL, 0),
(248, 'Bernadene', 'Berka', 'bberka6k@artisteer.com', 47763365, '48060581', NULL, NULL, '49 Eagan Parkway', 'Florida', 'Lavalleja', 'Uruguay', '1951-03-20', 'F', '2010-12-03 00:00:00', NULL, 1),
(249, 'Gav', 'Heffy', 'gheffy6l@elpais.com', 30681610, '31646030', NULL, NULL, '7 Haas Parkway', 'Young', 'Río Negro', 'Uruguay', '1984-09-01', 'M', '2013-06-21 00:00:00', NULL, 0),
(250, 'Virgina', 'Gibby', 'vgibby6m@wsj.com', 34848462, '29494926', NULL, NULL, '774 Grayhawk Street', 'Migues', 'Tacuarembó', 'Uruguay', '1975-01-01', 'F', '2012-04-05 00:00:00', NULL, 1),
(251, 'Sig', 'Tilberry', 'stilberry6n@dagondesign.com', 44546724, '43835183', NULL, NULL, '26 Waubesa Lane', 'Pando', 'Soriano', 'Uruguay', '1968-02-18', 'M', '2015-12-14 00:00:00', NULL, 1),
(252, 'Juanita', 'Faccini', 'jfaccini6o@businessweek.com', 36362360, '37864357', NULL, NULL, '525 Blue Bill Park Street', 'San Bautista', 'Montevideo', 'Uruguay', '1978-02-01', 'F', '2015-04-21 00:00:00', NULL, 1),
(253, 'Dale', 'Levington', 'dlevington6p@loc.gov', 54591929, '30155719', NULL, NULL, '23028 Nelson Plaza', 'Las Toscas', 'Soriano', 'Uruguay', '1993-06-16', 'M', '2018-06-05 00:00:00', NULL, 1),
(254, 'Andrei', 'Bettanay', 'abettanay6q@home.pl', 48114124, '37196507', NULL, NULL, '32700 Service Avenue', 'Los Cerrillos', 'Florida', 'Uruguay', '1977-08-10', 'F', '2012-03-22 00:00:00', NULL, 0),
(255, 'Mildrid', 'Forseith', 'mforseith6r@disqus.com', 56456508, '34120340', NULL, NULL, '6437 Dayton Road', 'Santa Bernardina', 'Cerro Largo', 'Uruguay', '1952-03-06', 'F', '2014-08-18 00:00:00', NULL, 1),
(256, 'Emilie', 'Fellgate', 'efellgate6s@umich.edu', 33888265, '46585480', NULL, NULL, '05 Colorado Point', 'Juan L. Lacaze', 'Artigas', 'Uruguay', '1963-11-18', 'F', '2016-12-27 00:00:00', NULL, 0),
(257, 'Merrilee', 'Dewbury', 'mdewbury6t@de.vu', 58966035, '34845443', NULL, NULL, '52 Stone Corner Place', 'Mercedes', 'Río Negro', 'Uruguay', '1988-12-27', 'F', '2010-06-21 00:00:00', NULL, 1),
(258, 'Doretta', 'Poser', 'dposer6u@sourceforge.net', 37435089, '42101875', NULL, NULL, '5 Express Park', 'Santa Rosa', 'Flores', 'Uruguay', '1951-12-10', 'F', '2016-01-12 00:00:00', NULL, 0);
INSERT INTO `personas` (`id`, `nombres`, `apellidos`, `email`, `ci`, `telefono1`, `telefono2`, `telefono3`, `direccion`, `localidad`, `departamento`, `pais`, `fecha_de_nacimiento`, `sexo`, `ingreso`, `observaciones`, `estado`) VALUES
(259, 'Saidee', 'Songer', 'ssonger6v@google.com', 32987359, '44812878', NULL, NULL, '64 Hoffman Road', 'Dolores', 'Río Negro', 'Uruguay', '1953-07-23', 'F', '2010-05-10 00:00:00', NULL, 0),
(260, 'Uta', 'Cruwys', 'ucruwys6w@uiuc.edu', 36669286, '28060554', NULL, NULL, '34 Rigney Trail', 'San Bautista', 'Soriano', 'Uruguay', '1989-07-31', 'F', '2010-10-24 00:00:00', NULL, 0),
(261, 'Julia', 'Jammet', 'jjammet6x@huffingtonpost.com', 50626679, '36591462', NULL, NULL, '665 David Crossing', 'Aguas Corrientes', 'Canelones', 'Uruguay', '1976-06-18', 'F', '2015-10-07 00:00:00', NULL, 1),
(262, 'Frayda', 'Vasilkov', 'fvasilkov6y@jugem.jp', 38868342, '48199389', NULL, NULL, '62 Basil Crossing', 'Baltasar Brum', 'Río Negro', 'Uruguay', '1986-04-02', 'F', '2014-12-08 00:00:00', NULL, 1),
(263, 'Diarmid', 'Coorington', 'dcoorington6z@meetup.com', 44312368, '33996232', NULL, NULL, '88452 Roth Pass', 'Progreso', 'Florida', 'Uruguay', '1995-10-01', 'M', '2014-06-30 00:00:00', NULL, 1),
(264, 'Cello', 'Shevels', 'cshevels70@github.com', 55367657, '42669264', NULL, NULL, '042 Butternut Terrace', 'San Javier', 'Tacuarembó', 'Uruguay', '1978-02-04', 'M', '2011-04-16 00:00:00', NULL, 1),
(265, 'Caresa', 'Meddows', 'cmeddows71@pinterest.com', 36430993, '20769609', NULL, NULL, '9 Hermina Parkway', 'Belén', 'Paysandú', 'Uruguay', '1950-09-20', 'F', '2019-04-04 00:00:00', NULL, 0),
(266, 'Hamil', 'Everall', 'heverall72@dell.com', 39353390, '22462858', NULL, NULL, '3986 Rutledge Terrace', 'Rivera', 'Canelones', 'Uruguay', '1955-05-14', 'M', '2012-02-27 00:00:00', NULL, 0),
(267, 'Tiffani', 'Mechem', 'tmechem73@japanpost.jp', 46186816, '37748047', NULL, NULL, '12201 Loeprich Pass', 'San Javier', 'Treinta y Tres', 'Uruguay', '1956-09-06', 'F', '2011-11-12 00:00:00', NULL, 0),
(268, 'Madlen', 'Ferencowicz', 'mferencowicz74@intel.com', 41264011, '24106865', NULL, NULL, '6 Sutteridge Point', 'Durazno', 'Florida', 'Uruguay', '1990-02-27', 'F', '2012-01-29 00:00:00', NULL, 0),
(269, 'Corene', 'Barfoot', 'cbarfoot75@indiegogo.com', 44818961, '37871514', NULL, NULL, '0 Warner Avenue', 'Fray Bentos', 'Montevideo', 'Uruguay', '1996-05-26', 'F', '2018-03-05 00:00:00', NULL, 0),
(270, 'Serge', 'Karolewski', 'skarolewski76@addtoany.com', 38170858, '44119289', NULL, NULL, '57 Butterfield Parkway', 'Florida', 'Colonia', 'Uruguay', '1961-11-07', 'M', '2010-10-23 00:00:00', NULL, 0),
(271, 'Lenard', 'Tubb', 'ltubb77@ovh.net', 43585250, '22035102', NULL, NULL, '613 Nova Circle', 'Santa Rosa', 'Durazno', 'Uruguay', '1990-08-11', 'M', '2012-01-06 00:00:00', NULL, 0),
(272, 'Shalna', 'Kruse', 'skruse78@japanpost.jp', 40175067, '35978072', NULL, NULL, '4 Karstens Parkway', 'Joaquín Suárez', 'Durazno', 'Uruguay', '1995-06-13', 'F', '2015-05-14 00:00:00', NULL, 0),
(273, 'Sholom', 'Venney', 'svenney79@comsenz.com', 36608540, '29339545', NULL, NULL, '6577 Loomis Place', 'Belén', 'Soriano', 'Uruguay', '1994-01-30', 'M', '2010-04-15 00:00:00', NULL, 0),
(274, 'Nicholle', 'Baily', 'nbaily7a@merriam-webster.com', 54690961, '38884711', NULL, NULL, '6098 Sundown Trail', 'Las Toscas', 'Florida', 'Uruguay', '1958-09-21', 'F', '2010-04-27 00:00:00', NULL, 0),
(275, 'Chan', 'Tuxell', 'ctuxell7b@adobe.com', 58235288, '21748231', NULL, NULL, '70018 Eastlawn Parkway', 'Vichadero', 'Flores', 'Uruguay', '1950-11-06', 'M', '2010-09-27 00:00:00', NULL, 1),
(276, 'Etan', 'Kester', 'ekester7c@t.co', 41572139, '24209140', NULL, NULL, '336 Cherokee Pass', 'Nuevo Berlín', 'Río Negro', 'Uruguay', '1954-05-19', 'M', '2016-05-24 00:00:00', NULL, 0),
(277, 'Fraze', 'McMorran', 'fmcmorran7d@nih.gov', 43198337, '23597279', NULL, NULL, '28488 Susan Crossing', 'San José de Mayo', 'Canelones', 'Uruguay', '1977-09-19', 'M', '2014-02-13 00:00:00', NULL, 1),
(278, 'Emelyne', 'Victor', 'evictor7e@addtoany.com', 41556614, '30477855', NULL, NULL, '51363 Donald Hill', 'Durazno', 'Rocha', 'Uruguay', '1991-05-25', 'F', '2017-09-26 00:00:00', NULL, 0),
(279, 'Hillary', 'Romke', 'hromke7f@ezinearticles.com', 36222581, '29726756', NULL, NULL, '7430 Scofield Avenue', 'Mariscala', 'Paysandú', 'Uruguay', '1990-07-12', 'M', '2016-12-15 00:00:00', NULL, 0),
(280, 'Chauncey', 'Brockett', 'cbrockett7g@gmpg.org', 47091626, '40429796', NULL, NULL, '72366 Monterey Point', 'Progreso', 'Tacuarembó', 'Uruguay', '1975-06-23', 'M', '2013-11-13 00:00:00', NULL, 0),
(281, 'Ynes', 'Hukins', 'yhukins7h@bloomberg.com', 46314780, '39003070', NULL, NULL, '4 Onsgard Street', 'Vergara', 'Flores', 'Uruguay', '1971-01-03', 'F', '2018-09-14 00:00:00', NULL, 0),
(282, 'Madella', 'Weinmann', 'mweinmann7i@delicious.com', 39036100, '44785799', NULL, NULL, '53 Mayer Junction', 'Pan de Azúcar', 'Rocha', 'Uruguay', '1996-08-19', 'F', '2016-11-23 00:00:00', NULL, 0),
(283, 'Koralle', 'Readett', 'kreadett7j@mac.com', 51080586, '46431773', NULL, NULL, '63448 Evergreen Alley', 'Santa Catalina', 'Cerro Largo', 'Uruguay', '1995-01-20', 'F', '2011-04-22 00:00:00', NULL, 0),
(284, 'Darnell', 'Denman', 'ddenman7k@vinaora.com', 45129402, '28734869', NULL, NULL, '6004 Shoshone Park', 'Progreso', 'Florida', 'Uruguay', '1991-04-29', 'M', '2010-10-29 00:00:00', NULL, 0),
(285, 'Jacklyn', 'Yukhnevich', 'jyukhnevich7l@wired.com', 55608470, '41464278', NULL, NULL, '956 Southridge Hill', 'Bella Unión', 'Cerro Largo', 'Uruguay', '1967-07-18', 'F', '2018-10-15 00:00:00', NULL, 0),
(286, 'Brandice', 'Beades', 'bbeades7m@flavors.me', 59979566, '30202382', NULL, NULL, '89 Shasta Alley', 'Cerro Colorado', 'Rivera', 'Uruguay', '1957-12-22', 'F', '2018-07-29 00:00:00', NULL, 1),
(287, 'Dianna', 'Linnitt', 'dlinnitt7n@yahoo.co.jp', 31607372, '45281430', NULL, NULL, '3067 Carioca Hill', 'Soca', 'Canelones', 'Uruguay', '1957-09-20', 'F', '2013-10-17 00:00:00', NULL, 1),
(288, 'Idaline', 'Minors', 'iminors7o@soup.io', 58921910, '45768438', NULL, NULL, '4 Golf Point', 'Rafael Perazza', 'Florida', 'Uruguay', '1982-08-17', 'F', '2014-10-09 00:00:00', NULL, 0),
(289, 'Rayna', 'Reinert', 'rreinert7p@goodreads.com', 36983244, '45799739', NULL, NULL, '70091 Comanche Terrace', 'San José de Mayo', 'Salto', 'Uruguay', '1992-06-12', 'F', '2016-10-01 00:00:00', NULL, 1),
(290, 'Sukey', 'Exposito', 'sexposito7q@yellowbook.com', 51133620, '37415217', NULL, NULL, '2810 Autumn Leaf Pass', 'Young', 'Colonia', 'Uruguay', '1989-07-29', 'F', '2011-04-09 00:00:00', NULL, 0),
(291, 'Laney', 'Bercevelo', 'lbercevelo7r@plala.or.jp', 33252798, '36507949', NULL, NULL, '13 Thompson Junction', 'Vergara', 'Florida', 'Uruguay', '1976-03-19', 'M', '2014-08-12 00:00:00', NULL, 0),
(292, 'Nilson', 'Vogl', 'nvogl7s@indiatimes.com', 41983321, '21201820', NULL, NULL, '723 Meadow Valley Plaza', 'Progreso', 'Salto', 'Uruguay', '1997-07-05', 'M', '2013-02-23 00:00:00', NULL, 1),
(293, 'Cam', 'Gages', 'cgages7t@bizjournals.com', 34364457, '37294059', NULL, NULL, '4 Fisk Avenue', 'Treinta y Tres', 'Flores', 'Uruguay', '1955-05-05', 'F', '2011-02-14 00:00:00', NULL, 1),
(294, 'Budd', 'Beidebeke', 'bbeidebeke7u@theguardian.com', 48228183, '27564779', NULL, NULL, '2 Gulseth Lane', 'Vergara', 'Rivera', 'Uruguay', '1983-01-22', 'M', '2013-05-31 00:00:00', NULL, 1),
(295, 'Vachel', 'Minci', 'vminci7v@chronoengine.com', 47401626, '21679460', NULL, NULL, '3 Blaine Trail', 'Tala', 'Lavalleja', 'Uruguay', '1964-09-04', 'M', '2019-01-23 00:00:00', NULL, 1),
(296, 'Wendell', 'Moorfield', 'wmoorfield7w@networksolutions.com', 34899172, '28642176', NULL, NULL, '8394 Autumn Leaf Center', 'Sauce', 'Lavalleja', 'Uruguay', '1974-11-30', 'M', '2016-02-05 00:00:00', NULL, 1),
(297, 'Christiana', 'Valero', 'cvalero7x@deliciousdays.com', 37188958, '43732337', NULL, NULL, '341 Lighthouse Bay Junction', 'Nuevo Berlín', 'Maldonado', 'Uruguay', '1966-08-12', 'F', '2011-04-17 00:00:00', NULL, 1),
(298, 'Collete', 'Kem', 'ckem7y@google.com.br', 46115670, '26634076', NULL, NULL, '4970 Steensland Junction', 'Santa Catalina', 'Rocha', 'Uruguay', '1966-09-22', 'F', '2013-05-24 00:00:00', NULL, 0),
(299, 'Emera', 'Bewick', 'ebewick7z@github.com', 36307751, '32914196', NULL, NULL, '054 Fairfield Junction', 'San Javier', 'Salto', 'Uruguay', '1992-10-09', 'F', '2017-01-04 00:00:00', NULL, 0),
(300, 'Harri', 'Jaumet', 'hjaumet80@parallels.com', 53283085, '22018312', NULL, NULL, '95343 Arrowood Hill', 'Nueva Helvecia', 'Rivera', 'Uruguay', '1996-01-22', 'F', '2017-06-08 00:00:00', NULL, 1),
(301, 'Norina', 'Dougher', 'ndougher81@t-online.de', 59686031, '20959897', NULL, NULL, '8614 Golden Leaf Pass', 'Pan de Azúcar', 'Río Negro', 'Uruguay', '1982-12-21', 'F', '2015-08-20 00:00:00', NULL, 1),
(302, 'Fernande', 'Adolfson', 'fadolfson82@usgs.gov', 56424305, '25989903', NULL, NULL, '39 East Pass', 'San José de Mayo', 'Rocha', 'Uruguay', '1955-11-03', 'F', '2014-01-24 00:00:00', NULL, 1),
(303, 'Katharyn', 'Parlatt', 'kparlatt83@si.edu', 48043285, '42938969', NULL, NULL, '1066 Cordelia Lane', 'Progreso', 'Paysandú', 'Uruguay', '1966-05-03', 'F', '2016-03-02 00:00:00', NULL, 0),
(304, 'Harbert', 'Dulany', 'hdulany84@springer.com', 37513222, '47688359', NULL, NULL, '43 Hanover Drive', 'Mercedes', 'Rocha', 'Uruguay', '1958-12-18', 'M', '2016-09-19 00:00:00', NULL, 1),
(305, 'Elmira', 'Loisi', 'eloisi85@cnet.com', 30106396, '34638657', NULL, NULL, '1923 Summerview Court', 'Fray Bentos', 'Florida', 'Uruguay', '1993-02-08', 'F', '2019-04-02 00:00:00', NULL, 0),
(306, 'Esta', 'McPake', 'emcpake86@bandcamp.com', 52787337, '24600469', NULL, NULL, '86 Northview Center', 'Treinta y Tres', 'Soriano', 'Uruguay', '1986-05-27', 'F', '2014-07-21 00:00:00', NULL, 0),
(307, 'Birgit', 'Scolli', 'bscolli87@tumblr.com', 39005020, '31606258', NULL, NULL, '05 Swallow Avenue', 'Mariscala', 'Cerro Largo', 'Uruguay', '1997-04-17', 'F', '2015-06-30 00:00:00', NULL, 1),
(308, 'Guglielmo', 'Mullaly', 'gmullaly88@oaic.gov.au', 59452414, '41391406', NULL, NULL, '263 Mallard Terrace', 'Colonia Nicolich', 'Colonia', 'Uruguay', '1986-08-05', 'M', '2016-03-24 00:00:00', NULL, 0),
(309, 'Tedra', 'Firidolfi', 'tfiridolfi89@walmart.com', 44854249, '24063146', NULL, NULL, '81177 Pepper Wood Way', 'Santiago Vázquez', 'Rivera', 'Uruguay', '1996-11-07', 'F', '2016-04-22 00:00:00', NULL, 1),
(310, 'Alister', 'Esparza', 'aesparza8a@taobao.com', 57501041, '32562292', NULL, NULL, '84 Acker Road', 'Villa del Carmen', 'Tacuarembó', 'Uruguay', '1959-01-12', 'M', '2018-12-31 00:00:00', NULL, 0),
(311, 'Xever', 'Crass', 'xcrass8b@bloomberg.com', 59517035, '24565437', NULL, NULL, '5986 Susan Plaza', 'La Paz', 'Montevideo', 'Uruguay', '1953-06-01', 'M', '2016-02-27 00:00:00', NULL, 1),
(312, 'Kevina', 'Rout', 'krout8c@gizmodo.com', 45536582, '31450995', NULL, NULL, '37620 5th Alley', 'Aguas Corrientes', 'Rocha', 'Uruguay', '1984-10-24', 'F', '2018-06-07 00:00:00', NULL, 1),
(313, 'Millisent', 'Bearne', 'mbearne8d@marriott.com', 46406596, '39421174', NULL, NULL, '5 Elgar Junction', 'Cardal', 'Tacuarembó', 'Uruguay', '1975-01-14', 'F', '2015-02-16 00:00:00', NULL, 0),
(314, 'Dayle', 'Jorn', 'djorn8e@tinyurl.com', 34670092, '45633993', NULL, NULL, '7 Commercial Street', 'San Javier', 'Maldonado', 'Uruguay', '1998-04-07', 'F', '2011-04-08 00:00:00', NULL, 0),
(315, 'Agace', 'Gue', 'ague8f@xrea.com', 51047799, '45567892', NULL, NULL, '57 Knutson Road', 'Villa del Carmen', 'Flores', 'Uruguay', '1960-06-12', 'F', '2012-11-01 00:00:00', NULL, 1),
(316, 'Alejandro', 'Sich', 'asich8g@ibm.com', 34914237, '20458787', NULL, NULL, '89 4th Avenue', 'Migues', 'Durazno', 'Uruguay', '1985-03-03', 'M', '2015-07-26 00:00:00', NULL, 1),
(317, 'Ardys', 'Mountney', 'amountney8h@pinterest.com', 34786787, '35054563', NULL, NULL, '04 Eliot Point', 'Vichadero', 'Colonia', 'Uruguay', '1997-12-17', 'F', '2015-07-31 00:00:00', NULL, 1),
(318, 'Rudyard', 'Sykora', 'rsykora8i@mozilla.com', 50347916, '44761879', NULL, NULL, '662 Bluejay Trail', 'Pan de Azúcar', 'Colonia', 'Uruguay', '1965-05-21', 'M', '2012-04-29 00:00:00', NULL, 0),
(319, 'Giraud', 'Bogays', 'gbogays8j@ihg.com', 36385866, '44311639', NULL, NULL, '79 Haas Court', 'Tupambaé', 'Rivera', 'Uruguay', '1982-08-04', 'M', '2012-10-26 00:00:00', NULL, 0),
(320, 'Milicent', 'MacKeague', 'mmackeague8k@netscape.com', 46412327, '41276402', NULL, NULL, '2 Almo Alley', 'Dolores', 'Artigas', 'Uruguay', '1994-08-23', 'F', '2018-12-27 00:00:00', NULL, 0),
(321, 'Bethina', 'Toy', 'btoy8l@wp.com', 54378784, '21410934', NULL, NULL, '17697 Ludington Park', 'La Floresta', 'Río Negro', 'Uruguay', '1973-11-27', 'F', '2017-02-02 00:00:00', NULL, 1),
(322, 'Armin', 'Barringer', 'abarringer8m@hud.gov', 54999925, '32244623', NULL, NULL, '2 Westerfield Park', 'Treinta y Tres', 'Soriano', 'Uruguay', '1984-02-19', 'M', '2010-11-08 00:00:00', NULL, 1),
(323, 'Sean', 'Burriss', 'sburriss8n@addthis.com', 43916680, '38057146', NULL, NULL, '76 Oakridge Terrace', 'Porvenir', 'Montevideo', 'Uruguay', '1961-04-05', 'M', '2013-09-01 00:00:00', NULL, 1),
(324, 'Henry', 'Henfre', 'hhenfre8o@csmonitor.com', 40462001, '48725285', NULL, NULL, '8856 Florence Terrace', 'Migues', 'Río Negro', 'Uruguay', '1986-07-11', 'M', '2013-10-02 00:00:00', NULL, 0),
(325, 'Cherlyn', 'Billanie', 'cbillanie8p@state.gov', 34007778, '21215369', NULL, NULL, '4 Calypso Court', 'Colonia Nicolich', 'Rivera', 'Uruguay', '1982-08-07', 'F', '2010-07-21 00:00:00', NULL, 1),
(326, 'Harper', 'Simmon', 'hsimmon8q@businesswire.com', 40108052, '37493378', NULL, NULL, '5434 Dorton Parkway', 'Tupambaé', 'Canelones', 'Uruguay', '1952-10-06', 'M', '2011-09-15 00:00:00', NULL, 1),
(327, 'Jared', 'Chicchelli', 'jchicchelli8r@illinois.edu', 48009234, '35834354', NULL, NULL, '0830 Rutledge Court', 'Durazno', 'Canelones', 'Uruguay', '1989-12-01', 'M', '2016-08-03 00:00:00', NULL, 1),
(328, 'Randell', 'Perrone', 'rperrone8s@nbcnews.com', 37972946, '24806522', NULL, NULL, '05114 Marcy Trail', 'Progreso', 'Flores', 'Uruguay', '1979-06-09', 'M', '2016-04-18 00:00:00', NULL, 0),
(329, 'Jules', 'Sugar', 'jsugar8t@hud.gov', 48518768, '35466395', NULL, NULL, '5 Monument Lane', 'Mariscala', 'Treinta y Tres', 'Uruguay', '1966-04-19', 'M', '2016-04-16 00:00:00', NULL, 1),
(330, 'Ambrosi', 'Cutcliffe', 'acutcliffe8u@google.fr', 52431470, '23140354', NULL, NULL, '08 Kensington Road', 'Joaquín Suárez', 'Lavalleja', 'Uruguay', '1971-08-17', 'M', '2019-02-06 00:00:00', NULL, 1),
(331, 'Elfrida', 'Toulson', 'etoulson8v@weibo.com', 59618059, '40346890', NULL, NULL, '07 Westport Street', 'Tarariras', 'Durazno', 'Uruguay', '1973-06-17', 'F', '2017-05-27 00:00:00', NULL, 0),
(332, 'Annabella', 'Cavey', 'acavey8w@mediafire.com', 43759257, '30078173', NULL, NULL, '56 Hanover Park', 'Nuevo Berlín', 'Canelones', 'Uruguay', '1989-09-18', 'F', '2011-08-05 00:00:00', NULL, 1),
(333, 'Persis', 'Johnstone', 'pjohnstone8x@hostgator.com', 36108986, '20078783', NULL, NULL, '2350 Eliot Parkway', 'Santiago Vázquez', 'Rocha', 'Uruguay', '1986-01-29', 'F', '2011-10-03 00:00:00', NULL, 1),
(334, 'Celisse', 'O\'Drought', 'codrought8y@mapquest.com', 47653118, '22178514', NULL, NULL, '62 Fairview Trail', 'Porvenir', 'Salto', 'Uruguay', '1963-03-29', 'F', '2013-11-20 00:00:00', NULL, 0),
(335, 'Ervin', 'Franzman', 'efranzman8z@wordpress.org', 44140947, '48533767', NULL, NULL, '5904 Moose Pass', 'Mercedes', 'Florida', 'Uruguay', '1984-10-02', 'M', '2018-02-04 00:00:00', NULL, 1),
(336, 'Sauncho', 'Fenck', 'sfenck90@kickstarter.com', 58579172, '48681274', NULL, NULL, '68694 Melody Parkway', 'Paso de Carrasco', 'Lavalleja', 'Uruguay', '1981-05-13', 'M', '2012-12-05 00:00:00', NULL, 1),
(337, 'Jaynell', 'Rubinivitz', 'jrubinivitz91@networksolutions.com', 37849651, '39312893', NULL, NULL, '76 Talisman Court', 'Cerro Colorado', 'Florida', 'Uruguay', '1955-11-07', 'F', '2017-10-11 00:00:00', NULL, 0),
(338, 'Arleta', 'Hamsson', 'ahamsson92@miibeian.gov.cn', 55926183, '36197838', NULL, NULL, '27 Carioca Trail', 'Paso de Carrasco', 'Río Negro', 'Uruguay', '1998-12-28', 'F', '2017-10-16 00:00:00', NULL, 1),
(339, 'Jeffrey', 'Leverich', 'jleverich93@wsj.com', 39717720, '37263055', NULL, NULL, '34483 Merry Point', 'Porvenir', 'San José', 'Uruguay', '1966-10-28', 'M', '2018-01-03 00:00:00', NULL, 0),
(340, 'Kaiser', 'Giovanazzi', 'kgiovanazzi94@senate.gov', 39546623, '30398980', NULL, NULL, '8 4th Avenue', 'Vichadero', 'Artigas', 'Uruguay', '1957-11-16', 'M', '2011-10-31 00:00:00', NULL, 1),
(341, 'Zacharias', 'Rae', 'zrae95@ezinearticles.com', 41763851, '43547835', NULL, NULL, '9546 Merchant Hill', 'Punta del Este', 'Flores', 'Uruguay', '1957-04-13', 'M', '2015-02-09 00:00:00', NULL, 1),
(342, 'Westleigh', 'Culley', 'wculley96@seattletimes.com', 44209244, '28237817', NULL, NULL, '504 Dunning Parkway', 'Cerro Colorado', 'San José', 'Uruguay', '1973-10-25', 'M', '2017-04-12 00:00:00', NULL, 0),
(343, 'Cordelie', 'Grzegorzewicz', 'cgrzegorzewicz97@devhub.com', 30458568, '48684895', NULL, NULL, '3686 Sachs Avenue', 'Colonia Nicolich', 'Durazno', 'Uruguay', '1957-03-20', 'F', '2010-05-25 00:00:00', NULL, 1),
(344, 'Tiena', 'Glassford', 'tglassford98@mlb.com', 39952655, '40557683', NULL, NULL, '5 Hansons Crossing', 'San Javier', 'Salto', 'Uruguay', '1977-05-18', 'F', '2017-07-06 00:00:00', NULL, 1),
(345, 'Darbie', 'Byres', 'dbyres99@census.gov', 38081199, '40003331', NULL, NULL, '9 Anderson Road', 'Young', 'Durazno', 'Uruguay', '1963-07-15', 'F', '2017-07-29 00:00:00', NULL, 0),
(346, 'Dallon', 'FitzAlan', 'dfitzalan9a@mayoclinic.com', 57776400, '22963868', NULL, NULL, '21 International Center', 'San Ramón', 'Paysandú', 'Uruguay', '1998-02-11', 'M', '2014-12-24 00:00:00', NULL, 0),
(347, 'Gill', 'Mulbery', 'gmulbery9b@google.de', 45077784, '43547488', NULL, NULL, '7 Little Fleur Place', 'La Paloma', 'Florida', 'Uruguay', '1968-05-14', 'M', '2010-09-25 00:00:00', NULL, 1),
(348, 'Roi', 'Conre', 'rconre9c@tripod.com', 34242216, '45763473', NULL, NULL, '620 David Park', 'Young', 'Lavalleja', 'Uruguay', '1972-09-28', 'M', '2011-08-24 00:00:00', NULL, 0),
(349, 'Berta', 'Blore', 'bblore9d@disqus.com', 38934567, '40741632', NULL, NULL, '44319 Straubel Street', 'Soca', 'Soriano', 'Uruguay', '1977-12-26', 'F', '2018-11-07 00:00:00', NULL, 1),
(350, 'Lazare', 'McKeurtan', 'lmckeurtan9e@nature.com', 34756306, '25904614', NULL, NULL, '0187 Farwell Lane', 'Maldonado', 'Maldonado', 'Uruguay', '1985-04-03', 'M', '2014-02-09 00:00:00', NULL, 1),
(351, 'Margaret', 'MacGettigen', 'mmacgettigen9f@amazon.co.uk', 56229141, '36273668', NULL, NULL, '754 Towne Alley', 'Bella Unión', 'Tacuarembó', 'Uruguay', '1996-02-23', 'F', '2018-09-08 00:00:00', NULL, 1),
(352, 'Beau', 'Pahlsson', 'bpahlsson9g@reference.com', 37057575, '41967239', NULL, NULL, '7586 Cordelia Street', 'Santa Catalina', 'Durazno', 'Uruguay', '1953-08-07', 'M', '2010-05-09 00:00:00', NULL, 1),
(353, 'Charleen', 'Gibberd', 'cgibberd9h@jalbum.net', 35501453, '27488965', NULL, NULL, '36946 Erie Avenue', 'Rivera', 'Colonia', 'Uruguay', '1975-06-09', 'F', '2016-05-06 00:00:00', NULL, 1),
(354, 'Gray', 'Cormode', 'gcormode9i@shop-pro.jp', 31360620, '40361384', NULL, NULL, '6 Sommers Pass', 'Soriano', 'Montevideo', 'Uruguay', '1977-08-03', 'M', '2010-12-05 00:00:00', NULL, 1),
(355, 'Ruben', 'Slad', 'rslad9j@amazon.com', 49460197, '29614208', NULL, NULL, '070 Clemons Point', 'Baltasar Brum', 'Artigas', 'Uruguay', '1976-01-25', 'M', '2016-01-07 00:00:00', NULL, 0),
(356, 'Charlotte', 'Stears', 'cstears9k@domainmarket.com', 33591347, '24631831', NULL, NULL, '7 Pond Plaza', 'Bella Unión', 'Paysandú', 'Uruguay', '1970-07-25', 'F', '2011-05-24 00:00:00', NULL, 0),
(357, 'Freeland', 'Greenard', 'fgreenard9l@feedburner.com', 52827890, '48231004', NULL, NULL, '2 Lerdahl Terrace', 'Santa Catalina', 'Paysandú', 'Uruguay', '1991-06-14', 'M', '2016-05-14 00:00:00', NULL, 1),
(358, 'Allister', 'Dungate', 'adungate9m@symantec.com', 50903600, '35476037', NULL, NULL, '556 Golf Course Parkway', 'La Paloma', 'Rocha', 'Uruguay', '1995-02-20', 'M', '2017-09-12 00:00:00', NULL, 1),
(359, 'Tally', 'Carswell', 'tcarswell9n@storify.com', 57834855, '36302898', NULL, NULL, '594 Rowland Drive', 'Progreso', 'Durazno', 'Uruguay', '1974-08-20', 'M', '2014-05-06 00:00:00', NULL, 0),
(360, 'Larissa', 'Rigeby', 'lrigeby9o@nhs.uk', 39315647, '41802468', NULL, NULL, '2790 Scofield Place', 'Cardal', 'Canelones', 'Uruguay', '1990-07-02', 'F', '2015-06-01 00:00:00', NULL, 1),
(361, 'Traci', 'Peizer', 'tpeizer9p@ezinearticles.com', 30688353, '34284150', NULL, NULL, '3287 Carioca Park', 'Mariscala', 'Treinta y Tres', 'Uruguay', '1985-06-24', 'F', '2010-08-26 00:00:00', NULL, 0),
(362, 'Kipper', 'Jenkins', 'kjenkins9q@microsoft.com', 47219611, '44795356', NULL, NULL, '60506 Crescent Oaks Court', 'Migues', 'Cerro Largo', 'Uruguay', '1954-01-23', 'M', '2017-01-01 00:00:00', NULL, 0),
(363, 'Elke', 'Yurocjhin', 'eyurocjhin9r@reference.com', 53967160, '22414863', NULL, NULL, '65077 Claremont Alley', 'Rafael Perazza', 'Soriano', 'Uruguay', '1968-05-24', 'F', '2015-05-13 00:00:00', NULL, 0),
(364, 'Caitlin', 'Crannis', 'ccrannis9s@whitehouse.gov', 42195093, '45811743', NULL, NULL, '13277 Knutson Point', 'Santa Rosa', 'Montevideo', 'Uruguay', '1953-09-02', 'F', '2013-08-21 00:00:00', NULL, 1),
(365, 'Raimund', 'Scripture', 'rscripture9t@usa.gov', 41432199, '48840802', NULL, NULL, '500 Golf View Plaza', 'Juan L. Lacaze', 'Rivera', 'Uruguay', '1971-08-28', 'M', '2016-11-24 00:00:00', NULL, 0),
(366, 'Harriett', 'Thaller', 'hthaller9u@wufoo.com', 31026505, '33200337', NULL, NULL, '67094 Stoughton Center', 'Cardal', 'Durazno', 'Uruguay', '1973-04-25', 'F', '2011-07-04 00:00:00', NULL, 1),
(367, 'Fiona', 'Fideler', 'ffideler9v@ameblo.jp', 42679846, '30245049', NULL, NULL, '4061 Jenna Alley', 'Lascano', 'Artigas', 'Uruguay', '1990-02-01', 'F', '2013-11-14 00:00:00', NULL, 1),
(368, 'Pat', 'Duncklee', 'pduncklee9w@furl.net', 58193737, '23512524', NULL, NULL, '27 Morrow Parkway', 'Trinidad', 'Florida', 'Uruguay', '1963-01-02', 'M', '2015-02-20 00:00:00', NULL, 1),
(369, 'Emmy', 'Maggi', 'emaggi9x@cloudflare.com', 33746519, '20839925', NULL, NULL, '2 4th Junction', 'San Ramón', 'Río Negro', 'Uruguay', '1986-11-18', 'M', '2010-11-26 00:00:00', NULL, 0),
(370, 'Cointon', 'Sparhawk', 'csparhawk9y@live.com', 33524074, '24293755', NULL, NULL, '423 Anthes Point', 'Santa Bernardina', 'San José', 'Uruguay', '1988-09-13', 'M', '2013-04-07 00:00:00', NULL, 1),
(371, 'Niki', 'Tummond', 'ntummond9z@ifeng.com', 36002220, '43881356', NULL, NULL, '6 Coleman Parkway', 'Colonia Nicolich', 'Cerro Largo', 'Uruguay', '1952-12-14', 'F', '2011-12-18 00:00:00', NULL, 1),
(372, 'Katrina', 'Doncom', 'kdoncoma0@furl.net', 52070475, '36624430', NULL, NULL, '641 Manley Street', 'La Paloma', 'Tacuarembó', 'Uruguay', '1962-01-29', 'F', '2013-03-22 00:00:00', NULL, 0),
(373, 'Erda', 'Neate', 'eneatea1@hud.gov', 44834782, '46670608', NULL, NULL, '6 Annamark Center', 'Santa Catalina', 'Canelones', 'Uruguay', '1972-04-17', 'F', '2019-03-16 00:00:00', NULL, 1),
(374, 'Lyssa', 'Skin', 'lskina2@desdev.cn', 52630981, '44897811', NULL, NULL, '1264 Huxley Street', 'Las Toscas', 'Río Negro', 'Uruguay', '1997-06-13', 'F', '2015-12-12 00:00:00', NULL, 1),
(375, 'Kipp', 'Moulding', 'kmouldinga3@weibo.com', 57285187, '31894529', NULL, NULL, '925 Butterfield Parkway', 'Aguas Corrientes', 'Paysandú', 'Uruguay', '1974-02-21', 'M', '2013-02-11 00:00:00', NULL, 1),
(376, 'Dorthy', 'Cleve', 'dclevea4@jugem.jp', 43400561, '22912765', NULL, NULL, '64 Grasskamp Park', 'Quebracho', 'Río Negro', 'Uruguay', '1956-10-24', 'F', '2012-12-30 00:00:00', NULL, 0),
(377, 'Adriane', 'Halls', 'ahallsa5@omniture.com', 40179785, '22022823', NULL, NULL, '05059 Butterfield Alley', 'Young', 'Rivera', 'Uruguay', '1958-04-04', 'F', '2016-02-02 00:00:00', NULL, 1),
(378, 'Lloyd', 'Dewberry', 'ldewberrya6@sciencedirect.com', 34008294, '42335586', NULL, NULL, '98 Truax Way', 'Florencio Sánchez', 'Soriano', 'Uruguay', '1976-07-07', 'M', '2012-08-13 00:00:00', NULL, 0),
(379, 'Martyn', 'Embra', 'membraa7@drupal.org', 55365080, '22736778', NULL, NULL, '524 Shopko Center', 'San José de Mayo', 'Florida', 'Uruguay', '1970-06-02', 'M', '2014-11-16 00:00:00', NULL, 0),
(380, 'Robbie', 'Rudloff', 'rrudloffa8@themeforest.net', 35590477, '47350844', NULL, NULL, '532 Helena Terrace', 'Cerro Colorado', 'Florida', 'Uruguay', '1972-03-06', 'F', '2011-12-21 00:00:00', NULL, 1),
(381, 'Nickey', 'Devers', 'ndeversa9@123-reg.co.uk', 44092918, '30861202', NULL, NULL, '8 Dawn Avenue', 'Nuevo Berlín', 'Florida', 'Uruguay', '1984-01-15', 'M', '2016-11-01 00:00:00', NULL, 0),
(382, 'Lock', 'Newey', 'lneweyaa@engadget.com', 47726969, '46483962', NULL, NULL, '63 Maple Wood Trail', 'San José de Mayo', 'Canelones', 'Uruguay', '1986-05-03', 'M', '2011-03-12 00:00:00', NULL, 0),
(383, 'Carlotta', 'Jeffs', 'cjeffsab@myspace.com', 38028943, '45988620', NULL, NULL, '2347 Gulseth Drive', 'Villa del Carmen', 'Flores', 'Uruguay', '1965-10-20', 'F', '2017-10-15 00:00:00', NULL, 0),
(384, 'Mead', 'Readwing', 'mreadwingac@shinystat.com', 52905201, '28874896', NULL, NULL, '7 Oak Circle', 'La Floresta', 'Salto', 'Uruguay', '1951-12-04', 'M', '2012-03-07 00:00:00', NULL, 1),
(385, 'Allina', 'Bough', 'aboughad@etsy.com', 46166427, '47992794', NULL, NULL, '2 Hoepker Hill', 'Punta del Este', 'Rivera', 'Uruguay', '1965-03-22', 'F', '2012-05-15 00:00:00', NULL, 0),
(386, 'Hedy', 'Creeber', 'hcreeberae@tinypic.com', 57167045, '20054532', NULL, NULL, '7 Cascade Hill', 'Sauce', 'Rocha', 'Uruguay', '1968-04-26', 'F', '2010-10-21 00:00:00', NULL, 0),
(387, 'Reed', 'Haestier', 'rhaestieraf@booking.com', 48294378, '45194083', NULL, NULL, '55118 Onsgard Way', 'Joaquín Suárez', 'Lavalleja', 'Uruguay', '1967-06-27', 'M', '2017-02-20 00:00:00', NULL, 0),
(388, 'Adda', 'Scawen', 'ascawenag@exblog.jp', 33959813, '38375168', NULL, NULL, '6 Corben Center', 'Santa Catalina', 'Tacuarembó', 'Uruguay', '1978-01-06', 'F', '2015-05-18 00:00:00', NULL, 1),
(389, 'Kendrick', 'Batchelor', 'kbatchelorah@unicef.org', 34662951, '43609414', NULL, NULL, '2444 Everett Lane', 'Rivera', 'Lavalleja', 'Uruguay', '1999-01-14', 'M', '2013-09-16 00:00:00', NULL, 0),
(390, 'Osborne', 'Westney', 'owestneyai@un.org', 44941190, '37433218', NULL, NULL, '679 Hallows Place', 'Soriano', 'Río Negro', 'Uruguay', '1958-11-16', 'M', '2017-02-18 00:00:00', NULL, 0),
(391, 'Teador', 'Ferrario', 'tferrarioaj@storify.com', 42364298, '29372376', NULL, NULL, '01562 Corscot Way', 'Joaquín Suárez', 'Maldonado', 'Uruguay', '1973-07-25', 'M', '2014-06-03 00:00:00', NULL, 1),
(392, 'Vinson', 'Lomaz', 'vlomazak@twitpic.com', 43480095, '29226089', NULL, NULL, '1 Golf View Center', 'Las Toscas', 'Rocha', 'Uruguay', '1957-03-10', 'M', '2013-04-23 00:00:00', NULL, 1),
(393, 'Archibald', 'Hounson', 'ahounsonal@hud.gov', 53557191, '46846236', NULL, NULL, '4 Holy Cross Pass', 'Ecilda Paullier', 'Durazno', 'Uruguay', '1975-07-14', 'M', '2019-03-04 00:00:00', NULL, 0),
(394, 'Mariel', 'Godby', 'mgodbyam@squidoo.com', 37931168, '29766499', NULL, NULL, '89926 Ramsey Plaza', 'Tupambaé', 'Treinta y Tres', 'Uruguay', '1997-10-14', 'F', '2018-09-30 00:00:00', NULL, 1),
(395, 'Grantham', 'O\'Mara', 'gomaraan@seesaa.net', 35222504, '39890466', NULL, NULL, '57 Bayside Pass', 'Maldonado', 'Maldonado', 'Uruguay', '1968-04-10', 'M', '2011-12-03 00:00:00', NULL, 1),
(396, 'Austine', 'Banbrigge', 'abanbriggeao@fotki.com', 47640128, '47381278', NULL, NULL, '9 Rigney Road', 'Cerro Colorado', 'Cerro Largo', 'Uruguay', '1996-10-18', 'F', '2017-01-04 00:00:00', NULL, 0),
(397, 'Kean', 'Aveyard', 'kaveyardap@usa.gov', 57336987, '35705268', NULL, NULL, '47 Melrose Road', 'Rivera', 'Paysandú', 'Uruguay', '1982-06-07', 'M', '2014-05-05 00:00:00', NULL, 1),
(398, 'Urbanus', 'Noto', 'unotoaq@netlog.com', 54862673, '42633135', NULL, NULL, '7 Kennedy Junction', 'Florida', 'Treinta y Tres', 'Uruguay', '1979-04-22', 'M', '2011-06-14 00:00:00', NULL, 1),
(399, 'Sydel', 'Lung', 'slungar@devhub.com', 54519656, '44171826', NULL, NULL, '2423 Anthes Park', 'Paso de Carrasco', 'Paysandú', 'Uruguay', '1950-10-21', 'F', '2012-05-08 00:00:00', NULL, 0),
(400, 'Jemmie', 'Sarjeant', 'jsarjeantas@qq.com', 32294816, '22587743', NULL, NULL, '48 Starling Parkway', 'Vergara', 'Soriano', 'Uruguay', '1952-02-17', 'F', '2013-01-29 00:00:00', NULL, 0),
(401, 'Jerrilee', 'Jehu', 'jjehuat@slate.com', 35022885, '28713175', NULL, NULL, '7650 Hermina Crossing', 'Migues', 'Rivera', 'Uruguay', '1978-03-19', 'F', '2011-08-16 00:00:00', NULL, 0),
(402, 'Traver', 'Dunge', 'tdungeau@ameblo.jp', 37682148, '21750624', NULL, NULL, '74753 Shoshone Terrace', 'Palmitas', 'Canelones', 'Uruguay', '1983-12-04', 'M', '2016-10-23 00:00:00', NULL, 1),
(403, 'Loralee', 'Yitzovicz', 'lyitzoviczav@paypal.com', 44502113, '27891490', NULL, NULL, '97896 Boyd Crossing', 'Santiago Vázquez', 'Paysandú', 'Uruguay', '1975-02-22', 'F', '2012-06-06 00:00:00', NULL, 1),
(404, 'Cayla', 'Trevithick', 'ctrevithickaw@php.net', 34690177, '31752189', NULL, NULL, '7509 1st Way', 'San Javier', 'Río Negro', 'Uruguay', '1980-02-11', 'F', '2019-02-22 00:00:00', NULL, 0),
(405, 'Sunny', 'Emblin', 'semblinax@pen.io', 38544972, '48384303', NULL, NULL, '7 Graceland Avenue', 'Santa Bernardina', 'Salto', 'Uruguay', '1955-04-18', 'M', '2019-03-31 00:00:00', NULL, 1),
(406, 'Buck', 'Merrien', 'bmerrienay@wiley.com', 34817384, '45012527', NULL, NULL, '2 Hollow Ridge Plaza', 'Nueva Helvecia', 'Canelones', 'Uruguay', '1987-06-06', 'M', '2017-08-03 00:00:00', NULL, 0),
(407, 'Joletta', 'Hanning', 'jhanningaz@multiply.com', 34007750, '47669271', NULL, NULL, '4 Atwood Junction', 'Las Toscas', 'Lavalleja', 'Uruguay', '1995-02-08', 'F', '2014-12-21 00:00:00', NULL, 0),
(408, 'Rudyard', 'Overy', 'roveryb0@sohu.com', 48367740, '21396046', NULL, NULL, '572 Muir Way', 'San José de Mayo', 'Rivera', 'Uruguay', '1983-10-10', 'M', '2018-12-16 00:00:00', NULL, 1),
(409, 'Swen', 'Bargery', 'sbargeryb1@shop-pro.jp', 37821347, '37249148', NULL, NULL, '6112 Green Ridge Hill', 'Delta del Tigre', 'Flores', 'Uruguay', '1954-09-03', 'M', '2011-04-15 00:00:00', NULL, 0),
(410, 'Melba', 'Di Filippo', 'mdifilippob2@unc.edu', 47898394, '40920410', NULL, NULL, '357 Sachtjen Terrace', 'Tupambaé', 'Durazno', 'Uruguay', '1956-09-21', 'F', '2017-02-15 00:00:00', NULL, 1),
(411, 'Clarice', 'Bouch', 'cbouchb3@shareasale.com', 36518518, '24080048', NULL, NULL, '5012 Porter Parkway', 'Pando', 'Maldonado', 'Uruguay', '1989-04-29', 'F', '2013-03-05 00:00:00', NULL, 0),
(412, 'Jackqueline', 'Troubridge', 'jtroubridgeb4@google.com.au', 43263122, '23220404', NULL, NULL, '71 Mendota Park', 'Santiago Vázquez', 'Montevideo', 'Uruguay', '1995-04-27', 'F', '2010-08-15 00:00:00', NULL, 1),
(413, 'Deidre', 'Bourdon', 'dbourdonb5@flavors.me', 40655374, '45494941', NULL, NULL, '580 Surrey Hill', 'Villa del Carmen', 'Rivera', 'Uruguay', '1953-04-27', 'F', '2018-08-24 00:00:00', NULL, 0),
(414, 'Lezley', 'Rowell', 'lrowellb6@nhs.uk', 34436863, '29448633', NULL, NULL, '5 Muir Avenue', 'Ecilda Paullier', 'Río Negro', 'Uruguay', '1954-01-28', 'M', '2011-10-01 00:00:00', NULL, 1),
(415, 'Karalynn', 'Glozman', 'kglozmanb7@gov.uk', 41066518, '25744990', NULL, NULL, '117 Ronald Regan Road', 'Porvenir', 'Paysandú', 'Uruguay', '1996-07-27', 'F', '2014-10-12 00:00:00', NULL, 1),
(416, 'Larisa', 'Coltart', 'lcoltartb8@webs.com', 30390628, '22588420', NULL, NULL, '93 Caliangt Trail', 'Paso de Carrasco', 'Treinta y Tres', 'Uruguay', '1981-01-30', 'F', '2014-09-13 00:00:00', NULL, 0),
(417, 'Sandie', 'Brenstuhl', 'sbrenstuhlb9@tripadvisor.com', 56657783, '26974479', NULL, NULL, '6 Dwight Way', 'Mercedes', 'Rivera', 'Uruguay', '1955-03-04', 'F', '2010-05-05 00:00:00', NULL, 0),
(418, 'Cello', 'England', 'cenglandba@noaa.gov', 40625545, '31314409', NULL, NULL, '9520 Farragut Place', 'Santiago Vázquez', 'Tacuarembó', 'Uruguay', '1957-05-04', 'M', '2016-10-25 00:00:00', NULL, 1),
(419, 'Carol-jean', 'Duke', 'cdukebb@java.com', 50631885, '37399165', NULL, NULL, '7 Blackbird Lane', 'Vichadero', 'Maldonado', 'Uruguay', '1954-03-06', 'F', '2013-02-08 00:00:00', NULL, 0),
(420, 'Claus', 'Bellew', 'cbellewbc@dell.com', 55598294, '46608441', NULL, NULL, '3656 Doe Crossing Center', 'Juan L. Lacaze', 'Flores', 'Uruguay', '1960-12-12', 'M', '2011-12-11 00:00:00', NULL, 1),
(421, 'Salvador', 'Hubbis', 'shubbisbd@bigcartel.com', 51028980, '37877573', NULL, NULL, '7 Mariners Cove Pass', 'Tupambaé', 'Florida', 'Uruguay', '1984-07-13', 'M', '2018-02-02 00:00:00', NULL, 0),
(422, 'Chaunce', 'Broome', 'cbroomebe@bbc.co.uk', 46179393, '38483820', NULL, NULL, '38 Fieldstone Circle', 'Aguas Corrientes', 'Florida', 'Uruguay', '1986-12-13', 'M', '2014-01-14 00:00:00', NULL, 0),
(423, 'Kaitlyn', 'Frazier', 'kfrazierbf@4shared.com', 48684004, '47835258', NULL, NULL, '16 Kipling Junction', 'La Paz', 'Río Negro', 'Uruguay', '1993-02-17', 'F', '2012-10-25 00:00:00', NULL, 1),
(424, 'Estell', 'Walkden', 'ewalkdenbg@engadget.com', 55127351, '36582516', NULL, NULL, '37736 Hoard Avenue', 'Joaquín Suárez', 'Salto', 'Uruguay', '1987-05-01', 'F', '2018-11-22 00:00:00', NULL, 0),
(425, 'Fremont', 'Normabell', 'fnormabellbh@a8.net', 34644101, '22423533', NULL, NULL, '4072 Rockefeller Junction', 'Tarariras', 'Cerro Largo', 'Uruguay', '1970-09-26', 'M', '2016-08-19 00:00:00', NULL, 0),
(426, 'Merilyn', 'Meeson', 'mmeesonbi@ucsd.edu', 59009289, '21447581', NULL, NULL, '801 Lunder Point', 'Santa Catalina', 'Salto', 'Uruguay', '1961-10-05', 'F', '2018-10-05 00:00:00', NULL, 0),
(427, 'Putnam', 'Valencia', 'pvalenciabj@lycos.com', 52293116, '40345494', NULL, NULL, '26 Holy Cross Trail', 'Porvenir', 'Paysandú', 'Uruguay', '1964-08-19', 'M', '2014-03-11 00:00:00', NULL, 0),
(428, 'Albie', 'Hubane', 'ahubanebk@loc.gov', 55036185, '44341487', NULL, NULL, '6 Westerfield Circle', 'Soca', 'Florida', 'Uruguay', '1977-02-16', 'M', '2018-07-10 00:00:00', NULL, 1),
(429, 'Andy', 'Whitcher', 'awhitcherbl@over-blog.com', 40138123, '31269624', NULL, NULL, '570 Farmco Road', 'Cerro Colorado', 'Florida', 'Uruguay', '1985-05-15', 'M', '2014-08-13 00:00:00', NULL, 1),
(430, 'Shina', 'Radcliffe', 'sradcliffebm@craigslist.org', 49957792, '43088147', NULL, NULL, '71388 Eastlawn Street', 'Mercedes', 'Montevideo', 'Uruguay', '1965-12-29', 'F', '2011-11-11 00:00:00', NULL, 0),
(431, 'Yul', 'Vandrill', 'yvandrillbn@wsj.com', 57337677, '48144650', NULL, NULL, '85 Duke Junction', 'Santa Bernardina', 'Soriano', 'Uruguay', '1990-03-05', 'M', '2014-12-30 00:00:00', NULL, 1),
(432, 'Theadora', 'Hodgon', 'thodgonbo@weather.com', 38311950, '32156906', NULL, NULL, '4235 Cottonwood Lane', 'Tupambaé', 'Florida', 'Uruguay', '1986-03-19', 'F', '2011-05-08 00:00:00', NULL, 0),
(433, 'Hussein', 'Huett', 'hhuettbp@ebay.co.uk', 30128509, '33862111', NULL, NULL, '43285 Mosinee Alley', 'Colonia Nicolich', 'Soriano', 'Uruguay', '1955-11-24', 'M', '2011-10-03 00:00:00', NULL, 0),
(434, 'Kathlin', 'Cockman', 'kcockmanbq@skyrock.com', 49442729, '46865628', NULL, NULL, '7 Morningstar Hill', 'Santiago Vázquez', 'Tacuarembó', 'Uruguay', '1991-04-30', 'F', '2017-04-18 00:00:00', NULL, 1),
(435, 'Jackqueline', 'Rock', 'jrockbr@about.me', 36908365, '41112224', NULL, NULL, '7361 Corscot Place', 'Mercedes', 'Salto', 'Uruguay', '1966-06-18', 'F', '2014-12-30 00:00:00', NULL, 1),
(436, 'Stern', 'Barlie', 'sbarliebs@ezinearticles.com', 45520291, '39676486', NULL, NULL, '2 Bowman Avenue', 'Bella Unión', 'Durazno', 'Uruguay', '1989-11-29', 'M', '2016-02-01 00:00:00', NULL, 0),
(437, 'Bart', 'McAnellye', 'bmcanellyebt@clickbank.net', 52532538, '38327782', NULL, NULL, '5 Amoth Street', 'La Floresta', 'Río Negro', 'Uruguay', '1965-03-10', 'M', '2014-03-09 00:00:00', NULL, 1),
(438, 'Briana', 'Day', 'bdaybu@printfriendly.com', 54999258, '40020616', NULL, NULL, '99413 Meadow Ridge Hill', 'Cardal', 'Maldonado', 'Uruguay', '1997-03-13', 'F', '2013-07-13 00:00:00', NULL, 1),
(439, 'Harriet', 'Smithin', 'hsmithinbv@blinklist.com', 49382837, '34128934', NULL, NULL, '18 Elgar Drive', 'Rivera', 'Rocha', 'Uruguay', '1955-07-01', 'F', '2017-12-04 00:00:00', NULL, 1),
(440, 'Perri', 'Yonnie', 'pyonniebw@statcounter.com', 50420331, '36634247', NULL, NULL, '6 La Follette Plaza', 'Santa Catalina', 'San José', 'Uruguay', '1951-06-23', 'F', '2012-08-05 00:00:00', NULL, 1),
(441, 'Jilly', 'Aggott', 'jaggottbx@paypal.com', 55629175, '22729094', NULL, NULL, '83 Shopko Court', 'Bella Unión', 'Artigas', 'Uruguay', '1956-03-01', 'F', '2016-12-28 00:00:00', NULL, 1),
(442, 'Rosamund', 'Faire', 'rfaireby@wordpress.org', 50627960, '35836632', NULL, NULL, '32 Carioca Point', 'Juan L. Lacaze', 'Durazno', 'Uruguay', '1953-10-04', 'F', '2015-04-16 00:00:00', NULL, 0),
(443, 'Bobby', 'Schimonek', 'bschimonekbz@huffingtonpost.com', 38772798, '44524084', NULL, NULL, '87 Hauk Parkway', 'Trinidad', 'Lavalleja', 'Uruguay', '1982-10-28', 'F', '2011-09-06 00:00:00', NULL, 0),
(444, 'Penelopa', 'Aldine', 'paldinec0@umich.edu', 44571040, '24362004', NULL, NULL, '4172 Golf View Court', 'San José de Mayo', 'Treinta y Tres', 'Uruguay', '1991-09-02', 'F', '2012-12-01 00:00:00', NULL, 0),
(445, 'Rebekah', 'Seaborne', 'rseabornec1@cbslocal.com', 37056553, '33886570', NULL, NULL, '9800 Butterfield Place', 'Sauce', 'Salto', 'Uruguay', '1968-09-07', 'F', '2013-08-06 00:00:00', NULL, 0),
(446, 'Regan', 'Hadigate', 'rhadigatec2@icio.us', 30133342, '47943968', NULL, NULL, '3403 Old Shore Plaza', 'Paso de Carrasco', 'Artigas', 'Uruguay', '1977-05-06', 'M', '2012-09-03 00:00:00', NULL, 0),
(447, 'Katie', 'Treven', 'ktrevenc3@vistaprint.com', 46609825, '21774931', NULL, NULL, '73 Coolidge Place', 'Belén', 'Artigas', 'Uruguay', '1994-05-27', 'F', '2013-07-02 00:00:00', NULL, 1),
(448, 'Leonore', 'McAvin', 'lmcavinc4@woothemes.com', 32536025, '47730770', NULL, NULL, '3355 Pierstorff Road', 'Barra de Carrasco', 'Maldonado', 'Uruguay', '1990-09-17', 'F', '2013-11-20 00:00:00', NULL, 0),
(449, 'Marcie', 'Broy', 'mbroyc5@imgur.com', 35072564, '45429073', NULL, NULL, '7685 Blue Bill Park Crossing', 'Treinta y Tres', 'Salto', 'Uruguay', '1995-09-28', 'F', '2014-02-05 00:00:00', NULL, 0),
(450, 'Avrit', 'Poundsford', 'apoundsfordc6@wunderground.com', 41720234, '48834484', NULL, NULL, '39579 Bluestem Crossing', 'Santiago Vázquez', 'Tacuarembó', 'Uruguay', '1976-09-05', 'F', '2017-04-05 00:00:00', NULL, 0),
(451, 'Sarina', 'Morrieson', 'smorriesonc7@mapy.cz', 50711030, '20873964', NULL, NULL, '27 Grover Point', 'Colonia Nicolich', 'Flores', 'Uruguay', '1985-12-08', 'F', '2015-02-21 00:00:00', NULL, 1),
(452, 'Inger', 'Walkingshaw', 'iwalkingshawc8@sogou.com', 41365537, '25950564', NULL, NULL, '404 Northwestern Circle', 'Aguas Corrientes', 'Rivera', 'Uruguay', '1957-11-16', 'M', '2011-03-14 00:00:00', NULL, 0),
(453, 'Olly', 'Pleavin', 'opleavinc9@scientificamerican.com', 41029111, '32904553', NULL, NULL, '522 Oneill Plaza', 'Progreso', 'Maldonado', 'Uruguay', '1953-04-26', 'F', '2016-03-03 00:00:00', NULL, 0),
(454, 'Rosmunda', 'Vondracek', 'rvondracekca@indiegogo.com', 49114701, '23494104', NULL, NULL, '69517 Truax Street', 'Fray Bentos', 'Durazno', 'Uruguay', '1951-05-01', 'F', '2013-11-20 00:00:00', NULL, 0),
(455, 'Leah', 'Cossam', 'lcossamcb@diigo.com', 40203344, '25849285', NULL, NULL, '30986 Shasta Crossing', 'Bella Unión', 'Lavalleja', 'Uruguay', '1988-02-08', 'F', '2013-10-27 00:00:00', NULL, 0),
(456, 'Grethel', 'Duesbury', 'gduesburycc@sourceforge.net', 32153539, '32180084', NULL, NULL, '7713 7th Crossing', 'Rivera', 'San José', 'Uruguay', '1953-11-04', 'F', '2016-05-10 00:00:00', NULL, 0),
(457, 'Candy', 'Basey', 'cbaseycd@earthlink.net', 59912126, '39174251', NULL, NULL, '74 Jana Point', 'Santa Bernardina', 'Rocha', 'Uruguay', '1988-09-05', 'F', '2013-07-31 00:00:00', NULL, 1),
(458, 'Roxane', 'Bance', 'rbancece@businessweek.com', 32836129, '32262319', NULL, NULL, '1 Hallows Terrace', 'Lascano', 'Salto', 'Uruguay', '1979-02-22', 'F', '2018-08-10 00:00:00', NULL, 1),
(459, 'Shirleen', 'Huckerbe', 'shuckerbecf@instagram.com', 40344477, '24701243', NULL, NULL, '4 Schlimgen Alley', 'Tala', 'Paysandú', 'Uruguay', '1993-02-11', 'F', '2014-03-29 00:00:00', NULL, 0),
(460, 'Reinhard', 'Braven', 'rbravencg@tuttocitta.it', 32448407, '40174421', NULL, NULL, '73758 Linden Crossing', 'Pan de Azúcar', 'Canelones', 'Uruguay', '1985-12-03', 'M', '2010-11-05 00:00:00', NULL, 0),
(461, 'Humfrey', 'Ryal', 'hryalch@yahoo.co.jp', 52424612, '27550795', NULL, NULL, '59 Grover Parkway', 'Delta del Tigre', 'Rivera', 'Uruguay', '1993-11-04', 'M', '2019-01-22 00:00:00', NULL, 1),
(462, 'Kane', 'Cancellario', 'kcancellarioci@scribd.com', 38291645, '40480100', NULL, NULL, '6352 Redwing Way', 'Los Cerrillos', 'Durazno', 'Uruguay', '1999-03-20', 'M', '2011-10-21 00:00:00', NULL, 0),
(463, 'Zackariah', 'Jenkins', 'zjenkinscj@un.org', 55227680, '43771211', NULL, NULL, '92972 Summerview Way', 'Tarariras', 'Paysandú', 'Uruguay', '1970-08-11', 'M', '2014-09-21 00:00:00', NULL, 1),
(464, 'Nixie', 'Arnold', 'narnoldck@apache.org', 41162376, '48642122', NULL, NULL, '6692 Manitowish Circle', 'Lascano', 'Maldonado', 'Uruguay', '1962-12-14', 'F', '2014-02-08 00:00:00', NULL, 0),
(465, 'Piper', 'Cram', 'pcramcl@webeden.co.uk', 52636366, '24266182', NULL, NULL, '63943 Pierstorff Place', 'Sauce', 'Flores', 'Uruguay', '1978-03-11', 'F', '2019-03-28 00:00:00', NULL, 1),
(466, 'Trumann', 'Gepheart', 'tgepheartcm@harvard.edu', 49632823, '35197740', NULL, NULL, '0 Hermina Drive', 'Treinta y Tres', 'Soriano', 'Uruguay', '1962-02-19', 'M', '2013-04-15 00:00:00', NULL, 0),
(467, 'Mead', 'Mechem', 'mmechemcn@economist.com', 48731946, '41794840', NULL, NULL, '47106 Shasta Court', 'Soriano', 'Tacuarembó', 'Uruguay', '1965-10-30', 'F', '2016-03-07 00:00:00', NULL, 1),
(468, 'Curr', 'Roebottom', 'croebottomco@google.ca', 35410980, '45557135', NULL, NULL, '1748 Rockefeller Way', 'Progreso', 'Salto', 'Uruguay', '1970-08-24', 'M', '2012-02-08 00:00:00', NULL, 0),
(469, 'Griffin', 'Ivakhno', 'givakhnocp@goodreads.com', 36026869, '31929683', NULL, NULL, '584 Corben Road', 'La Floresta', 'San José', 'Uruguay', '1990-10-21', 'M', '2010-07-22 00:00:00', NULL, 0),
(470, 'Ame', 'Noads', 'anoadscq@intel.com', 35759190, '21702489', NULL, NULL, '7 Delaware Crossing', 'Punta del Este', 'Canelones', 'Uruguay', '1999-04-10', 'F', '2016-12-02 00:00:00', NULL, 1),
(471, 'Johan', 'Woodroofe', 'jwoodroofecr@mtv.com', 56260495, '44049040', NULL, NULL, '2974 Elmside Point', 'Treinta y Tres', 'Paysandú', 'Uruguay', '1992-05-22', 'M', '2014-06-14 00:00:00', NULL, 0),
(472, 'Diandra', 'Wyche', 'dwychecs@dropbox.com', 41596393, '29056473', NULL, NULL, '16575 Surrey Junction', 'Colonia Nicolich', 'Tacuarembó', 'Uruguay', '1993-07-21', 'F', '2013-02-09 00:00:00', NULL, 0),
(473, 'Casandra', 'Forryan', 'cforryanct@nps.gov', 36104686, '31162409', NULL, NULL, '903 Fulton Junction', 'Baltasar Brum', 'Flores', 'Uruguay', '1961-02-04', 'F', '2011-03-08 00:00:00', NULL, 1),
(474, 'Shawna', 'Fideler', 'sfidelercu@google.com', 52934518, '42837405', NULL, NULL, '01 Sutteridge Center', 'Cardal', 'Rivera', 'Uruguay', '1974-03-07', 'F', '2019-03-11 00:00:00', NULL, 0),
(475, 'Lenore', 'Raggles', 'lragglescv@google.nl', 38422900, '33176522', NULL, NULL, '22143 Bartillon Lane', 'Young', 'Florida', 'Uruguay', '1983-03-04', 'F', '2013-09-06 00:00:00', NULL, 1),
(476, 'Fonz', 'Tourot', 'ftourotcw@imageshack.us', 30691700, '43717522', NULL, NULL, '86 Independence Lane', 'Migues', 'Maldonado', 'Uruguay', '1950-08-15', 'M', '2010-05-22 00:00:00', NULL, 1),
(477, 'Ynez', 'Ferrai', 'yferraicx@canalblog.com', 31686304, '29668240', NULL, NULL, '40772 Mandrake Alley', 'Progreso', 'Treinta y Tres', 'Uruguay', '1965-01-02', 'F', '2015-12-14 00:00:00', NULL, 0),
(478, 'Laurens', 'McFater', 'lmcfatercy@cnet.com', 30551270, '42211671', NULL, NULL, '62 Forster Lane', 'Florida', 'Flores', 'Uruguay', '1976-04-02', 'M', '2015-01-29 00:00:00', NULL, 0),
(479, 'Jonathon', 'Ortler', 'jortlercz@sitemeter.com', 59112296, '30962658', NULL, NULL, '13756 Artisan Parkway', 'Progreso', 'Maldonado', 'Uruguay', '1989-05-14', 'M', '2019-02-09 00:00:00', NULL, 1),
(480, 'Giulietta', 'Macilhench', 'gmacilhenchd0@google.com.hk', 36949429, '38172958', NULL, NULL, '9500 Ryan Trail', 'Soriano', 'Artigas', 'Uruguay', '1980-03-30', 'F', '2010-06-12 00:00:00', NULL, 1),
(481, 'Florette', 'Marsden', 'fmarsdend1@tripadvisor.com', 38094977, '29827018', NULL, NULL, '07842 Montana Park', 'Delta del Tigre', 'Montevideo', 'Uruguay', '1992-11-01', 'F', '2017-07-02 00:00:00', NULL, 1),
(482, 'Armand', 'Boyes', 'aboyesd2@who.int', 42473448, '20903992', NULL, NULL, '148 Dixon Place', 'Baltasar Brum', 'Río Negro', 'Uruguay', '1980-07-04', 'M', '2013-01-29 00:00:00', NULL, 1),
(483, 'Adena', 'Ivannikov', 'aivannikovd3@1688.com', 53589666, '39233883', NULL, NULL, '370 Gina Pass', 'Ecilda Paullier', 'Soriano', 'Uruguay', '1986-04-09', 'F', '2018-08-31 00:00:00', NULL, 0),
(484, 'Corbie', 'Haslam', 'chaslamd4@fc2.com', 57376485, '25595207', NULL, NULL, '215 Clove Junction', 'Las Toscas', 'Canelones', 'Uruguay', '1966-01-13', 'M', '2011-08-30 00:00:00', NULL, 0),
(485, 'Vick', 'Bowhay', 'vbowhayd5@tripadvisor.com', 49784462, '33489205', NULL, NULL, '86742 Stang Court', 'Ecilda Paullier', 'Flores', 'Uruguay', '1953-10-10', 'M', '2012-10-23 00:00:00', NULL, 0),
(486, 'Jennica', 'Olorenshaw', 'jolorenshawd6@wunderground.com', 58069133, '30945729', NULL, NULL, '954 Ohio Hill', 'Treinta y Tres', 'Lavalleja', 'Uruguay', '1962-05-14', 'F', '2018-04-05 00:00:00', NULL, 1),
(487, 'Zelda', 'Digle', 'zdigled7@feedburner.com', 59808370, '38364180', NULL, NULL, '651 Donald Hill', 'Soriano', 'Soriano', 'Uruguay', '1968-05-26', 'F', '2018-08-13 00:00:00', NULL, 1),
(488, 'Helene', 'Caush', 'hcaushd8@tamu.edu', 52146047, '32620582', NULL, NULL, '437 4th Way', 'Salto', 'Colonia', 'Uruguay', '1990-01-06', 'F', '2017-05-10 00:00:00', NULL, 0),
(489, 'Loutitia', 'Thorogood', 'lthorogoodd9@usnews.com', 53199808, '33624989', NULL, NULL, '407 Cottonwood Place', 'San Bautista', 'Lavalleja', 'Uruguay', '1995-10-15', 'F', '2019-02-24 00:00:00', NULL, 1),
(490, 'Andie', 'Babbage', 'ababbageda@sfgate.com', 31392225, '21390630', NULL, NULL, '414 Bellgrove Terrace', 'Tala', 'Cerro Largo', 'Uruguay', '1978-05-12', 'F', '2014-01-16 00:00:00', NULL, 0),
(491, 'Con', 'Yeoman', 'cyeomandb@uiuc.edu', 30281818, '20285396', NULL, NULL, '18245 Morrow Avenue', 'Tupambaé', 'Rocha', 'Uruguay', '1990-02-28', 'F', '2011-03-16 00:00:00', NULL, 0),
(492, 'Justus', 'Calloway', 'jcallowaydc@wordpress.com', 51079488, '37232816', NULL, NULL, '1 East Avenue', 'Young', 'Soriano', 'Uruguay', '1960-07-02', 'M', '2016-10-24 00:00:00', NULL, 1),
(493, 'Lisa', 'Harling', 'lharlingdd@bravesites.com', 42725448, '20221027', NULL, NULL, '0 Badeau Avenue', 'Barra de Carrasco', 'Colonia', 'Uruguay', '1952-09-16', 'F', '2011-04-09 00:00:00', NULL, 0),
(494, 'Gregg', 'Haggas', 'ghaggasde@state.tx.us', 58396144, '47397206', NULL, NULL, '43184 Havey Place', 'Aguas Corrientes', 'Florida', 'Uruguay', '1991-09-18', 'M', '2014-04-03 00:00:00', NULL, 1),
(495, 'Cos', 'Caddie', 'ccaddiedf@delicious.com', 32225205, '46622080', NULL, NULL, '5 Walton Avenue', 'Florida', 'Colonia', 'Uruguay', '1975-09-04', 'M', '2012-03-26 00:00:00', NULL, 0),
(496, 'Mia', 'Kuhnwald', 'mkuhnwalddg@comsenz.com', 56772956, '31788325', NULL, NULL, '338 Johnson Place', 'Nuevo Berlín', 'Lavalleja', 'Uruguay', '1959-12-10', 'F', '2012-01-07 00:00:00', NULL, 1),
(497, 'Karyl', 'Duckerin', 'kduckerindh@pen.io', 51505772, '23889260', NULL, NULL, '35199 Morning Road', 'Soca', 'Soriano', 'Uruguay', '1974-06-19', 'F', '2012-10-09 00:00:00', NULL, 1),
(498, 'Giuditta', 'Langstrath', 'glangstrathdi@moonfruit.com', 56463227, '35478582', NULL, NULL, '7949 Twin Pines Park', 'Palmitas', 'Colonia', 'Uruguay', '1996-10-07', 'F', '2018-06-25 00:00:00', NULL, 0),
(499, 'Delmor', 'Malthus', 'dmalthusdj@wiley.com', 32884381, '33451550', NULL, NULL, '20789 Annamark Court', 'Baltasar Brum', 'Lavalleja', 'Uruguay', '1961-05-07', 'M', '2010-08-04 00:00:00', NULL, 0),
(500, 'Edwin', 'Gaynsford', 'egaynsforddk@addthis.com', 43550639, '47938484', NULL, NULL, '4 Debra Road', 'Pan de Azúcar', 'Treinta y Tres', 'Uruguay', '1959-07-27', 'M', '2016-02-17 00:00:00', NULL, 0),
(501, 'Reidar', 'Absolon', 'rabsolondl@who.int', 30552422, '29222252', NULL, NULL, '0450 Sherman Place', 'Durazno', 'Flores', 'Uruguay', '1960-09-19', 'M', '2012-11-18 00:00:00', NULL, 0),
(502, 'Alonzo', 'Eriksson', 'aerikssondm@storify.com', 58674407, '26719738', NULL, NULL, '9 Coleman Avenue', 'Soriano', 'San José', 'Uruguay', '1971-03-02', 'M', '2012-11-13 00:00:00', NULL, 1),
(503, 'Mackenzie', 'Palser', 'mpalserdn@hao123.com', 59872569, '46607739', NULL, NULL, '77 Lindbergh Hill', 'Florencio Sánchez', 'Rocha', 'Uruguay', '1984-01-29', 'M', '2018-09-10 00:00:00', NULL, 1),
(504, 'Reinold', 'Gateley', 'rgateleydo@live.com', 34371171, '33818272', NULL, NULL, '2 Maryland Place', 'Soca', 'Salto', 'Uruguay', '1969-06-01', 'M', '2017-09-20 00:00:00', NULL, 0),
(505, 'Harri', 'Foye', 'hfoyedp@icio.us', 42799693, '43615394', NULL, NULL, '59752 Menomonie Terrace', 'San José de Mayo', 'Río Negro', 'Uruguay', '1963-01-19', 'F', '2013-12-19 00:00:00', NULL, 0),
(506, 'Lanny', 'Graddell', 'lgraddelldq@nydailynews.com', 32214227, '22526528', NULL, NULL, '4060 Fairfield Road', 'Rafael Perazza', 'Río Negro', 'Uruguay', '1996-09-28', 'F', '2012-06-07 00:00:00', NULL, 0),
(507, 'Wadsworth', 'Buxy', 'wbuxydr@zimbio.com', 54721945, '46627274', NULL, NULL, '1 Moland Way', 'Dolores', 'Artigas', 'Uruguay', '1987-05-31', 'M', '2012-07-23 00:00:00', NULL, 1),
(508, 'Ashli', 'Bartol', 'abartolds@meetup.com', 46273142, '45084171', NULL, NULL, '29 Eagan Center', 'San Bautista', 'Artigas', 'Uruguay', '1958-08-16', 'F', '2012-07-23 00:00:00', NULL, 1),
(509, 'Vida', 'Comberbach', 'vcomberbachdt@washingtonpost.com', 36623498, '30784029', NULL, NULL, '1 Rusk Park', 'San Ramón', 'Paysandú', 'Uruguay', '1976-09-27', 'F', '2012-12-04 00:00:00', NULL, 1),
(510, 'Renard', 'Danniell', 'rdannielldu@hostgator.com', 47054532, '28548876', NULL, NULL, '7288 Novick Parkway', 'Aguas Corrientes', 'Artigas', 'Uruguay', '1979-05-07', 'M', '2016-10-21 00:00:00', NULL, 1),
(511, 'Sherm', 'Hazzard', 'shazzarddv@vk.com', 55872655, '25490393', NULL, NULL, '9242 Union Court', 'Santa Catalina', 'Rivera', 'Uruguay', '1994-12-11', 'M', '2017-07-30 00:00:00', NULL, 0),
(512, 'Rudie', 'Guiu', 'rguiudw@yandex.ru', 30773898, '21266103', NULL, NULL, '4 Sheridan Point', 'Joaquín Suárez', 'Montevideo', 'Uruguay', '1974-11-02', 'M', '2010-06-28 00:00:00', NULL, 1);
INSERT INTO `personas` (`id`, `nombres`, `apellidos`, `email`, `ci`, `telefono1`, `telefono2`, `telefono3`, `direccion`, `localidad`, `departamento`, `pais`, `fecha_de_nacimiento`, `sexo`, `ingreso`, `observaciones`, `estado`) VALUES
(513, 'Ashli', 'Massingham', 'amassinghamdx@amazon.de', 42686046, '40870609', NULL, NULL, '8698 Northridge Avenue', 'Delta del Tigre', 'Lavalleja', 'Uruguay', '1957-05-10', 'F', '2015-05-11 00:00:00', NULL, 0),
(514, 'Lenee', 'Fynan', 'lfynandy@google.de', 43276586, '45873424', NULL, NULL, '8824 Grayhawk Park', 'Mercedes', 'Rivera', 'Uruguay', '1976-01-23', 'F', '2013-01-12 00:00:00', NULL, 1),
(515, 'Reinhard', 'Thackeray', 'rthackeraydz@weather.com', 59111520, '28341555', NULL, NULL, '4188 Fremont Place', 'Quebracho', 'Maldonado', 'Uruguay', '1957-01-12', 'M', '2015-05-29 00:00:00', NULL, 0),
(516, 'Katherina', 'Sinkin', 'ksinkine0@ehow.com', 46593318, '34671110', NULL, NULL, '97 Charing Cross Street', 'Pan de Azúcar', 'San José', 'Uruguay', '1995-09-09', 'F', '2010-10-11 00:00:00', NULL, 1),
(517, 'Arielle', 'Borgnol', 'aborgnole1@live.com', 37180692, '40895308', NULL, NULL, '30 Boyd Circle', 'Cerro Colorado', 'Durazno', 'Uruguay', '1956-08-01', 'F', '2011-05-26 00:00:00', NULL, 0),
(518, 'Consolata', 'Durrell', 'cdurrelle2@dailymotion.com', 54825766, '35749379', NULL, NULL, '99026 Fisk Place', 'Rivera', 'Treinta y Tres', 'Uruguay', '1977-01-25', 'F', '2014-08-07 00:00:00', NULL, 1),
(519, 'Evered', 'Torrecilla', 'etorrecillae3@google.com.br', 56066364, '36638991', NULL, NULL, '95171 Merry Center', 'Trinidad', 'Lavalleja', 'Uruguay', '1967-08-30', 'M', '2017-02-09 00:00:00', NULL, 0),
(520, 'Catharina', 'Kocher', 'ckochere4@slideshare.net', 30645653, '21170342', NULL, NULL, '25411 Columbus Hill', 'Cardal', 'Rocha', 'Uruguay', '1973-02-26', 'F', '2011-09-16 00:00:00', NULL, 1),
(521, 'Samara', 'Doddridge', 'sdoddridgee5@omniture.com', 36938905, '36836019', NULL, NULL, '7 Shasta Trail', 'Soca', 'San José', 'Uruguay', '1962-04-13', 'F', '2013-08-25 00:00:00', NULL, 0),
(522, 'Paolina', 'Williment', 'pwillimente6@bbc.co.uk', 49443455, '33513934', NULL, NULL, '26786 Melrose Way', 'Pan de Azúcar', 'Durazno', 'Uruguay', '1982-07-09', 'F', '2011-08-11 00:00:00', NULL, 1),
(523, 'Dare', 'Ivannikov', 'divannikove7@ihg.com', 55137867, '24280146', NULL, NULL, '36 Sutherland Pass', 'Vergara', 'Rocha', 'Uruguay', '1961-05-02', 'M', '2010-04-26 00:00:00', NULL, 1),
(524, 'Cyb', 'Elliker', 'cellikere8@webnode.com', 41873216, '42234827', NULL, NULL, '086 Killdeer Terrace', 'Punta del Este', 'Cerro Largo', 'Uruguay', '1975-09-06', 'F', '2015-08-18 00:00:00', NULL, 1),
(525, 'Doralia', 'Powley', 'dpowleye9@hugedomains.com', 58028802, '26022835', NULL, NULL, '243 Anthes Drive', 'Porvenir', 'Rivera', 'Uruguay', '1967-06-07', 'F', '2018-08-01 00:00:00', NULL, 1),
(526, 'Moina', 'Lawden', 'mlawdenea@chronoengine.com', 53135378, '33014447', NULL, NULL, '33209 Northview Crossing', 'La Paloma', 'Río Negro', 'Uruguay', '1986-05-23', 'F', '2014-09-06 00:00:00', NULL, 0),
(527, 'Cody', 'Belmont', 'cbelmonteb@qq.com', 58922253, '46848334', NULL, NULL, '08 Hallows Center', 'Young', 'Artigas', 'Uruguay', '1995-06-04', 'M', '2018-02-06 00:00:00', NULL, 1),
(528, 'Ann', 'Eardley', 'aeardleyec@boston.com', 33761426, '47633540', NULL, NULL, '580 Vidon Park', 'Trinidad', 'Paysandú', 'Uruguay', '1989-07-08', 'F', '2016-04-08 00:00:00', NULL, 0),
(529, 'Zara', 'Kilian', 'zkilianed@ustream.tv', 37804822, '36203321', NULL, NULL, '95 Sutteridge Crossing', 'Treinta y Tres', 'San José', 'Uruguay', '1960-09-12', 'F', '2013-03-20 00:00:00', NULL, 1),
(530, 'Ammamaria', 'Boyat', 'aboyatee@ox.ac.uk', 36761224, '31522207', NULL, NULL, '631 Bellgrove Center', 'La Floresta', 'Colonia', 'Uruguay', '1978-07-02', 'F', '2016-09-18 00:00:00', NULL, 0),
(531, 'Gage', 'Raw', 'grawef@so-net.ne.jp', 38288392, '45836484', NULL, NULL, '3508 Lukken Hill', 'Villa del Carmen', 'Florida', 'Uruguay', '1998-01-10', 'M', '2017-05-04 00:00:00', NULL, 0),
(532, 'Alissa', 'Fitzhenry', 'afitzhenryeg@quantcast.com', 36146491, '40424187', NULL, NULL, '47518 Fieldstone Drive', 'Rivera', 'Cerro Largo', 'Uruguay', '1962-08-02', 'F', '2013-08-29 00:00:00', NULL, 0),
(533, 'Coleen', 'Postins', 'cpostinseh@hao123.com', 53683061, '37679152', NULL, NULL, '376 Morning Lane', 'Migues', 'Rocha', 'Uruguay', '1952-03-13', 'F', '2016-08-30 00:00:00', NULL, 0),
(534, 'Aile', 'Rathbourne', 'arathbourneei@4shared.com', 49026803, '25159074', NULL, NULL, '833 Dixon Court', 'Los Cerrillos', 'San José', 'Uruguay', '1962-02-20', 'F', '2019-03-22 00:00:00', NULL, 1),
(535, 'Reeva', 'Northcote', 'rnorthcoteej@gravatar.com', 43327265, '29760897', NULL, NULL, '21 Morning Plaza', 'Treinta y Tres', 'Maldonado', 'Uruguay', '1951-04-27', 'F', '2012-10-26 00:00:00', NULL, 0),
(536, 'Orsola', 'Passe', 'opasseek@biglobe.ne.jp', 54944449, '29554241', NULL, NULL, '99191 Blue Bill Park Drive', 'Los Cerrillos', 'Soriano', 'Uruguay', '1954-07-25', 'F', '2012-07-21 00:00:00', NULL, 0),
(537, 'Tadeas', 'Alps', 'talpsel@businessinsider.com', 38990887, '39793075', NULL, NULL, '6392 Fordem Lane', 'La Floresta', 'Florida', 'Uruguay', '1957-09-26', 'M', '2012-01-24 00:00:00', NULL, 0),
(538, 'Vivi', 'Floodgate', 'vfloodgateem@intel.com', 53286628, '29036504', NULL, NULL, '13129 Moland Avenue', 'Soriano', 'Treinta y Tres', 'Uruguay', '1997-07-30', 'F', '2012-05-08 00:00:00', NULL, 1),
(539, 'Parke', 'Agar', 'pagaren@psu.edu', 38289482, '39965566', NULL, NULL, '53 Elmside Pass', 'Palmitas', 'Durazno', 'Uruguay', '1988-08-24', 'M', '2010-12-02 00:00:00', NULL, 1),
(540, 'Anabelle', 'Staunton', 'astauntoneo@unesco.org', 37041610, '36733051', NULL, NULL, '6424 Del Sol Center', 'Maldonado', 'Florida', 'Uruguay', '1986-07-22', 'F', '2013-08-25 00:00:00', NULL, 0),
(541, 'Luella', 'Blaszczyk', 'lblaszczykep@loc.gov', 38823355, '29853436', NULL, NULL, '6 Lakewood Terrace', 'Treinta y Tres', 'Paysandú', 'Uruguay', '1995-01-10', 'F', '2016-12-27 00:00:00', NULL, 1),
(542, 'Quentin', 'Lemmen', 'qlemmeneq@businessweek.com', 34611379, '36554657', NULL, NULL, '64 Oneill Trail', 'Cardal', 'Colonia', 'Uruguay', '1988-12-03', 'F', '2014-05-08 00:00:00', NULL, 1),
(543, 'Jerrome', 'Turmel', 'jturmeler@nifty.com', 34528129, '43537409', NULL, NULL, '10145 Magdeline Road', 'Nuevo Berlín', 'Maldonado', 'Uruguay', '1998-12-01', 'M', '2014-01-04 00:00:00', NULL, 1),
(544, 'Percival', 'Graver', 'pgraveres@list-manage.com', 39043467, '45517467', NULL, NULL, '0 Blackbird Park', 'Florencio Sánchez', 'Montevideo', 'Uruguay', '1981-06-21', 'M', '2018-10-30 00:00:00', NULL, 0),
(545, 'Barbe', 'Seares', 'bseareset@nsw.gov.au', 44114921, '26922504', NULL, NULL, '83611 Onsgard Center', 'Salto', 'Maldonado', 'Uruguay', '1968-06-21', 'F', '2013-01-03 00:00:00', NULL, 0),
(546, 'Jolee', 'Sturges', 'jsturgeseu@home.pl', 45101537, '36004704', NULL, NULL, '6271 Evergreen Lane', 'Juan L. Lacaze', 'Cerro Largo', 'Uruguay', '1980-03-12', 'F', '2010-12-09 00:00:00', NULL, 0),
(547, 'Ryun', 'Perview', 'rperviewev@wiley.com', 45493899, '47046890', NULL, NULL, '11251 Declaration Street', 'Quebracho', 'Salto', 'Uruguay', '1955-06-08', 'M', '2011-01-13 00:00:00', NULL, 0),
(548, 'Rainer', 'Skae', 'rskaeew@upenn.edu', 48810718, '47513118', NULL, NULL, '550 Mcguire Trail', 'Cerro Colorado', 'San José', 'Uruguay', '1951-07-23', 'M', '2011-12-04 00:00:00', NULL, 1),
(549, 'Vince', 'Tulloch', 'vtullochex@yellowpages.com', 30544742, '27679878', NULL, NULL, '11745 Beilfuss Road', 'Barra de Carrasco', 'Lavalleja', 'Uruguay', '1970-03-22', 'M', '2013-07-23 00:00:00', NULL, 0),
(550, 'Willamina', 'Cranstone', 'wcranstoneey@ifeng.com', 46776995, '36778249', NULL, NULL, '2462 Hanover Drive', 'Cerro Colorado', 'Cerro Largo', 'Uruguay', '1978-07-22', 'F', '2015-03-25 00:00:00', NULL, 1),
(551, 'Nariko', 'Doy', 'ndoyez@oracle.com', 38133734, '21695713', NULL, NULL, '022 Myrtle Drive', 'Dolores', 'Rivera', 'Uruguay', '1952-07-26', 'F', '2016-03-18 00:00:00', NULL, 0),
(552, 'Regan', 'Brettell', 'rbrettellf0@e-recht24.de', 39536168, '21974614', NULL, NULL, '8240 Summit Circle', 'Los Cerrillos', 'Soriano', 'Uruguay', '1995-09-17', 'M', '2019-01-05 00:00:00', NULL, 0),
(553, 'Galvan', 'Sorensen', 'gsorensenf1@netvibes.com', 31489447, '22274436', NULL, NULL, '530 Dexter Plaza', 'Quebracho', 'Río Negro', 'Uruguay', '1963-11-03', 'M', '2018-02-25 00:00:00', NULL, 0),
(554, 'Swen', 'McAlpine', 'smcalpinef2@cnn.com', 54962588, '35217397', NULL, NULL, '7520 Red Cloud Avenue', 'Fray Bentos', 'Paysandú', 'Uruguay', '1996-05-19', 'M', '2015-03-02 00:00:00', NULL, 1),
(555, 'Ephrem', 'Stanyan', 'estanyanf3@skype.com', 30021929, '24241936', NULL, NULL, '3319 Oxford Trail', 'Belén', 'Rivera', 'Uruguay', '1996-08-20', 'M', '2015-10-05 00:00:00', NULL, 1),
(556, 'Loralie', 'MacCathay', 'lmaccathayf4@ifeng.com', 37096222, '43178130', NULL, NULL, '02546 Graceland Parkway', 'Villa del Carmen', 'Río Negro', 'Uruguay', '1977-03-01', 'F', '2015-07-17 00:00:00', NULL, 1),
(557, 'Trever', 'Konzelmann', 'tkonzelmannf5@bing.com', 30517847, '48405812', NULL, NULL, '92057 La Follette Junction', 'Young', 'Florida', 'Uruguay', '1967-08-03', 'M', '2013-07-20 00:00:00', NULL, 1),
(558, 'Luke', 'Buzzing', 'lbuzzingf6@slate.com', 39367666, '41619622', NULL, NULL, '93 Cherokee Avenue', 'San José de Mayo', 'Soriano', 'Uruguay', '1973-07-09', 'M', '2011-07-10 00:00:00', NULL, 1),
(559, 'Meir', 'Atlay', 'matlayf7@360.cn', 34181678, '25199239', NULL, NULL, '53375 Pawling Court', 'Barra de Carrasco', 'Tacuarembó', 'Uruguay', '1995-02-12', 'M', '2013-02-21 00:00:00', NULL, 0),
(560, 'Brockie', 'Danielis', 'bdanielisf8@xinhuanet.com', 32523341, '34145238', NULL, NULL, '2 Drewry Plaza', 'Fray Bentos', 'Colonia', 'Uruguay', '1967-08-17', 'M', '2016-10-05 00:00:00', NULL, 0),
(561, 'Yettie', 'Riddick', 'yriddickf9@google.cn', 47084222, '37279376', NULL, NULL, '61 Larry Crossing', 'Ecilda Paullier', 'Montevideo', 'Uruguay', '1969-07-18', 'F', '2013-11-10 00:00:00', NULL, 0),
(562, 'Emmit', 'Philipeau', 'ephilipeaufa@furl.net', 33140027, '34429629', NULL, NULL, '57 Eagle Crest Alley', 'Pando', 'Artigas', 'Uruguay', '1990-06-24', 'M', '2017-12-05 00:00:00', NULL, 0),
(563, 'Berty', 'O\' Dornan', 'bodornanfb@jiathis.com', 56764079, '35375882', NULL, NULL, '81 Spohn Hill', 'Delta del Tigre', 'Artigas', 'Uruguay', '1951-11-27', 'M', '2012-12-26 00:00:00', NULL, 0),
(564, 'Mattheus', 'Gwin', 'mgwinfc@wisc.edu', 37324333, '40367220', NULL, NULL, '44931 Holy Cross Park', 'Tala', 'Rivera', 'Uruguay', '1997-03-10', 'M', '2011-01-13 00:00:00', NULL, 0),
(565, 'Hanna', 'Wilkenson', 'hwilkensonfd@icio.us', 54433044, '32868703', NULL, NULL, '020 Granby Plaza', 'Pan de Azúcar', 'Flores', 'Uruguay', '1969-09-24', 'F', '2012-10-08 00:00:00', NULL, 0),
(566, 'Shep', 'Tubbles', 'stubblesfe@issuu.com', 31854374, '41114809', NULL, NULL, '67397 Reindahl Street', 'Cerro Colorado', 'Colonia', 'Uruguay', '1952-11-12', 'M', '2012-06-21 00:00:00', NULL, 1),
(567, 'Ewart', 'Fintoph', 'efintophff@usatoday.com', 55767432, '29478086', NULL, NULL, '6 Quincy Plaza', 'Castillos', 'Florida', 'Uruguay', '1950-12-21', 'M', '2018-12-13 00:00:00', NULL, 1),
(568, 'Shandeigh', 'Yann', 'syannfg@hatena.ne.jp', 31074015, '40809484', NULL, NULL, '808 Russell Junction', 'Juan L. Lacaze', 'Soriano', 'Uruguay', '1995-05-04', 'F', '2013-07-13 00:00:00', NULL, 0),
(569, 'Justinian', 'Orviss', 'jorvissfh@list-manage.com', 40327737, '47168356', NULL, NULL, '5127 Steensland Plaza', 'Vichadero', 'Treinta y Tres', 'Uruguay', '1996-10-03', 'M', '2013-08-03 00:00:00', NULL, 0),
(570, 'Maurita', 'Hunting', 'mhuntingfi@homestead.com', 34168565, '39562093', NULL, NULL, '52 Carberry Avenue', 'Joaquín Suárez', 'Montevideo', 'Uruguay', '1990-05-26', 'F', '2015-10-03 00:00:00', NULL, 0),
(571, 'Brendon', 'Stirzaker', 'bstirzakerfj@xrea.com', 45134246, '22874839', NULL, NULL, '05 Schmedeman Avenue', 'Treinta y Tres', 'Cerro Largo', 'Uruguay', '1968-01-01', 'M', '2013-06-27 00:00:00', NULL, 0),
(572, 'Lek', 'Ponton', 'lpontonfk@qq.com', 39421793, '32833454', NULL, NULL, '818 Waubesa Junction', 'Rivera', 'Canelones', 'Uruguay', '1995-08-23', 'M', '2018-09-05 00:00:00', NULL, 1),
(573, 'Hannis', 'Woolacott', 'hwoolacottfl@elpais.com', 36828728, '37689231', NULL, NULL, '38122 Holmberg Plaza', 'Trinidad', 'Montevideo', 'Uruguay', '1956-01-30', 'F', '2015-06-24 00:00:00', NULL, 1),
(574, 'Amandi', 'Barnicott', 'abarnicottfm@unblog.fr', 55033231, '25617371', NULL, NULL, '863 3rd Lane', 'Mercedes', 'Río Negro', 'Uruguay', '1984-06-05', 'F', '2016-08-16 00:00:00', NULL, 0),
(575, 'Bebe', 'Aronstam', 'baronstamfn@cafepress.com', 45538063, '26646751', NULL, NULL, '201 Southridge Avenue', 'Juan L. Lacaze', 'Cerro Largo', 'Uruguay', '1965-08-09', 'F', '2018-07-01 00:00:00', NULL, 1),
(576, 'Gilburt', 'Cosbee', 'gcosbeefo@businesswire.com', 51640072, '32846356', NULL, NULL, '123 Longview Place', 'Ecilda Paullier', 'Colonia', 'Uruguay', '1983-03-21', 'M', '2015-04-20 00:00:00', NULL, 0),
(577, 'Kora', 'Broadley', 'kbroadleyfp@sakura.ne.jp', 51573734, '24202534', NULL, NULL, '91313 Green Way', 'Baltasar Brum', 'Durazno', 'Uruguay', '1986-03-17', 'F', '2010-04-17 00:00:00', NULL, 0),
(578, 'Hortensia', 'Parnell', 'hparnellfq@cbslocal.com', 38374137, '22587381', NULL, NULL, '23 Holy Cross Circle', 'Soca', 'Rivera', 'Uruguay', '1957-05-31', 'F', '2012-09-01 00:00:00', NULL, 1),
(579, 'Alexandrina', 'Farryan', 'afarryanfr@abc.net.au', 32371974, '36586070', NULL, NULL, '39608 Rigney Court', 'Santa Bernardina', 'Artigas', 'Uruguay', '1976-08-12', 'F', '2016-08-17 00:00:00', NULL, 0),
(580, 'Arron', 'Semorad', 'asemoradfs@ucoz.ru', 44128841, '44079689', NULL, NULL, '70139 Sachs Park', 'Trinidad', 'Montevideo', 'Uruguay', '1987-12-05', 'M', '2018-05-10 00:00:00', NULL, 1),
(581, 'Kippy', 'Knatt', 'kknattft@boston.com', 36226638, '29245845', NULL, NULL, '9 Loomis Alley', 'Palmitas', 'Flores', 'Uruguay', '1996-02-14', 'F', '2018-06-23 00:00:00', NULL, 0),
(582, 'Lucho', 'Blankau', 'lblankaufu@hao123.com', 39167293, '44749873', NULL, NULL, '0815 Morningstar Plaza', 'La Paz', 'Treinta y Tres', 'Uruguay', '1958-08-25', 'M', '2010-04-14 00:00:00', NULL, 0),
(583, 'Maria', 'Coope', 'mcoopefv@artisteer.com', 41357913, '22783841', NULL, NULL, '8411 Northview Street', 'Progreso', 'Durazno', 'Uruguay', '1984-08-21', 'F', '2014-05-03 00:00:00', NULL, 0),
(584, 'Myrlene', 'Moorhouse', 'mmoorhousefw@dropbox.com', 44544581, '27218354', NULL, NULL, '3 Graedel Park', 'Pan de Azúcar', 'Salto', 'Uruguay', '1995-03-13', 'F', '2018-11-15 00:00:00', NULL, 1),
(585, 'Audrey', 'Rraundl', 'arraundlfx@indiatimes.com', 54622778, '22003279', NULL, NULL, '4338 Drewry Circle', 'Soriano', 'Florida', 'Uruguay', '1970-11-11', 'F', '2016-08-10 00:00:00', NULL, 0),
(586, 'Lorianna', 'Berr', 'lberrfy@chronoengine.com', 42516539, '36421559', NULL, NULL, '4 Sachs Pass', 'Durazno', 'Flores', 'Uruguay', '1974-04-15', 'F', '2011-07-13 00:00:00', NULL, 1),
(587, 'Brietta', 'Vasile', 'bvasilefz@about.me', 50212855, '41030899', NULL, NULL, '1119 Acker Hill', 'Juan L. Lacaze', 'Rivera', 'Uruguay', '1980-09-22', 'F', '2013-01-23 00:00:00', NULL, 1),
(588, 'Sarene', 'Woolhouse', 'swoolhouseg0@japanpost.jp', 48662462, '34611779', NULL, NULL, '3 Pond Circle', 'Villa del Carmen', 'Río Negro', 'Uruguay', '1990-06-13', 'F', '2015-02-26 00:00:00', NULL, 0),
(589, 'Peterus', 'Eastmond', 'peastmondg1@deliciousdays.com', 36163461, '42434744', NULL, NULL, '8 Beilfuss Pass', 'Treinta y Tres', 'Flores', 'Uruguay', '1968-11-09', 'M', '2010-04-30 00:00:00', NULL, 0),
(590, 'Cristian', 'Doxey', 'cdoxeyg2@ibm.com', 54625101, '46361053', NULL, NULL, '99 Service Road', 'Punta del Este', 'Soriano', 'Uruguay', '1957-12-01', 'M', '2015-11-04 00:00:00', NULL, 1),
(591, 'Hartley', 'Buckby', 'hbuckbyg3@whitehouse.gov', 38552431, '23189971', NULL, NULL, '7072 Esker Point', 'Rivera', 'Flores', 'Uruguay', '1982-12-17', 'M', '2013-02-16 00:00:00', NULL, 0),
(592, 'Owen', 'Cattanach', 'ocattanachg4@wufoo.com', 49119987, '26995166', NULL, NULL, '853 Nobel Court', 'Pando', 'Tacuarembó', 'Uruguay', '1967-09-19', 'M', '2017-10-15 00:00:00', NULL, 1),
(593, 'Estrella', 'Churchin', 'echurching5@dropbox.com', 35699138, '37587430', NULL, NULL, '1 Hansons Trail', 'Ecilda Paullier', 'Treinta y Tres', 'Uruguay', '1954-06-11', 'F', '2019-04-08 00:00:00', NULL, 1),
(594, 'Walther', 'Wretham', 'wwrethamg6@independent.co.uk', 30651669, '30610033', NULL, NULL, '29 Hollow Ridge Drive', 'Florida', 'Treinta y Tres', 'Uruguay', '1992-04-16', 'M', '2012-08-14 00:00:00', NULL, 1),
(595, 'Pepe', 'Dauncey', 'pdaunceyg7@upenn.edu', 53054230, '43965883', NULL, NULL, '6959 Manufacturers Center', 'Maldonado', 'Tacuarembó', 'Uruguay', '1990-08-17', 'M', '2014-08-24 00:00:00', NULL, 1),
(596, 'Alex', 'Frammingham', 'aframminghamg8@hibu.com', 43870512, '46734837', NULL, NULL, '85028 Carioca Pass', 'San Javier', 'Salto', 'Uruguay', '1994-11-04', 'F', '2015-10-26 00:00:00', NULL, 0),
(597, 'Liane', 'Studeart', 'lstudeartg9@canalblog.com', 33752042, '25805381', NULL, NULL, '20 Grover Point', 'Santa Rosa', 'Cerro Largo', 'Uruguay', '1979-05-07', 'F', '2016-08-14 00:00:00', NULL, 1),
(598, 'Rock', 'Sabathe', 'rsabathega@ow.ly', 45724830, '41355250', NULL, NULL, '408 Sage Crossing', 'Santa Rosa', 'Rivera', 'Uruguay', '1979-09-27', 'M', '2015-07-15 00:00:00', NULL, 1),
(599, 'Tanner', 'Shrimpton', 'tshrimptongb@miitbeian.gov.cn', 42682003, '22244170', NULL, NULL, '722 Fairfield Pass', 'Porvenir', 'Maldonado', 'Uruguay', '1985-06-20', 'M', '2015-08-05 00:00:00', NULL, 1),
(600, 'Jarrod', 'Whittier', 'jwhittiergc@adobe.com', 33683504, '37677296', NULL, NULL, '688 Brentwood Way', 'Nueva Helvecia', 'Rivera', 'Uruguay', '1984-04-05', 'M', '2013-12-01 00:00:00', NULL, 0),
(601, 'Ivett', 'Owens', 'iowensgd@ocn.ne.jp', 50126029, '28304942', NULL, NULL, '8819 Artisan Terrace', 'Tarariras', 'Treinta y Tres', 'Uruguay', '1955-07-06', 'F', '2013-05-29 00:00:00', NULL, 1),
(602, 'Harriet', 'Cotelard', 'hcotelardge@t-online.de', 42301973, '28577325', NULL, NULL, '16 Atwood Way', 'Tarariras', 'Montevideo', 'Uruguay', '1959-01-28', 'F', '2013-08-27 00:00:00', NULL, 1),
(603, 'Gris', 'Anger', 'gangergf@histats.com', 58154662, '20247164', NULL, NULL, '55 Vernon Plaza', 'Juan L. Lacaze', 'Rocha', 'Uruguay', '1969-06-06', 'M', '2011-09-28 00:00:00', NULL, 1),
(604, 'Ruby', 'Greenroad', 'rgreenroadgg@fc2.com', 37630520, '26288045', NULL, NULL, '9 Sullivan Street', 'Soriano', 'Maldonado', 'Uruguay', '1963-01-07', 'M', '2019-02-09 00:00:00', NULL, 1),
(605, 'Morse', 'Alforde', 'malfordegh@businessinsider.com', 31771675, '26285323', NULL, NULL, '2130 Debra Park', 'Las Toscas', 'Paysandú', 'Uruguay', '1962-04-10', 'M', '2011-05-22 00:00:00', NULL, 1),
(606, 'Margret', 'McPartlin', 'mmcpartlingi@webeden.co.uk', 41889771, '36534634', NULL, NULL, '09804 Orin Place', 'San Ramón', 'Lavalleja', 'Uruguay', '1996-12-15', 'F', '2011-06-26 00:00:00', NULL, 0),
(607, 'Opalina', 'Spender', 'ospendergj@networksolutions.com', 58528836, '48304621', NULL, NULL, '0312 Crest Line Alley', 'Vergara', 'Maldonado', 'Uruguay', '1972-01-31', 'F', '2010-06-20 00:00:00', NULL, 1),
(608, 'Arlan', 'Hollington', 'ahollingtongk@desdev.cn', 44938387, '35191121', NULL, NULL, '2 Darwin Alley', 'La Paz', 'Rocha', 'Uruguay', '1964-08-12', 'M', '2014-01-14 00:00:00', NULL, 0),
(609, 'Adan', 'McCrossan', 'amccrossangl@yolasite.com', 33210001, '42674730', NULL, NULL, '4556 Kingsford Crossing', 'Paso de Carrasco', 'Florida', 'Uruguay', '1979-10-05', 'F', '2018-08-16 00:00:00', NULL, 0),
(610, 'Talia', 'Gratland', 'tgratlandgm@eventbrite.com', 36887579, '39722069', NULL, NULL, '25 Summer Ridge Avenue', 'Vichadero', 'Montevideo', 'Uruguay', '1990-06-03', 'F', '2015-06-07 00:00:00', NULL, 1),
(611, 'Alvira', 'Lander', 'alandergn@technorati.com', 47050625, '48561221', NULL, NULL, '723 Lunder Pass', 'Nueva Helvecia', 'Tacuarembó', 'Uruguay', '1979-06-20', 'F', '2015-08-06 00:00:00', NULL, 0),
(612, 'Mar', 'Bohlmann', 'mbohlmanngo@china.com.cn', 54860978, '40602642', NULL, NULL, '712 Summerview Pass', 'Trinidad', 'Cerro Largo', 'Uruguay', '1987-12-20', 'M', '2018-11-15 00:00:00', NULL, 1),
(613, 'Killie', 'Gissing', 'kgissinggp@upenn.edu', 58358693, '27794104', NULL, NULL, '7669 Dayton Road', 'Pan de Azúcar', 'Rocha', 'Uruguay', '1970-08-10', 'M', '2011-12-11 00:00:00', NULL, 0),
(614, 'Allyson', 'Janatka', 'ajanatkagq@wikimedia.org', 32011974, '22148220', NULL, NULL, '605 Butterfield Pass', 'Durazno', 'Artigas', 'Uruguay', '1956-04-29', 'F', '2010-11-01 00:00:00', NULL, 1),
(615, 'Thorny', 'Graalman', 'tgraalmangr@marriott.com', 46699024, '38736594', NULL, NULL, '213 Scoville Terrace', 'Young', 'Artigas', 'Uruguay', '1966-07-25', 'M', '2017-01-14 00:00:00', NULL, 0),
(616, 'Raychel', 'Wynes', 'rwynesgs@yahoo.co.jp', 53108301, '39116207', NULL, NULL, '41801 Michigan Junction', 'Tala', 'Maldonado', 'Uruguay', '1986-03-07', 'F', '2014-05-18 00:00:00', NULL, 1),
(617, 'Consolata', 'Tuffley', 'ctuffleygt@simplemachines.org', 37459269, '32774414', NULL, NULL, '78 Hallows Avenue', 'Barra de Carrasco', 'Soriano', 'Uruguay', '1977-07-13', 'F', '2018-01-11 00:00:00', NULL, 1),
(618, 'Killy', 'Peto', 'kpetogu@usatoday.com', 59212145, '26772010', NULL, NULL, '52 Crownhardt Crossing', 'Soriano', 'Salto', 'Uruguay', '1974-05-16', 'M', '2015-07-27 00:00:00', NULL, 0),
(619, 'Marianna', 'Lathom', 'mlathomgv@vimeo.com', 57854280, '24215123', NULL, NULL, '993 International Parkway', 'La Floresta', 'Río Negro', 'Uruguay', '1969-02-10', 'F', '2018-01-05 00:00:00', NULL, 1),
(620, 'Heidie', 'Kissick', 'hkissickgw@blogspot.com', 59006675, '22820724', NULL, NULL, '0672 Chinook Center', 'Cerro Colorado', 'Salto', 'Uruguay', '1953-05-04', 'F', '2011-01-22 00:00:00', NULL, 0),
(621, 'Morris', 'Saleway', 'msalewaygx@ning.com', 33689615, '41983206', NULL, NULL, '9 Scofield Terrace', 'Baltasar Brum', 'Treinta y Tres', 'Uruguay', '1959-05-01', 'M', '2014-07-31 00:00:00', NULL, 0),
(622, 'Merell', 'Hyne', 'mhynegy@free.fr', 49380759, '26648337', NULL, NULL, '93345 Kedzie Junction', 'Belén', 'Tacuarembó', 'Uruguay', '1996-09-21', 'M', '2018-02-24 00:00:00', NULL, 0),
(623, 'Birdie', 'Caffery', 'bcafferygz@youku.com', 42536802, '41523610', NULL, NULL, '4524 Kings Junction', 'Bella Unión', 'Tacuarembó', 'Uruguay', '1966-12-20', 'F', '2019-02-25 00:00:00', NULL, 0),
(624, 'Rhiamon', 'Twinborough', 'rtwinboroughh0@github.com', 56948440, '23941733', NULL, NULL, '052 Melody Lane', 'Vichadero', 'Durazno', 'Uruguay', '1985-09-13', 'F', '2016-09-03 00:00:00', NULL, 0),
(625, 'Jonis', 'Spadollini', 'jspadollinih1@xing.com', 42692410, '42341417', NULL, NULL, '60 Melby Park', 'Porvenir', 'Río Negro', 'Uruguay', '1961-06-25', 'F', '2015-07-08 00:00:00', NULL, 1),
(626, 'Jobina', 'Matelyunas', 'jmatelyunash2@friendfeed.com', 48716871, '22436974', NULL, NULL, '21 American Ash Trail', 'San Javier', 'Tacuarembó', 'Uruguay', '1995-05-31', 'F', '2013-09-14 00:00:00', NULL, 0),
(627, 'Tabbie', 'Servis', 'tservish3@wisc.edu', 58341173, '43873563', NULL, NULL, '0 Golf View Street', 'Florencio Sánchez', 'Cerro Largo', 'Uruguay', '1987-09-05', 'F', '2016-11-10 00:00:00', NULL, 1),
(628, 'Ronni', 'Fordham', 'rfordhamh4@51.la', 43138230, '29936191', NULL, NULL, '64 Forster Junction', 'Dolores', 'Cerro Largo', 'Uruguay', '1977-09-17', 'F', '2018-10-28 00:00:00', NULL, 0),
(629, 'Kristin', 'Gynn', 'kgynnh5@nsw.gov.au', 45812606, '47909267', NULL, NULL, '8165 Carioca Way', 'La Floresta', 'Florida', 'Uruguay', '1963-11-09', 'F', '2016-05-31 00:00:00', NULL, 1),
(630, 'Lil', 'Whitesel', 'lwhiteselh6@addthis.com', 59328076, '45598670', NULL, NULL, '3 Del Sol Park', 'San José de Mayo', 'Flores', 'Uruguay', '1973-03-14', 'F', '2019-01-05 00:00:00', NULL, 1),
(631, 'Haze', 'Barkus', 'hbarkush7@hao123.com', 51667819, '22112836', NULL, NULL, '6953 Lakeland Lane', 'Soca', 'Tacuarembó', 'Uruguay', '1956-01-23', 'M', '2013-01-30 00:00:00', NULL, 0),
(632, 'Jacinta', 'Locket', 'jlocketh8@youku.com', 42392403, '30822080', NULL, NULL, '64947 Bluestem Crossing', 'Las Toscas', 'Maldonado', 'Uruguay', '1954-05-11', 'F', '2018-05-26 00:00:00', NULL, 1),
(633, 'Lucina', 'Dummett', 'ldummetth9@mysql.com', 38143575, '45032491', NULL, NULL, '8 Basil Lane', 'Palmitas', 'Salto', 'Uruguay', '1975-05-20', 'F', '2012-11-02 00:00:00', NULL, 1),
(634, 'Myca', 'Boram', 'mboramha@amazon.co.uk', 38189103, '29862199', NULL, NULL, '0 Center Lane', 'Ecilda Paullier', 'Paysandú', 'Uruguay', '1956-11-16', 'M', '2013-01-28 00:00:00', NULL, 0),
(635, 'Biron', 'Caff', 'bcaffhb@prnewswire.com', 57154978, '48493042', NULL, NULL, '218 Lighthouse Bay Center', 'Maldonado', 'Tacuarembó', 'Uruguay', '1953-12-25', 'M', '2010-10-11 00:00:00', NULL, 0),
(636, 'Keelby', 'Brandsma', 'kbrandsmahc@wikispaces.com', 35011379, '33712580', NULL, NULL, '812 Alpine Place', 'Tupambaé', 'Canelones', 'Uruguay', '1998-09-24', 'M', '2018-06-16 00:00:00', NULL, 1),
(637, 'Belvia', 'O\'Kuddyhy', 'bokuddyhyhd@addthis.com', 42437752, '48480080', NULL, NULL, '667 Rutledge Lane', 'Trinidad', 'Salto', 'Uruguay', '1978-03-08', 'F', '2011-09-20 00:00:00', NULL, 1),
(638, 'Gordan', 'Snoxell', 'gsnoxellhe@examiner.com', 58186804, '39064677', NULL, NULL, '78558 Harper Pass', 'Castillos', 'Rocha', 'Uruguay', '1954-06-15', 'M', '2011-05-15 00:00:00', NULL, 0),
(639, 'Buiron', 'Hollyard', 'bhollyardhf@mtv.com', 52908386, '29483071', NULL, NULL, '2952 Sullivan Parkway', 'Villa del Carmen', 'Cerro Largo', 'Uruguay', '1951-01-13', 'M', '2018-04-08 00:00:00', NULL, 0),
(640, 'Lorens', 'Kubczak', 'lkubczakhg@chron.com', 57707831, '37805373', NULL, NULL, '0 Hoffman Alley', 'Villa del Carmen', 'Tacuarembó', 'Uruguay', '1966-07-06', 'M', '2018-08-30 00:00:00', NULL, 1),
(641, 'Crawford', 'Mainwaring', 'cmainwaringhh@goo.ne.jp', 51731496, '30367057', NULL, NULL, '5 Quincy Hill', 'Quebracho', 'Canelones', 'Uruguay', '1971-12-13', 'M', '2016-09-14 00:00:00', NULL, 0),
(642, 'Vicki', 'Mattosoff', 'vmattosoffhi@mozilla.com', 48442278, '46609872', NULL, NULL, '1726 Anniversary Crossing', 'San Javier', 'Salto', 'Uruguay', '1969-12-10', 'F', '2019-03-28 00:00:00', NULL, 0),
(643, 'Rhianon', 'Dongate', 'rdongatehj@geocities.com', 46292736, '38878611', NULL, NULL, '1166 Dawn Parkway', 'Palmitas', 'Montevideo', 'Uruguay', '1976-02-20', 'F', '2019-02-26 00:00:00', NULL, 1),
(644, 'Darline', 'Kilmurray', 'dkilmurrayhk@sciencedirect.com', 45777665, '44137025', NULL, NULL, '9002 Shelley Junction', 'Young', 'Florida', 'Uruguay', '1987-03-27', 'F', '2013-01-14 00:00:00', NULL, 1),
(645, 'Kean', 'Emmanueli', 'kemmanuelihl@furl.net', 48288397, '34265761', NULL, NULL, '2609 Crescent Oaks Way', 'Sauce', 'Soriano', 'Uruguay', '1958-09-29', 'M', '2018-07-22 00:00:00', NULL, 0),
(646, 'Ber', 'Tambling', 'btamblinghm@fotki.com', 51201008, '29831133', NULL, NULL, '7 Steensland Street', 'Tala', 'Rivera', 'Uruguay', '1997-06-15', 'M', '2016-01-24 00:00:00', NULL, 1),
(647, 'Constantia', 'Goodbarr', 'cgoodbarrhn@ifeng.com', 37476018, '46714741', NULL, NULL, '0 Mockingbird Avenue', 'Sauce', 'San José', 'Uruguay', '1985-07-10', 'F', '2012-05-18 00:00:00', NULL, 0),
(648, 'Catie', 'Farge', 'cfargeho@icio.us', 44575526, '26638254', NULL, NULL, '31 Pepper Wood Terrace', 'Vichadero', 'Tacuarembó', 'Uruguay', '1996-10-26', 'F', '2014-05-19 00:00:00', NULL, 1),
(649, 'Esta', 'Creany', 'ecreanyhp@cbc.ca', 51847034, '24617424', NULL, NULL, '80607 Corry Road', 'Florida', 'Lavalleja', 'Uruguay', '1968-01-26', 'F', '2017-04-01 00:00:00', NULL, 1),
(650, 'Heriberto', 'Darlasson', 'hdarlassonhq@tamu.edu', 49485335, '29624991', NULL, NULL, '9 Division Plaza', 'Porvenir', 'Florida', 'Uruguay', '1980-07-16', 'M', '2013-09-09 00:00:00', NULL, 0),
(651, 'Fianna', 'Loffel', 'floffelhr@squidoo.com', 45276531, '31143247', NULL, NULL, '0 Warrior Trail', 'Paso de Carrasco', 'Cerro Largo', 'Uruguay', '1964-05-18', 'F', '2015-06-20 00:00:00', NULL, 0),
(652, 'Berton', 'Siemianowicz', 'bsiemianowiczhs@tripadvisor.com', 49670815, '46291923', NULL, NULL, '95266 Oneill Court', 'Tupambaé', 'Soriano', 'Uruguay', '1992-03-10', 'M', '2015-05-11 00:00:00', NULL, 0),
(653, 'Jeffy', 'Felipe', 'jfelipeht@instagram.com', 30274245, '37756215', NULL, NULL, '79 Anniversary Way', 'Juan L. Lacaze', 'Soriano', 'Uruguay', '1966-01-03', 'M', '2010-07-30 00:00:00', NULL, 1),
(654, 'Cristobal', 'Margetts', 'cmargettshu@istockphoto.com', 52480692, '36508038', NULL, NULL, '1430 4th Way', 'Mariscala', 'Canelones', 'Uruguay', '1978-07-03', 'M', '2015-10-31 00:00:00', NULL, 0),
(655, 'Alice', 'Cappell', 'acappellhv@microsoft.com', 42765303, '23423279', NULL, NULL, '527 Ridge Oak Hill', 'Nuevo Berlín', 'Maldonado', 'Uruguay', '1973-10-28', 'F', '2013-12-07 00:00:00', NULL, 1),
(656, 'Darnall', 'Coyte', 'dcoytehw@ycombinator.com', 37888020, '44277849', NULL, NULL, '66919 Westridge Road', 'Aguas Corrientes', 'Canelones', 'Uruguay', '1963-11-01', 'M', '2014-11-09 00:00:00', NULL, 0),
(657, 'Abdel', 'De Zuani', 'adezuanihx@scientificamerican.com', 42127253, '39277375', NULL, NULL, '45282 Center Junction', 'Ecilda Paullier', 'Soriano', 'Uruguay', '1985-09-09', 'M', '2015-06-07 00:00:00', NULL, 0),
(658, 'Glenden', 'Lowfill', 'glowfillhy@youtu.be', 57481602, '25044446', NULL, NULL, '51472 Knutson Trail', 'San José de Mayo', 'Rivera', 'Uruguay', '1963-07-11', 'M', '2014-07-15 00:00:00', NULL, 0),
(659, 'Natty', 'Jentgens', 'njentgenshz@t.co', 48239604, '47574041', NULL, NULL, '616 7th Parkway', 'Trinidad', 'Paysandú', 'Uruguay', '1998-10-25', 'M', '2016-03-30 00:00:00', NULL, 1),
(660, 'Nanci', 'Squier', 'nsquieri0@phoca.cz', 58128915, '28771678', NULL, NULL, '57 Holmberg Road', 'Porvenir', 'Canelones', 'Uruguay', '1965-06-08', 'F', '2011-01-25 00:00:00', NULL, 0),
(661, 'Shelby', 'Trevance', 'strevancei1@ameblo.jp', 43380978, '38159649', NULL, NULL, '632 Bartelt Park', 'Santa Rosa', 'Artigas', 'Uruguay', '1959-05-17', 'F', '2015-03-24 00:00:00', NULL, 0),
(662, 'Patrice', 'Sineath', 'psineathi2@altervista.org', 40171101, '33491637', NULL, NULL, '20584 Quincy Way', 'Nueva Helvecia', 'Maldonado', 'Uruguay', '1992-12-21', 'F', '2011-08-27 00:00:00', NULL, 0),
(663, 'Thorsten', 'Burkhill', 'tburkhilli3@infoseek.co.jp', 30877865, '40843956', NULL, NULL, '512 Grim Terrace', 'Soriano', 'Rocha', 'Uruguay', '1970-08-05', 'M', '2012-03-25 00:00:00', NULL, 0),
(664, 'Kingston', 'Bettinson', 'kbettinsoni4@gov.uk', 56085059, '30301928', NULL, NULL, '06451 Monument Place', 'Juan L. Lacaze', 'San José', 'Uruguay', '1950-09-15', 'M', '2013-04-03 00:00:00', NULL, 1),
(665, 'Danya', 'Jurges', 'djurgesi5@dion.ne.jp', 36123734, '26437892', NULL, NULL, '57732 Vidon Trail', 'San Javier', 'Artigas', 'Uruguay', '1996-01-21', 'M', '2018-10-24 00:00:00', NULL, 1),
(666, 'Shawn', 'Belbin', 'sbelbini6@amazon.co.uk', 33826851, '31138035', NULL, NULL, '92 Clyde Gallagher Park', 'Cerro Colorado', 'Rivera', 'Uruguay', '1964-11-26', 'M', '2011-01-09 00:00:00', NULL, 0),
(667, 'Jaye', 'Grzegorecki', 'jgrzegoreckii7@yellowpages.com', 32791463, '34705269', NULL, NULL, '3 Gale Crossing', 'Lascano', 'Maldonado', 'Uruguay', '1979-03-26', 'M', '2010-07-17 00:00:00', NULL, 1),
(668, 'Xever', 'Renowden', 'xrenowdeni8@about.me', 30542026, '39043440', NULL, NULL, '07564 Emmet Avenue', 'Cardal', 'Florida', 'Uruguay', '1959-04-18', 'M', '2016-07-22 00:00:00', NULL, 0),
(669, 'Gavan', 'Griffitt', 'ggriffitti9@xrea.com', 53171771, '35718537', NULL, NULL, '06 Walton Point', 'Maldonado', 'Paysandú', 'Uruguay', '1951-06-23', 'M', '2011-08-09 00:00:00', NULL, 1),
(670, 'Dione', 'Custed', 'dcustedia@cnn.com', 32862380, '20583839', NULL, NULL, '6 Division Lane', 'Santa Bernardina', 'Lavalleja', 'Uruguay', '1962-11-22', 'F', '2017-02-10 00:00:00', NULL, 0),
(671, 'Karlee', 'Dreakin', 'kdreakinib@oakley.com', 31353898, '38790406', NULL, NULL, '626 Lyons Street', 'Fray Bentos', 'Salto', 'Uruguay', '1958-03-12', 'F', '2016-09-05 00:00:00', NULL, 1),
(672, 'Marja', 'O\' Mahony', 'momahonyic@whitehouse.gov', 56610768, '48874796', NULL, NULL, '37798 Manley Center', 'Nueva Helvecia', 'Colonia', 'Uruguay', '1996-03-02', 'F', '2016-05-07 00:00:00', NULL, 0),
(673, 'Dorice', 'Clingan', 'dclinganid@nps.gov', 31216322, '26354068', NULL, NULL, '7225 Schurz Trail', 'Mariscala', 'Artigas', 'Uruguay', '1956-01-24', 'F', '2015-11-29 00:00:00', NULL, 1),
(674, 'Ramsey', 'Vango', 'rvangoie@elpais.com', 49203807, '32216081', NULL, NULL, '638 Menomonie Street', 'Durazno', 'Colonia', 'Uruguay', '1971-04-20', 'M', '2010-04-23 00:00:00', NULL, 0),
(675, 'Hannis', 'Stainburn', 'hstainburnif@imdb.com', 59365446, '27097726', NULL, NULL, '5 Clemons Junction', 'Progreso', 'Montevideo', 'Uruguay', '1979-09-12', 'F', '2016-02-27 00:00:00', NULL, 0),
(676, 'Nanon', 'Tullett', 'ntullettig@wikia.com', 47063841, '28489131', NULL, NULL, '32 Golf Parkway', 'Paso de Carrasco', 'Tacuarembó', 'Uruguay', '1956-04-30', 'F', '2012-06-03 00:00:00', NULL, 0),
(677, 'Dasie', 'Edie', 'dedieih@chron.com', 44789691, '47185921', NULL, NULL, '119 Montana Place', 'San Ramón', 'Lavalleja', 'Uruguay', '1968-08-05', 'F', '2012-03-08 00:00:00', NULL, 1),
(678, 'Junina', 'Bradden', 'jbraddenii@ucsd.edu', 42423686, '40145686', NULL, NULL, '7501 Dawn Alley', 'Maldonado', 'Tacuarembó', 'Uruguay', '1987-06-26', 'F', '2017-10-23 00:00:00', NULL, 1),
(679, 'Tymon', 'McIlvaney', 'tmcilvaneyij@bandcamp.com', 42428500, '28151331', NULL, NULL, '87678 Hollow Ridge Park', 'La Floresta', 'Maldonado', 'Uruguay', '1977-09-04', 'M', '2011-06-08 00:00:00', NULL, 0),
(680, 'Emlen', 'Acton', 'eactonik@prnewswire.com', 40538170, '20902953', NULL, NULL, '5 Darwin Parkway', 'Maldonado', 'Durazno', 'Uruguay', '1996-02-19', 'M', '2017-05-05 00:00:00', NULL, 0),
(681, 'Ailina', 'Verrell', 'averrellil@squidoo.com', 37644352, '42903640', NULL, NULL, '647 Independence Park', 'Mercedes', 'Soriano', 'Uruguay', '1985-06-09', 'F', '2018-01-04 00:00:00', NULL, 1),
(682, 'Garey', 'Maudett', 'gmaudettim@newyorker.com', 35450630, '23550502', NULL, NULL, '9 Truax Point', 'Young', 'Durazno', 'Uruguay', '1992-09-15', 'M', '2013-05-08 00:00:00', NULL, 1),
(683, 'Ludvig', 'Dowyer', 'ldowyerin@washington.edu', 48809598, '40250866', NULL, NULL, '22 Kingsford Avenue', 'Santa Rosa', 'Flores', 'Uruguay', '1952-02-20', 'M', '2013-05-15 00:00:00', NULL, 1),
(684, 'Codie', 'Manning', 'cmanningio@webmd.com', 58574977, '23881702', NULL, NULL, '442 Riverside Terrace', 'Nuevo Berlín', 'Durazno', 'Uruguay', '1986-11-13', 'F', '2016-03-10 00:00:00', NULL, 1),
(685, 'Emanuel', 'Loveard', 'eloveardip@discovery.com', 57375902, '38679652', NULL, NULL, '90947 Kipling Crossing', 'Paso de Carrasco', 'Treinta y Tres', 'Uruguay', '1961-02-18', 'M', '2014-08-31 00:00:00', NULL, 1),
(686, 'Garold', 'Shermar', 'gshermariq@kickstarter.com', 36992891, '37686759', NULL, NULL, '055 Longview Center', 'Salto', 'Canelones', 'Uruguay', '1956-04-09', 'M', '2010-10-05 00:00:00', NULL, 0),
(687, 'Royce', 'Loynton', 'rloyntonir@multiply.com', 55647554, '39011899', NULL, NULL, '85 Montana Point', 'Nueva Helvecia', 'Rocha', 'Uruguay', '1971-02-12', 'M', '2018-10-05 00:00:00', NULL, 1),
(688, 'Nickola', 'Licciardello', 'nlicciardellois@drupal.org', 30043757, '22086885', NULL, NULL, '4644 Superior Pass', 'Santiago Vázquez', 'Río Negro', 'Uruguay', '1959-03-12', 'M', '2014-02-14 00:00:00', NULL, 0),
(689, 'Addia', 'Mapes', 'amapesit@ed.gov', 52549421, '22882098', NULL, NULL, '327 Fairview Pass', 'Santa Bernardina', 'Paysandú', 'Uruguay', '1958-05-27', 'F', '2015-04-02 00:00:00', NULL, 0),
(690, 'Selena', 'Swales', 'sswalesiu@washingtonpost.com', 39539413, '29132822', NULL, NULL, '038 Columbus Pass', 'Florida', 'Cerro Largo', 'Uruguay', '1988-03-12', 'F', '2018-01-28 00:00:00', NULL, 1),
(691, 'Cami', 'Wales', 'cwalesiv@msu.edu', 46073989, '36426993', NULL, NULL, '6 Grim Drive', 'Cerro Colorado', 'Maldonado', 'Uruguay', '1975-08-20', 'F', '2012-05-10 00:00:00', NULL, 1),
(692, 'Lyssa', 'Mayell', 'lmayelliw@nasa.gov', 37972026, '32968404', NULL, NULL, '282 Barby Street', 'Santa Catalina', 'Durazno', 'Uruguay', '1996-03-18', 'F', '2012-09-29 00:00:00', NULL, 0),
(693, 'Camila', 'Tilio', 'ctilioix@goodreads.com', 52421361, '48283073', NULL, NULL, '815 Kenwood Lane', 'Quebracho', 'Treinta y Tres', 'Uruguay', '1965-07-16', 'F', '2016-05-28 00:00:00', NULL, 0),
(694, 'Zaria', 'Bienvenu', 'zbienvenuiy@tinyurl.com', 43823458, '45301577', NULL, NULL, '71 Michigan Park', 'Sauce', 'Tacuarembó', 'Uruguay', '1958-12-23', 'F', '2014-04-06 00:00:00', NULL, 1),
(695, 'Thornie', 'Yallop', 'tyallopiz@instagram.com', 49077977, '24826580', NULL, NULL, '7230 Badeau Drive', 'Nuevo Berlín', 'Rocha', 'Uruguay', '1957-10-23', 'M', '2012-07-25 00:00:00', NULL, 0),
(696, 'Salomi', 'Casotti', 'scasottij0@wiley.com', 45148166, '36646964', NULL, NULL, '813 Florence Circle', 'Sauce', 'Flores', 'Uruguay', '1995-04-22', 'F', '2014-07-11 00:00:00', NULL, 0),
(697, 'Rusty', 'Karsh', 'rkarshj1@springer.com', 51223783, '22812705', NULL, NULL, '0839 Lawn Plaza', 'Aguas Corrientes', 'Colonia', 'Uruguay', '1992-12-07', 'M', '2016-12-31 00:00:00', NULL, 1),
(698, 'Donalt', 'Isoldi', 'disoldij2@godaddy.com', 57817158, '46768394', NULL, NULL, '15 Pine View Place', 'Cerro Colorado', 'Durazno', 'Uruguay', '1986-05-22', 'M', '2017-09-24 00:00:00', NULL, 0),
(699, 'Darby', 'McQuade', 'dmcquadej3@nature.com', 34142834, '21052547', NULL, NULL, '27359 Dayton Junction', 'Aguas Corrientes', 'Flores', 'Uruguay', '1973-10-03', 'M', '2011-07-15 00:00:00', NULL, 0),
(700, 'Sandy', 'Getty', 'sgettyj4@sbwire.com', 59998545, '34437753', NULL, NULL, '67479 Holmberg Drive', 'Los Cerrillos', 'San José', 'Uruguay', '1995-06-13', 'M', '2016-10-31 00:00:00', NULL, 1),
(701, 'Minni', 'Jonke', 'mjonkej5@vk.com', 59909859, '35759324', NULL, NULL, '81768 Moose Hill', 'Barra de Carrasco', 'Salto', 'Uruguay', '1957-05-27', 'F', '2015-12-07 00:00:00', NULL, 0),
(702, 'Dorri', 'Pires', 'dpiresj6@army.mil', 50831444, '44966985', NULL, NULL, '89507 Eastlawn Center', 'Tala', 'Colonia', 'Uruguay', '1987-03-09', 'F', '2013-04-01 00:00:00', NULL, 0),
(703, 'Chloette', 'Duddell', 'cduddellj7@nih.gov', 30175104, '48417457', NULL, NULL, '4970 Karstens Avenue', 'Young', 'Salto', 'Uruguay', '1956-08-21', 'F', '2014-01-10 00:00:00', NULL, 0),
(704, 'Merrill', 'Antuk', 'mantukj8@examiner.com', 44478495, '23898685', NULL, NULL, '38179 Sunnyside Junction', 'Barra de Carrasco', 'Durazno', 'Uruguay', '1990-07-18', 'M', '2017-11-05 00:00:00', NULL, 0),
(705, 'Sherill', 'Mendoza', 'smendozaj9@tiny.cc', 34846178, '44215868', NULL, NULL, '863 Oriole Parkway', 'Dolores', 'Canelones', 'Uruguay', '1986-11-24', 'F', '2017-11-28 00:00:00', NULL, 0),
(706, 'Mahalia', 'Gwatkins', 'mgwatkinsja@army.mil', 34970202, '44968585', NULL, NULL, '7200 Evergreen Street', 'Progreso', 'Colonia', 'Uruguay', '1958-10-12', 'F', '2015-01-30 00:00:00', NULL, 0),
(707, 'Eziechiele', 'Trask', 'etraskjb@paginegialle.it', 32741808, '25783538', NULL, NULL, '2307 Sachs Circle', 'Migues', 'Salto', 'Uruguay', '1992-09-07', 'M', '2016-11-16 00:00:00', NULL, 1),
(708, 'Trev', 'Antonescu', 'tantonescujc@github.com', 55333747, '32263266', NULL, NULL, '2 Sachs Point', 'Castillos', 'Treinta y Tres', 'Uruguay', '1979-02-02', 'M', '2012-05-09 00:00:00', NULL, 0),
(709, 'Nerte', 'De Blasiis', 'ndeblasiisjd@ehow.com', 59183707, '35431221', NULL, NULL, '162 Ilene Drive', 'Palmitas', 'Canelones', 'Uruguay', '1961-09-23', 'F', '2018-02-18 00:00:00', NULL, 1),
(710, 'Raul', 'Leishman', 'rleishmanje@bloomberg.com', 30546045, '45524621', NULL, NULL, '9424 Esker Point', 'Joaquín Suárez', 'Río Negro', 'Uruguay', '1953-11-28', 'M', '2018-11-03 00:00:00', NULL, 1),
(711, 'Brantley', 'Kenwright', 'bkenwrightjf@oaic.gov.au', 33511299, '35380817', NULL, NULL, '24308 Saint Paul Lane', 'La Paz', 'Tacuarembó', 'Uruguay', '1981-10-19', 'M', '2016-11-27 00:00:00', NULL, 0),
(712, 'Moina', 'Vedmore', 'mvedmorejg@census.gov', 36710203, '27587058', NULL, NULL, '62563 Myrtle Plaza', 'Cardal', 'Florida', 'Uruguay', '1971-03-04', 'F', '2018-01-31 00:00:00', NULL, 1),
(713, 'Schuyler', 'Goshawk', 'sgoshawkjh@technorati.com', 50587002, '26042281', NULL, NULL, '9 Gulseth Crossing', 'Porvenir', 'Artigas', 'Uruguay', '1979-04-24', 'M', '2012-03-29 00:00:00', NULL, 0),
(714, 'Carr', 'Wooler', 'cwoolerji@unc.edu', 46192869, '35809676', NULL, NULL, '720 Arizona Lane', 'Dolores', 'Rivera', 'Uruguay', '1958-09-12', 'M', '2016-03-23 00:00:00', NULL, 0),
(715, 'Alric', 'Sartain', 'asartainjj@npr.org', 30098437, '26435179', NULL, NULL, '673 Nobel Circle', 'Soca', 'Soriano', 'Uruguay', '1964-03-21', 'M', '2015-07-31 00:00:00', NULL, 1),
(716, 'Arlana', 'Fould', 'afouldjk@npr.org', 57609486, '46355313', NULL, NULL, '7935 Oxford Place', 'Rafael Perazza', 'Colonia', 'Uruguay', '1973-09-11', 'F', '2010-12-22 00:00:00', NULL, 1),
(717, 'Wendall', 'Marven', 'wmarvenjl@java.com', 52719398, '28675012', NULL, NULL, '175 Namekagon Plaza', 'Belén', 'Florida', 'Uruguay', '1952-12-04', 'M', '2017-08-29 00:00:00', NULL, 1),
(718, 'Gawen', 'MacKnocker', 'gmacknockerjm@etsy.com', 59096275, '45190384', NULL, NULL, '3718 6th Parkway', 'Santa Bernardina', 'San José', 'Uruguay', '1990-06-06', 'M', '2012-11-08 00:00:00', NULL, 1),
(719, 'Sydney', 'Degenhardt', 'sdegenhardtjn@answers.com', 53071283, '43679580', NULL, NULL, '4213 Veith Hill', 'Santiago Vázquez', 'Río Negro', 'Uruguay', '1981-02-05', 'M', '2014-05-11 00:00:00', NULL, 0),
(720, 'Rhoda', 'Bane', 'rbanejo@infoseek.co.jp', 51175683, '36502916', NULL, NULL, '39646 Blaine Center', 'Cardal', 'Cerro Largo', 'Uruguay', '1997-01-07', 'F', '2011-03-28 00:00:00', NULL, 0),
(721, 'Melva', 'Emmert', 'memmertjp@so-net.ne.jp', 41011411, '35501102', NULL, NULL, '98 Banding Point', 'Cerro Colorado', 'Durazno', 'Uruguay', '1966-12-07', 'F', '2011-11-15 00:00:00', NULL, 0),
(722, 'Emma', 'Blomfield', 'eblomfieldjq@slideshare.net', 55372411, '26479452', NULL, NULL, '60182 Oakridge Plaza', 'Migues', 'Rocha', 'Uruguay', '1979-04-01', 'F', '2011-10-13 00:00:00', NULL, 0),
(723, 'Lianna', 'O\'Feeny', 'lofeenyjr@dailymotion.com', 41657391, '35590032', NULL, NULL, '3 Dakota Crossing', 'Cardal', 'Tacuarembó', 'Uruguay', '1986-06-23', 'F', '2010-10-15 00:00:00', NULL, 1),
(724, 'Tallie', 'Anersen', 'tanersenjs@topsy.com', 50509736, '29694652', NULL, NULL, '8954 Browning Road', 'Soriano', 'Flores', 'Uruguay', '1991-09-20', 'M', '2017-02-01 00:00:00', NULL, 1),
(725, 'Ignace', 'Phippen', 'iphippenjt@wikipedia.org', 54121629, '21757121', NULL, NULL, '6 Manufacturers Terrace', 'Nuevo Berlín', 'Montevideo', 'Uruguay', '1970-01-01', 'M', '2013-05-08 00:00:00', NULL, 1),
(726, 'Lorin', 'Momford', 'lmomfordju@spotify.com', 49057619, '32169313', NULL, NULL, '4862 Washington Place', 'La Paz', 'Colonia', 'Uruguay', '1995-11-04', 'M', '2011-01-23 00:00:00', NULL, 0),
(727, 'Caresse', 'Jirka', 'cjirkajv@businesswire.com', 34845186, '21538420', NULL, NULL, '08 Village Green Plaza', 'Soriano', 'Flores', 'Uruguay', '1982-05-22', 'F', '2016-01-19 00:00:00', NULL, 1),
(728, 'Dulcea', 'O\' Dooley', 'dodooleyjw@merriam-webster.com', 38071693, '46421788', NULL, NULL, '289 Arapahoe Avenue', 'Pan de Azúcar', 'Rocha', 'Uruguay', '1954-12-07', 'F', '2015-03-07 00:00:00', NULL, 0),
(729, 'Gizela', 'Stacey', 'gstaceyjx@symantec.com', 43371649, '38414261', NULL, NULL, '2 Hazelcrest Park', 'Treinta y Tres', 'Montevideo', 'Uruguay', '1951-11-01', 'F', '2010-07-18 00:00:00', NULL, 0),
(730, 'Josi', 'Janusik', 'jjanusikjy@istockphoto.com', 37504055, '42053997', NULL, NULL, '21731 Eagan Street', 'Treinta y Tres', 'Maldonado', 'Uruguay', '1976-07-03', 'F', '2011-06-10 00:00:00', NULL, 1),
(731, 'Deane', 'Vanyard', 'dvanyardjz@webnode.com', 50280623, '36763491', NULL, NULL, '6 Melody Trail', 'Soriano', 'Maldonado', 'Uruguay', '1966-01-12', 'F', '2018-04-20 00:00:00', NULL, 1),
(732, 'Dion', 'Patmore', 'dpatmorek0@tamu.edu', 33823329, '26831888', NULL, NULL, '39609 Northview Junction', 'Barra de Carrasco', 'Soriano', 'Uruguay', '1984-05-26', 'M', '2018-01-09 00:00:00', NULL, 0),
(733, 'Sayre', 'Tidder', 'stidderk1@umich.edu', 55680879, '25452432', NULL, NULL, '611 Ridge Oak Junction', 'Trinidad', 'Flores', 'Uruguay', '1951-09-12', 'M', '2014-03-18 00:00:00', NULL, 1),
(734, 'Jolyn', 'Banasevich', 'jbanasevichk2@reference.com', 52302631, '35659587', NULL, NULL, '4108 Karstens Avenue', 'Pando', 'Soriano', 'Uruguay', '1978-10-27', 'F', '2015-08-13 00:00:00', NULL, 1),
(735, 'Angeline', 'Bradnick', 'abradnickk3@google.de', 56897399, '46737575', NULL, NULL, '5 Armistice Street', 'Mercedes', 'Colonia', 'Uruguay', '1974-08-15', 'F', '2010-12-01 00:00:00', NULL, 0),
(736, 'Gracie', 'Penkman', 'gpenkmank4@businessweek.com', 43677062, '40943081', NULL, NULL, '15 Service Park', 'Tarariras', 'Río Negro', 'Uruguay', '1969-10-28', 'F', '2017-09-23 00:00:00', NULL, 0),
(737, 'Nonna', 'Macieja', 'nmaciejak5@sitemeter.com', 53256572, '22559788', NULL, NULL, '134 Amoth Crossing', 'Florida', 'Montevideo', 'Uruguay', '1963-02-05', 'F', '2010-10-21 00:00:00', NULL, 0),
(738, 'Yettie', 'Ruppelin', 'yruppelink6@paginegialle.it', 53354609, '20272001', NULL, NULL, '15 Monument Road', 'Vichadero', 'Cerro Largo', 'Uruguay', '1973-07-08', 'F', '2011-06-23 00:00:00', NULL, 0),
(739, 'Glendon', 'MacMoyer', 'gmacmoyerk7@vinaora.com', 42430157, '47817158', NULL, NULL, '64981 Browning Trail', 'Juan L. Lacaze', 'Treinta y Tres', 'Uruguay', '1962-09-05', 'M', '2015-09-16 00:00:00', NULL, 0),
(740, 'Brnaby', 'Kingerby', 'bkingerbyk8@photobucket.com', 37018900, '34996985', NULL, NULL, '11074 Briar Crest Pass', 'San Ramón', 'Maldonado', 'Uruguay', '1992-09-20', 'M', '2010-06-23 00:00:00', NULL, 0),
(741, 'Lelia', 'Nelthrop', 'lnelthropk9@sfgate.com', 39312683, '24557114', NULL, NULL, '40749 Forest Center', 'Rafael Perazza', 'Rivera', 'Uruguay', '1995-07-03', 'F', '2016-01-31 00:00:00', NULL, 1),
(742, 'Norrie', 'Barszczewski', 'nbarszczewskika@cam.ac.uk', 51928573, '21331353', NULL, NULL, '02 Anhalt Drive', 'Sauce', 'Cerro Largo', 'Uruguay', '1963-08-13', 'F', '2018-11-01 00:00:00', NULL, 1),
(743, 'Mariya', 'Maric', 'mmarickb@who.int', 34176327, '28921914', NULL, NULL, '45 Holmberg Hill', 'Tupambaé', 'Paysandú', 'Uruguay', '1984-07-30', 'F', '2011-05-17 00:00:00', NULL, 0),
(744, 'Katinka', 'Paynter', 'kpaynterkc@vinaora.com', 50325640, '28916241', NULL, NULL, '07614 Service Center', 'Progreso', 'Soriano', 'Uruguay', '1997-07-09', 'F', '2014-02-13 00:00:00', NULL, 1),
(745, 'Almeta', 'Carmichael', 'acarmichaelkd@narod.ru', 46857189, '46615029', NULL, NULL, '01822 Ramsey Park', 'Florida', 'Durazno', 'Uruguay', '1974-03-07', 'F', '2015-03-13 00:00:00', NULL, 0),
(746, 'Eldridge', 'Haskey', 'ehaskeyke@printfriendly.com', 47155614, '47158090', NULL, NULL, '38758 Northview Court', 'La Paz', 'Salto', 'Uruguay', '1986-10-20', 'M', '2015-03-13 00:00:00', NULL, 0),
(747, 'Judie', 'Blanko', 'jblankokf@umn.edu', 44452270, '35123190', NULL, NULL, '9 Center Court', 'Villa del Carmen', 'Paysandú', 'Uruguay', '1964-10-25', 'F', '2011-09-30 00:00:00', NULL, 1),
(748, 'Jacquenetta', 'Speed', 'jspeedkg@cloudflare.com', 47744861, '46552877', NULL, NULL, '35 Roxbury Alley', 'Santa Bernardina', 'Paysandú', 'Uruguay', '1981-12-04', 'F', '2011-05-19 00:00:00', NULL, 0),
(749, 'Chrisy', 'Stellino', 'cstellinokh@omniture.com', 47637821, '30094853', NULL, NULL, '1 Melrose Place', 'Vergara', 'Maldonado', 'Uruguay', '1981-04-20', 'M', '2011-06-24 00:00:00', NULL, 0),
(750, 'Glenn', 'Greenless', 'ggreenlesski@sfgate.com', 34021971, '39304287', NULL, NULL, '1421 South Street', 'Treinta y Tres', 'Flores', 'Uruguay', '1971-10-17', 'M', '2017-10-15 00:00:00', NULL, 0),
(751, 'Zed', 'Mapes', 'zmapeskj@ocn.ne.jp', 58020035, '43226555', NULL, NULL, '197 Mayfield Hill', 'Quebracho', 'Canelones', 'Uruguay', '1964-02-24', 'M', '2015-08-11 00:00:00', NULL, 1),
(752, 'Leroy', 'Pithie', 'lpithiekk@so-net.ne.jp', 34643510, '28322529', NULL, NULL, '41497 Barnett Pass', 'Palmitas', 'San José', 'Uruguay', '1970-10-24', 'M', '2018-10-24 00:00:00', NULL, 0),
(753, 'Hank', 'Collocott', 'hcollocottkl@hatena.ne.jp', 33267338, '35893521', NULL, NULL, '6746 Arapahoe Way', 'Maldonado', 'Tacuarembó', 'Uruguay', '1996-11-09', 'M', '2016-05-28 00:00:00', NULL, 1),
(754, 'Domenico', 'Tideswell', 'dtideswellkm@theguardian.com', 49214806, '31228507', NULL, NULL, '6607 Jay Junction', 'Palmitas', 'Colonia', 'Uruguay', '1999-01-19', 'M', '2018-12-16 00:00:00', NULL, 0),
(755, 'Mercedes', 'Birbeck', 'mbirbeckkn@foxnews.com', 54476914, '39242572', NULL, NULL, '190 Summit Junction', 'Villa del Carmen', 'Lavalleja', 'Uruguay', '1970-04-11', 'F', '2011-03-27 00:00:00', NULL, 1),
(756, 'Feliza', 'Mourgue', 'fmourgueko@desdev.cn', 45539011, '33545833', NULL, NULL, '235 Haas Avenue', 'Lascano', 'Canelones', 'Uruguay', '1981-05-12', 'F', '2011-06-30 00:00:00', NULL, 0),
(757, 'Issie', 'Huckell', 'ihuckellkp@de.vu', 32938747, '28361144', NULL, NULL, '62640 Starling Terrace', 'Soca', 'Río Negro', 'Uruguay', '1996-05-07', 'F', '2014-09-05 00:00:00', NULL, 0),
(758, 'Jory', 'Meegin', 'jmeeginkq@hatena.ne.jp', 42499085, '24044244', NULL, NULL, '10 Brown Drive', 'Punta del Este', 'Cerro Largo', 'Uruguay', '1982-03-23', 'M', '2016-06-21 00:00:00', NULL, 1),
(759, 'Bailey', 'Mahon', 'bmahonkr@dyndns.org', 59752327, '25548038', NULL, NULL, '88 Homewood Circle', 'La Paloma', 'Flores', 'Uruguay', '1997-06-01', 'M', '2016-07-15 00:00:00', NULL, 1),
(760, 'Giovanni', 'Freeborne', 'gfreeborneks@yahoo.co.jp', 41844363, '48343979', NULL, NULL, '37 Westridge Parkway', 'Cardal', 'Canelones', 'Uruguay', '1983-03-25', 'M', '2015-03-25 00:00:00', NULL, 0),
(761, 'Gwyneth', 'Bradder', 'gbradderkt@kickstarter.com', 39052482, '40664525', NULL, NULL, '0 Cardinal Plaza', 'Nueva Helvecia', 'Salto', 'Uruguay', '1961-11-13', 'F', '2010-06-01 00:00:00', NULL, 1),
(762, 'Lyndsay', 'Khalid', 'lkhalidku@istockphoto.com', 45519281, '41556281', NULL, NULL, '99069 Fisk Drive', 'Maldonado', 'Florida', 'Uruguay', '1988-11-27', 'F', '2011-10-09 00:00:00', NULL, 0),
(763, 'Lodovico', 'Sapsford', 'lsapsfordkv@wordpress.com', 30512222, '39582006', NULL, NULL, '33 2nd Place', 'Soca', 'Flores', 'Uruguay', '1960-05-08', 'M', '2013-09-30 00:00:00', NULL, 1),
(764, 'Tammy', 'Coggeshall', 'tcoggeshallkw@jimdo.com', 57363122, '24224521', NULL, NULL, '77 Bunker Hill Street', 'Rivera', 'Colonia', 'Uruguay', '1956-06-26', 'M', '2018-12-10 00:00:00', NULL, 0),
(765, 'Isador', 'Hasling', 'ihaslingkx@is.gd', 58319528, '42156948', NULL, NULL, '59600 Lakewood Center', 'Tupambaé', 'Flores', 'Uruguay', '1967-03-06', 'M', '2017-10-30 00:00:00', NULL, 1);
INSERT INTO `personas` (`id`, `nombres`, `apellidos`, `email`, `ci`, `telefono1`, `telefono2`, `telefono3`, `direccion`, `localidad`, `departamento`, `pais`, `fecha_de_nacimiento`, `sexo`, `ingreso`, `observaciones`, `estado`) VALUES
(766, 'Lonnard', 'Houlworth', 'lhoulworthky@istockphoto.com', 40842802, '37231714', NULL, NULL, '1 Dahle Circle', 'Pando', 'Soriano', 'Uruguay', '1987-09-18', 'M', '2019-01-15 00:00:00', NULL, 1),
(767, 'Liliane', 'Pirt', 'lpirtkz@geocities.com', 33888935, '45037300', NULL, NULL, '4 Aberg Court', 'Belén', 'Cerro Largo', 'Uruguay', '1983-01-22', 'F', '2016-06-13 00:00:00', NULL, 1),
(768, 'Abram', 'Tombling', 'atomblingl0@cpanel.net', 33564977, '30718838', NULL, NULL, '4613 Mifflin Lane', 'Pan de Azúcar', 'Montevideo', 'Uruguay', '1982-12-14', 'M', '2012-09-12 00:00:00', NULL, 1),
(769, 'Rudie', 'Gaskamp', 'rgaskampl1@state.tx.us', 37715535, '41287480', NULL, NULL, '89519 Mccormick Hill', 'Tala', 'Artigas', 'Uruguay', '1975-04-30', 'M', '2017-01-18 00:00:00', NULL, 0),
(770, 'Rufus', 'Donett', 'rdonettl2@rambler.ru', 42282608, '35660273', NULL, NULL, '879 Green Street', 'Soriano', 'Artigas', 'Uruguay', '1987-12-05', 'M', '2016-04-10 00:00:00', NULL, 1),
(771, 'Nonie', 'Ferroni', 'nferronil3@fda.gov', 50963187, '42948233', NULL, NULL, '6018 Green Lane', 'Maldonado', 'San José', 'Uruguay', '1978-01-05', 'F', '2015-06-21 00:00:00', NULL, 0),
(772, 'Gherardo', 'Gouthier', 'ggouthierl4@chron.com', 47848963, '26312551', NULL, NULL, '7 Warbler Place', 'Barra de Carrasco', 'Montevideo', 'Uruguay', '1975-08-13', 'M', '2018-05-03 00:00:00', NULL, 0),
(773, 'Carly', 'Jouning', 'cjouningl5@wikia.com', 45111872, '43501099', NULL, NULL, '1 Dayton Point', 'Las Toscas', 'Paysandú', 'Uruguay', '1956-02-06', 'M', '2018-10-14 00:00:00', NULL, 0),
(774, 'Clareta', 'McCafferty', 'cmccaffertyl6@jimdo.com', 46923644, '34591652', NULL, NULL, '359 Basil Hill', 'Barra de Carrasco', 'Tacuarembó', 'Uruguay', '1982-03-11', 'F', '2013-05-17 00:00:00', NULL, 0),
(775, 'Del', 'Roiz', 'droizl7@nature.com', 34190629, '36816096', NULL, NULL, '9085 Pond Court', 'Punta del Este', 'Salto', 'Uruguay', '1967-06-28', 'F', '2013-04-03 00:00:00', NULL, 0),
(776, 'Selinda', 'McKibbin', 'smckibbinl8@alibaba.com', 48599666, '20774351', NULL, NULL, '679 Lukken Park', 'Delta del Tigre', 'Durazno', 'Uruguay', '1968-10-21', 'F', '2012-10-01 00:00:00', NULL, 1),
(777, 'Ashbey', 'Lapere', 'alaperel9@amazon.co.uk', 57302066, '25948153', NULL, NULL, '614 Stephen Road', 'Rivera', 'San José', 'Uruguay', '1976-03-15', 'M', '2013-08-14 00:00:00', NULL, 0),
(778, 'Almire', 'Sancraft', 'asancraftla@weibo.com', 54598915, '32308701', NULL, NULL, '8046 Sheridan Drive', 'Fray Bentos', 'Florida', 'Uruguay', '1979-01-29', 'F', '2015-08-05 00:00:00', NULL, 0),
(779, 'Jaquelyn', 'Edmons', 'jedmonslb@dell.com', 32724070, '20913338', NULL, NULL, '14209 Lindbergh Alley', 'San Bautista', 'Flores', 'Uruguay', '1979-12-06', 'F', '2010-07-08 00:00:00', NULL, 0),
(780, 'Ahmad', 'Hackett', 'ahackettlc@cyberchimps.com', 34177876, '25489134', NULL, NULL, '64 Arkansas Pass', 'Delta del Tigre', 'Soriano', 'Uruguay', '1998-10-16', 'M', '2011-05-11 00:00:00', NULL, 1),
(781, 'Gunar', 'Pinkard', 'gpinkardld@bing.com', 51188978, '24670135', NULL, NULL, '9520 Forest Dale Junction', 'Tupambaé', 'San José', 'Uruguay', '1986-06-12', 'M', '2018-11-26 00:00:00', NULL, 0),
(782, 'Rourke', 'Standbridge', 'rstandbridgele@tinyurl.com', 58337840, '40984010', NULL, NULL, '4 Bay Trail', 'Tala', 'Flores', 'Uruguay', '1955-08-11', 'M', '2014-10-19 00:00:00', NULL, 1),
(783, 'Mahalia', 'Marks', 'mmarkslf@pen.io', 57115526, '40338361', NULL, NULL, '8619 Ohio Circle', 'Punta del Este', 'San José', 'Uruguay', '1991-06-19', 'F', '2017-10-02 00:00:00', NULL, 1),
(784, 'Caitlin', 'Rapsey', 'crapseylg@typepad.com', 38904304, '21037105', NULL, NULL, '8 Sachtjen Plaza', 'Barra de Carrasco', 'Salto', 'Uruguay', '1969-01-20', 'F', '2017-08-06 00:00:00', NULL, 0),
(785, 'Tristam', 'Chauvey', 'tchauveylh@wiley.com', 38380576, '40489674', NULL, NULL, '621 Everett Street', 'Tala', 'Flores', 'Uruguay', '1989-01-23', 'M', '2012-11-25 00:00:00', NULL, 0),
(786, 'Ardene', 'Johnys', 'ajohnysli@t-online.de', 56437021, '35151380', NULL, NULL, '090 Starling Parkway', 'Progreso', 'Paysandú', 'Uruguay', '1991-08-06', 'F', '2013-03-20 00:00:00', NULL, 1),
(787, 'Meredithe', 'Weavill', 'mweavilllj@rediff.com', 43592880, '36554746', NULL, NULL, '78421 Golf Parkway', 'Rivera', 'Tacuarembó', 'Uruguay', '1996-11-02', 'F', '2010-09-21 00:00:00', NULL, 1),
(788, 'Eddi', 'Juster', 'ejusterlk@t.co', 38338288, '25358470', NULL, NULL, '0 Mockingbird Drive', 'Delta del Tigre', 'Río Negro', 'Uruguay', '1992-07-10', 'F', '2013-08-26 00:00:00', NULL, 0),
(789, 'Meier', 'Vicioso', 'mviciosoll@t-online.de', 55287132, '21042977', NULL, NULL, '6 Kropf Park', 'Nueva Helvecia', 'Canelones', 'Uruguay', '1994-02-14', 'M', '2012-02-17 00:00:00', NULL, 0),
(790, 'Helen-elizabeth', 'Orsi', 'horsilm@smugmug.com', 47285537, '34535329', NULL, NULL, '0680 Autumn Leaf Avenue', 'Tupambaé', 'Lavalleja', 'Uruguay', '1998-08-16', 'F', '2018-06-07 00:00:00', NULL, 1),
(791, 'Angelique', 'Crighton', 'acrightonln@howstuffworks.com', 35985201, '34200402', NULL, NULL, '3663 Commercial Park', 'Castillos', 'Florida', 'Uruguay', '1968-06-05', 'F', '2012-05-07 00:00:00', NULL, 0),
(792, 'Weylin', 'Jephcote', 'wjephcotelo@mapy.cz', 56858677, '38571648', NULL, NULL, '02804 Village Terrace', 'Nueva Helvecia', 'Durazno', 'Uruguay', '1968-09-18', 'M', '2019-03-12 00:00:00', NULL, 0),
(793, 'Violette', 'Brocklehurst', 'vbrocklehurstlp@fda.gov', 38471634, '37915271', NULL, NULL, '6037 Acker Lane', 'Palmitas', 'Florida', 'Uruguay', '1988-02-15', 'F', '2015-10-17 00:00:00', NULL, 0),
(794, 'Henka', 'Greatex', 'hgreatexlq@yahoo.com', 33512990, '40856054', NULL, NULL, '061 Fuller Lane', 'San Javier', 'Salto', 'Uruguay', '1975-12-25', 'F', '2019-02-03 00:00:00', NULL, 0),
(795, 'Tracey', 'Czaja', 'tczajalr@oaic.gov.au', 47419140, '22786993', NULL, NULL, '824 Roxbury Road', 'San Ramón', 'Tacuarembó', 'Uruguay', '1979-04-22', 'M', '2016-02-18 00:00:00', NULL, 0),
(796, 'Rodger', 'Tatum', 'rtatumls@devhub.com', 52470383, '20659225', NULL, NULL, '765 Lindbergh Hill', 'Bella Unión', 'Montevideo', 'Uruguay', '1962-07-27', 'M', '2015-01-27 00:00:00', NULL, 1),
(797, 'Aloysia', 'O\'Gavin', 'aogavinlt@aol.com', 55432287, '47820032', NULL, NULL, '84 Forest Drive', 'San Bautista', 'Río Negro', 'Uruguay', '1955-06-28', 'F', '2019-02-11 00:00:00', NULL, 1),
(798, 'Sutherland', 'Guidone', 'sguidonelu@tamu.edu', 38521257, '20755336', NULL, NULL, '9 Autumn Leaf Circle', 'San José de Mayo', 'Colonia', 'Uruguay', '1994-01-24', 'M', '2014-07-17 00:00:00', NULL, 0),
(799, 'Leora', 'Drayn', 'ldraynlv@deliciousdays.com', 34939416, '37831871', NULL, NULL, '62 Maryland Parkway', 'Fray Bentos', 'Colonia', 'Uruguay', '1997-12-10', 'F', '2017-07-02 00:00:00', NULL, 1),
(800, 'Bradford', 'Basnett', 'bbasnettlw@digg.com', 48715837, '28637940', NULL, NULL, '6 Westend Pass', 'Belén', 'Treinta y Tres', 'Uruguay', '1996-03-11', 'M', '2015-12-22 00:00:00', NULL, 1),
(801, 'Marna', 'Foxhall', 'mfoxhalllx@ning.com', 38930444, '42742094', NULL, NULL, '84129 Butterfield Place', 'Soriano', 'Flores', 'Uruguay', '1953-05-23', 'F', '2014-10-07 00:00:00', NULL, 0),
(802, 'Holly', 'Nicolson', 'hnicolsonly@marriott.com', 40907806, '48553357', NULL, NULL, '50423 Scoville Court', 'Tarariras', 'Durazno', 'Uruguay', '1965-01-26', 'F', '2013-09-25 00:00:00', NULL, 1),
(803, 'Niki', 'Hamilton', 'nhamiltonlz@nature.com', 42154505, '30274391', NULL, NULL, '922 Canary Pass', 'La Floresta', 'Durazno', 'Uruguay', '1953-08-21', 'M', '2015-04-02 00:00:00', NULL, 1),
(804, 'Ganny', 'Chifney', 'gchifneym0@symantec.com', 49042457, '38328041', NULL, NULL, '20 Sheridan Lane', 'Punta del Este', 'Durazno', 'Uruguay', '1977-08-02', 'M', '2018-11-19 00:00:00', NULL, 0),
(805, 'Jacinda', 'Cominetti', 'jcominettim1@princeton.edu', 51983712, '36535221', NULL, NULL, '5 Pleasure Parkway', 'Santa Catalina', 'Florida', 'Uruguay', '1962-05-08', 'F', '2015-09-26 00:00:00', NULL, 0),
(806, 'Claybourne', 'Kyffin', 'ckyffinm2@bandcamp.com', 49801460, '36899444', NULL, NULL, '3206 Del Sol Parkway', 'Rivera', 'Durazno', 'Uruguay', '1989-09-13', 'M', '2019-01-08 00:00:00', NULL, 1),
(807, 'Alfie', 'Darwent', 'adarwentm3@usnews.com', 45116352, '47011481', NULL, NULL, '2796 New Castle Way', 'Palmitas', 'Salto', 'Uruguay', '1988-01-10', 'M', '2019-03-27 00:00:00', NULL, 1),
(808, 'Lincoln', 'Cowling', 'lcowlingm4@google.ru', 40294727, '36158998', NULL, NULL, '55 Dunning Alley', 'Castillos', 'Flores', 'Uruguay', '1961-06-01', 'M', '2014-02-13 00:00:00', NULL, 0),
(809, 'Welch', 'Read', 'wreadm5@hhs.gov', 38661642, '32505849', NULL, NULL, '41 Beilfuss Point', 'La Floresta', 'San José', 'Uruguay', '1971-11-10', 'M', '2014-01-21 00:00:00', NULL, 1),
(810, 'Gaven', 'Petrazzi', 'gpetrazzim6@nydailynews.com', 34723431, '46637145', NULL, NULL, '6119 Heath Alley', 'Pan de Azúcar', 'Canelones', 'Uruguay', '1990-05-03', 'M', '2010-06-17 00:00:00', NULL, 1),
(811, 'Farlay', 'Gillino', 'fgillinom7@behance.net', 42059755, '30320087', NULL, NULL, '6828 Northridge Lane', 'Migues', 'Colonia', 'Uruguay', '1991-07-18', 'M', '2011-08-06 00:00:00', NULL, 1),
(812, 'Eleen', 'Aloshikin', 'ealoshikinm8@hugedomains.com', 35287514, '43642642', NULL, NULL, '7 Utah Court', 'Barra de Carrasco', 'Lavalleja', 'Uruguay', '1953-04-15', 'F', '2016-06-22 00:00:00', NULL, 1),
(813, 'Caria', 'Cragell', 'ccragellm9@dyndns.org', 44589854, '32118864', NULL, NULL, '9 Gale Circle', 'Durazno', 'Artigas', 'Uruguay', '1983-07-18', 'F', '2011-02-07 00:00:00', NULL, 1),
(814, 'Ennis', 'Scotson', 'escotsonma@altervista.org', 53760724, '41006657', NULL, NULL, '5645 Holy Cross Court', 'Tarariras', 'Artigas', 'Uruguay', '1984-01-15', 'M', '2013-12-19 00:00:00', NULL, 1),
(815, 'Sutton', 'Dermott', 'sdermottmb@boston.com', 50791764, '34680340', NULL, NULL, '7311 Paget Court', 'Progreso', 'Salto', 'Uruguay', '1995-01-06', 'M', '2012-04-15 00:00:00', NULL, 0),
(816, 'Valina', 'Witherdon', 'vwitherdonmc@ft.com', 32948597, '31650846', NULL, NULL, '06 Barnett Place', 'Maldonado', 'Rivera', 'Uruguay', '1978-09-01', 'F', '2018-09-06 00:00:00', NULL, 1),
(817, 'Helge', 'Snare', 'hsnaremd@fda.gov', 55879288, '28460577', NULL, NULL, '286 6th Center', 'Los Cerrillos', 'Lavalleja', 'Uruguay', '1970-03-20', 'F', '2011-08-03 00:00:00', NULL, 0),
(818, 'Marv', 'Jewise', 'mjewiseme@home.pl', 46094793, '42772668', NULL, NULL, '6 Hazelcrest Junction', 'San Javier', 'Flores', 'Uruguay', '1995-11-20', 'M', '2012-11-21 00:00:00', NULL, 0),
(819, 'Jamey', 'McGebenay', 'jmcgebenaymf@netlog.com', 33049943, '32048262', NULL, NULL, '2580 Kennedy Street', 'Dolores', 'Salto', 'Uruguay', '1955-11-28', 'M', '2019-01-20 00:00:00', NULL, 1),
(820, 'Brady', 'Eggleton', 'beggletonmg@omniture.com', 42471259, '37133141', NULL, NULL, '01755 Fairview Crossing', 'Rafael Perazza', 'Lavalleja', 'Uruguay', '1974-10-24', 'M', '2019-03-24 00:00:00', NULL, 1),
(821, 'Merle', 'Christal', 'mchristalmh@house.gov', 53589401, '33948903', NULL, NULL, '08 Pierstorff Plaza', 'San Ramón', 'Rivera', 'Uruguay', '1977-04-10', 'F', '2012-10-16 00:00:00', NULL, 1),
(822, 'Vannie', 'Thurlbeck', 'vthurlbeckmi@phpbb.com', 33128835, '21633974', NULL, NULL, '4 Sheridan Circle', 'Santa Bernardina', 'Flores', 'Uruguay', '1983-07-02', 'F', '2016-09-30 00:00:00', NULL, 1),
(823, 'Worth', 'Croxley', 'wcroxleymj@thetimes.co.uk', 57421394, '30718096', NULL, NULL, '1 Arapahoe Alley', 'San Bautista', 'Soriano', 'Uruguay', '1971-02-09', 'M', '2011-01-04 00:00:00', NULL, 1),
(824, 'Davine', 'Hindrick', 'dhindrickmk@eventbrite.com', 32580407, '33151793', NULL, NULL, '2 Fordem Center', 'Young', 'Colonia', 'Uruguay', '1968-09-17', 'F', '2012-11-01 00:00:00', NULL, 1),
(825, 'Waldo', 'Gouth', 'wgouthml@nba.com', 48120484, '21981682', NULL, NULL, '0693 Sunbrook Plaza', 'Cerro Colorado', 'Rocha', 'Uruguay', '1953-10-25', 'M', '2017-09-23 00:00:00', NULL, 0),
(826, 'Angus', 'Robillart', 'arobillartmm@chicagotribune.com', 45578481, '21253635', NULL, NULL, '6 Blaine Circle', 'Barra de Carrasco', 'Treinta y Tres', 'Uruguay', '1988-02-17', 'M', '2011-01-02 00:00:00', NULL, 0),
(827, 'Bettina', 'Farbrace', 'bfarbracemn@hugedomains.com', 43479683, '33448728', NULL, NULL, '95 Dayton Place', 'Tala', 'Rocha', 'Uruguay', '1980-06-09', 'F', '2014-06-26 00:00:00', NULL, 0),
(828, 'Duff', 'Claworth', 'dclaworthmo@edublogs.org', 30556617, '44373679', NULL, NULL, '12926 Doe Crossing Avenue', 'Vichadero', 'Cerro Largo', 'Uruguay', '1959-10-15', 'M', '2011-02-28 00:00:00', NULL, 0),
(829, 'Laurice', 'Annwyl', 'lannwylmp@skype.com', 50268132, '34787948', NULL, NULL, '62 Rusk Park', 'Nueva Helvecia', 'Florida', 'Uruguay', '1960-12-13', 'F', '2014-10-24 00:00:00', NULL, 0),
(830, 'Stacie', 'Porteous', 'sporteousmq@redcross.org', 41677809, '27179845', NULL, NULL, '8 Dapin Circle', 'San Ramón', 'Treinta y Tres', 'Uruguay', '1976-06-04', 'F', '2013-04-30 00:00:00', NULL, 0),
(831, 'Maighdiln', 'Biss', 'mbissmr@unblog.fr', 34574122, '27132775', NULL, NULL, '86904 Beilfuss Drive', 'Nueva Helvecia', 'Lavalleja', 'Uruguay', '1961-04-13', 'F', '2011-07-28 00:00:00', NULL, 0),
(832, 'Karola', 'Darville', 'kdarvillems@ning.com', 48297862, '46011445', NULL, NULL, '02892 American Ash Avenue', 'Tala', 'Río Negro', 'Uruguay', '1978-02-09', 'F', '2018-03-26 00:00:00', NULL, 0),
(833, 'Harmon', 'Stubbe', 'hstubbemt@mit.edu', 44850668, '28423383', NULL, NULL, '5 Loomis Parkway', 'La Floresta', 'Durazno', 'Uruguay', '1973-06-15', 'M', '2010-12-08 00:00:00', NULL, 1),
(834, 'Victor', 'Hymans', 'vhymansmu@joomla.org', 51441310, '44943792', NULL, NULL, '962 Park Meadow Place', 'Belén', 'Montevideo', 'Uruguay', '1978-02-08', 'M', '2011-11-01 00:00:00', NULL, 0),
(835, 'Hoyt', 'Bendall', 'hbendallmv@dot.gov', 51855088, '40098568', NULL, NULL, '1 Milwaukee Alley', 'Lascano', 'Cerro Largo', 'Uruguay', '1964-03-22', 'M', '2018-12-12 00:00:00', NULL, 1),
(836, 'Greer', 'Scrimshire', 'gscrimshiremw@networkadvertising.org', 59620225, '24610020', NULL, NULL, '8626 Meadow Ridge Street', 'Porvenir', 'Soriano', 'Uruguay', '1977-06-21', 'F', '2011-03-25 00:00:00', NULL, 1),
(837, 'Francklyn', 'Delete', 'fdeletemx@deliciousdays.com', 35747787, '28709022', NULL, NULL, '738 Bartelt Court', 'San Bautista', 'Paysandú', 'Uruguay', '1991-10-28', 'M', '2011-07-31 00:00:00', NULL, 0),
(838, 'Yorgos', 'Geertsen', 'ygeertsenmy@exblog.jp', 53212858, '40181947', NULL, NULL, '7710 Fuller Center', 'Quebracho', 'Rocha', 'Uruguay', '1997-02-21', 'M', '2016-04-01 00:00:00', NULL, 1),
(839, 'Loria', 'Inger', 'lingermz@example.com', 53382120, '43169582', NULL, NULL, '88 Scoville Way', 'La Paz', 'Canelones', 'Uruguay', '1959-06-27', 'F', '2012-02-22 00:00:00', NULL, 0),
(840, 'Leonerd', 'Bartels', 'lbartelsn0@mediafire.com', 39347702, '23788877', NULL, NULL, '69742 Texas Crossing', 'Juan L. Lacaze', 'Rocha', 'Uruguay', '1972-07-06', 'M', '2016-03-01 00:00:00', NULL, 1),
(841, 'Harrison', 'Marconi', 'hmarconin1@bing.com', 47023953, '43005989', NULL, NULL, '3177 Artisan Alley', 'Palmitas', 'Artigas', 'Uruguay', '1992-05-30', 'M', '2016-12-29 00:00:00', NULL, 1),
(842, 'Englebert', 'Bothen', 'ebothenn2@mozilla.com', 36522634, '28503680', NULL, NULL, '369 Express Circle', 'Tala', 'Maldonado', 'Uruguay', '1983-07-31', 'M', '2018-10-01 00:00:00', NULL, 1),
(843, 'Eadmund', 'Garioch', 'egariochn3@google.es', 42227486, '36546066', NULL, NULL, '9407 International Hill', 'San Bautista', 'Soriano', 'Uruguay', '1955-02-26', 'M', '2019-03-16 00:00:00', NULL, 1),
(844, 'Juliane', 'Haverson', 'jhaversonn4@ebay.com', 40162883, '45223741', NULL, NULL, '7 Russell Avenue', 'Tala', 'Salto', 'Uruguay', '1950-07-19', 'F', '2014-07-12 00:00:00', NULL, 1),
(845, 'Boothe', 'Mac Geaney', 'bmacgeaneyn5@csmonitor.com', 43351312, '36548263', NULL, NULL, '53448 Prairieview Terrace', 'Progreso', 'Salto', 'Uruguay', '1959-01-11', 'M', '2017-03-09 00:00:00', NULL, 1),
(846, 'Vinson', 'Tillot', 'vtillotn6@ezinearticles.com', 47401226, '20878549', NULL, NULL, '7 Shopko Road', 'Los Cerrillos', 'Treinta y Tres', 'Uruguay', '1970-04-18', 'M', '2011-12-18 00:00:00', NULL, 0),
(847, 'Skipton', 'Wormleighton', 'swormleightonn7@wikia.com', 51082820, '35194178', NULL, NULL, '84715 Cody Court', 'Los Cerrillos', 'Treinta y Tres', 'Uruguay', '1965-04-14', 'M', '2018-03-13 00:00:00', NULL, 1),
(848, 'Elisha', 'Debenham', 'edebenhamn8@weibo.com', 35707320, '43806915', NULL, NULL, '24 Waubesa Court', 'Joaquín Suárez', 'Rivera', 'Uruguay', '1955-12-13', 'M', '2012-09-14 00:00:00', NULL, 0),
(849, 'Charmian', 'Littleton', 'clittletonn9@tinyurl.com', 33279438, '36338171', NULL, NULL, '49950 Pepper Wood Point', 'Tarariras', 'Rivera', 'Uruguay', '1996-12-24', 'F', '2018-02-16 00:00:00', NULL, 0),
(850, 'Bondy', 'Basson', 'bbassonna@economist.com', 40863496, '30178319', NULL, NULL, '663 Parkside Pass', 'Vergara', 'Durazno', 'Uruguay', '1988-08-16', 'M', '2013-11-29 00:00:00', NULL, 1),
(851, 'Matti', 'Cliss', 'mclissnb@mozilla.com', 38311224, '31189609', NULL, NULL, '36144 Hanover Plaza', 'Bella Unión', 'Paysandú', 'Uruguay', '1988-05-31', 'F', '2017-06-20 00:00:00', NULL, 0),
(852, 'Marie-ann', 'Uzielli', 'muziellinc@cloudflare.com', 55084446, '45160058', NULL, NULL, '5 Lyons Trail', 'Cardal', 'Tacuarembó', 'Uruguay', '1957-07-25', 'F', '2011-01-01 00:00:00', NULL, 0),
(853, 'Jodi', 'Ricketts', 'jrickettsnd@free.fr', 56169437, '25756724', NULL, NULL, '5 Fieldstone Place', 'Progreso', 'Treinta y Tres', 'Uruguay', '1989-05-02', 'F', '2010-07-23 00:00:00', NULL, 1),
(854, 'Alvis', 'German', 'agermanne@trellian.com', 37980721, '35098435', NULL, NULL, '94063 Arkansas Lane', 'Barra de Carrasco', 'Durazno', 'Uruguay', '1991-03-23', 'M', '2017-03-31 00:00:00', NULL, 0),
(855, 'Nissie', 'Devoy', 'ndevoynf@google.it', 48908600, '24585461', NULL, NULL, '99 Spaight Junction', 'Soriano', 'Paysandú', 'Uruguay', '1971-08-02', 'F', '2017-07-28 00:00:00', NULL, 0),
(856, 'Donetta', 'Bisiker', 'dbisikerng@smh.com.au', 50264727, '41353029', NULL, NULL, '215 Corben Road', 'Joaquín Suárez', 'Treinta y Tres', 'Uruguay', '1956-02-11', 'F', '2013-12-19 00:00:00', NULL, 1),
(857, 'Alex', 'Bradnam', 'abradnamnh@vkontakte.ru', 49704691, '45565785', NULL, NULL, '385 Russell Park', 'La Floresta', 'Lavalleja', 'Uruguay', '1955-06-24', 'F', '2018-01-27 00:00:00', NULL, 0),
(858, 'Candida', 'Dannel', 'cdannelni@com.com', 31531810, '37777839', NULL, NULL, '647 Barnett Place', 'San Bautista', 'Río Negro', 'Uruguay', '1961-07-12', 'F', '2012-11-05 00:00:00', NULL, 0),
(859, 'Bobbye', 'Lamkin', 'blamkinnj@icq.com', 34413799, '23331137', NULL, NULL, '949 Ridge Oak Junction', 'Las Toscas', 'Lavalleja', 'Uruguay', '1978-08-02', 'F', '2018-06-07 00:00:00', NULL, 1),
(860, 'Marleen', 'Freddi', 'mfreddink@businessweek.com', 46556224, '31363960', NULL, NULL, '66 Eastlawn Lane', 'Juan L. Lacaze', 'Soriano', 'Uruguay', '1952-12-11', 'F', '2016-11-19 00:00:00', NULL, 0),
(861, 'Eric', 'Shotton', 'eshottonnl@bbc.co.uk', 35693858, '36924996', NULL, NULL, '55 Blackbird Crossing', 'Colonia Nicolich', 'Paysandú', 'Uruguay', '1983-09-08', 'M', '2012-12-02 00:00:00', NULL, 0),
(862, 'Marcelline', 'Cheine', 'mcheinenm@bizjournals.com', 34583165, '26412169', NULL, NULL, '8386 Chive Circle', 'Pan de Azúcar', 'Montevideo', 'Uruguay', '1989-03-08', 'F', '2015-02-02 00:00:00', NULL, 1),
(863, 'Marin', 'Radsdale', 'mradsdalenn@mediafire.com', 39484441, '44744853', NULL, NULL, '13 Brentwood Lane', 'Palmitas', 'Salto', 'Uruguay', '1986-11-18', 'F', '2013-03-26 00:00:00', NULL, 1),
(864, 'Margret', 'Pobjay', 'mpobjayno@yolasite.com', 40386030, '23112337', NULL, NULL, '239 Goodland Road', 'Aguas Corrientes', 'Durazno', 'Uruguay', '1978-04-21', 'F', '2013-02-14 00:00:00', NULL, 1),
(865, 'Tymon', 'Tommaseo', 'ttommaseonp@chron.com', 38319416, '31815856', NULL, NULL, '3883 Center Point', 'Juan L. Lacaze', 'Durazno', 'Uruguay', '1991-11-06', 'M', '2019-02-24 00:00:00', NULL, 0),
(866, 'Bronny', 'Bruhn', 'bbruhnnq@wsj.com', 53404105, '25090222', NULL, NULL, '13 Fair Oaks Park', 'Mariscala', 'Treinta y Tres', 'Uruguay', '1997-06-03', 'M', '2015-11-24 00:00:00', NULL, 1),
(867, 'Zelma', 'Dudley', 'zdudleynr@phpbb.com', 42782426, '35848714', NULL, NULL, '296 Northland Place', 'Treinta y Tres', 'Cerro Largo', 'Uruguay', '1965-03-16', 'F', '2017-03-29 00:00:00', NULL, 0),
(868, 'Willetta', 'Rolfs', 'wrolfsns@flavors.me', 53032540, '21342817', NULL, NULL, '469 Red Cloud Parkway', 'Santa Rosa', 'Montevideo', 'Uruguay', '1986-05-21', 'F', '2014-03-07 00:00:00', NULL, 0),
(869, 'Ari', 'Pierse', 'apiersent@yellowbook.com', 57299725, '41079110', NULL, NULL, '512 Petterle Parkway', 'Tala', 'Salto', 'Uruguay', '1989-12-02', 'M', '2012-04-02 00:00:00', NULL, 0),
(870, 'Allie', 'Tomley', 'atomleynu@army.mil', 33977602, '22358162', NULL, NULL, '5641 Bluejay Lane', 'Cardal', 'Artigas', 'Uruguay', '1976-10-11', 'F', '2011-10-14 00:00:00', NULL, 0),
(871, 'Kermie', 'Klulicek', 'kkluliceknv@friendfeed.com', 38174266, '38121076', NULL, NULL, '5 Upham Trail', 'Vergara', 'Maldonado', 'Uruguay', '1964-01-26', 'M', '2017-08-18 00:00:00', NULL, 0),
(872, 'Wallis', 'Saylor', 'wsaylornw@netvibes.com', 45214480, '36681599', NULL, NULL, '55 Annamark Circle', 'San Ramón', 'Tacuarembó', 'Uruguay', '1957-09-01', 'F', '2018-06-28 00:00:00', NULL, 1),
(873, 'Keenan', 'Whitaker', 'kwhitakernx@blogger.com', 42307973, '34551289', NULL, NULL, '288 Holy Cross Alley', 'Belén', 'Artigas', 'Uruguay', '1972-01-07', 'M', '2016-06-28 00:00:00', NULL, 0),
(874, 'Ammamaria', 'Shipway', 'ashipwayny@creativecommons.org', 44929496, '27532447', NULL, NULL, '507 Blaine Center', 'Santa Bernardina', 'Lavalleja', 'Uruguay', '1967-04-21', 'F', '2013-06-18 00:00:00', NULL, 0),
(875, 'Rabi', 'Croser', 'rcrosernz@about.com', 43651387, '35313945', NULL, NULL, '94970 Northland Avenue', 'Cardal', 'Soriano', 'Uruguay', '1954-03-18', 'M', '2011-08-29 00:00:00', NULL, 0),
(876, 'Isa', 'McGinn', 'imcginno0@marketwatch.com', 56943122, '41577587', NULL, NULL, '39627 Dakota Place', 'Santa Catalina', 'Rivera', 'Uruguay', '1960-02-08', 'F', '2010-09-28 00:00:00', NULL, 1),
(877, 'Willy', 'Galgey', 'wgalgeyo1@bing.com', 37792882, '36537430', NULL, NULL, '6962 Towne Lane', 'Paso de Carrasco', 'Colonia', 'Uruguay', '1973-01-22', 'F', '2019-01-24 00:00:00', NULL, 0),
(878, 'Ruthi', 'Ebbutt', 'rebbutto2@chron.com', 45959070, '27765870', NULL, NULL, '71 Tony Parkway', 'Delta del Tigre', 'San José', 'Uruguay', '1961-07-16', 'F', '2017-12-13 00:00:00', NULL, 0),
(879, 'Dawna', 'Pottinger', 'dpottingero3@disqus.com', 32461365, '23856428', NULL, NULL, '65 Brickson Park Drive', 'Belén', 'Cerro Largo', 'Uruguay', '1968-04-01', 'F', '2014-12-22 00:00:00', NULL, 1),
(880, 'Flor', 'Norval', 'fnorvalo4@blinklist.com', 54132869, '28322644', NULL, NULL, '71761 Algoma Court', 'Salto', 'Lavalleja', 'Uruguay', '1970-09-28', 'F', '2012-07-04 00:00:00', NULL, 0),
(881, 'Bobby', 'Toolin', 'btoolino5@slideshare.net', 37432665, '42019898', NULL, NULL, '9 Orin Crossing', 'Joaquín Suárez', 'Rocha', 'Uruguay', '1977-03-13', 'F', '2016-01-07 00:00:00', NULL, 1),
(882, 'Monro', 'Seers', 'mseerso6@springer.com', 42218818, '24615836', NULL, NULL, '4 Schlimgen Junction', 'Punta del Este', 'Florida', 'Uruguay', '1998-06-04', 'M', '2011-01-25 00:00:00', NULL, 1),
(883, 'Rafe', 'Flexman', 'rflexmano7@is.gd', 39993725, '38994760', NULL, NULL, '2 Rutledge Alley', 'Las Toscas', 'Florida', 'Uruguay', '1967-09-06', 'M', '2011-07-28 00:00:00', NULL, 1),
(884, 'Jeri', 'Gutsell', 'jgutsello8@pcworld.com', 49297811, '35320837', NULL, NULL, '25806 Messerschmidt Trail', 'Progreso', 'San José', 'Uruguay', '1981-02-15', 'F', '2018-06-12 00:00:00', NULL, 1),
(885, 'Bird', 'Hastwell', 'bhastwello9@twitter.com', 52701102, '31481171', NULL, NULL, '89 Vernon Junction', 'Soriano', 'Flores', 'Uruguay', '1994-02-12', 'F', '2015-03-17 00:00:00', NULL, 0),
(886, 'Johannah', 'Verling', 'jverlingoa@comcast.net', 49779681, '46326696', NULL, NULL, '48681 Moland Pass', 'Villa del Carmen', 'Cerro Largo', 'Uruguay', '1962-03-07', 'F', '2012-01-04 00:00:00', NULL, 0),
(887, 'Analiese', 'Eburne', 'aeburneob@wiley.com', 42372404, '35327006', NULL, NULL, '96 Shoshone Place', 'Santa Rosa', 'Salto', 'Uruguay', '1973-08-24', 'F', '2014-06-09 00:00:00', NULL, 0),
(888, 'Ingemar', 'Melbert', 'imelbertoc@economist.com', 54170233, '46328588', NULL, NULL, '29 Eagle Crest Circle', 'San Bautista', 'Artigas', 'Uruguay', '1997-02-16', 'M', '2010-07-29 00:00:00', NULL, 1),
(889, 'Sybila', 'Ort', 'sortod@theguardian.com', 58033244, '30439994', NULL, NULL, '3361 Donald Plaza', 'Belén', 'Cerro Largo', 'Uruguay', '1961-09-24', 'F', '2010-08-30 00:00:00', NULL, 1),
(890, 'Rich', 'Dabel', 'rdabeloe@github.io', 46391081, '45432042', NULL, NULL, '62 Del Sol Avenue', 'Trinidad', 'San José', 'Uruguay', '1957-03-24', 'M', '2018-12-19 00:00:00', NULL, 1),
(891, 'Clarita', 'Vegas', 'cvegasof@yelp.com', 45752201, '41482550', NULL, NULL, '04883 Kipling Parkway', 'Cerro Colorado', 'Montevideo', 'Uruguay', '1981-01-09', 'F', '2018-12-19 00:00:00', NULL, 1),
(892, 'Noelyn', 'Roddell', 'nroddellog@squarespace.com', 51029755, '27519081', NULL, NULL, '48665 Pierstorff Point', 'Castillos', 'Paysandú', 'Uruguay', '1978-09-07', 'F', '2010-10-15 00:00:00', NULL, 0),
(893, 'Nance', 'Warmington', 'nwarmingtonoh@squarespace.com', 32614443, '43741165', NULL, NULL, '4270 Northfield Lane', 'Colonia Nicolich', 'Flores', 'Uruguay', '1996-12-28', 'F', '2018-01-24 00:00:00', NULL, 1),
(894, 'Halsy', 'Otham', 'hothamoi@cdc.gov', 49555280, '37245535', NULL, NULL, '2 Hagan Road', 'Vergara', 'Rivera', 'Uruguay', '1960-05-01', 'M', '2011-02-03 00:00:00', NULL, 1),
(895, 'Shelbi', 'Bletsoe', 'sbletsoeoj@people.com.cn', 52824985, '28912198', NULL, NULL, '5 School Way', 'Joaquín Suárez', 'Paysandú', 'Uruguay', '1971-07-10', 'F', '2017-10-22 00:00:00', NULL, 1),
(896, 'Emmit', 'Thornton', 'ethorntonok@altervista.org', 48920991, '44136513', NULL, NULL, '186 Northwestern Road', 'Ecilda Paullier', 'Maldonado', 'Uruguay', '1986-07-03', 'M', '2013-07-27 00:00:00', NULL, 0),
(897, 'Winonah', 'Semerad', 'wsemeradol@slashdot.org', 34890253, '21760744', NULL, NULL, '94269 Monument Hill', 'La Floresta', 'Maldonado', 'Uruguay', '1966-08-05', 'F', '2011-09-06 00:00:00', NULL, 0),
(898, 'Bree', 'Blaszczyk', 'bblaszczykom@imdb.com', 35566135, '20084904', NULL, NULL, '4 School Street', 'Fray Bentos', 'Colonia', 'Uruguay', '1967-09-16', 'F', '2016-10-29 00:00:00', NULL, 0),
(899, 'Leeanne', 'Burtwhistle', 'lburtwhistleon@slate.com', 47079316, '43915056', NULL, NULL, '26174 Summer Ridge Lane', 'Cardal', 'Maldonado', 'Uruguay', '1954-01-29', 'F', '2017-08-09 00:00:00', NULL, 1),
(900, 'Horatius', 'Lawley', 'hlawleyoo@altervista.org', 59844750, '46351748', NULL, NULL, '6 Harbort Lane', 'Paso de Carrasco', 'Treinta y Tres', 'Uruguay', '1977-10-10', 'M', '2014-07-08 00:00:00', NULL, 0),
(901, 'Fleurette', 'Allridge', 'fallridgeop@yolasite.com', 45017926, '41292497', NULL, NULL, '1553 Warner Plaza', 'Santiago Vázquez', 'San José', 'Uruguay', '1959-08-03', 'F', '2014-02-23 00:00:00', NULL, 1),
(902, 'Natal', 'Jewett', 'njewettoq@ihg.com', 49228259, '39935152', NULL, NULL, '6512 Shasta Trail', 'La Paz', 'Colonia', 'Uruguay', '1978-04-07', 'M', '2011-06-19 00:00:00', NULL, 1),
(903, 'Lucita', 'Kingsnode', 'lkingsnodeor@economist.com', 51534083, '37689261', NULL, NULL, '82 6th Avenue', 'Tupambaé', 'Tacuarembó', 'Uruguay', '1964-08-22', 'F', '2016-11-02 00:00:00', NULL, 0),
(904, 'Kariotta', 'Sicily', 'ksicilyos@woothemes.com', 52890740, '46205745', NULL, NULL, '049 Hallows Circle', 'Tarariras', 'Lavalleja', 'Uruguay', '1988-11-23', 'F', '2018-12-11 00:00:00', NULL, 1),
(905, 'Tyrone', 'Irving', 'tirvingot@miitbeian.gov.cn', 31841957, '26538769', NULL, NULL, '4019 Crest Line Way', 'La Paloma', 'Colonia', 'Uruguay', '1965-05-30', 'M', '2017-09-28 00:00:00', NULL, 0),
(906, 'Nickola', 'Sentance', 'nsentanceou@github.com', 43840482, '41091988', NULL, NULL, '10 Pleasure Road', 'Santa Catalina', 'Salto', 'Uruguay', '1991-10-12', 'M', '2011-01-25 00:00:00', NULL, 0),
(907, 'Fleurette', 'Extal', 'fextalov@slashdot.org', 33960549, '32531736', NULL, NULL, '97569 Ludington Road', 'Quebracho', 'Soriano', 'Uruguay', '1976-11-07', 'F', '2014-08-10 00:00:00', NULL, 0),
(908, 'Syman', 'Bawles', 'sbawlesow@cocolog-nifty.com', 45734614, '43200344', NULL, NULL, '68675 Buell Center', 'Vergara', 'Paysandú', 'Uruguay', '1960-01-08', 'M', '2016-02-10 00:00:00', NULL, 1),
(909, 'Ebonee', 'Ness', 'enessox@scribd.com', 58798260, '21752872', NULL, NULL, '3 Glacier Hill Terrace', 'Punta del Este', 'Lavalleja', 'Uruguay', '1955-07-23', 'F', '2012-07-07 00:00:00', NULL, 1),
(910, 'Samara', 'O\'Donoghue', 'sodonoghueoy@engadget.com', 42356111, '39685552', NULL, NULL, '4368 Lighthouse Bay Road', 'Cerro Colorado', 'Rocha', 'Uruguay', '1977-09-09', 'F', '2010-05-10 00:00:00', NULL, 0),
(911, 'Minor', 'Oulett', 'moulettoz@youku.com', 35762644, '47333965', NULL, NULL, '796 Rusk Road', 'Delta del Tigre', 'Rocha', 'Uruguay', '1953-03-17', 'M', '2017-07-23 00:00:00', NULL, 1),
(912, 'Liliane', 'Presidey', 'lpresideyp0@printfriendly.com', 41157835, '41901505', NULL, NULL, '88636 Pepper Wood Court', 'La Paz', 'Rivera', 'Uruguay', '1986-09-06', 'F', '2011-11-11 00:00:00', NULL, 0),
(913, 'Kim', 'Scoggin', 'kscogginp1@ning.com', 51844682, '42911948', NULL, NULL, '86142 Clove Street', 'San Ramón', 'Colonia', 'Uruguay', '1989-08-22', 'F', '2016-05-03 00:00:00', NULL, 0),
(914, 'Meryl', 'Jakubski', 'mjakubskip2@upenn.edu', 37579825, '42082864', NULL, NULL, '6170 Mariners Cove Street', 'Progreso', 'Río Negro', 'Uruguay', '1981-03-17', 'M', '2014-04-07 00:00:00', NULL, 1),
(915, 'Robbie', 'Perrott', 'rperrottp3@prnewswire.com', 54870836, '35130412', NULL, NULL, '633 Carey Court', 'Los Cerrillos', 'Treinta y Tres', 'Uruguay', '1977-02-01', 'F', '2013-05-30 00:00:00', NULL, 1),
(916, 'Mitchell', 'Flury', 'mfluryp4@ow.ly', 52152890, '43267609', NULL, NULL, '65 Summit Crossing', 'Nuevo Berlín', 'Cerro Largo', 'Uruguay', '1965-11-06', 'M', '2015-05-13 00:00:00', NULL, 1),
(917, 'Nikolaus', 'Batrim', 'nbatrimp5@gnu.org', 52232259, '35677327', NULL, NULL, '04987 Alpine Plaza', 'Sauce', 'Treinta y Tres', 'Uruguay', '1987-10-22', 'M', '2013-06-23 00:00:00', NULL, 1),
(918, 'Eugenia', 'Illing', 'eillingp6@businessweek.com', 52977180, '46136028', NULL, NULL, '3 Artisan Trail', 'Joaquín Suárez', 'Salto', 'Uruguay', '1974-08-07', 'F', '2017-01-03 00:00:00', NULL, 1),
(919, 'Celisse', 'Macari', 'cmacarip7@eepurl.com', 36368066, '40075871', NULL, NULL, '0543 Fremont Terrace', 'San José de Mayo', 'Montevideo', 'Uruguay', '1965-05-22', 'F', '2015-04-02 00:00:00', NULL, 0),
(920, 'Darren', 'Cogzell', 'dcogzellp8@cdbaby.com', 59802521, '38574887', NULL, NULL, '28780 Michigan Plaza', 'Treinta y Tres', 'Florida', 'Uruguay', '1974-11-25', 'M', '2013-01-10 00:00:00', NULL, 1),
(921, 'Massimiliano', 'Vedmore', 'mvedmorep9@army.mil', 53301765, '40605127', NULL, NULL, '2 Delladonna Junction', 'Tupambaé', 'Tacuarembó', 'Uruguay', '1957-11-18', 'M', '2018-12-14 00:00:00', NULL, 0),
(922, 'Cash', 'Othick', 'cothickpa@biblegateway.com', 40852346, '47960206', NULL, NULL, '7 Maryland Center', 'Maldonado', 'Canelones', 'Uruguay', '1990-11-28', 'M', '2018-11-15 00:00:00', NULL, 1),
(923, 'Waneta', 'Brightey', 'wbrighteypb@amazon.co.jp', 47897433, '33214350', NULL, NULL, '684 Reinke Center', 'La Paz', 'Tacuarembó', 'Uruguay', '1952-02-28', 'F', '2018-10-24 00:00:00', NULL, 0),
(924, 'Brook', 'Hallor', 'bhallorpc@meetup.com', 55526147, '22167643', NULL, NULL, '61 Aberg Avenue', 'Pando', 'Rocha', 'Uruguay', '1990-07-01', 'M', '2011-05-13 00:00:00', NULL, 1),
(925, 'Lucais', 'Parmby', 'lparmbypd@businessinsider.com', 44271966, '34577623', NULL, NULL, '5696 Lakeland Plaza', 'Los Cerrillos', 'Salto', 'Uruguay', '1985-12-15', 'M', '2016-06-30 00:00:00', NULL, 1),
(926, 'Sara-ann', 'Wallentin', 'swallentinpe@sfgate.com', 49254230, '40456230', NULL, NULL, '95 Old Shore Court', 'Porvenir', 'Lavalleja', 'Uruguay', '1995-03-27', 'F', '2010-07-10 00:00:00', NULL, 1),
(927, 'Greta', 'Sudy', 'gsudypf@51.la', 50747749, '25102113', NULL, NULL, '27 Helena Pass', 'Young', 'San José', 'Uruguay', '1989-09-24', 'F', '2012-04-14 00:00:00', NULL, 1),
(928, 'Trina', 'Frounks', 'tfrounkspg@smh.com.au', 51053354, '41349013', NULL, NULL, '2700 Petterle Road', 'Dolores', 'Lavalleja', 'Uruguay', '1998-08-06', 'F', '2016-01-04 00:00:00', NULL, 1),
(929, 'Sallyanne', 'Adamec', 'sadamecph@php.net', 36478547, '48852941', NULL, NULL, '3 Elmside Point', 'Trinidad', 'Rivera', 'Uruguay', '1980-10-10', 'F', '2017-10-16 00:00:00', NULL, 1),
(930, 'Babara', 'Cheeseman', 'bcheesemanpi@com.com', 34056045, '27654269', NULL, NULL, '8 Oriole Drive', 'Santiago Vázquez', 'Colonia', 'Uruguay', '1978-04-16', 'F', '2017-09-08 00:00:00', NULL, 1),
(931, 'Ulrike', 'Scole', 'uscolepj@ca.gov', 53809834, '21680142', NULL, NULL, '8 Macpherson Court', 'Santa Catalina', 'Salto', 'Uruguay', '1972-06-26', 'F', '2016-02-13 00:00:00', NULL, 1),
(932, 'Madlen', 'Meates', 'mmeatespk@dyndns.org', 36876044, '36114619', NULL, NULL, '37042 Laurel Court', 'Tala', 'Artigas', 'Uruguay', '1966-10-23', 'F', '2019-02-13 00:00:00', NULL, 1),
(933, 'Kristi', 'Lister', 'klisterpl@squidoo.com', 56599008, '26931405', NULL, NULL, '093 Miller Court', 'Delta del Tigre', 'Montevideo', 'Uruguay', '1994-09-27', 'F', '2018-10-11 00:00:00', NULL, 1),
(934, 'Sheridan', 'Heliot', 'sheliotpm@smh.com.au', 35232155, '42004194', NULL, NULL, '1 Graceland Plaza', 'Mercedes', 'Salto', 'Uruguay', '1981-11-17', 'M', '2014-11-01 00:00:00', NULL, 0),
(935, 'Janette', 'Menere', 'jmenerepn@nytimes.com', 46575337, '20477648', NULL, NULL, '6027 Caliangt Terrace', 'Florencio Sánchez', 'Rivera', 'Uruguay', '1988-10-11', 'F', '2017-01-14 00:00:00', NULL, 1),
(936, 'Angelle', 'Zorzetti', 'azorzettipo@dot.gov', 48871758, '44851461', NULL, NULL, '84 Moulton Way', 'Paso de Carrasco', 'Río Negro', 'Uruguay', '1968-09-16', 'F', '2015-12-25 00:00:00', NULL, 1),
(937, 'Hamid', 'Elcoat', 'helcoatpp@devhub.com', 37844579, '24818232', NULL, NULL, '1501 Orin Street', 'Bella Unión', 'Artigas', 'Uruguay', '1975-08-19', 'M', '2013-06-29 00:00:00', NULL, 1),
(938, 'Bear', 'Nichol', 'bnicholpq@shutterfly.com', 58188378, '28712459', NULL, NULL, '47670 Merrick Pass', 'Pan de Azúcar', 'Soriano', 'Uruguay', '1955-02-28', 'M', '2013-07-04 00:00:00', NULL, 0),
(939, 'Kim', 'Feaveryear', 'kfeaveryearpr@pinterest.com', 44441144, '42937288', NULL, NULL, '56 Warrior Street', 'San José de Mayo', 'Cerro Largo', 'Uruguay', '1953-08-06', 'M', '2015-01-25 00:00:00', NULL, 1),
(940, 'Adolpho', 'Marc', 'amarcps@ning.com', 45946088, '44300075', NULL, NULL, '9872 Mendota Point', 'Aguas Corrientes', 'Artigas', 'Uruguay', '1984-09-08', 'M', '2013-07-02 00:00:00', NULL, 1),
(941, 'Jenifer', 'Wooff', 'jwooffpt@utexas.edu', 33733602, '26985162', NULL, NULL, '40441 Dwight Trail', 'Cerro Colorado', 'Canelones', 'Uruguay', '1999-01-07', 'F', '2014-11-03 00:00:00', NULL, 1),
(942, 'Teena', 'Philler', 'tphillerpu@spiegel.de', 39897134, '43581092', NULL, NULL, '9882 North Court', 'Punta del Este', 'Soriano', 'Uruguay', '1993-11-25', 'F', '2014-01-07 00:00:00', NULL, 1),
(943, 'Bessie', 'Folshom', 'bfolshompv@sohu.com', 44150463, '26229893', NULL, NULL, '8 Grasskamp Road', 'Porvenir', 'Salto', 'Uruguay', '1955-04-18', 'F', '2018-09-22 00:00:00', NULL, 0),
(944, 'Stacee', 'Patten', 'spattenpw@drupal.org', 45791783, '30020878', NULL, NULL, '25151 Warner Street', 'La Floresta', 'Soriano', 'Uruguay', '1975-08-10', 'M', '2016-01-26 00:00:00', NULL, 1),
(945, 'James', 'Polet', 'jpoletpx@statcounter.com', 45104783, '33612473', NULL, NULL, '3979 Redwing Place', 'Lascano', 'Durazno', 'Uruguay', '1967-08-27', 'M', '2019-02-07 00:00:00', NULL, 1),
(946, 'Dacey', 'Brennon', 'dbrennonpy@ftc.gov', 42358420, '22860333', NULL, NULL, '12 Summerview Hill', 'Porvenir', 'Río Negro', 'Uruguay', '1959-10-09', 'F', '2015-12-08 00:00:00', NULL, 0),
(947, 'Birk', 'Tinson', 'btinsonpz@epa.gov', 42539045, '33758014', NULL, NULL, '9 Debs Way', 'Tarariras', 'Salto', 'Uruguay', '1959-01-31', 'M', '2014-04-09 00:00:00', NULL, 0),
(948, 'Shel', 'Trewhella', 'strewhellaq0@slashdot.org', 50910965, '33376618', NULL, NULL, '0102 Londonderry Junction', 'Soca', 'Maldonado', 'Uruguay', '1986-04-27', 'F', '2011-12-16 00:00:00', NULL, 1),
(949, 'Annaliese', 'Hutchens', 'ahutchensq1@cam.ac.uk', 50546684, '42265830', NULL, NULL, '31 Manufacturers Avenue', 'Vichadero', 'Salto', 'Uruguay', '1954-03-31', 'F', '2017-10-14 00:00:00', NULL, 0),
(950, 'Emmy', 'Irdale', 'eirdaleq2@noaa.gov', 54891918, '47896925', NULL, NULL, '6202 Redwing Plaza', 'San Ramón', 'Tacuarembó', 'Uruguay', '1981-06-13', 'F', '2011-01-15 00:00:00', NULL, 0),
(951, 'Reuven', 'Balsom', 'rbalsomq3@wix.com', 32440625, '47619938', NULL, NULL, '050 Beilfuss Place', 'La Paz', 'Artigas', 'Uruguay', '1984-09-09', 'M', '2013-03-20 00:00:00', NULL, 1),
(952, 'Gladys', 'Frankland', 'gfranklandq4@1und1.de', 57909404, '41854676', NULL, NULL, '113 Pennsylvania Parkway', 'La Paloma', 'Artigas', 'Uruguay', '1999-03-28', 'F', '2018-03-12 00:00:00', NULL, 1),
(953, 'Ariel', 'Fortin', 'afortinq5@blogtalkradio.com', 46342616, '34844284', NULL, NULL, '29874 Bartelt Center', 'La Paz', 'Colonia', 'Uruguay', '1991-02-24', 'M', '2018-05-27 00:00:00', NULL, 1),
(954, 'Aldo', 'MacGaughy', 'amacgaughyq6@hao123.com', 45773494, '23732059', NULL, NULL, '598 Redwing Way', 'Colonia Nicolich', 'Rivera', 'Uruguay', '1995-06-24', 'M', '2014-04-06 00:00:00', NULL, 0),
(955, 'Jammal', 'Cloughton', 'jcloughtonq7@photobucket.com', 41406202, '41311413', NULL, NULL, '8794 Mendota Plaza', 'Rivera', 'Cerro Largo', 'Uruguay', '1953-04-14', 'M', '2014-03-23 00:00:00', NULL, 0),
(956, 'Rozella', 'McCallion', 'rmccallionq8@discovery.com', 43366104, '39498565', NULL, NULL, '796 Golden Leaf Junction', 'San Bautista', 'Canelones', 'Uruguay', '1979-11-27', 'F', '2016-10-13 00:00:00', NULL, 1),
(957, 'Rawley', 'Mathwen', 'rmathwenq9@nationalgeographic.com', 46462563, '36541691', NULL, NULL, '1 Oak Valley Place', 'Tala', 'Maldonado', 'Uruguay', '1961-11-30', 'M', '2016-08-21 00:00:00', NULL, 1),
(958, 'Kimball', 'Craythorne', 'kcraythorneqa@com.com', 31131315, '36701490', NULL, NULL, '2 Hermina Park', 'Young', 'Montevideo', 'Uruguay', '1984-03-27', 'M', '2014-03-06 00:00:00', NULL, 0),
(959, 'Haroun', 'Cleator', 'hcleatorqb@springer.com', 50524081, '39301962', NULL, NULL, '139 Di Loreto Court', 'Santa Bernardina', 'Lavalleja', 'Uruguay', '1982-06-18', 'M', '2012-03-28 00:00:00', NULL, 0),
(960, 'Nathanael', 'Kleimt', 'nkleimtqc@mit.edu', 30665076, '30614035', NULL, NULL, '6 Johnson Park', 'Fray Bentos', 'Flores', 'Uruguay', '1975-12-29', 'M', '2017-02-15 00:00:00', NULL, 0),
(961, 'Ivie', 'Maisey', 'imaiseyqd@pinterest.com', 42306592, '43195637', NULL, NULL, '87 Kinsman Lane', 'San José de Mayo', 'San José', 'Uruguay', '1961-01-21', 'F', '2016-05-08 00:00:00', NULL, 0),
(962, 'Dominga', 'Beedle', 'dbeedleqe@umn.edu', 32648915, '44519304', NULL, NULL, '44763 Golf Course Pass', 'Belén', 'Colonia', 'Uruguay', '1958-05-03', 'F', '2014-05-24 00:00:00', NULL, 0),
(963, 'Micheil', 'Brecknell', 'mbrecknellqf@photobucket.com', 32143988, '26804499', NULL, NULL, '85 Lerdahl Pass', 'Delta del Tigre', 'San José', 'Uruguay', '1982-01-26', 'M', '2017-12-23 00:00:00', NULL, 0),
(964, 'Ursula', 'Methuen', 'umethuenqg@fda.gov', 59995272, '22821222', NULL, NULL, '5 Prentice Point', 'Colonia Nicolich', 'Soriano', 'Uruguay', '1998-05-31', 'F', '2016-06-07 00:00:00', NULL, 0),
(965, 'Octavius', 'Karlowicz', 'okarlowiczqh@oakley.com', 31382664, '26550660', NULL, NULL, '39679 Coolidge Pass', 'Baltasar Brum', 'Soriano', 'Uruguay', '1969-06-18', 'M', '2012-08-07 00:00:00', NULL, 1),
(966, 'Kelly', 'Langhorn', 'klanghornqi@cpanel.net', 47572239, '38156249', NULL, NULL, '070 Pepper Wood Lane', 'Trinidad', 'Canelones', 'Uruguay', '1966-04-26', 'F', '2017-12-27 00:00:00', NULL, 1),
(967, 'Clotilda', 'Tafani', 'ctafaniqj@forbes.com', 59332642, '26296557', NULL, NULL, '3 Judy Park', 'La Paloma', 'Lavalleja', 'Uruguay', '1997-05-04', 'F', '2017-04-20 00:00:00', NULL, 1),
(968, 'Olwen', 'Rubertis', 'orubertisqk@google.co.uk', 34101376, '41867637', NULL, NULL, '26 Kingsford Drive', 'Soca', 'San José', 'Uruguay', '1982-07-15', 'F', '2010-09-19 00:00:00', NULL, 0),
(969, 'Delmor', 'Lettington', 'dlettingtonql@hud.gov', 41704978, '36880867', NULL, NULL, '197 Orin Park', 'Mercedes', 'Treinta y Tres', 'Uruguay', '1996-05-10', 'M', '2015-05-24 00:00:00', NULL, 0),
(970, 'Marsh', 'Slowcock', 'mslowcockqm@whitehouse.gov', 32435312, '39007818', NULL, NULL, '0 Petterle Trail', 'Los Cerrillos', 'Río Negro', 'Uruguay', '1979-10-06', 'M', '2017-06-22 00:00:00', NULL, 1),
(971, 'Trudie', 'Wissbey', 'twissbeyqn@yellowpages.com', 40034533, '44186739', NULL, NULL, '3 Debs Place', 'San Ramón', 'Tacuarembó', 'Uruguay', '1952-09-02', 'F', '2010-12-21 00:00:00', NULL, 0),
(972, 'Bondon', 'Bancroft', 'bbancroftqo@un.org', 58414564, '23016739', NULL, NULL, '27206 Weeping Birch Crossing', 'Treinta y Tres', 'Río Negro', 'Uruguay', '1968-05-27', 'M', '2016-07-30 00:00:00', NULL, 0),
(973, 'Conan', 'Shea', 'csheaqp@desdev.cn', 50621674, '28497792', NULL, NULL, '127 Heath Drive', 'Nueva Helvecia', 'Soriano', 'Uruguay', '1978-10-21', 'M', '2013-06-14 00:00:00', NULL, 0),
(974, 'Constanta', 'Goulden', 'cgouldenqq@washington.edu', 31688425, '38054161', NULL, NULL, '09 Novick Way', 'Durazno', 'Durazno', 'Uruguay', '1982-07-06', 'F', '2014-06-09 00:00:00', NULL, 0),
(975, 'Alyce', 'Castleton', 'acastletonqr@google.nl', 44868699, '38675936', NULL, NULL, '9117 Judy Plaza', 'Quebracho', 'Canelones', 'Uruguay', '1997-06-15', 'F', '2010-06-13 00:00:00', NULL, 1),
(976, 'Kalle', 'Braunter', 'kbraunterqs@guardian.co.uk', 47724646, '28490054', NULL, NULL, '4 La Follette Plaza', 'La Paz', 'Florida', 'Uruguay', '1963-10-15', 'M', '2012-09-23 00:00:00', NULL, 1),
(977, 'Kevon', 'Dedman', 'kdedmanqt@weibo.com', 45787747, '31785942', NULL, NULL, '92476 Toban Terrace', 'San Javier', 'Cerro Largo', 'Uruguay', '1991-10-31', 'M', '2010-09-10 00:00:00', NULL, 1),
(978, 'Hagen', 'Jouannisson', 'hjouannissonqu@cpanel.net', 31700092, '30212732', NULL, NULL, '462 Lake View Avenue', 'Aguas Corrientes', 'Rivera', 'Uruguay', '1989-09-13', 'M', '2014-02-03 00:00:00', NULL, 0),
(979, 'Franciskus', 'Soal', 'fsoalqv@blogspot.com', 35508832, '39183001', NULL, NULL, '1 Scoville Center', 'Tarariras', 'Lavalleja', 'Uruguay', '1976-08-03', 'M', '2012-05-31 00:00:00', NULL, 1),
(980, 'Bunny', 'Dimitrijevic', 'bdimitrijevicqw@oaic.gov.au', 42938141, '37300381', NULL, NULL, '09274 Melody Way', 'Tarariras', 'Rocha', 'Uruguay', '1964-10-12', 'F', '2016-06-18 00:00:00', NULL, 1),
(981, 'Aura', 'Heaslip', 'aheaslipqx@google.com', 56638425, '48882109', NULL, NULL, '2 Dexter Alley', 'Progreso', 'Rocha', 'Uruguay', '1955-07-15', 'F', '2013-08-11 00:00:00', NULL, 0),
(982, 'Aimee', 'Coules', 'acoulesqy@hhs.gov', 44330925, '36665146', NULL, NULL, '9 Toban Center', 'Cerro Colorado', 'San José', 'Uruguay', '1974-06-05', 'F', '2010-11-08 00:00:00', NULL, 1),
(983, 'Brod', 'Murcott', 'bmurcottqz@upenn.edu', 45051208, '45952186', NULL, NULL, '3 Milwaukee Circle', 'Soca', 'Rivera', 'Uruguay', '1983-02-11', 'M', '2018-12-10 00:00:00', NULL, 1),
(984, 'Silvain', 'Danko', 'sdankor0@123-reg.co.uk', 59408241, '20193064', NULL, NULL, '98 Mesta Circle', 'Los Cerrillos', 'Rivera', 'Uruguay', '1959-06-11', 'M', '2010-11-27 00:00:00', NULL, 1),
(985, 'Julius', 'Cunradi', 'jcunradir1@rediff.com', 35740863, '28617336', NULL, NULL, '6351 Jenna Place', 'Santiago Vázquez', 'Montevideo', 'Uruguay', '1969-03-19', 'M', '2013-10-18 00:00:00', NULL, 0),
(986, 'Viviene', 'Boldison', 'vboldisonr2@jugem.jp', 33552758, '45703343', NULL, NULL, '22157 Loftsgordon Drive', 'Trinidad', 'Cerro Largo', 'Uruguay', '1996-01-17', 'F', '2019-04-11 00:00:00', NULL, 1),
(987, 'Jaquith', 'Karolyi', 'jkarolyir3@ow.ly', 36230551, '40255331', NULL, NULL, '8248 Roxbury Way', 'Santa Bernardina', 'Florida', 'Uruguay', '1991-08-18', 'F', '2015-12-16 00:00:00', NULL, 0),
(988, 'Portie', 'Reader', 'preaderr4@nps.gov', 50204111, '27801322', NULL, NULL, '0 Sunfield Center', 'La Floresta', 'Maldonado', 'Uruguay', '1972-11-28', 'M', '2011-07-24 00:00:00', NULL, 1),
(989, 'Joyan', 'Stuehmeyer', 'jstuehmeyerr5@ustream.tv', 51001328, '42036530', NULL, NULL, '285 Stone Corner Park', 'Palmitas', 'Maldonado', 'Uruguay', '1984-03-26', 'F', '2010-12-27 00:00:00', NULL, 0),
(990, 'Geralda', 'Meenehan', 'gmeenehanr6@altervista.org', 54935302, '42542818', NULL, NULL, '030 Jackson Road', 'Florida', 'Flores', 'Uruguay', '1994-09-02', 'F', '2018-07-23 00:00:00', NULL, 0),
(991, 'Kelvin', 'MacLachlan', 'kmaclachlanr7@discuz.net', 53598343, '23129445', NULL, NULL, '0341 Graedel Parkway', 'Dolores', 'Tacuarembó', 'Uruguay', '1988-07-23', 'M', '2010-04-22 00:00:00', NULL, 1),
(992, 'Westleigh', 'Zuann', 'wzuannr8@timesonline.co.uk', 31109176, '43356651', NULL, NULL, '965 Dexter Trail', 'Sauce', 'San José', 'Uruguay', '1957-10-29', 'M', '2011-10-22 00:00:00', NULL, 0),
(993, 'Bastian', 'Boolsen', 'bboolsenr9@washington.edu', 59140999, '33799931', NULL, NULL, '586 Lien Way', 'Trinidad', 'Colonia', 'Uruguay', '1996-12-30', 'M', '2015-06-18 00:00:00', NULL, 1),
(994, 'Lelah', 'Murie', 'lmuriera@163.com', 48846001, '24498575', NULL, NULL, '7218 Burrows Road', 'Rivera', 'Río Negro', 'Uruguay', '1956-08-06', 'F', '2017-06-21 00:00:00', NULL, 0),
(995, 'Welbie', 'Baine', 'wbainerb@hao123.com', 37738181, '29924793', NULL, NULL, '91 Iowa Hill', 'La Paz', 'Treinta y Tres', 'Uruguay', '1974-07-21', 'M', '2010-05-30 00:00:00', NULL, 1),
(996, 'Onida', 'Itzkovitch', 'oitzkovitchrc@canalblog.com', 36899555, '35179301', NULL, NULL, '482 Sundown Hill', 'Florida', 'Flores', 'Uruguay', '1982-06-15', 'F', '2016-09-29 00:00:00', NULL, 0),
(997, 'Randall', 'Blunkett', 'rblunkettrd@aboutads.info', 43387970, '34818966', NULL, NULL, '1 Basil Way', 'Castillos', 'Durazno', 'Uruguay', '1988-02-14', 'M', '2011-10-07 00:00:00', NULL, 1),
(998, 'Jodi', 'Sukbhans', 'jsukbhansre@boston.com', 55383445, '46851750', NULL, NULL, '23 Badeau Point', 'Salto', 'Montevideo', 'Uruguay', '1986-08-22', 'F', '2015-12-07 00:00:00', NULL, 0),
(999, 'Geoff', 'Paddock', 'gpaddockrf@nydailynews.com', 35956459, '40998657', NULL, NULL, '207 Dovetail Point', 'Soriano', 'Paysandú', 'Uruguay', '1978-09-03', 'M', '2010-06-26 00:00:00', NULL, 0),
(1000, 'Karil', 'Gidden', 'kgiddenrg@mashable.com', 35590410, '44632183', NULL, NULL, '95 Elgar Parkway', 'Cerro Colorado', 'Rocha', 'Uruguay', '1973-04-24', 'F', '2012-04-24 00:00:00', NULL, 0),
(1001, 'Johannes', 'Carlett', 'jcarlettrh@studiopress.com', 57055713, '48310763', NULL, NULL, '4 Lindbergh Drive', 'Lascano', 'Artigas', 'Uruguay', '1979-05-22', 'M', '2017-06-07 00:00:00', NULL, 0),
(1002, 'Prue', 'Hurndall', 'phurndallri@e-recht24.de', 56289949, '46874784', NULL, NULL, '1 Esch Trail', 'Florencio Sánchez', 'Soriano', 'Uruguay', '1959-02-16', 'F', '2015-07-23 00:00:00', NULL, 1),
(1003, 'Augusto', 'Scoyne', 'ascoynerj@51.la', 32048167, '37659888', NULL, NULL, '63420 Corscot Center', 'La Floresta', 'San José', 'Uruguay', '1963-11-09', 'M', '2016-10-26 00:00:00', NULL, 1),
(1004, 'Earvin', 'Willavize', 'ewillavizerk@columbia.edu', 46366049, '45151995', NULL, NULL, '7661 Toban Place', 'San Bautista', 'Flores', 'Uruguay', '1966-11-12', 'M', '2012-06-14 00:00:00', NULL, 0),
(1005, 'Virgina', 'Heindrick', 'vheindrickrl@mashable.com', 31720386, '25706541', NULL, NULL, '7 Schlimgen Alley', 'Dolores', 'Paysandú', 'Uruguay', '1988-04-29', 'F', '2017-01-29 00:00:00', NULL, 1),
(1006, 'Chadwick', 'Conford', 'cconfordrm@toplist.cz', 57723170, '42991759', NULL, NULL, '4277 Helena Park', 'Soca', 'Flores', 'Uruguay', '1952-12-27', 'M', '2013-10-25 00:00:00', NULL, 0),
(1007, 'Melania', 'Mordin', 'mmordinrn@go.com', 45106057, '22693968', NULL, NULL, '16348 Maywood Hill', 'Tala', 'Treinta y Tres', 'Uruguay', '1991-05-04', 'F', '2010-04-16 00:00:00', NULL, 1),
(1008, 'Alfred', 'O\'Daly', 'aodalyro@timesonline.co.uk', 37252886, '48344653', NULL, NULL, '847 4th Crossing', 'Migues', 'Rivera', 'Uruguay', '1999-03-23', 'M', '2010-05-26 00:00:00', NULL, 1),
(1009, 'Marya', 'Kamien', 'mkamienrp@yelp.com', 51482337, '24743938', NULL, NULL, '8 Ryan Street', 'Durazno', 'Flores', 'Uruguay', '1953-01-24', 'F', '2016-10-15 00:00:00', NULL, 0),
(1010, 'Zebedee', 'Tibbetts', 'ztibbettsrq@vistaprint.com', 31964989, '27710795', NULL, NULL, '50 Grover Alley', 'Santiago Vázquez', 'Montevideo', 'Uruguay', '1970-06-15', 'M', '2017-06-04 00:00:00', NULL, 1),
(1011, 'Doralynne', 'Eglinton', 'deglintonrr@cnn.com', 58101862, '24945275', NULL, NULL, '33 Packers Terrace', 'Aguas Corrientes', 'Colonia', 'Uruguay', '1998-11-17', 'F', '2011-05-13 00:00:00', NULL, 0),
(1012, 'Ana María', 'Acosta', 'ama@comero.com.uy', 3453210, '44721678', '', '', 'Rodó 310', 'Rocha', 'Rocha', 'Uruguay', '1993-05-01', 'f', '2019-04-12 16:02:34', '', 1),
(1013, 'Laura', 'Correa', 'acorrea@comero.com.uy', 33332221, '44729106', '', '', '25 de mayo 678', 'Rocha', 'Rocha', 'Uruguay', '1985-01-28', 'f', '2019-04-30 18:15:08', 'True', 0),
(1014, 'Rosa', 'Perdomo', 'rperdomo@comero.com.uy', 29571003, '44726610', '', '', 'Sarandí 234', 'Rocha', 'Rocha', 'Uruguay', '1974-12-27', 'f', '2019-04-30 18:15:08', 'True', 0),
(1015, 'Cecilia', 'Tognola', 'ctognola@comero.com.uy', 40010036, '44723372', '', '', 'Treinta y Tres 2134', 'Rocha', 'Rocha', 'Uruguay', '1971-02-06', 'f', '2019-04-30 18:15:08', 'True', 0);

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
(3, 3, 'enfermero', 'bettinarey', '$2b$12$Zx8jDOABDhOfTki3h4kTae7D7xb9ixTw6Salbgi.XHBksajJqLtP.'),
(4, 1012, 'enfermero', 'anamariaacosta', '$2b$12$cT4GHz0GrLVweniNwASh5uw/OjjgkWHGK/KSERNplxJ6uiDjHVNv6'),
(5, 1013, 'enfermero', 'lcorrea', '$2b$12$f6eQEoZBHynNj9UgJu0RFu1yJsIT6d.rvgvocHFCaHXnOXBr2ao5u'),
(6, 1014, 'administrativo', 'rperdomo', '$2b$12$.VqTLdYBDmGrj9rQR1hZde24FdtHVp4DjLHu6SelPb2jhhFcmWS6i'),
(7, 1015, 'doctor', 'ctognola', '$2b$12$abGoYkkMLahJsVUNfBg/yu3IkareGjvnCxsEuT3ByEXcXK89u0V5O');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `enfermeros`
--
ALTER TABLE `enfermeros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1016;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
