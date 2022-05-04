create database Empresas_ThiagoAlo;
use Empresas_ThiagoAlo

create table Fornecedor(
	CodFor int identity(1,1),
	FNome varchar(30),
	Tipo varchar(30),
	Cidade varchar(30)
	CONSTRAINT PK_Fornecedor PRIMARY KEY (CodFor)
	);
	
create table Peça(
	CodPeca int identity(1,1),
	PNome varchar(30),
	Cor varchar(30),
	Peso int
	CONSTRAINT PK_Peça PRIMARY KEY (Codpeca)
	);

create table Projeto(
	CodProj int identity(1,1),
	Designação varchar(255),
	Cidade varchar(30)
	CONSTRAINT PK_Projeto PRIMARY KEY (CodProj)
	);

create table Fornecimento(
	CodFor int,
	CodPeca int,
	CodProj int,
	DataF varchar (20) NOT NULL,
	Qtd int
	FOREIGN KEY (CodPeca) REFERENCES Peça(CodPeca),
	FOREIGN KEY (CodProj) REFERENCES Projeto(CodProj),
	FOREIGN KEY (CodFor) REFERENCES Fornecedor(CodFor),
	);

	
-- Altere a Tabela Projeto e acrescente o campo CodigoPostal do tipo varchar(10)
alter table Projeto
add CodigoPostal varchar(10)

----------------Insira cinco registos, a seu gosto, em cada tabela;
--insert into Fornecedor (FNome, Tipo, Cidade)
--values ('Porsi','Bolachas','Valencia');
--insert into Fornecedor (FNome, Tipo, Cidade)
--values ('Chaco','Cigarros','Lisboa');
--insert into Fornecedor (FNome, Tipo, Cidade)
--values ('Ferrari','Carros','Berlim');
--insert into Fornecedor (FNome, Tipo, Cidade)
--values ('BlackLabel','Whiskey','Nova York');
--insert into Fornecedor (FNome, Tipo, Cidade)
--values ('Thiagon','Roupas','Porto');

select * from Fornecedor

--insert into Peça(PNome, Cor, Peso)
--values('Oreo','Preto',1)
--insert into Peça(PNome, Cor, Peso)
--values('Derby','Vermelho',1)
--insert into Peça(PNome, Cor, Peso)
--values('MotorV8','Cinza',500)
--insert into Peça(PNome, Cor, Peso)
--values('Garrafa','Transparente',2)
--insert into Peça(PNome, Cor, Peso)
--values('Calças','Brancas',1)

select * from Peça

--insert into Projeto(Designação, Cidade, CodigoPostal)
--values ('Ativo', 'Porto',4400550)
--insert into Projeto(Designação, Cidade, CodigoPostal)
--values ('Em Produção', 'Amarantes',3300550)
--insert into Projeto(Designação, Cidade, CodigoPostal)
--values ('Ativo', 'Braga',2200550)
--insert into Projeto(Designação, Cidade, CodigoPostal)
--values ('Encerrado', 'Setubal',1100550)
--insert into Projeto(Designação, Cidade, CodigoPostal)
--values ('Ativo', 'Madrid',5500550)

select * from Projeto

--insert into Fornecimento (CodFor,CodPeca,CodProj,DataF, Qtd)
--values(1,1,1,'15/12/2022',2)
--insert into Fornecimento (CodFor,CodPeca,CodProj,DataF, Qtd)
--values(2,2,2,'03/03/2022',6)
--insert into Fornecimento (CodFor,CodPeca,CodProj,DataF, Qtd)
--values(3,3,3,'08/08/2022',8)
--insert into Fornecimento (CodFor,CodPeca,CodProj,DataF, Qtd)
--values(4,4,4,'10/10/2022',10)
--insert into Fornecimento (CodFor,CodPeca,CodProj,DataF, Qtd)
--values(5,5,5,'06/06/2022',12)

select * from Fornecimento

------------------- Remover todos os registos de fornecimento de peças com uma dada cor
delete f
FROM Fornecimento f inner join Peça p
on f.CodPeca = p.CodPeca
where p.cor='Brancas'

------------------ Alter o a cor de todas as Peças para Vermelho
UPDATE  Peça  
SET Cor = 'Vermelho'

select * from Peça
------------------  Alter a Cidade do Fornecedor “Armindo LDA”, ou outro a gosto, para “Paris”
UPDATE Fornecedor
set Cidade = 'Paris'
where FNome = 'Thiagon'

----- Mostrar todos os projetos com todos os seus detalhes. 
select * from Projeto

----- Mostrar todos os detalhes dos projetos localizados em Lisboa (ou outro a gosto). 
select Cidade from Projeto where Cidade = 'Porto'

-----  Mostrar os códigos dos fornecedores do projeto J1 (ou outro a gosto).
select CodProj, CodFor from Fornecimento where CodProj = 2

-----  Mostrar os nomes dos projetos fornecidos pelo fornecedor F1 (ou outro a gosto). 
select FNome "Projetos do fornecedor Porsi"
from Fornecimento f
inner join Fornecedor p
on f.CodFor = p.CodFor
where FNome = 'Porsi'

----- Mostrar as cores das peças fornecidas pelo fornecedor F1(ou outro a gosto).
select Cor, CodFor
from Fornecimento f
inner join Peça p
on f.CodPeca = p.CodPeca
where CodFor = 3

-----  Mostrar os códigos dos fornecedores dos projetos J1 e J2 (ou outro a gosto).
select FNome, CodProj
from Fornecimento f
inner join Fornecedor p
on f.CodFor = p.CodFor
where FNome in ('Ferrari','Prosi');

-----  Mostrar os códigos das peças fornecidas para projeto em Lisboa. (ou outro a gosto). 
select f.CodPeca, t.Cidade
from Fornecimento f
inner join Peça p
on f.CodPeca = p.CodPeca
inner join Projeto t
on f.CodProj = t.CodProj
where Cidade = 'Porto'

-----  Mostrar os códigos dos fornecedores que forneceram uma peça vermelha para algum projeto 
-----  em Lisboa ou no Porto. (ou outras duas cidades a gosto). 
select f.CodFor, c.Cor, t.Cidade
from Fornecimento f
inner join Peça c
on f.CodPeca = c.CodPeca
inner join Projeto t
on f.CodProj = t.CodProj
where Cidade in ('Braga','Madrid') 

-----  Mostrar os códigos dos projetos fornecidos por todos os fornecedores que fornecem alguma peça vermelha
select f.CodFor from Fornecedor f
inner join Fornecimento fo
on f.CodFor=fo.CodFor
inner join Peça p
on p.CodPeca=fo.CodPeca
inner join Projeto pr
on pr.CodProj=fo.CodProj
where p.Cor='Vermelho' AND (pr.Cidade='Braga' OR pr.Cidade='Porto') 

----- Mostra o número total de projetos que têm como fornecedor o F3 (ou outro a gosto)
select count(Qtd) as Quantidade from Fornecimento f
inner join Fornecedor v
on f.CodFor = v.CodFor
where FNome = 'Ferrari'

-----  Mostrar o número de peças fornecidas por cada fornecedor.
select f.Qtd, p.Fnome
from Fornecedor p
inner join Fornecimento f
on f.CodFor=p.CodFor

-----  Mostrar peças que nunca foram fornecidas a qualquer projeto.
select p.CodPeca, p.PNome
from Peça p
left join Fornecimento f
on f.CodPeca = p.CodPeca
where f.CodPeca is null