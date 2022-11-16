/*
db settings

mysql -u root

create database team07;
create user 'team07'@'localhost' identified by 'team07';
grant all privileges on team07.* to 'team07'@'localhost';

mysql -u team07 -p team07
*/

create table users(
    userId varchar(255) not null,
    pwd varchar(255) not null,
    userName varchar(255) not null,
    introduction varchar(255),
    primary key (userId)
);

create table keyword(
    keywordId int not null,
    keywordName varchar(255),
    primary key (keywordId)
);

create table country(
    countryId varchar(10) not null,
    countryName varchar(255),
    primary key (countryId)
);

create table company(
    companyId int not null,
    companyName varchar(255),
    primary key (companyId)
);

create table actor(
    actorId int not null,
    actorName varchar(255),
    primary key (actorId)
);

create table director(
    directorId int not null,
    directorName varchar(255),
    primary key (directorId)
);

create table genre(
    genreId int not null,
    genreName varchar(255),
    primary key (genreId)
);

create table movie_metadata(
    movieId int not null,
    adult boolean,
    popularity float,
    originalTitle varchar(255),
    overview varchar(20000),
    tagline varchar(20000),
    openDt date,
    posterPath varchar(10000),
    directorId int,
    genreId int,
    countryId varchar(10),
    runtime int,
    primary key (movieId),
    foreign key (directorId) references director(directorId) on update cascade on delete set null,
    foreign key (genreId) references genre(genreId) on update cascade on delete set null,
    foreign key (countryId) references country(countryId) on update cascade on delete set null
);

create table review(
    userId varchar(255) not null,
    movieId int not null,
    rating float not null,
    comments varchar(300),
    reviewTime datetime not null,
    primary key (userId, movieId),
    foreign key (userId) references users(userId) on update cascade,
    foreign key (movieId) references movie_metadata(movieId) on update cascade on delete cascade
);

create table describes(
    keywordId int not null,
    movieId int not null,
    primary key (keywordId, movieId),
    foreign key (keywordId) references keyword(keywordId) on update cascade on delete cascade,
    foreign key (movieId) references movie_metadata(movieId) on update cascade on delete cascade
);

create table characters(
    actorId int not null,
    movieId int not null,
    characterName varchar(255),
    characterOrder int not null,
    primary key (actorId, movieId),
    foreign key (actorId) references actor(actorId) on update cascade,
    foreign key (movieId) references movie_metadata(movieId) on update cascade on delete cascade
);

create table movie_company(
    companyId int not null,
    movieId int not null,
    primary key (companyId, movieId),
    foreign key (companyId) references company(companyId) on update cascade,
    foreign key (movieId) references movie_metadata(movieId) on update cascade on delete cascade
);

create index idx_actorId on actor(actorId);