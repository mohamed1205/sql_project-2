SELECT * FROM dataset_1;

SELECT * FROM dataset_2;

-- Number of rows in our dataset

SELECT count(*) FROM dataset_1  
SELECT count(*) FROM dataset_2  

-- dataset for Jharkhand and Bihar

SELECT * FROM dataset_1 where state in ('Jharkhand','Bihar')

-- population of india

SELECT sum(Population) AS population from dataset_2

-- avrage growth by state

SELECT state,ROUND(AVG(growth),2) AS avg_growth 
FROM dataset_1 
GROUP BY state 
ORDER BY avg_growth DESC;

-- avg sex_ratio

SELECT state,ROUND(AVG(sex_ratio),0) AS avg_sex_ratio
FROM dataset_1 
GROUP BY state 
ORDER BY avg_sex_ratio DESC;

-- avg literacy rate

SELECT state,ROUND(AVG(literacy),0) AS avg_literacy
FROM dataset_1 
GROUP BY state 
HAVING avg_literacy>90
ORDER BY avg_literacy DESC;

-- TOP 3 state showing hight growth ratio

SELECT state,ROUND(AVG(growth),2) AS avg_growth 
FROM dataset_1 
GROUP BY state 
ORDER BY avg_growth DESC
limit 3;

-- LAST 3 state showing lowest sex ratio

SELECT state,ROUND(AVG(sex_ratio),0) AS avg_sex_ratio
FROM dataset_1 
GROUP BY state 
ORDER BY avg_sex_ratio ASC
limit 3;

-- top and bottom 3 states in literacy state

drop table if exists top_states;
CREATE TABLE top_states 
(state varchar(255),t_state float);

insert into top_states
SELECT state,ROUND(AVG(literacy),0) AS avg_literacy
FROM dataset_1 
GROUP BY state 
ORDER BY avg_literacy DESC;

SELECT * FROM top_states ORDER BY top_states.t_state DESC limit 3;

drop table if exists bottom_states;
CREATE TABLE bottom_states 
(state varchar(255),b_state float);

insert into bottom_states
SELECT state,ROUND(AVG(literacy),0) AS avg_literacy
FROM dataset_1 
GROUP BY state 
ORDER BY avg_literacy asc;

SELECT * FROM bottom_states ORDER BY bottom_states.b_state asc limit 3;

-- use union operator to combine top and bottom 3 states in literacy state

SELECT * FROM( select * from top_states ORDER BY top_states.t_state DESC limit 3) as top
union
SELECT * FROM (select* from bottom_states ORDER BY bottom_states.b_state asc limit 3) as bottom
;

