#!/bin/bash

# Comando para permitir conexões ao servidor X para o usuário root
xhost +SI:localuser:root

# Comando para executar o container ROS com acesso ao display
container_id=$(docker run -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it osrf/ros:iron-desktop)
sleep 2

#   Testado no Ubuntu 22.04.3 LTS no WSL2 (Windows 10) com o Windows Terminal.
xterm -e docker exec -it $container_id /bin/bash -c "source /opt/ros/iron/setup.bash && ros2 run turtlesim turtlesim_node" &
sleep 1
xterm -e docker exec -it $container_id /bin/bash -c "source /opt/ros/iron/setup.bash && ros2 run turtlesim turtle_teleop_key" &
sleep 1
xterm -e docker exec -it $container_id /bin/bash -c "source /opt/ros/iron/setup.bash && rqt_graph" &
sleep 1

#   Testado no Ubuntu 20.04 com o Gnome Terminal (Dual Boot)
# gnome-terminal -- docker exec -it $container_id /bin/bash -c "source /opt/ros/iron/setup.bash && ros2 run turtlesim turtlesim_node"
# gnome-terminal -- docker exec -it $container_id /bin/bash -c "source /opt/ros/iron/setup.bash && ros2 run turtlesim turtle_teleop_key"
# gnome-terminal -- docker exec -it $container_id /bin/bash -c "source /opt/ros/iron/setup.bash && rqt_graph"



