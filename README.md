Repositório com exemplos e tutoriais de ROS2.

Os exemplos e tutoriais aqui implementados foram desenvolvidos com base nos tutoriais 
da documentação oficial do ROS2 Iron - https://docs.ros.org/en/iron/Tutorials.html

Todos os exemplos e tutoriais estão implementados pode meio de container Docker, a fim 
de minimizar o tempo gasto com a preparação do abiente de desenvolvimento.

Destaco qu parte dos exemplos foram implementados no Ubuntu 20.04 (SO instalado no SSD) 
e outra parte foi implementada no Ubuntu 22.04.3 (SO rodando no WSL2). Porém, em ambos 
os casos, a mesma imagem docker foi utilizada.

Obs. 1: para executar os exemplos a partir do WSL2, configurações adicionais devem ser 
realizadas para permitir que o WSL2 possa executar aplicativos de GUI. Essas configurações 
são encontradas em: https://learn.microsoft.com/pt-br/windows/wsl/tutorials/gui-apps

Obs. 2: para que os scripts (.sh) possam ser executados, você deve dar permissão de 
execução para os arquivos:
    -> chmod +x scripts/ex1_nocao_basica_nos/ex1_run_ros_container.sh
    -> chmod +x scripts/ex2_entendendo_topicos/ex2_run_ros_container.sh
    -> chmod +x scripts/ex3_nocao_basica_servicos/ex3_run_ros_container.sh

Obs. 3: para executar os scripts:
    -> ./scripts/ex1_nocao_basica_nos/ex1_run_ros_container.sh
    -> ./scripts/ex2_entendendo_topicos/ex2_run_ros_container.sh
    -> ./scripts/ex3_nocao_basica_servicos/ex3_run_ros_container.sh

Exemplo 1 - Noções básicas sobre Nós
-> https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Nodes/Understanding-ROS2-Nodes.html

Exemplo 2 - Entendendo Tópicos
-> https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Topics/Understanding-ROS2-Topics.html

Exemplo 3 - Noções básicas sobre Serviços
-> https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Services/Understanding-ROS2-Services.html




