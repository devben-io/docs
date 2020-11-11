# RabbitMQ - Hacks

```
#
$ rabbitmqctl -l delete_queue <QUEUE>.dead

# Show Queues
$ rabbitmqctl -l list_queues

# hard delete
$ rabbitmqctl -l eval '{ok, Q} = rabbit_amqqueue:lookup(rabbit_misc:r(<<"/">>, queue, <<"<QUEUE>.dead">>)), rabbit_amqqueue:delete_crashed(Q).'

```
