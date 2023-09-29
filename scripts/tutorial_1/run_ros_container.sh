#!/bin/bash

# Comando para permitir conexões ao servidor X para o usuário root
xhost +SI:localuser:root

# Comando para executar o container ROS com acesso ao display
container_id=$(docker run -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it osrf/ros:iron-desktop)

sleep 2

gnome-terminal -- docker exec -it $container_id /bin/bash -c "source /opt/ros/iron/setup.bash && ros2 run turtlesim turtlesim_node"

gnome-terminal -- docker exec -it $container_id /bin/bash -c "source /opt/ros/iron/setup.bash && ros2 run turtlesim turtle_teleop_key"

gnome-terminal -- docker exec -it $container_id /bin/bash -c "source /opt/ros/iron/setup.bash && rqt"