-- Eduardo Vinicius Rodrigues Lima, 1900992
-- Leonardo Buzzo, 1900861
-- Davi Hideo Santa Rita Uemura, 1900814
-- Lucas Oliveira Cristovam de Souza, 1900824
-- Heitor Leal de Souza, 1900576

use Concessionaria

create table usuario
( Id smallint identity (1,1),
  Login_usuario varchar(50) unique not null,
  senha varchar(50) not null,
  Dtexpiracao date constraint dfDtexpiracao default ('01/01/1900')
  constraint pkId primary key (Id)
 )
 

 
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

 create table professor
(
Id_professor smallint identity (1,1),
Id_usuario smallint,
email varchar (50) unique not null,
celular varchar (20) unique not null,
apelido varchar (20),
constraint pkId_professor primary key (Id_professor),
constraint fkId_usuario_professor foreign key (Id_usuario)
references usuario (Id)
)



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



Create table DisciplinaOfertada
(
Id_DiscOfertada smallint identity (1,1),
Id_coordenador smallint,
DtInicioMatricula date,
DtFimMatricula date,
Id_Disciplina_Ofertada smallint,
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
constraint fkId_Disciplina foreign key (Id_Disciplina_Ofertada)
references Disciplina (Id_Disciplina),
constraint fkid_coordenador_DiscOfertada foreign key (Id_coordenador)
references coordenador (Id_coordenador),
constraint fkId_professor foreign key (Id_professor)
references professor (Id_professor),
)


create table Curso
(
Id smallint identity (1,1),
nome varchar(50) unique not null,
constraint pkId_curso primary key (Id)
)


create table SolicitacaoMatricula (
	Id smallint identity (1,1),
	id_aluno2 smallint,
	id_disciplina_ofertada smallint,
	dt_solicitacao date constraint df_dtsolicitacao default CURRENT_TIMESTAMP,
	id_coordenador smallint,
	status_matricula varchar(15) constraint df_status default ('Solicitada')
	
	constraint pk_Id primary key (id)

	constraint fk_id_aluno_SolMatricula foreign key (id_aluno2)
	references Aluno(id_aluno),

	constraint fk_id_disciplina foreign key (id_disciplina_ofertada)
	references DisciplinaOfertada(Id_DiscOfertada),

	constraint fk_id_coordenador foreign key (id_coordenador)
	references Coordenador(id_coordenador),

	constraint ck_Status check (status_matricula in ('Solicitada', 'Aprovada', 'Rejeitada', 'Cancelada'))
)


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
constraint fkId_professor_atividade foreign key (Id_professor)
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
references atividade (Id_Atividade),
constraint fkId_professor_Vinculada foreign key (Id_professor)
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
titulo varchar (20),C
resposta varchar (100),
DtEntrega date constraint df_DtEntrega default CURRENT_TIMESTAMP,
status_entrega varchar (9) constraint dfStatus default ('Entregue'),
Id_professor smallint,
nota decimal (5,2),
DtAvaliação date,
Obs varchar (100)
constraint pkId_entrega primary key (Id_entrega),
constraint fkId_Aluno foreign key (Id_Aluno)
references aluno (Id_Aluno),
constraint fkId_AtividadeVinculada foreign key (Id_AtividadeVinculada)
references AtividadeVinculada (Id_AtividadeVinculada),
constraint fkId_professor_Entrega foreign key (Id_professor)
references professor (Id_professor),
constraint ckStatus_Entrega check (Status_entrega in ('Entregue', 'corrigido')),
constraint CkNota check (nota >=0.0 and nota <=10.0)
)
 
 


create table mensagem
(
Id_mensagem smallint identity (1,1),
Id_aluno_mensagem smallint,
Id_professor smallint,
Assunto varchar (50),
referencia varchar (100),
conteudo varchar (100),
Status_mensagem varchar (10),
DtEnvio date,
DtReposta date,
Resposta varchar (100),
constraint PkId_mensagem primary key (Id_mensagem),
constraint fkId_aluno_mensagem foreign key (Id_aluno_mensagem)
references aluno (Id_aluno),
constraint fkId_professor_mensagem foreign key (Id_professor)
references professor (Id_professor),
constraint ckStatus_mensagem check (Status_mensagem in ('Enviado', 'Lido', 'Respondido'))
)
