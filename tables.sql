drop table RESOURCE_MANAGER_DEVICE_PARAM;
drop table RESOURCE_MANAGER_PROGRAM_PARAM;
drop table RESOURCE_MANAGER_PARAM;
drop table RESOURCE_MANAGER;
drop table TASK_PROFILE;
drop table TASK;
drop table PROGRAM_PROFILE;
drop table PROFILE;
drop table DEVICE;
drop table PROGRAM;

create table PROGRAM(
    program_id int unique primary key,
    program_name varchar(30),
    program_description varchar(100),
    program_active boolean,
    reg_date timestamp
);

create table DEVICE(
    device_id smallint unique primary key,
    device_name varchar(30),
    device_description varchar(50),
    device_type varchar(10),
    device_online boolean,
    device_status smallint,
    task_id bigint,
    task_priority int
);

create table PROFILE(
    profile_id smallint unique primary key,
    profile_name varchar(30),
    profile_description varchar(50),
    profile_active boolean,
    device_type varchar(10),
    device_count smallint,
    profile_static boolean,
    device_id smallint
);

create table PROGRAM_PROFILE(
    program_id int references PROGRAM(program_id),
    profile_id smallint references PROFILE(profile_id),
    profile_active boolean,
    reg_date timestamp
);

create table TASK(
    task_id bigint unique primary key,
    program_id int references PROGRAM(program_id),
    task_status smallint,
    req_time timestamp
);

create table TASK_PROFILE(
    task_id bigint references TASK(task_id),
    profile_id smallint references PROFILE(profile_id),
    profile_priority int,
    profile_status smallint
);

create table RESOURCE_MANAGER(
    manager_id smallint unique not null primary key,
    manager_name varchar(30),
    manager_online boolean,
    manager_status smallint,
    manager_address varchar(50)
);

create table RESOURCE_MANAGER_PARAM(
    manager_id smallint references RESOURCE_MANAGER(manager_id),
    param_name varchar(30),
    param_value varchar(150)
);

create table RESOURCE_MANAGER_PROGRAM_PARAM(
    manager_id smallint references RESOURCE_MANAGER(manager_id),
    program_id int references PROGRAM(program_id),
    param_name varchar(30), --INIT_TIME, CHECK_TIME, MIN_WORK_TIME, MAX_WORK_TIME, SAVE_TIME, PROGRESS_INFO_TIME
    param_value varchar(150)
);

create table RESOURCE_MANAGER_DEVICE_PARAM(
    manager_id smallint references RESOURCE_MANAGER(manager_id),
    device_id smallint references DEVICE(device_id),
    device_name varchar(30),
    param_name varchar(30),
    param_value varchar(150)
)