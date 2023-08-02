
use hospital;

create table medico(
    medico_id int not null auto_increment,
    medico_nombre varchar(50) not null,
    medico_especialidad varchar(50) not null,
    primary key(medico_id)

);

create table paciente(
    paciente_id int not null auto_increment,
    paciente_nombre varchar(50) not null,
    paciente_apellido varchar(50) not null,
    paciente_dni varchar(50) not null,
    paciente_fecha_nacimiento date not null,
    primary key(paciente_id)
);

create table medicamento(
    medicamento_id int not null auto_increment,
    medicamento_nombre varchar(50) not null,
    medicamento_dosis varchar(50) not null,
    primary key(medicamento_id)
);

create table receta (
    receta_id int not null auto_increment,
    receta_fecha date not null,
    receta_medicamento_id int not null,
    receta_paciente_id int not null,
    receta_medico_id int not null,
    primary key(receta_id),
    foreign key(receta_medicamento_id) references medicamento(medicamento_id),
    foreign key(receta_paciente_id) references paciente(paciente_id),
    foreign key(receta_medico_id) references medico(medico_id)
);

create table recetaMedicamento(
    recetaMedicamento_id int not null auto_increment,
    recetaMedicamento_recta_id int not null,
    recetaMedicamento_medicamento_id int not null,
    recetaMedicamento_dosis varchar(50) not null,
    primary key(recetaMedicamento_id),
    foreign key(recetaMedicamento_recta_id) references receta(receta_id),
    foreign key(recetaMedicamento_medicamento_id) references medicamento(medicamento_id)
);
