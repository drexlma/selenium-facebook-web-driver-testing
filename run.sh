mkdir ~/.vnc/
echo "secret" > ~/.vnc/passwd


docker stop $(docker ps -q --filter ancestor=drexlmaier/selenium-facebook-web-driver-testing )
docker build -t drexlmaier/selenium-facebook-web-driver-testing .
docker run  -p 4444:4444 --security-opt seccomp:unconfined -d drexlmaier/selenium-facebook-web-driver-testing

docker exec -it $(docker ps -q --filter ancestor=drexlmaier/selenium-facebook-web-driver-testing ) bash


docker exec -it $(docker ps -q --filter ancestor=drexlmaier/selenium-facebook-web-driver-testing ) php /usr/local/bin/example.php

