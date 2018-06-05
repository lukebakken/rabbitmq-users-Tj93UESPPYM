using System;
using RabbitMQ.Client;

namespace cluster_autoheal
{
    class Program
    {
        static void Main(string[] args)
        {
            var cf = new ConnectionFactory();
            cf.RequestedConnectionTimeout *= 2;
            cf.AutomaticRecoveryEnabled = true;
            cf.TopologyRecoveryEnabled = true;
            cf.AuthMechanisms = new AuthMechanismFactory[] { new PlainMechanismFactory() };
            cf.UserName = "guest";
            cf.Password = "guest";
            cf.VirtualHost = "/";
            var h1 = new AmqpTcpEndpoint("localhost", 5060);
            var h2 = new AmqpTcpEndpoint("localhost", 5061);
            var h3 = new AmqpTcpEndpoint("localhost", 5062);
            for (var i = 1; i <= 10; i++)
            {
                using (var cn = cf.CreateConnection(new[] { h1, h2, h3 }))
                using (var model = cn.CreateModel())
                {
                    var z = model.QueueDeclare($"ha.queue_autoDeleted_{i}", false, false, true);
                    model.BasicPublish("", z.QueueName, false, model.CreateBasicProperties(), new byte[] { 1, 2, 3 });
                    z = model.QueueDeclare($"ha.queue_durable_{i}", true, false, false);
                    model.BasicPublish("", z.QueueName, false, model.CreateBasicProperties(), new byte[] { 1, 2, 3 });
                    z = model.QueueDeclare($"ha.queue{i}", false, false, false);
                    model.BasicPublish("", z.QueueName, false, model.CreateBasicProperties(), new byte[] { 1, 2, 3 });
                }
                Console.WriteLine(i);
            }
            Console.WriteLine("Press any key");
            Console.ReadKey();
        }
    }
}
