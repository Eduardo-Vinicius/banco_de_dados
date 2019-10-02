create database Concessionaria
go

drop table usuario
drop table coordenador
drop table aluno
drop table professor
drop table disciplina
drop table DisciplinaOfertada
drop table Curso
drop table SolicitacaoMatricula

create table usuario
( Id smallint identity (1,1),
  Login_usuario varchar(50) unique not null,
  senha varchar(50) not null,
  Dtexpiracao date constraint dfDtexpiracao default ('01/01/1900')
  constraint pkId primary key (Id)
 )
 
 insert into usuario (Login_usuario, senha) values ('Eduardo', 'dudu')
 
 
 create table coordenador
(
 Id_coordenador smallint identity (1,1),
 Id_usuario smallint,
 nome varchar (40) not null,
 email varchar (50) unique not null,
 celular varchar (30) unique not null,
 constraint pkId_coordenador primary key (Id_coordenador),
 constraint fkIdusuario foreign key (Id_usuario)
 references usuario (Id)
)
 
 insert into coordenador(Id_usuario, nome, email, celular)
 values (1, 'Eduardo', 'dududud@dud', '938293')
  
  create table aluno
(
Id_aluno smallint identity (1,1),
Id_usuario smallint,
nome varchar (50) not null,
email varchar (50) unique not null,
celular varchar (20) unique not null,
RA int not null,
foto varchar (100),
constraint pkId_aluno primary key (Id_aluno),
constraint fkId_usuario foreign key (Id_usuario)
references usuario (Id)
)

insert into aluno (id_usuario, nome, email, celular, ra, foto)
values (1, 'dudu', '@leo', '2989', '1900992', 'url.thjink.okd')


 create table professor
(
Id_professor smallint identity (1,1),
Id_usuario smallint,
email varchar (50) unique not null,
celular varchar (20) unique not null,
apelido varchar (20),
constraint pkId_professor primary key (Id_professor),
constraint fkId_usuario2 foreign key (Id_usuario)
references usuario (Id)
)

insert into professor(id_usuario, email, celular, apelido)
values (1, '@leo', '2389', 'leozito')

 create table disciplina
(
Id_disciplina smallint identity(1,1),
nome varchar (50) unique not null,
dtDisciplina date constraint dfDtDisciplina default (getdate()),
StsDisciplina varchar (7) constraint DfStsDisciplina default ('Aberto'),
PlanoDeEnsino varchar (100),
CargaHoraria tinyint, 
competencias varchar (100),
habilidades varchar (100),
ementa varchar (100),
ConteudoProgramatico varchar (100),
BibliografiaBasica varchar (100),
BibliografiaComplementar varchar (100),
PercentualPratico tinyint,
PercentualTeorico tinyint,
Id_coordenador smallint,
constraint ckStsDsiciplina check (StsDisciplina like 'Aberto' or StsDisciplina like 'Fechado'),
constraint ckCargaHoraria check (CargaHoraria = 40 or CargaHoraria = 80),
constraint ckPercentualPratico check (PercentualPratico >=0 and PercentualPratico <=100),
constraint ckPercentualTeorico check (PercentualTeorico >=0 and PercentualTeorico <=100),
constraint pkId_disciplina primary key (Id_disciplina),
constraint fkId_coordenador foreign key (Id_coordenador)
references coordenador(Id_coordenador)
)

insert into disciplina (nome, planodeensino, cargahoraria, competencias, habilidades, ementa, ConteudoProgramatico,
						bibliografiabasica, BibliografiaComplementar, PercentualPratico, PercentualTeorico)
			values	   ('Davi Hideo', 'Aprendeer como Dormir', 40, 'Entender', 'Programacao', 'Não sei o que é ementa',
						'Python 2x semana', 'Entender Einstein',  'Complementar', 80, 70)

Create table DisciplinaOfertada
(
Id_DiscOfertada smallint identity (1,1),
Id_coordenador smallint,
DtInicioMatricula date,
DtFimMatricula date,
Id_Disciplina smallint,
Id_curso smallint,
Ano smallint,
semestre tinyint,
turma varchar(20),
Id_professor smallint,
metodologia varchar (100),
recursos varchar (100),
CriterioAvaliacao varchar (100),
PlanoDeAulas varchar (100),
constraint ckAno check (Ano >=1900 and Ano <=2100),
constraint cksemestre check (semestre = 1 or semestre = 2),
constraint ckturma check (turma like '[A-Z]'),
constraint pkId_DiscOfertada primary key (Id_DiscOfertada),
constraint fkId_Disciplina foreign key (Id_Disciplina)
references Disciplina (Id_Disciplina),
constraint fkid_coordenador2 foreign key (Id_coordenador)
references coordenador (Id_coordenador),
constraint fkId_professor foreign key (Id_professor)
references professor (Id_professor),
)


insert into disciplinaofertada (Id_coordenador, DtInicioMatricula, DtFimMatricula, Id_Disciplina, Id_curso, ano, semestre,turma,
								Id_professor, metodologia, recursos, CriterioAvaliacao, PlanoDeAulas)
					values	   (1, getdate(), getdate(), 2, 1, 2019, 2, 'a', 1, 'Aprender', 'Aprender', 'Aprender', 'Plano de Aulas')

create table Curso
(
Id smallint identity (1,1),
nome varchar(50) unique not null,
constraint pkId_curso primary key (Id)
)

insert into Curso(nome) values ('Informática')

alter table DisciplinaOfertada add constraint fk_Idcurso foreign key (Id_curso)
references curso (Id)

create table SolicitacaoMatricula (
	Id smallint identity (1,1),
	id_aluno2 smallint,
	id_disciplina_ofertada smallint,
	dt_solicitacao date constraint df_dtsolicitacao default CURRENT_TIMESTAMP,
	id_coordenador smallint,
	status_matricula varchar(15) constraint df_status default ('Solicitada')
	
	constraint pk_Id primary key (id)

	constraint fk_id_aluno5 foreign key (id_aluno2)
	references Aluno(id_aluno),

	constraint fk_id_disciplina foreign key (id_disciplina_ofertada)
	references DisciplinaOfertada(Id_DiscOfertada),

	constraint fk_id_coordenador foreign key (id_coordenador)
	references Coordenador(id_coordenador),

	constraint ck_Status check (status_matricula in ('Solicitada', 'Aprovada', 'Rejeitada', 'Cancelada'))
)

insert into SolicitacaoMatricula(id_aluno2, id_disciplina_ofertada)
						values (1, 1)

create table atividade
(
Id_Atividade smallint identity (1,1),
titulo varchar (20) unique not null	,
descricao varchar (50),
conteudo varchar (50),
tipo varchar (20),
extras varchar (50),
Id_professor smallint,
constraint pkId_Atividade primary key (Id_atividade),
constraint fkId_professor8 foreign key (Id_professor)
references professor (Id_professor),
constraint ck_tipo check (tipo like 'Resposta Aberta' or tipo like 'Teste')
)

create table AtividadeVinculada
(
Id_AtividadeVinculada smallint identity (1,1),
Id_Atividade smallint unique,
Id_Professor smallint,
Id_disciplinaOfertada smallint unique,
rotulo varchar(10) unique,
Status_AtividadeVinculada varchar (50),
DtInicioRespostas date,
DtFimRespostas date 
constraint pkId_AtividadeVinculada primary key (Id_AtividadeVinculada),
Constraint fkId_atividade foreign key (Id_atividade)
references atividade (Id_atividade),
constraint fkId_professor foreign key (Id_professor)
references professor (Id_professor),
constraint fkId_disciplinaOfertada foreign key (Id_disciplinaOfertada)
references DisciplinaOfertada (Id_discOfertada),
constraint ck_Status_Atividade check (Status_AtividadeVinculada in ('Disponibilizada', 'Aberta', 'Fechada', 'Encerrada', 'Prorrogada'))
)

create table entrega
(
Id_Entrega smallint identity (1,1),
Id_Aluno smallint,
Id_AtividadeVinculada smallint,
titulo varchar (20),
resposta varchar (100),
DtEntrega date constraint df_DtEntrega default CURRENT_TIMESTAMP,
status_entrega varchar (9) constraint dfStatus default ('Entregue'),
Id_professor smallint,
nota decimal (2,2),
DtAvaliação date,
Obs varchar (100)
constraint pkId_entrega primary key (Id_entrega),
constraint fkId_Aluno foreign key (Id_Aluno)
references aluno (Id_Aluno),
constraint fkId_AtividadeVinculada foreign key (Id_AtividadeVinculada)
references AtividadeVinculada (Id_AtividadeVinculada),
constraint fkId_professor foreign key (Id_professor)
references professor (Id_professor),
constraint ckStatus_Entrega check (Status_entrega in ('Entregue', 'corrigido')),
constraint CkNota check (nota >=0.0 and nota <=10.0)
)

create table mensagem
(
Id_mensagem smallint identity (1,1),
Id_aluno smallint,
Id_professor smallint,
Assunto varchar (50),
referencia varchar (50),
conteudo varchar (50),
Status_mensagem varchar (10) constraint ,
DtEnvio date,
DtReposta date,
Resposta varchar (50),
constraint PkId_mensagem primary key (Id_mensagem),
constraint fkId_aluno foreign key (Id_aluno)
references aluno (Id_aluno),
constraint fkId_professor foreign key (Id_professor)
references professor (Id_professor),
constraint ckStatus_mensagem check (Status_mensagem in ('Enviado', 'Lido', 'Respondido'))
)









