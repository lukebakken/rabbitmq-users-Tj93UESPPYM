.\rabbitmqctl.bat -n rabbit@WIN2012R2-2 stop_app
.\rabbitmqctl.bat -n rabbit@WIN2012R2-2 join_cluster rabbit@WIN2012R2-R1
.\rabbitmqctl.bat -n rabbit@WIN2012R2-2 start_app

.\rabbitmqctl.bat -n rabbit@WIN2012R2-3 stop_app
.\rabbitmqctl.bat -n rabbit@WIN2012R2-3 join_cluster rabbit@WIN2012R2-R1
.\rabbitmqctl.bat -n rabbit@WIN2012R2-3 start_app

.\rabbitmqctl.bat -n rabbit@WIN2012R2-1 cluster_status
