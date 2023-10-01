# Repositório com exemplos e tutoriais de ROS2.

Os exemplos e tutoriais aqui implementados foram desenvolvidos com base nos tutoriais 
da documentação oficial do ROS2 Iron, sendo ideal que a leitura da documentação oficial 
seja realizada em conjunto com a execução dos scripts.

- https://docs.ros.org/en/iron/Tutorials.html

Todos os exemplos e tutoriais foram implementados em containers Docker, a fim 
de minimizar o tempo gasto com a preparação do abiente de desenvolvimento.

Destaco que parte dos exemplos foram implementados no Ubuntu 20.04 "(S.O. instalado no SSD)" 
e outra parte foi implementada no Ubuntu 22.04.3 (S.O. rodando no WSL2). Porém, em ambos 
os casos, a mesma imagem docker foi utilizada.

Obs.: para executar os exemplos a partir do WSL2, configurações adicionais devem ser 
realizadas para permitir que o WSL2 possa executar aplicativos de GUI. Essas configurações 
são encontradas em: 

- https://learn.microsoft.com/pt-br/windows/wsl/tutorials/gui-apps

## Instruções de uso:

Para que os scripts (.sh) possam ser executados, você deve dar permissão de execução para os arquivos:

    $ chmod +x scripts/ex1_nocao_basica_nos/ex1_run_ros_container.sh
    $ chmod +x scripts/ex2_entendendo_topicos/ex2_run_ros_container.sh
    $ chmod +x scripts/ex3_nocao_basica_servicos/ex3_run_ros_container.sh
    $ chmod +x scripts/etc...

---------------------------------------------------------------------------------------------------
#### Exemplo 1 - Noções básicas sobre Nós

    $ ./scripts/ex1_nocao_basica_nos/ex1_run_ros_container.sh

Exemplo baseado em:
https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Nodes/Understanding-ROS2-Nodes.html


---------------------------------------------------------------------------------------------------
#### Exemplo 2 - Entendendo Tópicos

    $ ./scripts/ex2_entendendo_topicos/ex2_run_ros_container.sh

Exemplo baseado em:
https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Topics/Understanding-ROS2-Topics.html


---------------------------------------------------------------------------------------------------
#### Exemplo 3 - Noções básicas sobre Serviços

    $ ./scripts/ex3_nocao_basica_servicos/ex3_run_ros_container.sh

Exemplo baseado em:
https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Services/Understanding-ROS2-Services.html


---------------------------------------------------------------------------------------------------
#### Exemplo 4 - Entendendo Parâmetros

    $ ./scripts/ex4_entendendo_parametros/ex4_run_ros_container.sh

Exemplo baseado em:
https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Parameters/Understanding-ROS2-Parameters.html


---------------------------------------------------------------------------------------------------
#### Exemplo 5 - Entendendo Ações

    $ ./scripts/ex_5_entendendo_acoes/ex5_run_ros_container.sh

Exemplo baseado em:
https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Actions/Understanding-ROS2-Actions.html