<!--  -->
# starts douker app
sudo usermod -aG docker $USER
newgrp docker
docker-compose up --build

sudo docker-compose up --build


sudo apt remove docker-compose -y
sudo apt update
sudo apt install docker-compose-plugin -y
docker compose up --build
