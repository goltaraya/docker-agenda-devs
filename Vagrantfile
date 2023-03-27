Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"
  
  config.vm.hostname = "docker-host"

  config.vm.network "public_network", bridge: "wlp2s0"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  
  config.vm.provision "file", source: "./agenda.sql", destination: "/tmp/"
  config.vm.provision "file", source: "./Dockerfile", destination: "/tmp/"
  config.vm.provision "file", source: "./docker-compose.yaml", destination: "/tmp/"
  config.vm.provision "shell", path: "provision.sh"
end
