#!/bin/bash

modo=$1
image_name=osrf/ros:iron-desktop
host_x11_directory=/tmp/.X11-unix
container_x11_directory=/tmp/.X11-unix
host_ws_directory=$(pwd)/ros2_ws/
container_ws_directory=/root/ros2_ws/


if [ ! -d "ros2_ws" ]; then
    mkdir -p ros2_ws/
fi
cd ros2_ws/


if [ ! -d "src" ]; then
    mkdir -p src
fi
cd ..

container_id=$(docker run -d -e DISPLAY=$DISPLAY -v $host_x11_directory:$container_x11_directory -v $host_ws_directory:$container_ws_directory -it $image_name)

# scripts apenas para formatação do texto
docker cp print1.sh $container_id:/print1.sh
docker cp print2.sh $container_id:/print2.sh

xterm -display :0 -geometry 78x24+000+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
chmod +x /print1.sh &&
chmod +x /print2.sh &&

/./print1.sh \
    \"0.1 - Atualizar pacotes.\" \
    \"apt update && apt-get update \" &&
apt update && apt-get update &&

/./print1.sh \
    \"1 - Configurar o ambiente ROS2.\" \
    \"source /opt/ros/iron/setup.bash\" &&
source /opt/ros/iron/setup.bash &&

/./print1.sh \
    \"2 - Ir para 'src', na raiz do localhost.\" \
    \"cd /root/ros2_ws/src\" &&
cd /root/ros2_ws/src &&

/./print1.sh \
    \"3 - Criar pacote (simples de tipo Hello World) ROS2 com CMake e informação de licença.\" \
    \"ros2 pkg create --build-type ament_cmake --node-name my_node_by_cmake my_package_by_cmake --license Apache-2.0\" &&
ros2 pkg create --build-type ament_cmake --node-name my_node_by_cmake my_package_by_cmake --license Apache-2.0 &&

/./print1.sh \
    \"4 - Criar pacote (simples de tipo Hello World) ROS2 com Python e informação de licença.\" \
    \"ros2 pkg create --build-type ament_python --node-name my_node_by_python my_package_by_python --license Apache-2.0\" &&
ros2 pkg create --build-type ament_python --node-name my_node_by_python my_package_by_python --license Apache-2.0 &&

/./print1.sh \
    \"5 - Ir para o diretório do pacote criado com CMake.\" \
    \"cd my_package_by_cmake\" &&
cd my_package_by_cmake &&

/./print1.sh \
    \"6 - Ver arquivos gerados automaticamente (Para não quebrar o fluxo do tutorial você pode analisar os arquivos em seu volume. Note que em 'src' foi criado o arquivo 'my_node_by_cmake.cpp'. É para lá (src) que todos nossos nós cpp personalizados irão...).\" \
    \"ls\" &&
ls &&

/./print1.sh \
    \"7 - Voltar para raiz o diretório 'src'.\" \
    \"cd ..\" &&
cd .. &&

/./print1.sh \
    \"8 - Ir para o diretório do pacote criado com Python.\" \
    \"cd my_package_by_python\" &&
cd my_package_by_python &&

/./print1.sh \
    \"9 - Ver arquivos gerados automaticamente (Para não quebrar o fluxo do tutorial você pode analisar os arquivos em seu volume. Note que em 'src' foi criado o arquivo 'my_node_by_python.cpp').\" \
    \"ls\" &&
ls &&

/./print1.sh \
    \"10 - Voltar para raiz do workspace.\" \
    \"cd .. && cd ..\" &&
cd .. && cd .. &&

/./print1.sh \
    \"11 - Verificar dependências dos pacotes (é bom pra fixar...).\" \
    \"rosdep check --from-paths src --ignore-src --rosdistro iron\" &&
rosdep check --from-paths src --ignore-src --rosdistro iron &&

/./print1.sh \
    \"12 - Fazer build dos pacotes.\" \
    \"colcon build\" &&
colcon build &&

/./print2.sh \
    \"Note que poderíamos usar os parâmetros '--packages-select <package_name>' após o 'colcon build', caso não quiséssemos fazer build de todos pacotes existentes em 'src' (muitas vezes poderemos ter diversos pacotes, não necessitando fazer build de todos todas as vezes...).\" &&

echo 'Agora interaja com o segundo terminal' &&

echo ' ';bash
" &

sleep 1

xterm -display :0 -geometry 78x24+640+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
echo ' ' &&
echo 'ATENÇÃO, SÓ INTERAJA COM ESTE TERMINAL DEPOIS QUE O PRIMEIRO TERMINAL ORIENTAR!!' && 
echo ' ' &&

/./print1.sh \
    \"1 - Configurar o ambiente ROS2 (originar instalação principal).\" \
    \"source /opt/ros/iron/setup.bash\" &&
source /opt/ros/iron/setup.bash &&

/./print1.sh \
    \"2 - Ir para raiz do localhost.\" \
    \"cd /root/ros2_ws\" &&
cd /root/ros2_ws &&

/./print1.sh \
    \"3 - Originar workspace.\" \
    \"source install/local_setup.bash\" &&
source install/local_setup.bash &&

/./print1.sh \
    \"4 - Executar nó (my_node_by_cmake)\" \
    \"ros2 run my_package_by_cmake my_node_by_cmake\" &&
ros2 run my_package_by_cmake my_node_by_cmake &&

/./print1.sh \
    \"5 - Executar nó (my_node_by_python)\" \
    \"ros2 run my_package_by_cmake my_node_by_python\" &&
ros2 run my_package_by_python my_node_by_python &&

/./print2.sh \
    \"É recomendado acrescentarmos algumas informações no package.xml. Para isso, abra em seu PC mesmo o arquivo 'ros2_ws/src/my_package_by_cmake.package.xml' e/ou 'ros2_ws/src/my_package_by_python.package.xml' e insira 'nome' e 'e-mail' na linha 'maintainer'. Além disso, é recomendado adicionar um resumo do pacote na linha 'description'. Salve ao terminar.\" &&

/./print2.sh \
    \"Note que abaixo da tag de licença temos alguns nomes de tags terminando com '_depend'. É ali que listaríamos nossas dependências de outros pacotes para o 'colcon' pesquisar.\" &&





echo ' ';bash
" &