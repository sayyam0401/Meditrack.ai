use analysis;
SELECT * FROM meditrack_equipment;

#How many equipment assets are there?
select count(*) as total_equipments from meditrack_equipment;

#How many equipment items are in each category?
select count(*) as total_equipment,category from meditrack_equipment 
group by category
order by total_equipment desc;

#How many equipment items are in each department?
select department,count(*) as equipment_count from meditrack_equipment
group by department
order by equipment_count desc;

#What is the distribution of equipment by status?
select status,count(*) as equipment_count from meditrack_equipment
group by status
order by equipment_count desc;

#What is the total equipment purchase cost?
select sum(Purchase_Cost) as total_cost from meditrack_equipment;

#What is the average purchase cost by category?
select category,avg(Purchase_Cost) as avg_cost from meditrack_equipment
group by category
order by avg_cost desc;

#Which category has the highest maintenance cost?
select category, sum(Maintenance_Cost) as total_maintenance from meditrack_equipment
group by category 
order by total_maintenance desc
limit 1;

#What is the average maintenance cost by department?
select department,avg(Maintenance_Cost) as avg_maintenance 
from meditrack_equipment
group by department;

#Which equipment has the highest number of reported issues?
 select Equipment_ID,Equipment_Name,Issue_Count from meditrack_equipment
 order by Issue_Count desc
 limit 10;
 
 #Which equipment has the highest downtime?
select Equipment_ID,Equipment_Name,Downtime_Hours from meditrack_equipment
order by Downtime_Hours desc
limit 10;

#Department with the highest total downtime?
select Department,sum(Downtime_Hours) as total_downtime from meditrack_equipment
group by department
order by total_downtime desc
limit 1;

#Equipment with the highest usage hours?
select Equipment_ID,Equipment_Name,Usage_Hours from meditrack_equipment
order by Usage_Hours desc
limit 1;

#Relationship between usage and downtime
select
    Equipment_Name,
    ROUND(AVG(Usage_Hours), 2) AS avg_usage_hours,
    ROUND(AVG(Downtime_Hours), 2) AS avg_downtime_hours
from meditrack_equipment
GROUP BY Equipment_Name
ORDER BY avg_usage_hours DESC;