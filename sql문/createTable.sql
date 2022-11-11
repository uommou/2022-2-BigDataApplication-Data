create table user(
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
    countryId int not null,
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
    overview varchar,
    tagline varchar,
    openDt date,
    posterPath varchar,
    directorId int,
    genreId int,
    countryId int,
    runtime int
    primary key (movieId),
    foreign key (directorId) references director(directorId),
    foreign key (genreId) references genre(genreId),
    foreign key (countryId) references country(countryId)
)

create table review(
    userId int not null,
    movieId int not null,
    rating float not null,
    comments varchar(300),
    reviewTime smalldatetime not null,
    primary key (userId, movieId),
    foreign key (userId) references user(userId),
    foreign key (movieId) references movie_metadata(movieId)
);

create table describes(
    keywordId int not null,
    movieId int not null,
    primary key (keywordId, movieId),
    foreign key (keywordId) references keyword(keywordId),
    foreign key (movieId) references movie_metadata(movieId)
);

create table character(
    actorId int not null,
    movieId int not null,
    characterName varchar,
    order int not null,
    primary key (actorId, movieId),
    foreign key (actorId) references actor(actorId),
    foreign key (movieId) references movie_metadata(movieId)
);

create table movie_company(
    companyId int not null,
    movieId int not null,
    primary key (companyId, movieId),
    foreign key (companyId) references company(companyId),
    foreign key (movieId) references movie_metadata(movieId)
);