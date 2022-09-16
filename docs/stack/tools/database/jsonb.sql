-- query data
-- address and subscription is json
select *
from public.user;
-- jsonb to identify json
create table public.users (
    id bigint,
    uid varchar(500),
    first_name varchar(500),
    last_name varchar(500),
    username varchar(500),
    email varchar(500),
    gender varchar(500),
    date_of_birth varchar(500),
    address jsonb,
    subscription jsonb,
    user_id bigint,
    dt_current_timestamp timestamp
);
insert into public.users
select id,
    uid,
    first_name,
    last_name,
    username,
    email,
    gender,
    date_of_birth,
    CAST(address as jsonb),
    CAST(subscription as jsonb),
    user_id,
    dt_current_timestamp
from public.user;
select jsonb_pretty(address) as address,
    jsonb_pretty(subscription) as subscription
from public.users;
select (subscription->>'plan') as plan,
    count(*) as count
from public.users
where subscription->>'plan' in ('Diamont', 'Business')
group by (subscription->>'plan') create index idx_sub_plan_jsonb on public.users ((subscription->>'plan') ASC)