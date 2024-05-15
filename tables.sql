drop table if exists QUEUE_MANAGER_PARAM;
drop table if exists DECISION;
drop table if exists TASK_SESSION_STAGE;
drop table if exists TASK_SESSION;
drop table if exists RESOURCE_MANAGER_DEVICE_PARAM;
drop table if exists DEVICE;
drop table if exists RESOURCE_MANAGER_PROGRAM_PARAM;
drop table if exists RESOURCE_MANAGER_PARAM;
drop table if exists RESOURCE_MANAGER;
drop table if exists TASK_PROFILE;
drop table if exists TASK;
drop table if exists PROGRAM_PROFILE;
drop table if exists PROFILE;
drop table if exists PROGRAM;
drop table if exists DICT_TASK_SESSION_STATUS;
drop table if exists DICT_DEVICE_STATUS;
drop table if exists DICT_TASK_PROFILE_STATUS;

create table DICT_TASK_PROFILE_STATUS(
    constant_status smallint unique,
    constant_value varchar(30)
);
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (1, 'ADD_TASK_IN_PROGRESS');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-1, 'ADD_TASK_FAILED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (2, 'IN_QUEUE');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-2, 'DELETED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (3, 'UPLOAD_DATA_IN_PROGRESS');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-3, 'UPLOAD_DATA_FAILED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (4, 'DOWNLOAD_IN_PROGRESS');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-4, 'DOWNLOAD_FAILED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (5, 'DEPLOY_IN_PROGRESS');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-5, 'DEPLOY_FAILED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (6, 'IN_WORK_PROTECTED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (7, 'IN_WORK');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-7, 'IS_STUCK');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (8, 'STOP_IN_PROGRESS');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-8, 'STOP_FAILED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (9, 'COLLECT_IN_PROGRESS');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-9, 'COLLECT_FAILED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (10, 'UPLOAD_IN_PROGRESS');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-10, 'UPLOAD_FAILED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (11, 'ENDED');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (111, 'ENDED_SAVE_DATA');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-11, 'END_ERROR');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-111, 'END_MIN_TIME_ERROR');
insert into DICT_TASK_PROFILE_STATUS(constant_status, constant_value) values (-112, 'END_MAX_TIME_ERROR');

create table DICT_DEVICE_STATUS(
    constant_status smallint unique,
    constant_value varchar(30)
);
insert into DICT_DEVICE_STATUS(constant_status, constant_value) values (-1, 'BROKEN');
insert into DICT_DEVICE_STATUS(constant_status, constant_value) values (0, 'READY');
insert into DICT_DEVICE_STATUS(constant_status, constant_value) values (1, 'IN_WORK');

create table DICT_TASK_SESSION_STATUS(
    constant_status smallint unique,
    constant_value varchar(30)
);
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (1, 'INITIALIZATION');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (2, 'CHECK_DEVICE_IN_PROGRESS');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-2, 'CHECK_DEVICE_FAILED');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (3, 'UPLOAD_DATA_IN_PROGRESS');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-3, 'UPLOAD_DATA_FAILED');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (4, 'DEPLOY_IN_PROGRESS');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-4, 'DEPLOY_FAILED');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (5, 'IN_WORK_PROTECTED');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (6, 'IN_WORK');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-6, 'IS_STUCK');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (7, 'STOP_IN_PROGRESS');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-7, 'STOP_FAILED');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (8, 'COLLECT_IN_PROGRESS');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-8, 'COLLECT_FAILED');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (9, 'UPLOAD_IN_PROGRESS');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-9, 'UPLOAD_FAILED');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (10, 'ENDED');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (101, 'ENDED_SAVE_DATA');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-10, 'END_ERROR');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-101, 'END_MIN_TIME_ERROR');
insert into DICT_TASK_SESSION_STATUS(constant_status, constant_value) values (-102, 'END_MAX_TIME_ERROR');

create table PROGRAM(
    program_id int unique primary key,
    program_name varchar(30),
    program_description varchar(100),
    program_active boolean,
    reg_date timestamp
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
    task_status smallint references DICT_TASK_PROFILE_STATUS(constant_status),
    req_time timestamp
);

create table TASK_PROFILE(
    task_id bigint references TASK(task_id),
    profile_id smallint references PROFILE(profile_id),
    profile_priority int,
    profile_status smallint references DICT_TASK_PROFILE_STATUS(constant_status)
);

create table RESOURCE_MANAGER(
    manager_id smallint unique not null primary key,
    manager_name varchar(30),
    manager_online boolean,
    manager_status smallint,
    manager_address varchar(50)
);

insert into RESOURCE_MANAGER(manager_id, manager_name, manager_online, manager_status, manager_address)
values (1, 'dev-manager', true, 0, '127.0.0.1:8080');

create table RESOURCE_MANAGER_PARAM(
    manager_id smallint references RESOURCE_MANAGER(manager_id),
    param_name varchar(30),
    param_value varchar(150)
);

insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'HOME_DIR', '/opt/programs_home');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'TASK_LOG_DIR', '/opt/programs_home/logs');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'CHECK_NAME', 'check.sh');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'DEPLOY_NAME', 'deploy.sh');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'RUN_NAME', 'run.sh');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'STOP_NAME', 'stop.sh');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'COLLECT_NAME', 'collect.sh');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'PROGRESS_INFO_NAME', 'progress_info.sh');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'DOWNLOAD_COUNTDOWN', '60');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'CHECKDEVICE_COUNTDOWN', '30');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'CHECK_COUNTDOWN', '30');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'DEPLOY_COUNTDOWN', '30');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'STOP_COUNTDOWN', '120');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'COLLECT_COUNTDOWN', '30');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'UPLOAD_COUNTDOWN', '120');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'PROGRESSINFO_COUNTDOWN', '10');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'RESTORE_TIMEOUT', '60');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'LOG_MAX_AGE', '14');
insert into RESOURCE_MANAGER_PARAM (manager_id, param_name, param_value) values (1, 'DEBUG_MODE', 'false');

create table RESOURCE_MANAGER_PROGRAM_PARAM(
    manager_id smallint references RESOURCE_MANAGER(manager_id),
    program_id int references PROGRAM(program_id),
    param_name varchar(30), --INIT_TIME, CHECK_TIME, MIN_WORK_TIME, MAX_WORK_TIME, SAVE_TIME, PROGRESS_INFO_TIME
    param_value varchar(150)
);

create table DEVICE(
    device_id smallint unique primary key,
    device_name varchar(30),
    device_description varchar(50),
    device_type varchar(10),
    device_online boolean,
    device_status smallint references DICT_DEVICE_STATUS(constant_status),
    manager_id smallint references RESOURCE_MANAGER(manager_id),
    task_id bigint,
    task_priority int
);

create table RESOURCE_MANAGER_DEVICE_PARAM(
    manager_id smallint references RESOURCE_MANAGER(manager_id),
    device_id smallint references DEVICE(device_id),
    param_name varchar(30),
    param_value varchar(150)
);

create table TASK_SESSION(
    session_id bigint unique not null primary key,
    task_id bigint references TASK(task_id),
    manager_id smallint references RESOURCE_MANAGER(manager_id),
    session_status smallint
);

create table TASK_SESSION_STAGE(
    session_id bigint references TASK_SESSION(session_id),
    stage_name varchar(30),
    start_time timestamp,
    finish_time timestamp
);

create table DECISION(
    task_id bigint,
    device_name varchar(30),
    manager_name varchar(30)
);

create table QUEUE_MANAGER_PARAM(
    id smallint primary key,
    param_name varchar(30),
    param_value varchar(150)
);

insert into QUEUE_MANAGER_PARAM(id, param_name, param_value) values (1, 'DECISION_TIMEOUT_SEC', '30');