SET GLOBAL event_scheduler = ON;


CREATE TABLE Player (
p_id VARCHAR(7), name VARCHAR(50) NOT NULL, age INTEGER NOT NULL, nationality VARCHAR(20) NOT NULL,
PRIMARY KEY(p_id)
);



CREATE TABLE Team(
t_id VARCHAR(7), name VARCHAR(50) NOT NULL, money_spent DECIMAL(2,2), home_ground VARCHAR(50) NOT NULL, o_id VARCHAR(7) NOT NULL,
PRIMARY KEY(t_id),
FOREIGN KEY (o_id) REFERENCES Owner(o_id) ON DELETE CASCADE,
CONSTRAINT chk_team CHECK (money_spent < 50)
);


CREATE TABLE Venue(
v_id VARCHAR(7), name VARCHAR(50) NOT NULL,
PRIMARY KEY(v_id)
);



CREATE TABLE C_Match(
m_id VARCHAR(7), stage VARCHAR(15) NOT NULL, team1 VARCHAR(7), team2 VARCHAR(7), m_date DATE NOT NULL, toss_won_by VARCHAR(7) NOT NULL, result VARCHAR(7) NOT NULL, v_id VARCHAR(7) NOT NULL, u_id VARCHAR(7),
PRIMARY KEY(m_id),
FOREIGN KEY (v_id) REFERENCES Venue(v_id) ON DELETE CASCADE,
FOREIGN KEY (u_id) REFERENCES Umpire(u_id) ON DELETE CASCADE
);

CREATE TABLE Plays(
p_id VARCHAR(7), t_id VARCHAR(7) NOT NULL, c_year ENUM('2013','2014'),
FOREIGN KEY (p_id) REFERENCES Player(p_id) ON DELETE CASCADE,	
FOREIGN KEY (t_id) REFERENCES Team(t_id) ON DELETE CASCADE,
PRIMARY KEY(p_id,t_id,c_year)
);

CREATE TABLE captain(
p_id VARCHAR(7), t_id VARCHAR(7) NOT NULL, c_year ENUM('2013','2014'),
FOREIGN KEY (p_id) REFERENCES Player(p_id) ON DELETE CASCADE,
FOREIGN KEY (t_id) REFERENCES Team(t_id) ON DELETE CASCADE,
PRIMARY KEY(p_id,t_id,c_year)
);




CREATE TABLE T_award(
ta_id VARCHAR(7),t_id VARCHAR(7), name VARCHAR(50) NOT NULL, c_year ENUM('2013','2014'),
FOREIGN KEY(t_id) REFERENCES Team(t_id) ON DELETE CASCADE,
PRIMARY KEY(ta_id,c_year)
);

 
CREATE TABLE Player_stats(
p_id VARCHAR(7), m_id VARCHAR(7) NOT NULL, runs INTEGER NOT NULL, wickets INTEGER NOT NULL, catches INTEGER NOT NULL, sixes INTEGER NOT NULL, fours INTEGER NOT NULL, strike_rate DECIMAL NOT NULL,
FOREIGN KEY (p_id) REFERENCES Player(p_id) ON DELETE CASCADE,
FOREIGN KEY (m_id) REFERENCES C_Match(m_id) ON DELETE CASCADE,
PRIMARY KEY(p_id,m_id)
);


CREATE EVENT UA ON SCHEDULE EVERY 1 YEAR
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 YEAR
DO
UPDATE Player SET age=age+1;

INSERT INTO Player VALUES('1P0000A','Virat Kohli',27,'Indian');
INSERT INTO Player VALUES('1P0000B','Yuvraj Singh',32,'Indian');
INSERT INTO Player VALUES('1P0000C','MS Dhoni',34,'Indian');
INSERT INTO Player VALUES('1P0000D','Suresh Raina',28,'Indian');
INSERT INTO Player VALUES('1P0000E','Ravichandran Ashwin',27,'Indian');
INSERT INTO Player VALUES('1P0000F','Ravindra Jadeja',28,'Indian');
INSERT INTO Player VALUES('1P0000G','Ashish Nehra',37,'Indian');
INSERT INTO Player VALUES('1P0000H','Rohit Sharma',29,'Indian');
INSERT INTO Player VALUES('1P0000I','RP Singh',33,'Indian');
INSERT INTO Player VALUES('1P0000J','Sanju Samson',21,'Indian');
INSERT INTO Player VALUES('1P0000K','Shreyas Iyer',20,'Indian');
INSERT INTO Player VALUES('1P0000L','Gautam Gambhir',30,'Indian');
INSERT INTO Player VALUES('1P0000M','Shikhar Dhawan',29,'Indian');
INSERT INTO Player VALUES('2P0000A','Quinton De Kock',24,'South African');
INSERT INTO Player VALUES('2P0000B','AB De Villiers',32,'South African');
INSERT INTO Player VALUES('2P0000C','Dale Steyn',34,'South African');
INSERT INTO Player VALUES('2P0000E','Chris Morris',29,'South African');
INSERT INTO Player VALUES('2P0000F','JP Dumminy',27,'South African');
INSERT INTO Player VALUES('2P0000G','David Miller',27,'South African');
INSERT INTO Player VALUES('3P0000A','Steve Smith',25,'Australian');
INSERT INTO Player VALUES('3P0000B','Shane Watson',34,'Australian');
INSERT INTO Player VALUES('3P0000C','Brett Lee',38,'Australian');
INSERT INTO Player VALUES('3P0000D','David Warner',27,'Australian');
INSERT INTO Player VALUES('3P0000E','Aaron Finch',28,'Australian');
INSERT INTO Player VALUES('3P0000F','George Bailey',29,'Australian');
INSERT INTO Player VALUES('4P0000A','Brendon Mccullum',34,'New Zealand');
INSERT INTO Player VALUES('4P0000C','Ross Taylor',31,'New Zealand');
INSERT INTO Player VALUES('4P0000D','Trent Boult',25,'New Zealand');
INSERT INTO Player VALUES('5P0000A','Chris Gayle',32,'West Indian');
INSERT INTO Player VALUES('5P0000B','Dwyane Bravo',30,'West Indian');
INSERT INTO Player VALUES('6P0000B','Lasith Malinga',33,'Sri Lankan');
INSERT INTO Player VALUES('7P0000A','Eoin Morgan',29,'England');


INSERT INTO Owner VALUES('1O000A','Shah Rukh Khan');
INSERT INTO Owner VALUES('1O000B','Mukesh Ambani');
INSERT INTO Owner VALUES('1O000C','Vijay Malya');
INSERT INTO Owner VALUES('1O000D','GMR Co.');
INSERT INTO Owner VALUES('1O000E','India Cement');
INSERT INTO Owner VALUES('1O000F','Sun TV');
INSERT INTO Owner VALUES('1O000G','Shilpa Shetty');
INSERT INTO Owner VALUES('1O000H','Priety Zinta');


INSERT INTO Team VALUES('1T000F','Sun Risers Hyderabad',27.94,'Uppal Stadium','1O000F');
INSERT INTO Team VALUES('1T000B','Mumbai Indians',34.24,'Wankhade Stadium','1O000B');
INSERT INTO Team VALUES('1T000A','Kolkata Knight Riders',32.53,'Eden Gardens','1O000A');
INSERT INTO Team VALUES('1T000D','Delhi Daredevils',24.29,'Feroz Shah Kotla','1O000D');
INSERT INTO Team VALUES('1T000C','Royal Challengers Bangalore',41.90,'M Chinnaswamy Stadium','1O000C');
INSERT INTO Team VALUES('1T000E','Chennai Super Kings',38.81,'M. A. Chidambaram Stadium','1O000E');
INSERT INTO Team VALUES('1T000G','Rajasthan Royals',23.65,'Sawai Mansingh Stadium','1O000G');
INSERT INTO Team VALUES('1T000H','Kings XI Punjab',25.53,'Himachal Pradesh Cricket Association Stadium','1O000H');


INSERT INTO Coach VALUES('1C000A','1T000F','Tom Mody','Head');
INSERT INTO Coach VALUES('1C000B','1T000C','Alan Donald','Head');
INSERT INTO Coach VALUES('1C000C','1T000E','Stephan Flemming','Head');
INSERT INTO Coach VALUES('1C000D','1T000B','Ricky Ponting','Batting');
INSERT INTO Coach VALUES('1C000E','1T000B','Jonty Rhodes','Fielding');
INSERT INTO Coach VALUES('1C000F','1T000B','Shane Bond','Bowling');
INSERT INTO Coach VALUES('1C000G','1T000C','Daniel Vettori','Bowling');
INSERT INTO Coach VALUES('1C000H','1T000F','Muttaih Muralidharan','Bowling');
INSERT INTO Coach VALUES('1C000I','1T000H','Sanjay Bangar','Head');
INSERT INTO Coach VALUES('1C000J','1T000G','Paddy Upton','Head');
INSERT INTO Coach VALUES('1C000K','1T000D','Gary Kirsten','Head');
INSERT INTO Coach VALUES('1C000L','1T000A','Trevor Bayliss','Head');

INSERT INTO Venue VALUES('1V000A','Uppal Stadium');
INSERT INTO Venue VALUES('1V000B','Wankhade Stadium');
INSERT INTO Venue VALUES('1V000C','Eden Gardens');
INSERT INTO Venue VALUES('1V000D','Feroz Shah Kotla');
INSERT INTO Venue VALUES('1V000E','M Chinnaswamy Stadium');
INSERT INTO Venue VALUES('1V000F','M. A. Chidambaram Stadium');
INSERT INTO Venue VALUES('1V000G','Sawai Mansingh Stadium');
INSERT INTO Venue VALUES('1V000H','Himachal Pradesh Cricket Association Stadium');
INSERT INTO Venue VALUES('1V000I','Y S R ACA VDCA CRICKET STADIUM');
INSERT INTO Venue VALUES('1V000J','Punjab Cricket Association IS Bindra Stadium');
INSERT INTO Venue VALUES('1V000K','Sardar Patel Stadium');
INSERT INTO Venue VALUES('1V000L','Barabati Stadium');
INSERT INTO Venue VALUES('1V000M','Maharashtra Cricket Association Stadium');
INSERT INTO Venue VALUES('1V000N','Vidarbha Cricket Association Stadium');

INSERT INTO Captain VALUES('1P0000A','1T000C','2014');
INSERT INTO Captain VALUES('1P0000A','1T000C','2013');
INSERT INTO Captain VALUES('3P0000D','1T000F','2014');
INSERT INTO Captain VALUES('1P0000M','1T000F','2014');
INSERT INTO Captain VALUES('1P0000H','1T000B','2014');
INSERT INTO Captain VALUES('1P0000H','1T000B','2013');
INSERT INTO Captain VALUES('1P0000L','1T000A','2014');
INSERT INTO Captain VALUES('1P0000L','1T000A','2013');
INSERT INTO Captain VALUES('2P0000F','1T000D','2014');
INSERT INTO Captain VALUES('2P0000F','1T000D','2013');
INSERT INTO Captain VALUES('1P0000C','1T000E','2014');
INSERT INTO Captain VALUES('1P0000C','1T000E','2013');
INSERT INTO Captain VALUES('3P0000B','1T000G','2014');
INSERT INTO Captain VALUES('3P0000B','1T000G','2013');
INSERT INTO Captain VALUES('3P0000F','1T000H','2014');
INSERT INTO Captain VALUES('3P0000F','1T000H','2013');

INSERT INTO P_award VALUES('1PA000A','5P0000A','Orange Cap','2013');
INSERT INTO P_award VALUES('1PA000A','3P0000D','Orange Cap','2014');
INSERT INTO P_award VALUES('1PA000B','1P0000I','Purple Cap','2013');
INSERT INTO P_award VALUES('1PA000B','5P0000B','Purple Cap','2014');
INSERT INTO P_award VALUES('1PA000C','1P0000B','Atom MVP','2013');
INSERT INTO P_award VALUES('1PA000C','3P0000B','Atom MVP','2014');
INSERT INTO P_award VALUES('1PA000D','1P0000J','Rising Player','2013');
INSERT INTO P_award VALUES('1PA000D','1P0000K','Rising Player','2014');
INSERT INTO P_award VALUES('1PA000E','1P0000H','Maximum Sixes','2013');
INSERT INTO P_award VALUES('1PA000E','5P0000A','Maximum Sixes','2014');

INSERT INTO T_award VALUES('1TA000A','1T000B','IPL Winner','2013');
INSERT INTO T_award VALUES('1TA000A','1T000A','IPL Winner','2014');
INSERT INTO T_award VALUES('1TA000B','1T000E','IPL Runner Up','2013');
INSERT INTO T_award VALUES('1TA000B','1T000E','IPL Runner Up','2014');
INSERT INTO T_award VALUES('1TA000C','1T000G','IPL Third place','2013');
INSERT INTO T_award VALUES('1TA000C','1T000B','IPL Third place','2014');
INSERT INTO T_award VALUES('1TA000D','1T000E','Fairplay','2013');
INSERT INTO T_award VALUES('1TA000D','1T000F','Fairplay','2014');

INSERT INTO Plays VALUES('1P0000A','1T000C','2013');
INSERT INTO Plays VALUES('1P0000A','1T000C','2014');

INSERT INTO Plays VALUES('1P0000B','1T000C','2013');
INSERT INTO Plays VALUES('1P0000B','1T000C','2014');

INSERT INTO Plays VALUES('1P0000C','1T000E','2013');
INSERT INTO Plays VALUES('1P0000C','1T000E','2014');

INSERT INTO Plays VALUES('1P0000D','1T000E','2013');
INSERT INTO Plays VALUES('1P0000D','1T000E','2014');

INSERT INTO Plays VALUES('1P0000I','1T000B','2013');
INSERT INTO Plays VALUES('1P0000I','1T000B','2014');

INSERT INTO Plays VALUES('1P0000M','1T000B','2013');
INSERT INTO Plays VALUES('1P0000J','1T000B','2014');

INSERT INTO Plays VALUES('1P0000L','1T000G','2013');
INSERT INTO Plays VALUES('1P0000K','1T000G','2014');

INSERT INTO Plays VALUES('1P0000K','1T000B','2013');
INSERT INTO Plays VALUES('1P0000L','1T000B','2014');


INSERT INTO Plays VALUES('1P0000J','1T000A','2013');
INSERT INTO Plays VALUES('1P0000M','1T000A','2014');

INSERT INTO Plays VALUES('2P0000A','1T000A','2013');
INSERT INTO Plays VALUES('2P0000A','1T000A','2014');

INSERT INTO Plays VALUES('2P0000B','1T000C','2013');
INSERT INTO Plays VALUES('2P0000B','1T000C','2014');

INSERT INTO Plays VALUES('2P0000C','1T000F','2013');
INSERT INTO Plays VALUES('2P0000C','1T000F','2014');


INSERT INTO Plays VALUES('2P0000E','1T000D','2013');
INSERT INTO Plays VALUES('2P0000E','1T000D','2014');

INSERT INTO Plays VALUES('2P0000F','1T000D','2013');
INSERT INTO Plays VALUES('2P0000F','1T000D','2014');

INSERT INTO Plays VALUES('2P0000G','1T000D','2013');
INSERT INTO Plays VALUES('2P0000G','1T000D','2014');

INSERT INTO Plays VALUES('3P0000A','1T000D','2013');
INSERT INTO Plays VALUES('3P0000A','1T000D','2014');


INSERT INTO Plays VALUES('3P0000B','1T000G','2013');
INSERT INTO Plays VALUES('3P0000B','1T000G','2014');

INSERT INTO Plays VALUES('7P0000A','1T000A','2013');
INSERT INTO Plays VALUES('7P0000A','1T000A','2014');

INSERT INTO Plays VALUES('3P0000C','1T000A','2013');
INSERT INTO Plays VALUES('3P0000C','1T000A','2014');

INSERT INTO Plays VALUES('3P0000D','1T000F','2013');
INSERT INTO Plays VALUES('3P0000D','1T000F','2014');

INSERT INTO Plays VALUES('3P0000E','1T000F','2014');

INSERT INTO Plays VALUES('3P0000F','1T000H','2013');
INSERT INTO Plays VALUES('3P0000F','1T000H','2014');

INSERT INTO Plays VALUES('4P0000C','1T000C','2013');
INSERT INTO Plays VALUES('4P0000A','1T000C','2014');

INSERT INTO Plays VALUES('4P0000A','1T000E','2013');
INSERT INTO Plays VALUES('4P0000C','1T000E','2014');

INSERT INTO Plays VALUES('5P0000B','1T000G','2013');
INSERT INTO Plays VALUES('4P0000D','1T000G','2014');

INSERT INTO Plays VALUES('5P0000A','1T000E','2013');
INSERT INTO Plays VALUES('5P0000A','1T000E','2014');

INSERT INTO Plays VALUES('4P0000D','1T000G','2013');
INSERT INTO Plays VALUES('5P0000B','1T000G','2014');

INSERT INTO Plays VALUES('6P0000B','1T000B','2013');
INSERT INTO Plays VALUES('6P0000B','1T000B','2014');

INSERT INTO Plays VALUES('1P0000E','1T000H','2013');
INSERT INTO Plays VALUES('1P0000E','1T000H','2014');

INSERT INTO Plays VALUES('1P0000F','1T000F','2013');
INSERT INTO Plays VALUES('1P0000F','1T000F','2014');

INSERT INTO Plays VALUES('1P0000G','1T000H','2013');
INSERT INTO Plays VALUES('1P0000G','1T000H','2014');

INSERT INTO Plays VALUES('1P0000H','1T000H','2013');
INSERT INTO Plays VALUES('1P0000H','1T000H','2014');

INSERT INTO Umpire VALUES('1U000A','S Ravi','Indian',56);
INSERT INTO Umpire VALUES('1U000B','Simon Taufel','Australian',208);
INSERT INTO Umpire VALUES('1U000C','Aleem Daar','Pakistan',171);
INSERT INTO Umpire VALUES('1U000D','Kumar Dharmasena','Sri Lankan',156);
INSERT INTO Umpire VALUES('1U000E','Billy Bowden','New Zealand',203);
INSERT INTO Umpire VALUES('1U000F','Steve Bucknor','West Indian',21);
INSERT INTO Umpire VALUES('1U000G','Richard Kettleborough','England',171);
INSERT INTO Umpire VALUES('1U000H','Ian Gould','England',123);
INSERT INTO Umpire VALUES('1U000I','Rod Tucker','Australian',98);
INSERT INTO Umpire VALUES('1U000J','David Shepard','England',87);

INSERT INTO C_Match VALUES('3M130A','Group','1T000A','1T000B',"2013-04-12",'1T000B','1T000B','1V000B','1U000A');
INSERT INTO C_Match VALUES('3M130B','Group','1T000B','1T000C',"2013-04-13",'1T000B','1T000B','1V000E','1U000B');
INSERT INTO C_Match VALUES('3M130C','Group','1T000C','1T000D',"2013-04-14",'1T000C','1T000D','1V000D','1U000C');
INSERT INTO C_Match VALUES('3M130D','Group','1T000D','1T000E',"2013-04-15",'1T000D','1T000D','1V000D','1U000D');
INSERT INTO C_Match VALUES('3M130E','Group','1T000E','1T000F',"2013-04-16",'1T000E','1T000F','1V000A','1U000E');
INSERT INTO C_Match VALUES('3M130F','Group','1T000F','1T000G',"2013-04-17",'1T000G','1T000F','1V000A','1U000F');
INSERT INTO C_Match VALUES('3M130G','Group','1T000G','1T000H',"2013-04-18",'1T000G','1T000G','1V000G','1U000G');
INSERT INTO C_Match VALUES('3M130H','Group','1T000H','1T000A',"2013-04-19",'1T000H','1T000H','1V000C','1U000H');
INSERT INTO C_Match VALUES('3M130I','Group','1T000A','1T000D',"2013-04-22",'1T000D','1T000D','1V000C','1U000I');
INSERT INTO C_Match VALUES('3M130J','Group','1T000B','1T000E',"2013-04-23",'1T000B','1T000E','1V000B','1U000J');
INSERT INTO C_Match VALUES('3M130K','Group','1T000C','1T000F',"2013-04-24",'1T000F','1T000F','1V000A','1U000A');
INSERT INTO C_Match VALUES('3M130L','Group','1T000D','1T000G',"2013-04-25",'1T000G','1T000D','1V000G','1U000B');
INSERT INTO C_Match VALUES('3M130M','Group','1T000E','1T000H',"2013-04-26",'1T000E','1T000H','1V000F','1U000C');
INSERT INTO C_Match VALUES('3M130N','Group','1T000F','1T000A',"2013-04-27",'1T000A','1T000F','1V000C','1U000D');
INSERT INTO C_Match VALUES('3M130O','Group','1T000G','1T000B',"2013-04-28",'1T000B','1T000G','1V000G','1U000E');
INSERT INTO C_Match VALUES('3M130P','Group','1T000H','1T000C',"2013-04-29",'1T000C','1T000H','1V000E','1U000F');
INSERT INTO C_Match VALUES('3M130Q','Semi Final','1T000G','1T000B',"2013-05-04",'1T000B','1T000B','1V000A','1U000G');
INSERT INTO C_Match VALUES('3M130R','Semi Final','1T000F','1T000E',"2013-05-05",'1T000F','1T000E','1V000B','1U000H');
INSERT INTO C_Match VALUES('3M130S','Third','1T000F','1T000G',"2013-05-09",'1T000F','1T000G','1V000E','1U000I');
INSERT INTO C_Match VALUES('3M130T','Final','1T000E','1T000B',"2013-05-10",'1T000B','1T000B','1V000C','1U000J');
INSERT INTO C_Match VALUES('3M140A','Group','1T000A','1T000B',"2014-04-12",'1T000B','1T000B','1V000B','1U000A');
INSERT INTO C_Match VALUES('3M140B','Group','1T000B','1T000C',"2014-04-13",'1T000B','1T000B','1V000E','1U000B');
INSERT INTO C_Match VALUES('3M140C','Group','1T000C','1T000D',"2014-04-14",'1T000D','1T000C','1V000D','1U000C');
INSERT INTO C_Match VALUES('3M140D','Group','1T000D','1T000E',"2014-04-15",'1T000D','1T000D','1V000D','1U000D');
INSERT INTO C_Match VALUES('3M140E','Group','1T000E','1T000F',"2014-04-16",'1T000F','1T000E','1V000A','1U000E');
INSERT INTO C_Match VALUES('3M140F','Group','1T000F','1T000G',"2014-04-17",'1T000F','1T000G','1V000A','1U000F');
INSERT INTO C_Match VALUES('3M140G','Group','1T000G','1T000H',"2014-04-18",'1T000G','1T000G','1V000G','1U000G');
INSERT INTO C_Match VALUES('3M140H','Group','1T000H','1T000A',"2014-04-19",'1T000H','1T000H','1V000C','1U000H');
INSERT INTO C_Match VALUES('3M140I','Group','1T000A','1T000D',"2014-04-22",'1T000D','1T000D','1V000C','1U000I');
INSERT INTO C_Match VALUES('3M140J','Group','1T000B','1T000E',"2014-04-23",'1T000E','1T000B','1V000B','1U000J');
INSERT INTO C_Match VALUES('3M140K','Group','1T000C','1T000F',"2014-04-24",'1T000F','1T000F','1V000A','1U000A');
INSERT INTO C_Match VALUES('3M140L','Group','1T000D','1T000G',"2014-04-25",'1T000D','1T000G','1V000G','1U000B');
INSERT INTO C_Match VALUES('3M140M','Group','1T000E','1T000H',"2014-04-26",'1T000H','1T000H','1V000F','1U000C');
INSERT INTO C_Match VALUES('3M140N','Group','1T000F','1T000A',"2014-04-27",'1T000F','1T000F','1V000C','1U000D');
INSERT INTO C_Match VALUES('3M140O','Group','1T000G','1T000B',"2014-04-28",'1T000G','1T000B','1V000G','1U000E');
INSERT INTO C_Match VALUES('3M140P','Group','1T000H','1T000C',"2014-04-29",'1T000H','1T000C','1V000E','1U000F');
INSERT INTO C_Match VALUES('3M140Q','Semi Final','1T000G','1T000A',"2014-05-03",'1T000G','1T000A','1V000G','1U000G');
INSERT INTO C_Match VALUES('3M140R','Semi Final','1T000B','1T000E',"2014-05-05",'1T000E','1T000E','1V000C','1U000H');
INSERT INTO C_Match VALUES('3M140S','Third','1T000B','1T000G',"2014-05-09",'1T000B','1T000B','1V000D','1U000I');
INSERT INTO C_Match VALUES('3M140T','Final','1T000E','1T000A',"2014-05-11",'1T000A','1T000A','1V000B','1U000J');

INSERT INTO Player_stats VALUES('1P0000A','3M130B',78,0,3,4,7,165.56);
INSERT INTO Player_stats VALUES('1P0000A','3M130K',81,0,2,4,9,175.76);
INSERT INTO Player_stats VALUES('1P0000A','3M140C',65,0,5,3,6,148.52);
INSERT INTO Player_stats VALUES('1P0000A','3M140P',91,0,3,8,7,209.68);

INSERT INTO Player_stats VALUES('3P0000D','3M130F',93,0,1,6,9,179.89);
INSERT INTO Player_stats VALUES('3P0000D','3M130K',68,0,3,3,6,154.12);
INSERT INTO Player_stats VALUES('3P0000D','3M140N',108,0,1,9,8,198.73);
INSERT INTO Player_stats VALUES('3P0000D','3M140K',26,0,2,1,3,132.34);

INSERT INTO Player_stats VALUES('3P0000B','3M130G',32,2,0,0,4,112.33);
INSERT INTO Player_stats VALUES('3P0000B','3M130Q',67,1,1,3,5,147.76);
INSERT INTO Player_stats VALUES('3P0000B','3M140G',12,3,2,0,1,100.00);
INSERT INTO Player_stats VALUES('3P0000B','3M140L',74,2,1,4,7,176.53);

INSERT INTO Player_stats VALUES('6P0000B','3M130B',0,4,1,0,0,0);
INSERT INTO Player_stats VALUES('6P0000B','3M130Q',0,3,2,0,0,0);
INSERT INTO Player_stats VALUES('6P0000B','3M140R',0,4,0,0,0,0);
INSERT INTO Player_stats VALUES('6P0000B','3M140O',0,2,0,0,0,0);

-- Easy queries

SELECT name, age FROM Player WHERE age>32 AND nationality='Indian';

SELECT name, domain FROM Coach WHERE domain='Head';

SELECT v.name FROM Venue v, Team t WHERE v.name=t.home_ground;

SELECT name FROM Umpire WHERE nationality='England' AND experience>=50;

SELECT p.name FROM Player p, Team t, Plays x 
WHERE x.t_id=t.t_id AND x.p_id=p.p_id AND t.name='Chennai Super Kings' AND x.c_year='2014';

SELECT * FROM Captain c, Team t, Player p 
WHERE c.p_id=p.p_id AND c.t_id=t.t_id AND c.c_year='2014';

SELECT p.name FROM Player p, P_award paw 
WHERE p.p_id=paw.p_id AND p.nationality='Australian';

SELECT m_id, stage, m_date FROM C_Match WHERE toss_won_by=result;

-- Medium level queries

-- Runner up - can be used for all teams I have used MI as example
SELECT t.name, count(ta.t_id) FROM T_award ta, Team t 
WHERE t.t_id=ta.t_id AND ta.name='IPL Runner Up' AND t.name='Mumbai Indians'
GROUP BY t.name;

-- Winner - can be used for all teams I have used MI as example
SELECT t.name, count(ta.t_id) FROM T_award ta, Team t 
WHERE t.t_id=ta.t_id AND ta.name='IPL Winner' AND t.name='Mumbai Indians'
GROUP BY t.name;

-- Number of times captain for a team - include this in the player info for all the players we are creating links
SELECT p.name, c.c_year, count(c.p_id) FROM Captain c, Player p, Team t 
WHERE c.p_id=p.p_id AND t.t_id=c.t_id 
GROUP BY p.name, c.c_year, t.name;

-- Average wickets by Malinga in Semi Finals - include in Malinga's page
SELECT avg(ps.wickets) FROM Player_stats ps, C_Match m, Player p 
WHERE m.m_id=ps.m_id AND m.stage='Semi Final' AND ps.p_id=p.p_id AND p.name='Lasith Malinga';

-- Average Runs by Kohli/Warner in Group - include in respective players page
SELECT avg(ps.runs) FROM Player_stats ps, C_Match m, Player p 
WHERE m.m_id=ps.m_id AND m.stage='Group' AND ps.p_id=p.p_id AND p.name='Virat Kohli';

-- Complex queries

-- Average runs scored by Virat Kohli when he has won a match for the team he has played
SELECT avg(ps.runs), avg(ps.strike_rate) FROM Player_stats ps 
WHERE ps.m_id IN (
    SELECT m.m_id FROM C_Match m, Team t 
    WHERE m.result=t.t_id AND t.name IN (
        SELECT t.name FROM Team t, Plays py, Player pl 
        WHERE t.t_id=py.t_id AND pl.p_id=py.p_id AND pl.name='Virat Kohli'
    )
);

-- Average stats of shane watson at home games
SELECT avg(ps.runs), avg(ps.strike_rate), avg(ps.wickets) FROM Player_stats ps 
WHERE ps.m_id IN (
    SELECT m.m_id FROM C_Match m, Team t, Venue v 
    WHERE v.name=t.home_ground AND t.name IN (
        SELECT t.name FROM Team t, Plays py, Player pl 
        WHERE t.t_id=py.t_id AND pl.p_id=py.p_id AND pl.name='Shane Watson'
    )
);

-- Number of matches won by a team at home
SELECT count(DISTINCT m.m_id) FROM C_Match m, Team t, Venue v 
WHERE t.t_id=m.result AND m.v_id IN(
    SELECT v1.v_id FROM Venue v1, Team t1 
    WHERE t1.home_ground=v1.name AND t1.name='Rajasthan Royals'
);