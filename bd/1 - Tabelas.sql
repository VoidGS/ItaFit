create database itafit;
use itafit;

drop table Planos;
create table Planos (
	idPlano int auto_increment not null,
    nomePlano varchar(255) not null unique,
    valorPlano float not null,
    constraint primary key (idPlano)
);

drop table Alunos;
create table Alunos (
	idAluno int auto_increment not null,
    nomeAluno varchar(255) not null,
    sexoAluno char(1) null,
    cpfAluno int not null unique,
    idadeAluno smallint null,
    alturaAluno float not null,
    pesoAluno float not null,
    idPlano int not null,
    celularAluno smallint not null,
    constraint primary key (idAluno),
    constraint foreign key (idPlano) references Planos (idPlano)
);

drop table Funcoes;
create table Funcoes (
	idFuncao int auto_increment not null,
    nomeFuncao varchar(255) not null unique,
    constraint primary key (idFuncao)
);

drop table Funcionarios;
create table Funcionarios (
	idFuncionario int auto_increment not null,
    nomeFuncionario varchar(255) not null,
    sexoFuncionario char(1) null,
    cpfFuncionario int not null unique,
    idadeFuncionario smallint null,
    celularFuncionario smallint null,
    idFuncao int not null,
    constraint primary key (idFuncionario),
    constraint foreign key (idFuncao) references Funcoes (idFuncao)
);

drop table FormasPagamento;
create table FormasPagamento (
	idFormaPagamento int auto_increment not null,
    tipoFormaPagamento varchar(255) not null unique,
    constraint primary key (idFormaPagamento)
);

drop table Pagamentos;
create table Pagamentos (
	idPagamento int auto_increment not null,
    idAluno int not null,
    dataPagamento datetime not null default current_timestamp,
    idFormaPagamento int not null,
    constraint primary key (idPagamento),
    constraint foreign key (idAluno) references Alunos (idAluno),
    constraint foreign key (idFormaPagamento) references FormasPagamento (idFormaPagamento)
);

drop table Treinos;
create table Treinos (
	idTreino int auto_increment not null,
    nomeTreino varchar(255) not null unique,
    descTreino varchar(255) null,
    constraint primary key (idTreino)
);

drop table Registro;
create table Registro (
	idRegistro int auto_increment not null,
    idTreino int not null,
    idAluno int not null,
    idFuncionario int not null,
    dataTreino datetime not null default current_timestamp,
    constraint primary key (idRegistro),
    constraint foreign key (idTreino) references Treinos (idTreino),
    constraint foreign key (idAluno) references Alunos (idAluno),
    constraint foreign key (idFuncionario) references Funcionarios (idFuncionario)
);