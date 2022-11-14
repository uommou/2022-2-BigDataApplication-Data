--load data local infile '상대경로' into table team07.테이블명 fields terminated by ',';
--이 형식 지켜서 csv 파일 삽입하면 됩니다.
--상대경로는 실행하는 쉘 기준인 듯. C:\xampp 이 현재 디렉토리

load data local infile "htdocs/team07/recent/user.csv" into table team07.users fields terminated by ',';
load data local infile "htdocs/team07/recent/keyword.csv" into table team07.keyword fields terminated by ',';
load data local infile "htdocs/team07/recent/country.csv" into table team07.country fields terminated by ',';
load data local infile "htdocs/team07/recent/company.csv" into table team07.company fields terminated by ',';
load data local infile "htdocs/team07/recent/actor.csv" into table team07.actor fields terminated by ',';
load data local infile "htdocs/team07/recent/director.csv" into table team07.director fields terminated by ',';
load data local infile "htdocs/team07/recent/genre.csv" into table team07.genre fields terminated by ',';
load data local infile "htdocs/team07/recent/movie_metadata.csv" into table team07.movie_metadata fields terminated by ',';
load data local infile "htdocs/team07/recent/review.csv" into table team07.review fields terminated by ',';
load data local infile "htdocs/team07/recent/describes.csv" into table team07.describes fields terminated by ',';
load data local infile "htdocs/team07/recent/characters.csv" into table team07.characters fields terminated by ',';
load data local infile "htdocs/team07/recent/movie_company.csv" into table team07.movie_company fields terminated by ',';