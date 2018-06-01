call .\rabbitmqctl.bat -n rabbit@WIN2012R2-2 stop_app
call .\rabbitmqctl.bat -n rabbit@WIN2012R2-2 join_cluster rabbit@WIN2012R2-1
call .\rabbitmqctl.bat -n rabbit@WIN2012R2-2 start_app

call .\rabbitmqctl.bat -n rabbit@WIN2012R2-3 stop_app
call .\rabbitmqctl.bat -n rabbit@WIN2012R2-3 join_cluster rabbit@WIN2012R2-1
call .\rabbitmqctl.bat -n rabbit@WIN2012R2-3 start_app

call .\rabbitmqctl.bat -n rabbit@WIN2012R2-1 cluster_status
