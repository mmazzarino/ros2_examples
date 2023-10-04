#!/bin/bash

# Diretório no host onde você deseja armazenar os arquivos
host_directory=$(pwd)/scripts/ex6_instrospeccao_de_msgs_de_log/host_directory

# Verifica se o servidor X está em execução e acessível
# if [[ ! -z $DISPLAY && -S $DISPLAY && $(xauth list) ]]; then
#     echo "Servidor X em execução e acessível"
# else
#     echo "Permitindo conexões ao servidor X para o usuário root"
#     xhost +SI:localuser:root
# fi

# Comando para executar o container ROS com acesso ao display e mapeamento de volumes
container_id=$(docker run -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $host_directory:/volumes -it osrf/ros:iron-desktop)
sleep 2

# Testado no Ubuntu 22.04.3 LTS no WSL2 (Windows 10) com o Windows Terminal. 
# Obs.: Os parâmetros -geometry larguraxaltura+posicaox+posicaoy devem ser ajustados de acordo com o setup do seu(s) monitor(es).
#       No meu caso, no momento destes testes, estou usando dois monitores de 1920x1080 posicionados um acima do outro, então 
#       utilizo o parâmetro 1080 para especificar que os terminais devem ser posicionados no topo do monitor inferior, lado a lado,
#       distando 640 pixels um do outro (permitindo até 3 terminais lado a lado). Essas confugurações se mostram importantes no 
#       decorrer dos exemplos, uma vez que é importante que os terminais estejam posicionados de forma que seja possível visualizar
#       todos os terminais simultaneamente.


xterm -display :0 -geometry 78x24+000+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash && 
ros2 run rqt_console rqt_console" &
sleep 1

xterm -display :0 -geometry 78x24+640+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash && 
ros2 run turtlesim turtlesim_node" &
# ros2 run turtlesim turtlesim_node --ros-args --log-level WARN" &
sleep 1

xterm -display :0 -geometry 78x24+1280+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash && 
echo ' ' &&
echo 'Os níveis de registro do ROS2 são ordenados por gravidade:' &&
echo '  FATAL' &&
echo '  ERROR' &&
echo '  WARN' &&
echo '  INFO' &&
echo '  DEBUG' &&
echo ' ' &&
echo 'O ROS2 tem um nível de registro em log padrão, e só são exibidas mensagens de gravidade >= a gravidade do nível padrão.' &&
echo 'Por padrão, o nível de registro em log padrão é INFO, mas podemos alterá-lo com o comando abaixo:' &&
echo 'ros2 run turtlesim turtlesim_node --ros-args --log-level WARN' &&
echo 'Ao iniciar o nó turtlesim_node com o argumento \"--log-level WARN\" apenas serão exibidos mensagens de WARN, ERROR e FATAL' &&
echo 'Para produzir mensagens de log para exibir no rqt_console, vamos fazer a tartaruga correr para a parede' &&
echo 'Executamos o comando abaixo (visto em detalhes no tutorial de Tópicos)' &&
echo 'ros2 topic pub -r 1 /turtle1/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}\"' &&
ros2 topic pub -r 1 /turtle1/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}\" &&
echo ' ' &&

echo \" \"; bash 
 " &
sleep 1
