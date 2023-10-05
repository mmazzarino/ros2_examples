#!/bin/bash

modo=$1
image_name=osrf/ros:iron-desktop
host_x11_directory=/tmp/.X11-unix
container_x11_directory=/tmp/.X11-unix
host_ws_directory=$(pwd)/ros2_ws/
container_ws_directory=/root/ros2_ws/


if [ ! -d "ros2_ws" ]; then
    if [ "$modo" != "build" ]; then
        echo "Erro: 1 na primeira execução, o modo deve ser \"build\""
        exit 1
    fi
    mkdir -p ros2_ws/
fi
cd ros2_ws/


if [ ! -d "src" ]; then
    if [ "$modo" != "build" ]; then
        echo "Erro: 2 na primeira execução, o modo deve ser \"build\""
        exit 1
    fi
    mkdir -p src
    cd src
    git clone https://github.com/ros/ros_tutorials.git -b iron
    cd ..
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
    \"1 - Configurar o ambiente ROS2.\" \
    \"source /opt/ros/iron/setup.bash\" &&
source /opt/ros/iron/setup.bash &&

/./print1.sh \
    \"2 - Ir para raiz do localhost.\" \
    \"cd /root/ros2_ws\" &&
cd /root/ros2_ws &&

/./print1.sh \
    \"3 - Instalar dependências ROS2.\" \
    \"rosdep install -i --from-path src --rosdistro iron -y\" &&
rosdep install -i --from-path src --rosdistro iron -y &&

/./print1.sh \
    \"4 - Criar o espaço de trabalho.\" \
    \"colcon build\" &&
colcon build &&

/./print2.sh \
    \"Os pacotes declaram suas dependências no arquivo 'rosdep.xml' (aprenderemos mais sobre pacotes no próximo tutorial). Esse comando percorre essas declarações e instala as que estão faltando. Vamos aprender mais sobre 'rosdep' em outro tutorial (em breve).\" &&

/./print2.sh \
    \"Outros argumentos úteis para: colcon build
    
    --packages-up-to: Cria o pacote desejado, além de todas as suas dependências, mas não todo o espaço de trabalho (economiza tempo)
    
    --symlink-install: Evita que você tenha que reconstruir toda vez que ajustar scripts Python
    
    --event-handlers: console_direct+ mostra a saída do console durante a compilação (pode ser encontrado no diretório) \" &&

/./print2.sh \
    \"Antes de adquirir a sobreposição, é muito importante que você abra um novo terminal, separado daquele onde você construiu o espaço de trabalho. Fornecer uma sobreposição no mesmo terminal onde você construiu, ou da mesma forma construir onde uma sobreposição é originada, pode criar problemas complexos.\" &&

echo 'Feche este terminal para abrir o novo' &&

echo ' ';bash
" &
wait


xterm -display :0 -geometry 78x24+640+0 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
/./print1.sh \
    \"1 - Configurar o ambiente ROS2.\" \
    \"source /opt/ros/iron/setup.bash\" &&
source /opt/ros/iron/setup.bash &&

/./print1.sh \
    \"2 - Ir para raiz do localhost.\" \
    \"cd /root/ros2_ws\" &&
cd /root/ros2_ws &&

/./print1.sh \
    \"3 - Criar sobreposição.\" \
    \"source install/local_setup.bash\" &&
source install/local_setup.bash &&

/./print2.sh \
    \"O fornecimento da sobreposição adicionará apenas os pacotes disponíveis na sobreposição ao seu ambiente. 'local_setup' origina a sobreposição, bem como 'setup' a subposição em que foi criada, permitindo que você utilize ambos os espaços de trabalho. \" &&

/./print1.sh \
    \"4 - Executar o pacote a partir da sobreposição.\" \
    \"ros2 run turtlesim turtlesim_node\" &&
ros2 run turtlesim turtlesim_node &&

/./print2.sh \
    \"Para demonstrar que a execução do pacote está acontecendo a partir da sobreposição, vamos modificar o Turtlesim a partir da sobreposição.\" &&

/./print2.sh \
    \"Como realizamos o mapeamento entre os volumes do container e do nosso PC (-v \$host_ws_directory:\$container_ws_directory), as edições que fizermos em ros2_ws no nosso PC serão instantâneamente refletidas para dentro do container.\" &&

/./print2.sh \
    \"Vamos editar a sobreposição editando a barra de título na janela turtlesim da seguinte forma\" &&

/./print2.sh \
    \"Passo 1:\" \
    \"    No seu PC, navegue até ros2_ws/src/ros_tutorials/turtlesim/src \" \
    
    \"Passo 2:\" \
    \"    Abra o arquivo turtle_frame.cpp \" \

    \"Passo 3:\" \
    \"    Encontre a linha (provavelmente 52) que diz: setWindowTitle('TurtleSim') \" \

    \"Passo 4:\" \
    \"    Altere o valor de 'TurtleSim' para algum nome qualquer (ex: MyTurtleSim) \" \

    \"Passo 5:\" \
    \"    Salve o arquivo e feche-o \" \

    \"Passo 6:\" \
    \"    Volte para o primeiro terminal onde executamos 'colcon build' anteriormente e execute novamente \" \

    \"Passo 7:\" \
    \"    Feito isso, volte para este terminal (este mesmo onde você está lendo isso) que é onde a sobreposição foi originada e tecle Enter para continuar \" &&

/./print1.sh \
    \"5 - Executar o pacote a partir da sobreposição.\" \
    \"ros2 run turtlesim turtlesim_node\" &&
ros2 run turtlesim turtlesim_node &&

echo ' ';bash
" &