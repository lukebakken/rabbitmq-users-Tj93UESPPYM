## `/etc/hosts` file

```
127.0.0.2	shostakovich2
127.0.0.3	shostakovich3
127.0.0.4	shostakovich4
``

## Start RMQ

```

RABBITMQ_ALLOW_INPUT=true RABBITMQ_NODENAME='rabbit2@shostakovich2' RABBITMQ_NODE_IP_ADDRESS=127.0.0.2 RABBITMQ_DIST_PORT=25672 RABBITMQ_SERVER_START_ARGS='-rabbitmq_management listener [{ip,"127.0.0.2"},{port,15672}]' RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS='-kernel inet_dist_use_interface {127,0,0,2} -kernel net_ticktime 5' RABBITMQ_CONFIG_FILE=/home/lbakken/issues/rabbitmq-users/cluster-autoheal-Tj93UESPPYM/rabbitmq ./sbin/rabbitmq-server

RABBITMQ_ALLOW_INPUT=true RABBITMQ_NODENAME='rabbit3@shostakovich3' RABBITMQ_NODE_IP_ADDRESS=127.0.0.3 RABBITMQ_DIST_PORT=25673 RABBITMQ_SERVER_START_ARGS='-rabbitmq_management listener [{ip,"127.0.0.3"},{port,15672}]' RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS='-kernel inet_dist_use_interface {127,0,0,3} -kernel net_ticktime 5' RABBITMQ_CONFIG_FILE=/home/lbakken/issues/rabbitmq-users/cluster-autoheal-Tj93UESPPYM/rabbitmq ./sbin/rabbitmq-server

RABBITMQ_ALLOW_INPUT=true RABBITMQ_NODENAME='rabbit4@shostakovich4' RABBITMQ_NODE_IP_ADDRESS=127.0.0.4 RABBITMQ_DIST_PORT=25674 RABBITMQ_SERVER_START_ARGS='-rabbitmq_management listener [{ip,"127.0.0.4"},{port,15672}]' RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS='-kernel inet_dist_use_interface {127,0,0,4} -kernel net_ticktime 5' RABBITMQ_CONFIG_FILE=/home/lbakken/issues/rabbitmq-users/cluster-autoheal-Tj93UESPPYM/rabbitmq ./sbin/rabbitmq-server
```

## Build cluster

```
./sbin/rabbitmqctl -n rabbit3@shostakovich3 stop_app; ./sbin/rabbitmqctl -n rabbit3@shostakovich3 join_cluster rabbit2@shostakovich2; ./sbin/rabbitmqctl -n rabbit3@shostakovich3 start_app; ./sbin/rabbitmqctl -n rabbit2@shostakovich2 cluster_status

./sbin/rabbitmqctl -n rabbit4@shostakovich4 stop_app; ./sbin/rabbitmqctl -n rabbit4@shostakovich4 join_cluster rabbit2@shostakovich2; ./sbin/rabbitmqctl -n rabbit4@shostakovich4 start_app; ./sbin/rabbitmqctl -n rabbit2@shostakovich2 cluster_status
```
