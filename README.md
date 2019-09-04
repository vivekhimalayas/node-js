# node-js

Load Balancing

1. Created a external load balancer
2. Create external/internal subnet

External subnet for load balancer
Internal subnet for machines
Security groups where only ports 80 and 443 are allowed. If possible, allow incoming traffic from only specific ip's.


ECS

1. Launch ecs in pvt subnet
2. I have used fargate.

Jenkins job will launch do git commit,checkout,run services on ecs including task definition. Its a node js docker app.

Prometheus will be used for monitoring. In normal scenario, we woud have used prometheus server for monitoring container stats like cpu,memory etc.

It would go like this.

Container (3000 port inside the container) >> Prometheus Node exporter running inside container whenever its launched (From s3,ansible etc) (Fixed port) >> Prometheus server (scrape configuration to scrape the target i.e. node exporter) >> Grafana on top of the Prometheus server to show metrics in visualized way.
 
I would have used blackbox exporter of prometheus to monitor endpoints too by running a blackbox exporter in a separate container or I can have blackbox running in the same machine as prometheus to monitor end points.

Prometheus and blackbox exporter are running on 9090 and 9115 ports.

But because of limitations, I have used only prometheus blackbox exporter to monitor the end points. I will use an alert manager to monitor the systems too. I will run them in the same container as prometheus. 

To collect nodejs metrics, I will either run a below prometheus nodejs exporter to monitor the nodejs application.

https://github.com/siimon/prom-client

We have already put application behind load balancer and hence the traffic can be validated and allowed either via security groups or via firewall like open source or AWS WAF.
We can setup a private Docker repo or use ECR to keep the docker images safe.

I can also share my prometheus and nodejs docker images if you want it.
