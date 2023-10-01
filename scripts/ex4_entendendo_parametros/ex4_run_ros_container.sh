#!/bin/bash

# # Comando para permitir conexões ao servidor X para o usuário root
# xhost +SI:localuser:root

# # Comando para executar o container ROS com acesso ao display
# container_id=$(docker run -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it osrf/ros:iron-desktop)
# sleep 2

# Diretório no host onde você deseja armazenar os arquivos
host_directory=$(pwd)/scripts/ex4_entendendo_parametros/host_directory

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

# Obs. 2: Note que temos uma linha comentada nos comandos abaixo (linha de inicialização do turtlesim).
#         Na primeira vez que você executar este script, deixe o "primeiro comando" descomentado e o "segundo comando" comentado.
#         Durante a execução do script, você será instruído a derrubar os containers e executar novamente este script, porém,
#         desta vez, deixando o "primeiro comando" comentado e o "segundo comando" descomentado. Isso é necessário para que você
#         possa entender o funcionamento dos parâmetros em tempo de execução.                     
xterm -display :0 -geometry 78x24+000+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"source /opt/ros/iron/setup.bash && 
 ros2 run turtlesim turtlesim_node" &
#  ros2 run turtlesim turtlesim_node --ros-args --params-file volumes/turtlesim.yaml " &
sleep 1

xterm -display :0 -geometry 78x24+640+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"source /opt/ros/iron/setup.bash && 
 ros2 run turtlesim turtle_teleop_key" &
sleep 1

xterm -display :0 -geometry 78x24+1280+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash && 
echo \"Para ver os parâmetros pertencentes aos nós, executamos o comando: \" &&
echo \"'ros2 param list'\" &&
echo \"Executando comando: 'ros2 param list'\" &&
ros2 param list &&
sleep 1 && 
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"Para exibir o tipo e o valor atual de um parâmetro, usamos o comando: \" &&
echo \"'ros2 param get <node_name> <parameter_name>'\" &&
echo \"Executando comando: 'ros2 param get /turtlesim background_g'\" &&
ros2 param get /turtlesim background_g &&
sleep 1 && 
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"Para alterar o valor de um parâmetro em tempo de execução, usamos o comando:\" &&
echo \"'ros2 param set <node_name> <parameter_name> <value>'\" &&
echo \"Executando comando: 'ros2 param set /turtlesim background_r 150'\" &&
ros2 param set /turtlesim background_r $((RANDOM % 255)) &&
# ros2 param set /turtlesim background_r 155 &
sleep 1 && 
echo \" \" &&
echo \"A definição de parâmetros com o comando 'set' só os alterará na sessão atual, não permanentemente. No entanto, você pode salvar suas configurações e recarregá-las na próxima vez que iniciar um nó \" &&
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"Podemos exibir todos os valores de parâmetros atuais usando o comando: \" &&
echo \"'ros2 param dump <node_name>'\" && 
echo \"Por padrão, o comando imprime na saída padrão (stdout), mas podemos redirecionar para um arquivo para salvalos.\" &&
echo \"Executando comando: 'ros2 param dump /turtlesim > volumes/turtlesim.yaml'\" &&
ros2 param dump /turtlesim > volumes/turtlesim.yaml &&
sleep 1 && 
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"Podemos carregar parâmetros de um arquivo para um nó em execução usando o comando: \" &&
echo \"ros2 param load <node_name> <parameter_file>\" &&
echo \"Executando comando: 'ros2 param load /turtlesim volumes/turtlesim.yaml'\" &&
ros2 param load /turtlesim volumes/turtlesim.yaml &&
echo \" \" &&
echo \" Obs.:Os parâmetros somente leitura só podem ser modificados na inicialização e não depois, é por isso que existem alguns avisos para os parâmetros 'qos_overrides'. \" &&
sleep 1 && 
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"Para iniciar o mesmo nó usando os valores de parametro salvo, usamos o comando: \" &&
echo \"'ros2 run <package_name> <executable_name> --ros-args --params-file <file_name>'\" &&
echo \"Este é basicamente o mesmo comando que sempre utilizamos para iniciar o turtlesim, porém, com 'param-file' \"
echo \"Se você ainda não fez isso, derrube estes containers e descomente a linha de inicialização do turtlesim neste mesmo script. \" &&

echo \" \"; bash
" &
 
sleep 1
