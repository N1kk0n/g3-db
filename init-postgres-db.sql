CREATE USER rqm WITH PASSWORD 'g3_rqm';
CREATE USER qm WITH PASSWORD 'g3_qm';
CREATE USER rm WITH PASSWORD 'g3_rm';

CREATE ROLE manager;
GRANT manager TO rqm, qm, rm;

CREATE DATABASE g3;
\connect g3;
CREATE SCHEMA state_schema;
GRANT USAGE ON SCHEMA state_schema TO manager;

ALTER DEFAULT PRIVILEGES 
FOR USER postgres
IN SCHEMA state_schema
GRANT select, insert, update, delete ON TABLES TO manager;

--! For already exists objects
-- create table state_schema.user(name varchar(256));
-- GRANT select, insert, update, delete ON ALL TABLES IN SCHEMA state_schema TO manager;
-- GRANT usage, select ON SEQUENCES IN SCHEMA state_schema TO manager;

--! For new objects
-- For all tables
ALTER DEFAULT PRIVILEGES 
FOR USER postgres -- user who creates new objects 
IN SCHEMA state_schema
GRANT select, insert, update, delete ON TABLES TO manager; -- role who read new objects

-- For all sequences
ALTER DEFAULT PRIVILEGES
FOR USER postgres
IN SCHEMA state_schema
GRANT usage, select ON SEQUENCES TO manager; 

-- TABLES

-- drop table if exists QUEUE_MANAGER_PARAM;
-- drop table if exists DECISION;
-- drop table if exists TASK_SESSION_STAGE;
-- drop table if exists TASK_SESSION;
-- drop table if exists RESOURCE_MANAGER_DEVICE_PARAM;
-- drop table if exists DEVICE;
-- drop table if exists RESOURCE_MANAGER_PARAM;
-- drop table if exists TASK_PROFILE;
-- drop table if exists TASK;
-- drop table if exists PROGRAM_PROFILE;
-- drop table if exists PROFILE;
-- drop table if exists PROGRAM;
-- drop table if exists DICT_TASK_SESSION_STATUS;
-- drop table if exists DICT_DEVICE_STATUS;
-- drop table if exists DICT_TASK_PROFILE_STATUS;

create table state_schema.DICT_TASK_PROFILE_STATUS(
    constant_status smallint unique,
    constant_value varchar(32)
);

insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (1, 'ADD_TASK_IN_PROGRESS');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-1, 'ADD_TASK_FAILED');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (2, 'IN_QUEUE');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-2, 'DELETED');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (3, 'UPLOAD_DATA_IN_PROGRESS');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-3, 'UPLOAD_DATA_FAILED');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (4, 'DEPLOY_IN_PROGRESS');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-4, 'DEPLOY_FAILED');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (5, 'IN_WORK_PROTECTED');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (6, 'IN_WORK');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-6, 'IS_STUCK');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (7, 'STOP_IN_PROGRESS');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-7, 'STOP_FAILED');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (8, 'COLLECT_IN_PROGRESS');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-8, 'COLLECT_FAILED');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (9, 'UPLOAD_IN_PROGRESS');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-9, 'UPLOAD_FAILED');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (10, 'ENDED');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (101, 'ENDED_SAVE_DATA');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-10, 'END_ERROR');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-101, 'END_MIN_TIME_ERROR');
insert into state_schema.DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-102, 'END_MAX_TIME_ERROR');

create table state_schema.DICT_DEVICE_STATUS(
    constant_status smallint unique,
    constant_value varchar(32)
);
insert into state_schema.DICT_DEVICE_STATUS(constant_status, constant_value) values (-1, 'BROKEN');
insert into state_schema.DICT_DEVICE_STATUS(constant_status, constant_value) values (0, 'READY');
insert into state_schema.DICT_DEVICE_STATUS(constant_status, constant_value) values (1, 'IN_WORK');

create table state_schema.DICT_TASK_SESSION_STATUS(
    constant_status smallint unique,
    constant_value varchar(32)
);
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (1, 'INITIALIZATION');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (2, 'CHECK_DEVICE_IN_PROGRESS');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-2, 'CHECK_DEVICE_FAILED');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (3, 'UPLOAD_DATA_IN_PROGRESS');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-3, 'UPLOAD_DATA_FAILED');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (4, 'DEPLOY_IN_PROGRESS');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-4, 'DEPLOY_FAILED');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (5, 'IN_WORK_PROTECTED');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (6, 'IN_WORK');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-6, 'IS_STUCK');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (7, 'STOP_IN_PROGRESS');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-7, 'STOP_FAILED');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (8, 'COLLECT_IN_PROGRESS');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-8, 'COLLECT_FAILED');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (9, 'UPLOAD_IN_PROGRESS');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-9, 'UPLOAD_FAILED');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (10, 'ENDED');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (101, 'ENDED_SAVE_DATA');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-10, 'END_ERROR');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-101, 'END_MIN_TIME_ERROR');
insert into state_schema.DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-102, 'END_MAX_TIME_ERROR');

create table state_schema.PROGRAM(
    program_id int unique primary key,
    program_name varchar(32),
    program_description varchar(128),
    program_active boolean,
    reg_date timestamp
);

create table state_schema.PROFILE(
    profile_id smallint unique primary key,
    profile_name varchar(32),
    profile_description varchar(64),
    profile_active boolean,
    device_type varchar(10),
    device_count smallint,
    profile_static boolean,
    device_id smallint
);

create table state_schema.PROGRAM_PROFILE(
    program_id int references state_schema.PROGRAM(program_id),
    profile_id smallint references state_schema.PROFILE(profile_id),
    profile_active boolean,
    reg_date timestamp
);


create table state_schema.PROGRAM_PROFILE_PARAM(
    program_id int references state_schema.PROGRAM(program_id),
    profile_id smallint references state_schema.PROFILE(profile_id),
    param_name varchar(32),
    param_value varchar(164)
);

create table state_schema.TASK(
    task_id bigint unique primary key,
    program_id int references state_schema.PROGRAM(program_id),
    task_status smallint references state_schema.DICT_TASK_PROFILE_STATUS(constant_status),
    req_time timestamp
);

create table state_schema.TASK_PROFILE(
    task_id bigint references state_schema.TASK(task_id),
    profile_id smallint references state_schema.PROFILE(profile_id),
    profile_priority int,
    profile_status smallint references state_schema.DICT_TASK_PROFILE_STATUS(constant_status)
);

create table state_schema.DEVICE(
    device_id smallint unique primary key,
    device_name varchar(32),
    device_description varchar(64),
    device_type varchar(10),
    device_online boolean,
    device_status smallint references state_schema.DICT_DEVICE_STATUS(constant_status),
    task_id bigint,
    task_priority int
);

create table state_schema.DEVICE_PARAM(
    device_id smallint references state_schema.DEVICE(device_id),
    param_name varchar(32),
    param_value varchar(164)
);

create table state_schema.TASK_SESSION(
    session_id bigint unique not null primary key,
    task_id bigint references state_schema.TASK(task_id),
    session_status smallint
);

create table state_schema.TASK_SESSION_STAGE(
    session_id bigint references state_schema.TASK_SESSION(session_id),
    stage_name varchar(32),
    start_time timestamp,
    finish_time timestamp
);

create table state_schema.DECISION(
    task_id bigint,
    program_id int,
    device_name varchar(32)
);

create table state_schema.QUEUE_MANAGER_PARAM(
    id serial primary key,
    param_name varchar(32),
    param_value varchar(256)
);

create table state_schema.RESOURCE_MANAGER_PARAM(
    id serial primary key,
    param_name varchar(32),
    param_value varchar(256)
);

create table state_schema.COMPONENT(
    id int primary key,
    component_name varchar(64),
    topic_name varchar(64),
    ip_address_port varchar(64)
);


create table state_schema.OPERATION(
    id int primary key,
    operation_name varchar(64) not null,
    component_id int not null references state_schema.COMPONENT(id)
);


create table state_schema.GRAPH(
    id int primary key,
    graph_name varchar(64) not null
);


create table state_schema.ROUTE(
    id serial primary key,
    graph_id int not null references state_schema.GRAPH(id),
    status int not null
);


create table state_schema.VERTEX(
    id int primary key,
    graph_id int not null references state_schema.GRAPH(id),
    vertex_num int not null,
    operation_id int not null
);


create table state_schema.EDGE(
    graph_id int not null references state_schema.GRAPH(id),
    curr_vertex_id int not null,
    result int not null,
    next_graph_id int not null,
    next_vertex_id int not null,
    child_route boolean not null
);

create table state_schema.TOPIC_MESSAGE(
    id bigserial primary key,
    unique_id uuid unique not null,
    route_id int not null,
    producer_component varchar(64) not null,
    consumer_component varchar(64) not null,
    is_received boolean not null,
    content JSON not null
);

-- TEST DATA

-- devices
insert into state_schema.device(device_id, device_name, device_description, device_type, device_online, device_status, task_id, task_priority) values (1, 'dev-1-4cpu', '4 CPU (1/4)', 'c', true, 0, -1, -1);
insert into state_schema.device(device_id, device_name, device_description, device_type, device_online, device_status, task_id, task_priority) values (2, 'dev-2-4cpu', '4 CPU (1/4)', 'c', true, 0, -1, -1);
insert into state_schema.device(device_id, device_name, device_description, device_type, device_online, device_status, task_id, task_priority) values (3, 'dev-3-4cpu', '4 CPU (1/4)', 'c', true, 0, -1, -1);
insert into state_schema.device(device_id, device_name, device_description, device_type, device_online, device_status, task_id, task_priority) values (4, 'dev-4-4cpu', '4 CPU (1/4)', 'c', true, 0, -1, -1);

-- resource_manager_device_params
insert into state_schema.device_param(device_id, param_name, param_value) values (1, 'CHECK_PATH', '/opt/device/check_device-1.sh');
insert into state_schema.device_param(device_id, param_name, param_value) values (2, 'CHECK_PATH', '/opt/device/check_device-2.sh');
insert into state_schema.device_param(device_id, param_name, param_value) values (3, 'CHECK_PATH', '/opt/device/check_device-3.sh');
insert into state_schema.device_param(device_id, param_name, param_value) values (4, 'CHECK_PATH', '/opt/device/check_device-4.sh');
insert into state_schema.device_param(device_id, param_name, param_value) values (1, 'LOCAL_TEMPLATES_DIRECTORY', '/opt/templates/local');
insert into state_schema.device_param(device_id, param_name, param_value) values (2, 'LOCAL_TEMPLATES_DIRECTORY', '/opt/templates/local');
insert into state_schema.device_param(device_id, param_name, param_value) values (3, 'LOCAL_TEMPLATES_DIRECTORY', '/opt/templates/local');
insert into state_schema.device_param(device_id, param_name, param_value) values (4, 'LOCAL_TEMPLATES_DIRECTORY', '/opt/templates/local');
insert into state_schema.device_param(device_id, param_name, param_value) values (1, 'GLOBAL_TEMPLATES_DIRECTORY', '/opt/templates/global');
insert into state_schema.device_param(device_id, param_name, param_value) values (2, 'GLOBAL_TEMPLATES_DIRECTORY', '/opt/templates/global');
insert into state_schema.device_param(device_id, param_name, param_value) values (3, 'GLOBAL_TEMPLATES_DIRECTORY', '/opt/templates/global');
insert into state_schema.device_param(device_id, param_name, param_value) values (4, 'GLOBAL_TEMPLATES_DIRECTORY', '/opt/templates/global');
insert into state_schema.device_param(device_id, param_name, param_value) values (1, 'MAIL_ALARM', 'true');
insert into state_schema.device_param(device_id, param_name, param_value) values (2, 'MAIL_ALARM', 'true');
insert into state_schema.device_param(device_id, param_name, param_value) values (3, 'MAIL_ALARM', 'true');
insert into state_schema.device_param(device_id, param_name, param_value) values (4, 'MAIL_ALARM', 'true');
insert into state_schema.device_param(device_id, param_name, param_value) values (1, 'CHECK_COUNTDOWN', '20');
insert into state_schema.device_param(device_id, param_name, param_value) values (2, 'CHECK_COUNTDOWN', '20');
insert into state_schema.device_param(device_id, param_name, param_value) values (3, 'CHECK_COUNTDOWN', '20');
insert into state_schema.device_param(device_id, param_name, param_value) values (4, 'CHECK_COUNTDOWN', '20');

-- profiles
insert into state_schema.profile(profile_id, profile_name, profile_description, profile_active, device_type, device_count, profile_static, device_id) values (1, '4cpu-1/4', '1/4 half of <dev-*-4cpu>', true, 'c', 1, false, -1);
insert into state_schema.profile(profile_id, profile_name, profile_description, profile_active, device_type, device_count, profile_static, device_id) values (2, '4cpu-1/2', '1/2 half of <dev-*-4cpu>', true, 'c', 2, false, -1);
insert into state_schema.profile(profile_id, profile_name, profile_description, profile_active, device_type, device_count, profile_static, device_id) values (3, '4cpu-full', '1/4 half of <dev-*-4cpu>', true, 'c', 4, false, -1);
insert into state_schema.profile(profile_id, profile_name, profile_description, profile_active, device_type, device_count, profile_static, device_id) values (4, '4cpu-1/4 (static)', '1/4 half of <dev-*-4cpu> (static)', true, 'c', 1, true, 1);

-- programs
insert into state_schema.program(program_id, program_name, program_description, program_active, reg_date) values (1, 't001', 'Test #1 program for G3', true, current_timestamp);
insert into state_schema.program(program_id, program_name, program_description, program_active, reg_date) values (2, 't002', 'Test #2 program for G3', true, current_timestamp);

-- program_profiles
insert into state_schema.program_profile(program_id, profile_id, profile_active, reg_date) values (1, 1, true, current_timestamp);
insert into state_schema.program_profile(program_id, profile_id, profile_active, reg_date) values (1, 2, true, current_timestamp);
insert into state_schema.program_profile(program_id, profile_id, profile_active, reg_date) values (1, 3, true, current_timestamp);
insert into state_schema.program_profile(program_id, profile_id, profile_active, reg_date) values (1, 4, true, current_timestamp);

insert into state_schema.program_profile(program_id, profile_id, profile_active, reg_date) values (2, 1, true, current_timestamp);
insert into state_schema.program_profile(program_id, profile_id, profile_active, reg_date) values (2, 2, true, current_timestamp);

-- program_params
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'HOME', '/opt/programs_home/t001');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'CHECK', '/opt/programs_home/t001/check.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'DEPLOY', '/opt/programs_home/t001/deploy.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'RUN', '/opt/programs_home/t001/run.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'STOP', '/opt/programs_home/t001/stop.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'COLLECT', '/opt/programs_home/t001/collect.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'PROGRESSINFO', '/opt/programs_home/t001/progress_info.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'TEMPLATE_TASK_MARKER', 'true');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'GLOBAL_TEMPLATE_NAME', 'global_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'LOCAL_TEMPLATE_NAME', 'local_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'DOWNLOAD_COUNTDOWN', '60');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'CHECK_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'DEPLOY_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'PROGRESSINFO_COUNTDOWN', '10');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'STOP_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'COLLECT_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'UPLOAD_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'INIT_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'CHECK_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'MIN_WORK_TIME', '600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'MAX_WORK_TIME', '3600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'SAVE_TIME', '1800');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 1, 'PROGRESS_INFO_TIME', '120');

insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'HOME', '/opt/programs_home/t001');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'CHECK', '/opt/programs_home/t001/check.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'DEPLOY', '/opt/programs_home/t001/deploy.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'RUN', '/opt/programs_home/t001/run.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'STOP', '/opt/programs_home/t001/stop.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'COLLECT', '/opt/programs_home/t001/collect.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'PROGRESSINFO', '/opt/programs_home/t001/progress_info.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'TEMPLATE_TASK_MARKER', 'true');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'GLOBAL_TEMPLATE_NAME', 'global_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'LOCAL_TEMPLATE_NAME', 'local_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'DOWNLOAD_COUNTDOWN', '60');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'CHECK_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'DEPLOY_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'PROGRESSINFO_COUNTDOWN', '10');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'STOP_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'COLLECT_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'UPLOAD_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'INIT_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'CHECK_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'MIN_WORK_TIME', '600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'MAX_WORK_TIME', '3600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'SAVE_TIME', '1800');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 2, 'PROGRESS_INFO_TIME', '120');

insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'HOME', '/opt/programs_home/t001');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'CHECK', '/opt/programs_home/t001/check.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'DEPLOY', '/opt/programs_home/t001/deploy.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'RUN', '/opt/programs_home/t001/run.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'STOP', '/opt/programs_home/t001/stop.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'COLLECT', '/opt/programs_home/t001/collect.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'PROGRESSINFO', '/opt/programs_home/t001/progress_info.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'TEMPLATE_TASK_MARKER', 'true');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'GLOBAL_TEMPLATE_NAME', 'global_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'LOCAL_TEMPLATE_NAME', 'local_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'DOWNLOAD_COUNTDOWN', '60');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'CHECK_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'DEPLOY_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'PROGRESSINFO_COUNTDOWN', '10');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'STOP_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'COLLECT_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'UPLOAD_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'INIT_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'CHECK_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'MIN_WORK_TIME', '600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'MAX_WORK_TIME', '3600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'SAVE_TIME', '1800');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 3, 'PROGRESS_INFO_TIME', '120');

insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'HOME', '/opt/programs_home/t001');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'CHECK', '/opt/programs_home/t001/check.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'DEPLOY', '/opt/programs_home/t001/deploy.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'RUN', '/opt/programs_home/t001/run.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'STOP', '/opt/programs_home/t001/stop.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'COLLECT', '/opt/programs_home/t001/collect.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'PROGRESSINFO', '/opt/programs_home/t001/progress_info.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'TEMPLATE_TASK_MARKER', 'true');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'GLOBAL_TEMPLATE_NAME', 'global_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'LOCAL_TEMPLATE_NAME', 'local_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'DOWNLOAD_COUNTDOWN', '60');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'CHECK_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'DEPLOY_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'PROGRESSINFO_COUNTDOWN', '10');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'STOP_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'COLLECT_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'UPLOAD_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'INIT_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'CHECK_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'MIN_WORK_TIME', '600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'MAX_WORK_TIME', '3600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'SAVE_TIME', '1800');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (1, 4, 'PROGRESS_INFO_TIME', '120');


insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'HOME', '/opt/programs_home/t002');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'CHECK', '/opt/programs_home/t002/check.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'DEPLOY', '/opt/programs_home/t002/deploy.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'RUN', '/opt/programs_home/t002/run.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'STOP', '/opt/programs_home/t002/stop.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'COLLECT', '/opt/programs_home/t002/collect.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'PROGRESSINFO', '/opt/programs_home/t002/progress_info.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'TEMPLATE_TASK_MARKER', 'true');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'GLOBAL_TEMPLATE_NAME', 'global_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'LOCAL_TEMPLATE_NAME', 'local_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'DOWNLOAD_COUNTDOWN', '60');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'CHECK_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'DEPLOY_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'PROGRESSINFO_COUNTDOWN', '10');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'STOP_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'COLLECT_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'UPLOAD_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'INIT_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'CHECK_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'MIN_WORK_TIME', '600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'MAX_WORK_TIME', '3600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'SAVE_TIME', '1800');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 1, 'PROGRESS_INFO_TIME', '120');

insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'HOME', '/opt/programs_home/t002');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'CHECK', '/opt/programs_home/t002/check.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'DEPLOY', '/opt/programs_home/t002/deploy.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'RUN', '/opt/programs_home/t002/run.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'STOP', '/opt/programs_home/t002/stop.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'COLLECT', '/opt/programs_home/t002/collect.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'PROGRESSINFO', '/opt/programs_home/t002/progress_info.sh');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'TEMPLATE_TASK_MARKER', 'true');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'GLOBAL_TEMPLATE_NAME', 'global_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'LOCAL_TEMPLATE_NAME', 'local_template');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'DOWNLOAD_COUNTDOWN', '60');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'CHECK_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'DEPLOY_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'PROGRESSINFO_COUNTDOWN', '10');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'STOP_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'COLLECT_COUNTDOWN', '30');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'UPLOAD_COUNTDOWN', '120');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'INIT_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'CHECK_TIME', '300');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'MIN_WORK_TIME', '600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'MAX_WORK_TIME', '3600');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'SAVE_TIME', '1800');
insert into state_schema.program_profile_param (program_id, profile_id, param_name, param_value) values (2, 2, 'PROGRESS_INFO_TIME', '120');

--tasks
insert into state_schema.task(task_id, program_id, task_status, req_time) values (1, 1, 2, current_timestamp);
insert into state_schema.task(task_id, program_id, task_status, req_time) values (2, 2, 2, current_timestamp);
insert into state_schema.task(task_id, program_id, task_status, req_time) values (3, 2, 2, current_timestamp);

-- task_profiles
insert into state_schema.task_profile(task_id, profile_id, profile_priority, profile_status) values (1, 1, 10, 2);
insert into state_schema.task_profile(task_id, profile_id, profile_priority, profile_status) values (1, 2, 15, 2);
insert into state_schema.task_profile(task_id, profile_id, profile_priority, profile_status) values (1, 3, 20, 2);
insert into state_schema.task_profile(task_id, profile_id, profile_priority, profile_status) values (1, 4, 30, 2);

insert into state_schema.task_profile(task_id, profile_id, profile_priority, profile_status) values (2, 1, 10, 2);
insert into state_schema.task_profile(task_id, profile_id, profile_priority, profile_status) values (2, 2, 15, 2);

insert into state_schema.task_profile(task_id, profile_id, profile_priority, profile_status) values (3, 1, 10, 2);

-- components
insert into state_schema.component(id, component_name, topic_name) values(1, 'qm', 'qm-topic');
insert into state_schema.component(id, component_name, topic_name) values(2, 'rm', 'rm-topic');

--operations
insert into state_schema.operation(id, operation_name, component_id) values(1, 'TEST', 1);
insert into state_schema.operation(id, operation_name, component_id) values(2, 'TEST', 2);
insert into state_schema.operation(id, operation_name, component_id) values(3, 'END', 1);
insert into state_schema.operation(id, operation_name, component_id) values(4, 'END', 2);

--graphs
insert into state_schema.graph(id, graph_name) values(1, 'G3-TEST');

--vertexes
insert into state_schema.vertex(id, graph_id, vertex_num, operation_id) values(1, 1, 1, 1);
insert into state_schema.vertex(id, graph_id, vertex_num, operation_id) values(2, 1, 2, 2);
insert into state_schema.vertex(id, graph_id, vertex_num, operation_id) values(3, 1, 3, 3);

--edges
insert into state_schema.edge(graph_id, curr_vertex_id, result, next_graph_id, next_vertex_id, child_route) values(1, 1, 2, 1, 2, false);
insert into state_schema.edge(graph_id, curr_vertex_id, result, next_graph_id, next_vertex_id, child_route) values(1, 2, 2, 1, 3, false);
