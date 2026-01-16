drop table urls;

create table if not exists urls(
    id int unsigned,
    url text invisible ,
    primary key (id)
);

alter table urls add column url_md5 char(32) generated always as (md5(url));
alter table urls add index (url_md5);

-- use a binary representation for efficient lookups
alter table urls add column url_md5_bin binary(16) generated always as ( unhex(md5(url)));
alter table urls add index(url_md5_bin);

describe urls;

-- Insert dummy data into the table
INSERT INTO urls (id, url) VALUES
(1, 'https://example.com'),
(2, 'https://dummyurl.com'),
(3, 'https://testsite.org'),
(4, 'https://fakesite.net'),
(5, 'https://mockdata.io'),
(6, 'https://placeholder.com'),
(7, 'https://example.org'),
(8, 'https://demo.site'),
(9, 'https://example.edu'),
(10, 'https://example.gov');


explain select *, url from urls where urls.url_md5_bin  = unhex(md5('https://example.org'));

select *, unhex(urls.url_md5_bin) from urls;