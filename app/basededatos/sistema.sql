-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2022 a las 05:25:04
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sist_catalogacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativos`
--

/*CREATE TABLE `administrativos` (
  `id_usuario` int(11) NOT NULL,
  `nss` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titulo varchar(50) NOT NULL,
  fotocopia_ci boolean NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
create table tipo_archivo(
  id int(11) not null auto_increment,
  id_archivo int(11) not null,
  nombre varchar(50) not null,
  descripcion varchar(50) not null,
  primary key(id),
  FOREIGN KEY (id_archivo) REFERENCES archivos(id)
);
--


--

create table ubicaciones(
  id int(11) not null auto_increment,
  nombre varchar(50) not null,
  descripcion varchar(50) not null,
  fila int(11) not null,
  columna int(11) not null,
  primary key(id)
);


-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id_usuario` int(11) NOT NULL,
  fecha_nombramiento date
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id_usuario` int(11) NOT NULL,
  `matricula` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gabetas`
--

CREATE TABLE `gabetas` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_ambiente int(11) not null,
  `cod_gabeta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabla ambiente
create table ambientes(
    id int(11) not null auto_increment,
    id_lugar int(11) not null,
    nombre varchar(50) not null,
    primary key(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- tabla lugar

create table lugares(
    id int(11) not null auto_increment,
    id_ambiente int(11) not null,
    nombre varchar(50) not null,
    ubicacion varchar(100) not null,
    descripcion text,
    primary key(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_cursos_actividades`
--

CREATE TABLE `programas_cursos_actividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_finalizacion` date DEFAULT NULL,
  `version` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL auto_increment,
  `usuario` varchar(50) NOT NULL ,
  correo varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  primary key(id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- TABLA PERSONA
CREATE TABLE personas(
    id int(11) not null auto_increment primary key,
	id_usuario int(11) not null,
    ci varchar(10) not null unique,
    `nombre` varchar(50) NOT NULL,
    `ap_paterno` varchar(50) NOT NULL,
    `ap_materno` varchar(50),
	telefono varchar(50),
    fecha_inicio date not null,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_roles`
--

CREATE TABLE `usuarios_roles` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_usuario`);


--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);


--
-- Indices de la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD PRIMARY KEY (`id_usuario`,`id_rol`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gabetas`
--
ALTER TABLE `gabetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programas_cursos_actividades`
--
ALTER TABLE `programas_cursos_actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


-- Restricciones para tablas volcadas
--

--


-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `personas` (`id`);

--

-- Filtros para la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD CONSTRAINT `usuarios_roles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuarios_roles_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);




-- Estructura de tabla para la tabla `archivos_tipo`

create table archivo_ubicaciones(
  id int(11) not null auto_increment,
  id_archivo int(11) not null,
  id_ubicacion int(11) not null,
  id_persona int(11) not null,
  id_programa int(11) not null,
  primary key(id)
);






-- alterar tabla archivo_ubicaciones y adicionar restricciones llave foranea

-- id_archivo int(11) not null,
--   id_ubicacion int(11) not null,
--   id_persona int(11) not null,
--   id_programa int(11) not null,

alter table archivo_ubicaciones
 add CONSTRAINT fk_archivo_f1 FOREIGN KEY (id_archivo) REFERENCES archivos(id),
 add CONSTRAINT fk_archivo_f2 FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id),
 add CONSTRAINT fk_archivo_f3 FOREIGN KEY (id_persona) REFERENCES personas(id),
 add CONSTRAINT fk_archivo_f4 FOREIGN KEY (id_programa) REFERENCES programas_cursos_actividades(id);
 COMMIT;


alter table ambientes
add CONSTRAINT fk_lugar FOREIGN key(id_lugar) references lugares(id);




alter table gabetas 

add CONSTRAINT fk_gabetas FOREIGN key(id_ambiente) references ambientes(id);
