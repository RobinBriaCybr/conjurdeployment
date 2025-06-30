source variable.sh
serverType="standby"


mkdir /home/ec2-user/cluster/log
mkdir /home/ec2-user/cluster/backup
mkdir /home/ec2-user/cluster/config
mkdir /home/ec2-user/cluster/seeds



# Create Docker Container
echo "Creating DAP Master Server Container"
echo "------------------------------------"
sudo podman run --name $container \
  --tls-verify=false \
  -d --restart=always \
  -p "443:443" -p "5432:5432" -p "1999:1999" \
  --security-opt seccomp=seccomp.json \
  -v /home/ec2-user/cluster/log:/var/log/conjur/:Z \
  -v /home/ec2-user/cluster/backup/:/opt/conjur/backup:Z \
  -v /home/ec2-user/cluster/config/:/etc/conjur/config:Z \
  -v /home/ec2-user/cluster/seeds:/opt/conjur/seeds:Z \
  $registry/conjur-appliance:$version

cp seed2 /home/ec2-user/cluster/seeds

sudo podman exec -i $container evoke unpack seed /opt/conjur/seeds/seed2

sudo podman exec  -i $container evoke configure $serverType
