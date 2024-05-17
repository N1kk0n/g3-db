delete from task_profile;
delete from task;
delete from program_profile;
delete from resource_manager_program_param;
delete from program;
delete from profile;
delete from resource_manager_device_param;
delete from device;

-- devices
insert into device(device_id,
                   device_name, device_description,
                   device_type,
                   device_online, device_status,
                   manager_id,
                   task_id, task_priority)
values (1, 'dev-1-4cpu', '4 CPU (1/4)', 'c', true, 0, 1, -1, -1);
insert into device(device_id,
                   device_name, device_description,
                   device_type,
                   device_online, device_status,
                   manager_id,
                   task_id, task_priority)
values (2, 'dev-2-4cpu', '4 CPU (1/4)', 'c', true, 0, 1, -1, -1);
insert into device(device_id,
                   device_name, device_description,
                   device_type,
                   device_online, device_status,
                   manager_id,
                   task_id, task_priority)
values (3, 'dev-3-4cpu', '4 CPU (1/4)', 'c', true, 0, 1, -1, -1);
insert into device(device_id,
                   device_name, device_description,
                   device_type,
                   device_online, device_status,
                   manager_id,
                   task_id, task_priority)
values (4, 'dev-4-4cpu', '4 CPU (1/4)', 'c', true, 0, 1, -1, -1);

-- resource_manager_device_params
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 1, 'CHECK_PATH', '/opt/device/check_device-1.sh');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 2, 'CHECK_PATH', '/opt/device/check_device-2.sh');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 3, 'CHECK_PATH', '/opt/device/check_device-3.sh');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 4, 'CHECK_PATH', '/opt/device/check_device-4.sh');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 1, 'LOCAL_TEMPLATES_DIRECTORY', '/opt/templates/local');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 2, 'LOCAL_TEMPLATES_DIRECTORY', '/opt/templates/local');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 3, 'LOCAL_TEMPLATES_DIRECTORY', '/opt/templates/local');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 4, 'LOCAL_TEMPLATES_DIRECTORY', '/opt/templates/local');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 1, 'GLOBAL_TEMPLATES_DIRECTORY', '/opt/templates/global');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 2, 'GLOBAL_TEMPLATES_DIRECTORY', '/opt/templates/global');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 3, 'GLOBAL_TEMPLATES_DIRECTORY', '/opt/templates/global');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 4, 'GLOBAL_TEMPLATES_DIRECTORY', '/opt/templates/global');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 1, 'MAIL_ALARM', 'true');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 2, 'MAIL_ALARM', 'true');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 3, 'MAIL_ALARM', 'true');
insert into resource_manager_device_param(manager_id, device_id, param_name, param_value)
values (1, 4, 'MAIL_ALARM', 'true');

-- profiles
insert into profile(profile_id,
                    profile_name, profile_description,
                    profile_active,
                    device_type, device_count,
                    profile_static, device_id)
values (1, '4cpu-1/4', '1/4 half of <dev-*-4cpu>', true, 'c', 1, false, -1);
insert into profile(profile_id,
                    profile_name, profile_description,
                    profile_active,
                    device_type, device_count,
                    profile_static, device_id)
values (2, '4cpu-1/2', '1/2 half of <dev-*-4cpu>', true, 'c', 2, false, -1);
insert into profile(profile_id,
                    profile_name, profile_description,
                    profile_active,
                    device_type, device_count,
                    profile_static, device_id)
values (3, '4cpu-full', '1/4 half of <dev-*-4cpu>', true, 'c', 4, false, -1);
insert into profile(profile_id,
                    profile_name, profile_description,
                    profile_active,
                    device_type, device_count,
                    profile_static, device_id)
values (4, '4cpu-1/4 (static)', '1/4 half of <dev-*-4cpu> (static)', true, 'c', 1, true, 1);

-- programs
insert into program(program_id, program_name, program_description, program_active, reg_date)
values (1, 't001', 'Test #1 program for G3', true, current_timestamp);
insert into program(program_id, program_name, program_description, program_active, reg_date)
values (2, 't002', 'Test #2 program for G3', true, current_timestamp);

-- resource_manager_device_params
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'HOME', '/opt/programs_home/t001');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'CHECK', '/opt/programs_home/t001/check.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'DEPLOY', '/opt/programs_home/t001/deploy.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'RUN', '/opt/programs_home/t001/run.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'STOP', '/opt/programs_home/t001/stop.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'COLLECT', '/opt/programs_home/t001/collect.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'PROGRESSINFO', '/opt/programs_home/t001/progress_info.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'TEMPLATE_TASK_MARKER', 'true');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'GLOBAL_TEMPLATE_NAME', 'global_template');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 1, 'LOCAL_TEMPLATE_NAME', 'local_template');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'HOME', '/opt/programs_home/t002');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'CHECK', '/opt/programs_home/t002/check.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'DEPLOY', '/opt/programs_home/t002/deploy.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'RUN', '/opt/programs_home/t002/run.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'STOP', '/opt/programs_home/t002/stop.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'COLLECT', '/opt/programs_home/t002/collect.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'PROGRESSINFO', '/opt/programs_home/t002/progress_info.sh');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'TEMPLATE_TASK_MARKER', 'true');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'GLOBAL_TEMPLATE_NAME', 'global_template');
insert into resource_manager_program_param (manager_id, program_id, param_name, param_value)
values (1, 2, 'LOCAL_TEMPLATE_NAME', 'local_template');

-- program_profiles
insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (1, 1, true, current_timestamp);
insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (1, 2, true, current_timestamp);
insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (1, 3, true, current_timestamp);
insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (1, 4, true, current_timestamp);

insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (2, 1, true, current_timestamp);
insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (2, 2, true, current_timestamp);

--users
insert into user_account(user_id, user_name, user_role, user_hash)
values (1, 'test', 'user', 'hash');

--tasks
insert into task(task_id, program_id, user_id, req_time)
values (1, 1, 1, current_timestamp);
insert into task(task_id, program_id, user_id, req_time)
values (2, 2, 1, current_timestamp);
insert into task(task_id, program_id, user_id, req_time)
values (3, 2, 1, current_timestamp);

-- task_profiles
insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (1, 1, 10, 2);
insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (1, 2, 15, 2);
insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (1, 3, 20, 2);
insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (1, 4, 30, 2);

insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (2, 1, 10, 2);
insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (2, 2, 15, 2);

insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (3, 1, 10, 2);

