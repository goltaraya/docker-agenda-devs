Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"
  
  config.vm.hostname = "docker-host"

  config.vm.network "public_network"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  
  # if in Windows:
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.provision "file", source: "./agenda.sql", destination: "/tmp/"
  config.vm.provision "file", source: "./Dockerfile", destination: "/tmp/"
  config.vm.provision "file", source: "./docker-compose.yaml", destination: "/tmp/"
  config.vm.provision "file", source: "./php.ini", destination: "/tmp/"
  config.vm.provision "shell", path: "provision.sh"
end
