function store_data(data, fileheader)

[~, hostname] = system('hostname');
hostname = hostname(1:end-1);

[~, pid] = system('ps -p $$ -o ppid=');
pid = pid(2:end-1);

[~, date] = system('date +%F_%T');
date = date(1:end-1);

filename = sprintf('%s_pid%s_%s_%s.mat', fileheader, ...
    pid, hostname, date);

fprintf('Saving data to: \n%s\n', filename);
save(filename, 'data');