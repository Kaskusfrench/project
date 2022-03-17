#!/bin/bash
toilet "MetrisHost" --font mono12 | lolcat
echo "==========Server Setup==========="
echo "Please choose a server type..."
echo "Types: nodejs, minecraft, custom"
echo "==========Server Setup==========="
echo "Please type a server type..."
read -p "TYPE: " TYPE
if [ "$TYPE" = "nodejs" ]; then 
    figlet "NodeJS" | lolcat
    echo "Running NPM Install..." | lolcat
    npm install
    echo "Starting node app..." | lolcat
    node .
else
if [ "$TYPE" = "minecraft" ]; then 
    apt install openjdk-16-jdk >> javainstall.log
    echo "Downloading paper latest..." | lolcat
    rm -rf /home/container/server.jar
    wget https://ci.tivy.ca/job/Airplane-1.17/lastSuccessfulBuild/artifact/launcher-airplane.jar
    mv launcher-airplane.jar /home/container/server.jar
    echo "server-ip=0.0.0.0" >> server.properties
    echo "server-port=$SERVER_PORT" >> server.properties
    java -Xms128M -Xmx"$SERVER_MEMORY"M -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar
else
if [ "$TYPE" = "custom" ]; then 
    echo "Please enter custom bash command..." | lolcat
    read -p "Command: " CUSTOMCMD
    eval "$CUSTOMCMD"
else
    echo "Invalid Server Type."
fi;
fi;
fi;
