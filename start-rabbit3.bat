set RABBITMQ_ALLOW_INPUT=true
set RABBITMQ_NODENAME=rabbit@WIN2012R2-3
set RABBITMQ_NODE_IP_ADDRESS=10.0.50.62
set RABBITMQ_DIST_PORT=25672
set RABBITMQ_SERVER_START_ARGS=-rabbitmq_management listener [{ip,"10.0.50.62"},{port,15672}]
set RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS=-kernel inet_dist_use_interface {10,0,50,62}
"C:\Program Files\RabbitMQ\rabbitmq_server-3.7.5\sbin\rabbitmq-server.bat"
