#!/bin/bash

modo=$1

image_name=osrf/ros:iron-desktop
host_x11_directory=/tmp/.X11-unix
container_x11_directory=/tmp/.X11-unix
host_ws_directory=$(pwd)/ros2_ws/
container_ws_directory=/root/ros2_ws/


# verifica se já existe o diretório ros2_ws, se não existe, cria
if [ ! -d "ros2_ws" ]; then
    if [ "$modo" != "build" ]; then
        echo "Erro: na primeira execução, o modo deve ser \"build\""
        exit 1
    fi
    mkdir -p ros2_ws/
fi
cd ros2_ws/


# verifica se já existe o diretório src, se não existe, clona o repositório
if [ ! -d "src" ]; then
    if [ "$modo" != "build" ]; then
        echo "Erro: na primeira execução, o modo deve ser \"build\""
        exit 1
    fi
    git clone https://github.com/ros2/examples src/examples -b iron
fi
cd ..


container_id=$(docker run -d -e DISPLAY=$DISPLAY -v $host_x11_directory:$container_x11_directory -it $image_name)
sleep 2

# Copia o conteúdo de host_ws_directory para container_ws_directory
docker cp $host_ws_directory $container_id:$container_ws_directory 2> /dev/null
sleep 1


if [ "$modo" = "build" ]; then
    xterm -display :0 -geometry 78x24+000+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
    "
    echo ' ' &&

    echo 'source /opt/ros/iron/setup.bash' &&
    echo ' ' &&
    source /opt/ros/iron/setup.bash &&
    echo ' ' &&

    echo ' ' &&
    echo 'apt install python3-colcon-common-extensions' &&
    echo ' ' &&
    apt install python3-colcon-common-extensions &&
    echo ' ' &&

    echo ' ' &&
    echo 'cd /root/ros2_ws' &&
    echo ' ' &&
    cd /root/ros2_ws &&
    echo ' ' &&

    echo ' ' &&
    echo 'colcon build --symlink-install' &&
    echo ' ' &&
    colcon build --symlink-install
    echo ' ' &&

    echo ' ' &&
    echo 'Agora, concluida a instalação, podemos ver os diretórios \"build\", \"install\" e \"log\".' &&
    echo ' ' &&
    ls -l &&
    echo ' ' &&

    echo ' ' &&
    echo 'Para executar testes para os pacotes que acabamos de criar, executamos o seguinte:' &&
    echo 'colcon test' &&
    echo ' ' &&
    colcon test &&
    echo ' ' &&

    echo ' ' &&
    echo 'Para configurar o ambiente, adicionando os componentes ao path, executamos o seguinte:' &&
    echo 'source install/setup.bash' &&
    echo ' ' &&
    source install/setup.bash &&
    echo ' ' &&

    echo ' '" &
    wait
    
    docker cp $container_id:$container_ws_directory/build $host_ws_directory/build
    docker cp $container_id:$container_ws_directory/install $host_ws_directory/install
    docker cp $container_id:$container_ws_directory/log $host_ws_directory/log
    wait
fi


xterm -display :0 -geometry 78x24+000+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
echo ' ' &&

echo 'source /opt/ros/iron/setup.bash' &&
echo ' ' &&
source /opt/ros/iron/setup.bash &&
echo ' ' &&

echo ' ' &&
echo 'apt install python3-colcon-common-extensions' &&
echo ' ' &&
apt install python3-colcon-common-extensions &&
echo ' ' &&

echo ' ' &&
echo 'cd /root/ros2_ws' &&
echo ' ' &&
cd /root/ros2_ws &&
echo ' ' &&

echo ' ' &&
echo 'Para configurar o ambiente, adicionando os componentes ao path, executamos o seguinte:' &&
echo 'source install/setup.bash' &&
echo ' ' &&
source install/setup.bash &&
echo ' ' &&

echo 'Com o ambiente originado, podemos executar executáveis construídos pelo colcon. Vamos executar um nó de assinante a partir dos exemplos:' &&
echo 'Obs.: Logo na sequência deste, em outro terminal, vamos executar um nó do editor' &&
echo ' ' &&

echo ' ' &&
echo 'ros2 run examples_rclcpp_minimal_subscriber subscriber_member_function' &&
echo ' ' &&
ros2 run examples_rclcpp_minimal_subscriber subscriber_member_function &&
echo ' ' &&
echo ' '" &
sleep 5


xterm -display :0 -geometry 78x24+640+000 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
echo ' ' &&
echo 'source /opt/ros/iron/setup.bash' &&
echo ' ' &&
source /opt/ros/iron/setup.bash &&
echo ' ' &&
echo ' ' &&

echo ' ' &&
echo 'Executamos um nó de editor:' &&
echo 'ros2 run examples_rclcpp_minimal_publisher publisher_member_function' &&
echo ' ' &&
ros2 run examples_rclcpp_minimal_publisher publisher_member_function
echo ' ' &&
echo ' ' &&


echo ' ';bash
" &
sleep 1
