
drop table fpersons;

create table fpersons (
    id bigint unsigned auto_increment ,
    first_name varchar(100) not null ,
    last_name varchar(100) not null ,
    state char(3) not null ,
    birthday date not null ,
    bio text not null ,

    primary key (id)
);

alter table fpersons add fulltext index  `fulltext`(first_name, last_name, bio);

show indexes from fpersons;


select * from fpersons limit 23;

-- fulltext index
-- default natural language mode
 select
     * from fpersons
      where
              match(first_name, last_name, bio) against ('novelist and');


-- boolean mode

select fpersons.* , match(first_name, last_name, bio) against ('+engineer -working' in boolean  mode)
    from fpersons
where match(first_name, last_name, bio) against ('+engineer -working' in boolean mode);



select state, count(*) as state_count from fpersons
group by state
order by state_count desc;






















-- Generate 50 rows of realistic person data
INSERT INTO fpersons (first_name, last_name, state, birthday, bio)
VALUES
    ('Emma', 'Rodriguez', 'CA', '1992-03-15', 'Software engineer passionate about machine learning and hiking in the Sierra Nevada. Started coding at 15 and now leads a team at a cutting-edge tech startup in Silicon Valley.'),
    ('Liam', 'Thompson', 'NY', '1987-11-22', 'Award-winning photojournalist who has documented social movements across three continents. Published in National Geographic and winner of the Pulitzer Prize for feature photography.'),
    ('Sophia', 'Chen', 'WA', '1995-07-08', 'Marine biologist specializing in coral reef conservation. Currently researching climate change impacts on ocean ecosystems and developing sustainable marine protection strategies.'),
    ('Noah', 'Patel', 'TX', '1983-09-30', 'Successful restaurateur who owns a chain of farm-to-table restaurants across Texas. Advocates for local agriculture and sustainable food systems.'),
    ('Olivia', 'Kawasaki', 'HI', '1990-05-17', 'Professional surfer and environmental activist. Works with local communities to protect marine habitats and promote ocean conservation.'),
    ('Ethan', 'Murphy', 'IL', '1988-12-05', 'Jazz musician and music educator. Plays saxophone with several Chicago-based ensembles and runs a nonprofit teaching music to underprivileged youth.'),
    ('Ava', 'Goldstein', 'NJ', '1993-01-25', 'Pediatric oncologist doing groundbreaking research on childhood cancer treatments. Published numerous scientific papers and recipient of the Young Investigator Award.'),
    ('Mason', 'Garcia', 'AZ', '1985-06-12', 'Solar energy entrepreneur who has developed innovative renewable energy solutions for rural communities in the Southwest.'),
    ('Isabella', 'Nguyen', 'CA', '1991-08-03', 'Tech startup founder focused on developing AI-driven educational platforms for underserved communities.'),
    ('William', 'O\'Connor', 'MA', '1986-04-19', 'Pulitzer Prize-winning novelist and creative writing professor at a prestigious New England university.'),
    ('Mia', 'Kim', 'WA', '1994-10-11', 'Professional rock climber and outdoor gear designer. Has scaled some of the most challenging peaks in the Cascades and Andes.'),
    ('James', 'Rivera', 'FL', '1989-02-14', 'Marine biologist and shark conservation expert. Leads research expeditions studying marine predator populations in the Gulf of Mexico.'),
    ('Charlotte', 'Levy', 'NY', '1996-07-26', 'Emerging documentary filmmaker focusing on social justice issues. Her latest film won critical acclaim at the Sundance Film Festival.'),
    ('Benjamin', 'Mehta', 'TX', '1984-11-09', 'Cardiovascular surgeon known for pioneering minimally invasive heart surgery techniques.'),
    ('Amelia', 'Santos', 'CA', '1992-05-01', 'Professional dancer and choreographer with a contemporary dance company in San Francisco.'),
    ('Lucas', 'Fitzgerald', 'IL', '1987-09-16', 'Craft brewery owner who specializes in experimental and locally-sourced ingredient brewing.'),
    ('Harper', 'Wong', 'WA', '1993-03-07', 'Environmental lawyer fighting for indigenous land rights and climate change mitigation.'),
    ('Elijah', 'Morales', 'NM', '1986-12-22', 'Archaeological researcher specializing in pre-Columbian civilizations of the Southwest.'),
    ('Evelyn', 'Sullivan', 'CO', '1990-06-30', 'Professional mountain guide and wilderness survival instructor with over 15 years of experience in the Rocky Mountains.'),
    ('Alexander', 'Tanaka', 'OR', '1988-01-18', 'Sustainable agriculture expert developing innovative urban farming techniques.'),
    ('Abigail', 'Bennett', 'MI', '1995-11-05', 'Robotics engineer working on advanced prosthetic technologies for medical applications.'),
    ('Jackson', 'Cruz', 'CA', '1983-08-09', 'Award-winning chef specializing in fusion cuisine and sustainable food practices.'),
    ('Emily', 'Reyes', 'TX', '1991-04-27', 'Space systems engineer at a leading aerospace company, working on next-generation satellite technologies.'),
    ('Daniel', 'Park', 'NJ', '1986-10-14', 'Professional jazz pianist and music producer with international acclaim.'),
    ('Sofia', 'Andersen', 'WA', '1994-02-01', 'Wildlife conservation photographer documenting endangered species in the Pacific Northwest.'),
    ('Michael', 'Russo', 'NY', '1989-07-23', 'Broadway theater director known for innovative and socially conscious productions.'),
    ('Avery', 'Hassan', 'CA', '1992-11-30', 'Tech entrepreneur developing AI-driven mental health support platforms.'),
    ('Elizabeth', 'Lee', 'IL', '1987-05-12', 'Public health researcher focusing on community-based healthcare solutions.'),
    ('Matthew', 'Alvarez', 'FL', '1990-09-08', 'Marine conservation biologist studying coral reef restoration techniques.'),
    ('Scarlett', 'Gupta', 'TX', '1993-01-17', 'Renewable energy policy advisor working with state-level government on sustainable energy initiatives.'),
    ('Gabriel', 'Stewart', 'CO', '1985-06-25', 'Professional mountain bike trail designer and outdoor recreation planner.'),
    ('Aria', 'Mohamed', 'CA', '1996-03-03', 'Emerging virtual reality developer creating immersive educational experiences.'),
    ('Jack', 'O\'Brien', 'MA', '1988-12-11', 'Craft beer brewmaster and agricultural sustainability consultant.'),
    ('Chloe', 'Nakamura', 'WA', '1991-08-20', 'Environmental graphic designer specializing in sustainability communication.'),
    ('Ryan', 'Petrov', 'NY', '1984-02-07', 'International conflict resolution mediator with UN peacekeeping experience.'),
    ('Lily', 'Martinez', 'NM', '1993-10-16', 'Native American artist preserving and modernizing traditional textile arts.'),
    ('Nathan', 'Cooper', 'OR', '1986-05-29', 'Sustainable forestry expert developing innovative forest management practices.'),
    ('Hannah', 'Zimmerman', 'MI', '1990-07-14', 'Neuroscientist researching innovative treatments for neurological disorders.'),
    ('Samuel', 'Rodriguez', 'TX', '1989-01-05', 'Community organizer and social justice advocate working with immigrant populations.'),
    ('Layla', 'Singh', 'CA', '1995-04-22', 'Quantum computing researcher at a leading technology institute.'),
    ('Carter', 'Wallace', 'WA', '1987-11-08', 'Professional outdoor equipment designer and environmental sustainability consultant.'),
    ('Zoe', 'Kim', 'NY', '1992-06-19', 'Digital marketing strategist specializing in ethical and purpose-driven brands.'),
    ('Christopher', 'Fernandez', 'FL', '1985-09-02', 'Marine engineer developing sustainable maritime transportation technologies.'),
    ('Audrey', 'Patel', 'IL', '1994-03-26', 'Biotechnology researcher working on innovative genetic therapies.'),
    ('Isaac', 'O\'Connor', 'CA', '1988-10-07', 'Sustainable architecture designer focusing on eco-friendly urban development.'),
    ('Skylar', 'Chen', 'TX', '1991-05-15', 'Artificial intelligence ethics researcher and public policy consultant.');