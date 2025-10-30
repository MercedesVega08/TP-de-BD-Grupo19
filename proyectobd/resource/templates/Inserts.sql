-- ============================================
-- INSERTS DE DATOS DE EJEMPLO PARA EL MODELO DE GESTIÓN DE RECLAMOS
-- ============================================

-- Tabla: usuario (primero todos los usuarios, incluidos empleados)

use grupo19;

INSERT INTO grupo19.usuario (telefono, direccion) VALUES
(112345678, 'Av. Siempre Viva 123'),
(113456789, 'Calle Falsa 456'),
(114567891, 'Av. Belgrano 789'),
(115678902, 'Ruta 8 km 45'),
(116789012, 'San Martín 321'),
(117777000, 'Depósito Central'),
(117777000, 'Taller Zona Norte'),
(117777000, 'Base Sur');

-- Tabla: motivo
INSERT INTO grupo19.motivo (codigo, descripcion) VALUES
(1, 'Falla eléctrica'),
(2, 'Corte de servicio'),
(3, 'Daño en medidor'),
(4, 'Revisión de facturación'),
(5, 'Otros');

-- Tabla: empresa
INSERT INTO grupo19.empresa (id_usuario, cuit, cap_instalada) VALUES
(4, 30711222334, 500),
(5, 30999888776, 1200);

-- Tabla: persona
INSERT INTO grupo19.persona (id_usuario, dni, nombre, apellido, email, f_dn) VALUES
(1, 30111222, 'Juan', 'Pérez', 'juanperez@gmail.com', '1988-05-14'),
(2, 29888777, 'María', 'Gómez', 'mariagomez@hotmail.com', '1990-01-10'),
(3, 33222444, 'Carlos', 'Fernández', 'carlosf@gmail.com', '1995-06-23');

-- Tabla: empleado_mantenimiento (después de usuario)
INSERT INTO grupo19.empleado_mantenimiento (id_usuario, sueldo) VALUES
(6, 250000),
(7, 275000),
(8, 260000);

-- Tabla: reclamo
INSERT INTO grupo19.reclamo (id_usuario, codigo, fecha_reclamo) VALUES
(2, 1, '2024-10-01'),
(1, 2, '2024-10-03'),
(3, 3, '2024-10-05'),
(1, 4, '2024-10-06'),
(5, 1, '2024-10-08');

-- Tabla: material
INSERT INTO grupo19.materiales (cod_material, descripcion) VALUES
(101, 'Cable de cobre'),
(102, 'Transformador'),
(103, 'Medidor digital'),
(104, 'Fusible'),
(105, 'Aislante térmico');

-- Tabla: llamada
INSERT INTO grupo19.llamada (nro_reclamo, fecha_llamada, hora_llamada) VALUES
(1, '2024-10-01', '09:30:00'),
(2, '2024-10-03', '10:15:00'),
(3, '2024-10-05', '11:45:00'),
(4, '2024-10-06', '14:20:00'),
(5, '2024-10-08', '08:50:00');

-- Tabla: deriva
INSERT INTO grupo19.deriva (id_usuario, nro_reclamo) VALUES
(6, 1),
(7, 2),
(8, 3),
(6, 4),
(7, 5);

-- Tabla: uso
INSERT INTO grupo19.uso (nro_reclamo, cod_material, cantidad) VALUES
(1, 101, 20),
(1, 104, 5),
(2, 102, 1),
(3, 103, 2),
(4, 101, 10),
(5, 105, 8);

