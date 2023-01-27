create database musica 
use musica 

create table artista (
	idartista int primary key identity,
	artista varchar (45) not null
)

create table album (
	idalbum int primary key identity,
	album varchar (45) not null,
	lancamento char (4),
	artista_idartista int foreign key references artista
) 	

create table musica (
	idmusica int primary key identity,
	titulo varchar (45)not null,
	tempo time,
	letra text,
	album_idalbum int foreign key references album
)

insert into artista values ('Rush')
insert into artista values ('Tchaikowski')
insert into artista values ('Justin bieber')


select*from artista

insert into album (album,lancamento,artista_idartista)
	values ('Test for echo','2001','1')
insert into musica(titulo,tempo,album_idalbum)
	values ('Test for echo','00:08:32',1)
	
	select * from artista,album
	where idartista = artista_idartista
	
	select * from artista,album,musica
	where idartista = artista_idartista and
		idalbum = album_idalbum

-- 1 - Inserir 10 artistas, 5 albuns e 20 musicas 
-- referente aos albuns e artistas 
insert into artista values ('Rush')
insert into artista values ('Tchaikowski')
insert into artista values ('Justin bieber')
insert into artista values ('Jack Jhonson')
insert into artista values ('Jonh Mayer')
insert into artista values ('Jasho Mars')
insert into artista values ('Bruno Mars')
insert into artista values ('Chad Smith')
insert into artista values ('Cliff Burton')
insert into artista values ('Corey Taylor')

	select*from artista

insert into album (album,lancamento,artista_idartista)
	values ('The Getaway','2016','5')
	
insert into album (album,lancamento,artista_idartista)
	values ('Lowa','2001','3')

insert into album (album,lancamento,artista_idartista)
	values ('And Justice for All','1988','4')

insert into album (album,lancamento,artista_idartista)
	values ('Brushfire Fairytales','2001','2')
	
insert into album (album,lancamento,artista_idartista)
	values ('Continuum','2006','1')
	
	select*from album


insert into musica(titulo,tempo,album_idalbum)
	values('Mouth for war','00:03:42',6)
insert into musica(titulo,tempo,album_idalbum)
	values('Nevermind','00:08:32',1)
insert into musica(titulo,tempo,album_idalbum)
	values('Lemonada','00:08:32',1)
insert into musica(titulo,tempo,album_idalbum)
	values('Ed sheeran','00:08:32',1)
insert into musica(titulo,tempo,album_idalbum)
	values('Purpose','00:08:32',1)
	select*from musica
-- 2 - Selecionar os nome sdos artistas com mais musicas 
select artista,count(*) from artista, album,musica
where idartista = artista_idartista
and idalbum = album_idalbum
group by artista
order by count (*) desc
-- 3 - Selecionar os albuns com maior tempo de execução	
select album,COUNT (*) from album,musica
where idalbum = album_idalbum
group by album 
order by COUNT (*) desc
-- 4 - Selecionar os artistas com menos musicas 
select artista, COUNT (*) from artista,album,musica
where idartista = artista_idartista 
and idalbum = album=idalbum group by artista
order by count (*) asc
-- 5 - Selecionar apenas o nome do artista, o nome do 
-- album e o titulo das músicas 
select artista , album, titulo from artista ,album,musica
where idartista= artista_idartista
idalbum=album_idalbum

-- 6 - Selecionar as musicas com tempo entre 3 e 5 minutos
select artista,album,titulo from artista ,album,musica
where idartista = artista_idartista
idalbum=album_idalbum
and tempo between '00:00:30' time '00:01:00'
-- 7 - Selecionar o total de músicas de cada album
select album, COUNT (titulo) from album, musica
where idalbum = album_idalbum
group by album 
order by COUNT (titulo) desc
-- 8 - Selecionar o total de músicas de cada artista
select artista , COUNT (titulo) from artista,album,musica
where idartista = artista_idartista and idalbum = album_idalbum
group by artista 
-- 9 - Selecionar os artistas com menos albuns e 
-- mais músicas
select artista , count(*) from artista,album,musica
where idartista = artista_idartista
group by artista
order by COUNT (album) asc , COUNT (titulo) desc 

-- 10 - Selecionar o tempo total de cada album
select CONVERT ( varchar , sum ( convert ( int,LEFT (tempo,2)))+(((SUM (CONVERT (int , RIGHT ( tempo,2)))
from musica 
-- 11 - Selecionar o total de artistas sem album
select artista, album from artista,album 
where not exists (select * from album where idartista = artista_idartista)
 
-- 12 - Selecionar os artistas com menos músicas 
-- nos albuns
select artista,album from musica,album,artista
where idartista = artista_idartista and idalbum = album_idalbum
group by artista,album 
order by COUNT(*)