create database SaveFlowers;

use SaveFlowers;

create table empresa(
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar(100) not null,
    cnpj varchar(18) not null,
	loginEmpresa varchar(50),
    senhaEmpresa varchar(50)
);

create table funcionario(
	idFuncionario int primary key auto_increment,
    tipoFuncionario varchar(50) not null, constraint chkTipoFuncionario check(tipoFuncionario in ('Administrador', 'Entregador')),
    nomeFuncionario varchar(100) not null,
    cpf char(14) not null,    
    dtNasc date not null,
    email varchar(100) not null
);

create table caminhao(
	idCaminhao int primary key auto_increment,
    placa char(8)
);

create table sensor(
	idSensor int primary key auto_increment,
    tipoSensor varchar(50) not null, constraint chkTipoSensor check (tipoSensor in ('Temperatura e Umidade')),
    statusSensor varchar(50) not null, constraint chkStatusSensor check (statusSensor in ('Ativo', 'Inativo', 'Em manutenção'))
);

create table capturaTemperaturaUmidade(
	idCaptura int primary key auto_increment,
    dtCaptura date not null,
    hrCaptura time not null,
    temperatura float not null,
    umidade float not null
);


-- Inserção de Registros
insert into empresa values
	(null, 'Delivery Roses', '527.598.428-60', 'DeliveryRoses', '1234');

insert into funcionario values
	(null, 'Administrador', 'Edukof', '246.777.666-58', '1985-06-25', 'mariarosario@hotmail.com', 'MariaRosario'),
    (null, 'Entregador', 'Kaiky jap', '987.654.321-09', '1980-12-01', 'joseferreira@hotmail.com', 'JoseFerreira'),
    (null, 'Entregador', 'Gabriel Lopes', '741.852.963-07', '1989-02-10', 'biancasouza@hotmail.com', 'BiancaSouza'),
    (null, 'Entregador', 'Geovanna Alves', '369.258.147-03', '1993-05-17', 'andreneto@hotmail.com', 'AndrePaulo');
    
insert into caminhao values
	(null, 'BRA 2K20'),
    (null, 'BRA 2E19'),
    (null, 'BRA 0S17');
    
insert into sensor values
	(null, 'Temperatura e Umidade', 'Ativo', 1),
    (null, 'Temperatura e Umidade', 'Ativo', 2),
    (null, 'Temperatura e Umidade', 'Inativo', 3);
    
insert into capturaTemperaturaUmidade values
	(null, '2023-03-01', '13:00:00', 5, 73),
    (null, '2023-03-01', '13:30:00', 5, 73),
    (null, '2023-03-01', '14:00:00', 5, 72),
    (null, '2023-03-02', '11:00:00', 4, 70),
    (null, '2023-03-02', '11:30:00', 4, 70),
    (null, '2023-03-02', '12:00:00', 20, 65),
    (null, '2023-03-02', '12:30:00', 19, 65),
    (null, '2023-03-03', '10:00:00', 7, 75),
    (null, '2023-03-03', '10:30:00', 7, 75),
    (null, '2023-03-03', '11:00:00', 6, 77);


-- Consulta de dados
select * from capturaTemperaturaUmidade 
	order by dtCaptura;
    
select * from capturaTemperaturaUmidade 
	order by dtCaptura desc;
  
select * from capturatemperaturaumidade
	where temperatura > 7 or temperatura < 1 or umidade > 75 or umidade < 70;
  
select * from capturaTemperaturaUmidade 
	where dtCaptura = '2023-03-02';
    
select * from empresa;

select * from funcionario;

select * from funcionario
	where tipoFuncionario = 'Administrador';
    
select * from funcionario
	where tipoFuncionario = 'Entregador';
    
select * from caminhao;

select * from caminhao
	where placa = 'LQD-777';
    
select * from sensor;

select * from sensor
	where statusSensor = 'Ativo';

select * from sensor
	where statusSensor = 'Inativo';    
    
    use saveflowers