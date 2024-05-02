delete from task_profile;
delete from task;
delete from program_profile;
delete from program;
delete from profile;
delete from device;
delete from resource_manager;

-- resource_managers
insert into resource_manager(manager_id, manager_name, manager_online, manager_status, manager_address)
values (1, 'dev-manager', false, 0, '127.0.0.1:8080');

-- devices
insert into device(device_id,
                   device_name, device_description,
                   device_type,
                   device_online, device_status,
                   manager_id,
                   task_id, task_priority)
values (1, 'dev-1-4cpu', '4 CPU (1/4)', 'c', false, 0, 1, -1, -1);
insert into device(device_id,
                   device_name, device_description,
                   device_type,
                   device_online, device_status,
                   manager_id,
                   task_id, task_priority)
values (2, 'dev-2-4cpu', '4 CPU (1/4)', 'c', false, 0, 1, -1, -1);
insert into device(device_id,
                   device_name, device_description,
                   device_type,
                   device_online, device_status,
                   manager_id,
                   task_id, task_priority)
values (3, 'dev-3-4cpu', '4 CPU (1/4)', 'c', false, 0, 1, -1, -1);
insert into device(device_id,
                   device_name, device_description,
                   device_type,
                   device_online, device_status,
                   manager_id,
                   task_id, task_priority)
values (4, 'dev-4-4cpu', '4 CPU (1/4)', 'c', false, 0, 1, -1, -1);

--profiles
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

--programs
insert into program(program_id, program_name, program_description, program_active, reg_date)
values (1, 't001', 'Test #1 program for G3', true, current_timestamp);
insert into program(program_id, program_name, program_description, program_active, reg_date)
values (2, 't002', 'Test #2 program for G3', true, current_timestamp);

--program_profiles
insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (1, 1, true, current_timestamp);
insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (1, 2, true, current_timestamp);
insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (1, 3, true, current_timestamp);

insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (2, 1, true, current_timestamp);
insert into program_profile(program_id, profile_id, profile_active, reg_date)
values (2, 2, true, current_timestamp);

--tasks
insert into task(task_id, program_id, task_status, req_time)
values(1, 1, 2, current_timestamp);
insert into task(task_id, program_id, task_status, req_time)
values(2, 2, 2, current_timestamp);
insert into task(task_id, program_id, task_status, req_time)
values(3, 2, 2, current_timestamp);

--task_profiles
insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (1, 1, 10, 2);
insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (1, 2, 15, 2);
insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (1, 3, 20, 2);

insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (2, 1, 10, 2);
insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (2, 2, 15, 2);

insert into task_profile(task_id, profile_id, profile_priority, profile_status)
values (3, 1, 10, 2);

