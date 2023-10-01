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


# As ações são compostas por três partes:
# - Uma meta (goal) que é enviada para o servidor de ação.
# - Um feedback (feedback) que é enviado periodicamente do servidor de ação para o cliente de ação.
# - Um resultado (result) que é enviado do servidor de ação para o cliente de ação quando a meta é concluída.

# As ações são como serviços que permitem executar tarefas de longa duração, fornecer feedback regular e são canceláveis.
# Um sistema de robô provavelmente usaria ações para navegação. Um objetivo de ação poderia dizer a um robô para viajar 
# para uma posição. Enquanto o robô navega até a posição, ele pode enviar atualizações ao longo do caminho (ou seja, feedback)
# e, em seguida, uma mensagem de resultado final quando chegar ao seu destino.

xterm -display :0 -geometry 78x24+000+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"source /opt/ros/iron/setup.bash && 
 ros2 run turtlesim turtlesim_node" &
sleep 1

xterm -display :0 -geometry 78x24+640+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"source /opt/ros/iron/setup.bash && 
 ros2 run turtlesim turtle_teleop_key" &
sleep 1

xterm -display :0 -geometry 78x24+1280+1080 -fa 'Monospace' -fs 10 -e docker exec -it $container_id /bin/bash -c \
"
source /opt/ros/iron/setup.bash && 
echo \"Para ver a lista de ações que um nó fornece, usamos o comando:\" &&
echo \"'ros2 node info <nome do nó>'\" &&
echo \"Executando comando: 'ros2 node info /turtlesim'\" &&
ros2 node info /turtlesim &&
echo \" \" &&
echo \"Obeserve que a ação '/turtle1/rotate_absolute' está em 'Action Servers'. Isso significa que o nó '/turtlesim' responde e fornece feedback para a ação '/turtle1/rotate_absolute'\" &&
sleep 1 && 
echo \" \" &&
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"Executando comando: 'ros2 node info /teleop_turtle'\" &&
ros2 node info /teleop_turtle &&
echo \" \" &&
echo \"Observe que a ação 'turtle1/rotate_absolute' está em 'Action Clients'. Isso significa que o nó '/teleop_turtle' envia metas para a ação. \" &&
sleep 1 && 
echo \" \" &&
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"Para identificar todas as ações no gráfico ROS 2, usamos o comando:\" &&
echo \"'ros2 action list'\" &&
echo \"Executando comando: 'ros2 action list'\" &&
ros2 action list && 
echo \" \" &&
echo \"Observe que a ação '/turtle1/rotate_absolute' por enquanto é a única ação no gráfico ROS.\" &&
echo \" \" &&
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"As Ações tem tipos, semelhantes a Tópicos e Serviços. Para localizar o tipo das ações, usamos o comando:\" &&
echo \"'ros2 action list -t'\" &&
echo \"Executando comando: 'ros2 action list -t'\" &&
ros2 action list -t && 
echo \" \" &&

echo \"Podemos introspeccionar ainda mais a ação com o comando:\" &&
echo \"'ros2 action info <nome da ação>'\" &&
echo \"Executando comando: 'ros2 action info /turtle1/rotate_absolute'\" &&
ros2 action info /turtle1/rotate_absolute &&
echo \" \" &&
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"Antes de enviar ou executar uma meta de ação, precisamos conhecer a estrutura do tipo de ação.\" &&
echo \"Com o comando 'ros2 interface show <nome do tipo de ação>', podemos ver a estrutura do tipo de ação.\" &&
echo \"Executando comando: 'ros2 interface show turtlesim/action/RotateAbsolute'\" &&
ros2 interface show turtlesim/action/RotateAbsolute &&
echo \" \" &&
echo \"Observe que:\" &&
echo \" - A primeira seção da estrutura (float32 theta) é referente a Estrutura da Solicitação da Meta.\" &&
echo \" - A segunda seção da estrutura (float32 delta) é referente a Estrutura do Resultado.\" &&
echo \" - A terceira seção da estrutura (float32 remaining) é referente a Estrutura do Feedback.\" &&
echo \"-----------------------------------------------------------------------------\" &&
echo \" \" &&

echo \"Para enviar uma meta de ação, usamos o comando:\" &&
echo \"'ros2 action send_goal <action_name> <action_type> <values>'\" &&
echo \"Obs.: o parâmetro <values> precisa estar no formato <YAML>\" &&
echo \"Executando comando: 'ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute '{theta: 1.57}'\" &&
ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute '{theta: 1.57}' &&
echo \" \" &&

echo \"Para ver o Feedback da meta, adicionamos o parâmetro '--feedback' ao comando:\" &&
echo \"Executando comando: 'ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute '{theta: 2.0}' --feedback'\" &&
ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute '{theta: 2.0}' --feedback &&
echo \" \" &&


echo \" \"; bash
" &
 
sleep 1
