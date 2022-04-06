# CREATE TABLE players
# (
#     id int unsigned not null auto_increment,
#     user_name varchar(32),
#     password varchar(32),
#     primary key (id),
#     unique (user_name)
# );

CREATE TABLE leagues
(
    id int unsigned not null auto_increment,
    league_name varchar(100) UNIQUE,
    start_date date,
    end_date date,
    owner_id int unsigned not null,
    primary key (id),
    foreign key (owner_id) references players (id)
);

CREATE TABLE leagues_players
(
    league_id int unsigned not null,
    player_id int unsigned not null,
    foreign key (league_id) references leagues(id),
    foreign key (player_id) references players(id),
    unique (league_id, player_id)
);