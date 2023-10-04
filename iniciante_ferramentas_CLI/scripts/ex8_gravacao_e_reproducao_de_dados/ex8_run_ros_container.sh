#!/bin/bash
image_name=osrf/ros:iron-desktop
host_x11_directory=/tmp/.X11-unix
container_x11_directory=/tmp/.X11-unix
host_bag_files_directory=$(pwd)/scripts/ex8_gravacao_e_reproducao_de_dados/volumes/bag_files/
container_bag_files_directory=/bag_files/


container_id=$(docker run -d -e DISPLAY=$DISPLAY -v $host_x11_directory:$container_x11_directory -v $host_bag_files_directory:$container_bag_files_directory -it $image_name)
sleep 2


xterm -display :0 -geometry 78x24+000+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash && 
ros2 run turtlesim turtlesim_node
" &
sleep 1


xterm -display :0 -geometry 78x24+640+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash &&
ros2 run turtlesim turtle_teleop_key
" &


xterm -display :0 -geometry 78x24+1280+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash &&

echo 'ros2 bag só pode gravar dados de mensagens publicadas em tópicos. Para ver a lista de tópicos:' &&
echo 'ros2 topic list' &&
ros2 topic list &&

echo ' ' &&
sleep 1 &&

echo 'No tutorial de tópicos, aprendemos que o nó \"/turtle_teleop\" publica comandos sobre o tópico \"/turtle1/cmd_vel\" para fazer a tartaruga se mover em turtlesim.' &&
echo ' ' &&
echo 'Para ver os dados que estão sendo publicados, executamos o comando:' &&
echo 'ros2 topic echo /turtle1/cmd_vel' &&
echo ' ' &&
echo 'Movendo a tartaruga no terminal do teleop, podemos ver os dados que estão sendo publicados no tópico \"/turtle1/cmd_vel\".' &&
echo ' ' &&
echo ' ' &&
echo 'Registro do bag ros2' &&
echo 'Por padrão, o comando \"ros2 bag record\" grava arquivos de dados no formato \".mcap\".' &&
echo ' ' &&
echo 'Para gravar arquivos com o formato SQLite3 (.db3), adicionamos o sinalizador \"--storage sqlite3\", ou simplesmente \"-s sqlite3\".' &&
echo ' ' &&
echo 'Para registrar os dados publicados em um tópico, usamos a sintaxe:' &&
echo 'ros2 bag record <topic_name>' &&
echo ' ' &&
echo 'Obs.: o registro será salvo no diretório em que você se encontra, então:' &&
echo ' ' &&
echo 'OBS.: Pressione ctrl+c após realizar este teste, para seguir para o próximo... ' &&
echo ' ' &&
echo 'cd /bag_files/ && ros2 bag record /turtle1/cmd_vel' &&
cd /bag_files/ && ros2 bag record /turtle1/cmd_vel  &&

echo ' ' &&
sleep 1 &&
echo ' ' &&

echo ' ' &&
echo 'Podemos gravar vários tópicos, bem como alterar o nome do arquivo salvo.' &&
echo ' ' &&
echo 'OBS.: Pressione ctrl+c após realizar este teste, para seguir para o próximo... ' &&
echo ' ' &&
echo 'ros2 bag record -o subset /turtle1/cmd_vel /turtle1/pose' &&
ros2 bag record -o subset /turtle1/cmd_vel /turtle1/pose &&

echo ' ' &&
sleep 1 &&
echo ' ' &&

echo 'Podemos gravar vários tópicos, bem como alterar o nome do arquivo salvo.' &&
echo ' ' &&
echo 'ros2 bag info <bag_file_name>' &&
ros2 bag info subset &&

echo ' ' &&
sleep 1 &&
echo ' ' &&

echo 'Para reproduzir os dados gravados, usamos a sintaxe:' &&
echo 'ros2 bag play <bag_file_name>' &&
echo ' ' &&
ros2 bag play subset &&

echo ' ' &&
sleep 1 &&
echo ' ' &&


echo ' '; bash
" &





