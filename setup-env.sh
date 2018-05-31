#!/usr/bin/env bash

set -o errexit
set -o nounset

for ((i = 0; i < 10; i++))
do
    q_name="durable-$i"
    echo -n Declaring queue $q_name...
    rabbitmqadmin --host=shostakovich2 --port=15672 declare queue name="$q_name" durable=true
    echo Done.

    echo -n Publishing message to $q_name...
    rabbitmqadmin --host=shostakovich2 --port=15672 publish routing_key="$q_name" payload="$q_name"
    echo Done.
done

for ((i = 0; i < 10; i++))
do
    q_name="autodelete-$i"
    echo -n Declaring queue $q_name...
    rabbitmqadmin --host=shostakovich3 --port=15672 declare queue name="$q_name" auto_delete=true
    echo Done.

    echo -n Publishing message to $q_name...
    rabbitmqadmin --host=shostakovich3 --port=15672 publish routing_key="$q_name" payload="$q_name"
    echo Done.
done

for ((i = 0; i < 10; i++))
do
    q_name="normal-$i"
    echo -n Declaring queue $q_name...
    rabbitmqadmin --host=shostakovich4 --port=15672 declare queue name="$q_name"
    echo Done.

    echo -n Publishing message to $q_name...
    rabbitmqadmin --host=shostakovich4 --port=15672 publish routing_key="$q_name" payload="$q_name"
    echo Done.
done
