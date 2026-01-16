
drop table fun;
create table fun(

    is_true boolean,
    zip_code char(10),
    ip_address_v4 int unsigned,
    ip_address_v6 binary(16),

    check ( (ip_address_v4 is not null) or ( ip_address_v6 is not null) )
);

show create table  fun ;

select inet6_aton("::");
select inet_aton("255.255.255.255");

insert into fun(is_true, zip_code, ip_address_v4, ip_address_v6)
values ( true, '19203', inet_aton("192.168.0.1") ,  inet6_aton("::"));

select inet_aton("192.168.0.1");

select is_true, zip_code, inet_ntoa(ip_address_v4) , inet6_ntoa(ip_address_v6)
    from fun