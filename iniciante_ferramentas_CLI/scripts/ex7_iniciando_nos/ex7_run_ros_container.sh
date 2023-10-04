#!/bin/bash
image_name=osrf/ros:iron-desktop
host_launch_directory=$(pwd)/scripts/ex7_iniciando_nos/volumes/share/turtlesim/launch/
container_launch_directory=/opt/ros/iron/share/turtlesim/launch/
host_x11_directory=/tmp/.X11-unix
container_x11_directory=/tmp/.X11-unix


container_id=$(docker run -d -e DISPLAY=$DISPLAY -v $host_x11_directory:$container_x11_directory -v $host_launch_directory:$container_launch_directory -it $image_name)
sleep 2


xterm -display :0 -geometry 78x24+000+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash && 
ros2 launch turtlesim multisim.launch.py
" &
sleep 1


xterm -display :0 -geometry 78x24+640+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash &&
ros2 topic pub  /turtlesim1/turtle1/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}\" 
" &


xterm -display :0 -geometry 78x24+1280+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash &&
ros2 topic pub  /turtlesim2/turtle1/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: -1.8}}\"; bash 
" &
sleep 1

