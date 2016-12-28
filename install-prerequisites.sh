echo --------------------------- Downloading and setting up Docker...
curl -sSL https://get.docker.com/ | sh
echo --------------------------- Downloading docker-compose...
curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
echo --------------------------- Making docker-compose executable...
chmod +x /usr/local/bin/docker-compose
echo --------------------------- Increases maximum memory map areas on host. This is a new requirement for Elasticsearch in 5.x, which HAS to be changed on the host and can not be accounted for on the image/container side of things. See https://github.com/docker-library/elasticsearch/issues/98 ...
sudo sysctl -w vm.max_map_count=262144
echo --------------------------- Installing apache2-utils to get htpasswd...
apt-get install apache2-utils -y --install-recommends
