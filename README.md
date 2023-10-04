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
    $ chmod +x scripts/ex...

Obs.: Durante a execução dos exemplos, o seu sistema pode ir acumulando containers docker e, dependendo 
do seu hardware, isso pode afetar o desempenho. Abaixo estão alguns comandos docker que podem auxiliar no desenvolvimento.
    
    $ docker ps                             # lista todos os seus containers em execução
    
    $ docker ps -a                          # listar todos os containers (em execução ou não)
    
    $ docker stop container_id -t 0         # parar um container
    
    $ docker container rm container_id      # remove um container
