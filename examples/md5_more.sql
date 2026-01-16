
drop table addresses;

create table if not exists addresses (
    id int unsigned ,
    primary_line varchar(100)  ,
    secondary_line varchar(100)  ,
    urbanization varchar(100)  ,
    last_line varchar(100) ,
    primary key (id)
);

-- enforce uniqueness and do equality lookups on multiple columns without using a giant composite index
alter table addresses add column md5 binary(16) generated always as (unhex(md5(concat_ws('|', primary_line, secondary_line, urbanization, last_line))));
alter table addresses add unique index (md5);
show indexes from addresses;

INSERT INTO addresses (id, primary_line, secondary_line, urbanization, last_line) VALUES
(1, '123 Main St', 'Apt 4B', 'Greenwood Heights', 'Brooklyn, NY 11222'),
(2, '456 Elm St', 'Suite 210', 'Downtown', 'San Francisco, CA 94107'),
(3, '789 Oak Ave', NULL, 'Sunnyvale', 'Sunnyvale, CA 94086'),
(4, '321 Maple Dr', 'Unit 12', 'Cedar Park', 'Austin, TX 78729'),
(5, '555 Birch Ln', NULL, 'Willow Creek', 'Denver, CO 80203'),
(6, '777 Cherry Blvd', 'Building 5', 'Holly Springs', 'Atlanta, GA 30303'),
(7, '999 Pine Rd', 'Floor 3', 'Silverwood', 'Seattle, WA 98109'),
(8, '112 Spruce Way', NULL, 'Aspen Ridge', 'Boulder, CO 80302'),
(9, '330 Cedar St', 'Apt 22A', 'Forest Glen', 'Portland, OR 97205'),
(10, '444 Willow Ct', 'Suite 100', 'Lakeside', 'Orlando, FL 32801'),
(11, '888 Palm Dr', NULL, 'Desert Bloom', 'Phoenix, AZ 85001'),
(12, '222 Magnolia Rd', 'Unit 8C', 'Parkside', 'Miami, FL 33101'),
(13, '678 Redwood Ave', 'Apt 9B', 'Shady Grove', 'Los Angeles, CA 90001'),
(14, '987 Poplar St', 'Building 2', 'Oak Hill', 'Dallas, TX 75201'),
(15, '345 Ash Blvd', 'Floor 4', 'Spring Meadows', 'Chicago, IL 60601'),
(16, '210 Cypress Ln', NULL, 'Pine Valley', 'San Diego, CA 92101'),
(17, '754 Sycamore Rd', 'Suite 5', 'Woodland Heights', 'Boston, MA 02108'),
(18, '432 Dogwood Ct', 'Unit 3', 'Evergreen', 'Charlotte, NC 28202'),
(19, '678 Hickory St', 'Apt 1A', 'Maplewood', 'New Orleans, LA 70130'),
(20, '890 Alder Way', 'Building 7', 'Birchwood', 'Las Vegas, NV 89101'),
(21, '100 Juniper Rd', 'Floor 2', 'Seaside', 'San Jose, CA 95112'),
(22, '234 Walnut Dr', NULL, 'Harborview', 'Baltimore, MD 21201'),
(23, '567 Chestnut Ave', 'Suite 300', 'Bayview', 'Tampa, FL 33602'),
(24, '789 Beech Ln', 'Unit 10A', 'Horizon Heights', 'Houston, TX 77001'),
(25, '123 Aspen Blvd', 'Building 1', 'Mountain Ridge', 'Salt Lake City, UT 84101');



describe addresses;