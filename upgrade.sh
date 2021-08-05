#Upgrade script to pull and upgrade to the latest container images

#Moves to pi-hole first
cd ~/pi-hole

#Pulls the latest version
docker-compose pull

#Restarts necessary containers with newer images
docker-compose up -d --no-deps

#Moves to internet-pi
cd ..
cd ~/internet-monitoring

#Pulls the latest image
docker-compose pull

#Restarts the necessary containers with newer images
docker-compose up -d --no-deps

#Deletes unused/deprecated container images
#The -f flag is to bypass the prompt for 'yes' or 'no'
docker system prune -f