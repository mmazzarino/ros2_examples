#!/bin/bash

# Comando para permitir conexões ao servidor X para o usuário root
xhost +SI:localuser:root

# Comando para executar o container ROS com acesso ao display
container_id=$(docker run -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it osrf/ros:iron-desktop)
sleep 2

# Testado no Ubuntu 22.04.3 LTS no WSL2 (Windows 10) com o Windows Terminal. 
# Obs.: Os parâmetros -geometry larguraxaltura+posicaox+posicaoy devem ser ajustados de acordo com o setup do seu(s) monitor(es).
#       No meu caso, no momento destes testes, estou usando dois monitores de 1920x1080 posicionados um acima do outro, então 
#       utilizo o parâmetro 1080 para especificar que os terminais devem ser posicionados no topo do monitor inferior, lado a lado,
#       distando 640 pixels um do outro (permitindo até 3 terminais lado a lado). Essas confugurações se mostram importantes no 
#       decorrer dos exemplos, uma vez que é importante que os terminais estejam posicionados de forma que seja possível visualizar
#       todos os terminais simultaneamente.

xterm -display :0 -geometry 78x24+000+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"source /opt/ros/iron/setup.bash && 
 ros2 run turtlesim turtlesim_node" &
sleep 1

xterm -display :0 -geometry 78x24+640+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"source /opt/ros/iron/setup.bash && 
 ros2 run turtlesim turtle_teleop_key" &
sleep 1

xterm -display :0 -geometry 78x24+1280+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"source /opt/ros/iron/setup.bash && 
 echo \"Executando comando: 'ros2 service list'\" &&
 ros2 service list &&
 sleep 1 && 
 echo \"-----------------------------------------------------------------------------\" &&
 echo \" \" &&

 echo \"Executando comando: 'ros2 service type /spawn'\" &&
 ros2 service type /spawn && 
 sleep 1 && 
 echo \"-----------------------------------------------------------------------------\" &&
 echo \" \" &&

 echo \"Executando comando: 'ros2 service type /clear'\" &&
 ros2 service type /clear &&
 sleep 1 && 
 echo \"-----------------------------------------------------------------------------\" &&
 echo \" \" &&
 
 echo \"Executando comando: 'ros2 service list -t'\" &&
 ros2 service list -t &&
 sleep 1 && 
 echo \"-----------------------------------------------------------------------------\" &&
 echo \" \" &&

 echo \"Para encontrar todos serviços de um tipo especifico, executamos: 'ros2 service find <type_name>'\" &&
 echo \" \" &&
 echo \"Executando comando: 'ros2 service find std_srvs/srv/Empty'\" &&
 ros2 service find std_srvs/srv/Empty &&
 sleep 1 && 
 echo \"-----------------------------------------------------------------------------\" &&
 echo \" \" &&

 echo \"Podemos chamar serviços a partir da linha de comando, mas primeiro precisamos saber a estrutura dos dados de entrada\" &&
 echo \" \" &&
 echo \"Executando comando: 'ros2 interface show turtlesim/srv/Spawn'\" &&
 ros2 interface show turtlesim/srv/Spawn &&
 sleep 1 && 
 echo \"-----------------------------------------------------------------------------\" &&
 echo \" \" &&

 echo \"Agora que sabemos o que é um tipo de serviço, como encontrar o tipo de um serviço e como localizar a estrutura dos argumentos desse tipo, podemos chamar um serviço usando:\" &&
 echo \"ros2 service call <service_name> <service_type> <arguments>\" &&
 echo \"Executando comando: 'ros2 service call /clear std_srvs/srv/Empty'\" &&
 ros2 service call /clear std_srvs/srv/Empty &&
 sleep 1 && 
 echo \" \" &&
 echo \"A execução deste comando teria apagado quaisquer linhas que a tartaruga tivesse desenhado.\" &&
 echo \"-----------------------------------------------------------------------------\" &&
 echo \" \" &&
 
 echo \"Agora vamos desovar uma nova tartaruga\" &&
 echo \" \" &&
 echo \"Executando comando: 'ros2 service call /spawn turtlesim/srv/Spawn \"{x: 2, y: 2, theta: 0.2, name: ''}\"' \" &&
 ros2 service call /spawn turtlesim/srv/Spawn \"{x: 2, y: 2, theta: 0.2, name: ''}\" &&
 echo \"-----------------------------------------------------------------------------\" &&
 echo \" \" &&

 echo \" \"; bash" &
 
sleep 1
