create database TaxiAereo

use TaxiAereo

create table Pessoa(
	CPF char(11) primary key,
	Nome varchar(255),
	RG char(9) unique
)

create table Telefone(
	Numero char(11),
	idP char(11),
	primary key (Numero, idP),
	constraint FK_Pessoa_Telefone foreign key (idP) references Pessoa(CPF) on delete cascade
)

create table Endere�o(
	idP char(11) primary key,
	Rua varchar(255),
	Bairro varchar(255),
	Numero int,
	CEP char(11),
	constraint FK_Pessoa_Endere�o foreign key (idP) references Pessoa(CPF) on delete cascade
)

create table Cliente(
	idP char(11) primary key,
	Data_Cadastro date,
	constraint FK_Pessoa_Cliente foreign key (idP) references Pessoa(CPF)
)

create table Vendedor(
	idP char(11) primary key,
	Comissao decimal(9,2),
	Data_Admissao date,
	constraint FK_Pessoa_Vendedor foreign key (idP) references Pessoa(CPF)
)

create table Piloto(
	idP char(11) primary key,
	Breve varchar(255) not null,
	Salario decimal(9,2)
)

create table Veiculo(
	Chassi char(17) primary key,
	Modelo varchar(255),
	Capacidade int,
	Autonomia varchar(255)
)

create table Voo(
	ID int primary key,
	idPL char(11),
	idVC char(17),
	Data_Agendada date,
	Horario time,
	Duracao time,
	Origem varchar(255),
	Destino varchar(255),
	constraint FK_Piloto_Voo foreign key (idPL) references Piloto(idP) on delete cascade,
	constraint FK_Veiculo_Voo foreign key (idVC) references Veiculo(Chassi) on delete cascade
)

create table Contrato(
	idC char (11),
	idV char(11),
	Registro varchar(255),
	Valor decimal(9,2),
	Protocolo varchar(255),
	primary key(idC,idV),
	constraint FK_Cliente_Contrato foreign key(idC) references Cliente(idP) on delete cascade,
	constraint FK_Vendedor_Contrato foreign key(idV) references Vendedor(idP) on delete cascade
)