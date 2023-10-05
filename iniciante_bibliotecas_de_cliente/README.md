## Tutoriais de nível iniciante - Bibliotecas de Cliente


---------------------------------------------------------------------------------------------------
### Tutorial 1 - Usando colcon para compilar pacotes

### Resumo
Este é um breve tutorial sobre como criar e criar um espaço de trabalho ROS2 com o Colcon. É um tutorial prático e não projetado para substituir a documentação principal

O colcon é uma ferramenta usada no ROS 2 (Robot Operating System 2) para compilar e construir projetos. Ele substitui o catkin_make usado no ROS original. colcon é projetado para ser mais flexível e eficiente, especialmente para projetos grandes com várias dependências. Simplifica o processo de compilação e gerenciamento de pacotes em ambientes ROS 2, facilitando o desenvolvimento de software para robótica.

Para obter mais detalhes sobre o design do colcon, consulte https://design.ros2.org/articles/build_tool.html


### Comando de execução:
    $ cd tutorial_1 && ./run_ros_container.sh build # build só é obrigatório na primeira execução.

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-Client-Libraries/Colcon-Tutorial.html



---------------------------------------------------------------------------------------------------
### Tutorial 2 - Criando um espaço de trabalho

### Resumo
Crie um espaço de trabalho e saiba como configurar uma sobreposição para desenvolvimento e teste.

Um espaço de trabalho é um diretório que contém pacotes ROS 2. Antes de usar o ROS 2, é necessário originar seu espaço de trabalho de instalação do ROS 2 no terminal em que você planeja trabalhar. Isso torna os pacotes do ROS 2 disponíveis para você usar nesse terminal.

Você também tem a opção de fornecer uma "sobreposição" - um espaço de trabalho secundário onde você pode adicionar novos pacotes sem interferir com o espaço de trabalho ROS 2 existente que você está estendendo, ou "underlay". Seu underlay deve conter as dependências de todos os pacotes em sua sobreposição. Os pacotes em sua sobreposição substituirão os pacotes na subposição. Também é possível ter várias camadas de subcamadas e sobreposições, com cada sobreposição sucessiva usando os pacotes de seus underlays pai.


### Comando de execução:
    $ cd tutorial_2 && ./run_ros_container.sh

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-Client-Libraries/Creating-A-Workspace/Creating-A-Workspace.html


---------------------------------------------------------------------------------------------------
### Tutorial 3 - Criando um pacote

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 4 - Escrevendo um editor e assinante simples (C++)

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 5 - Escrevendo um editor e assinante simples (Python)

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 6 - Escrevendo um serviço e cliente simples (C++)

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 7 - Escrevendo um serviço e cliente simples (Python)

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 8 - Criando arquivos msg e srv personalizados

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 9 - Implementando interfaces personalizadas

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 10 - Usando parâmetros em uma classe (C++)

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 11 - Usando parâmetros em uma classe (Python)

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 12 - Usando ros2doctor para identificar problemas

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 


---------------------------------------------------------------------------------------------------
### Tutorial 13 - Criando e usando plugins (C++)

### Resumo

### Comando de execução:
    $ ./

### Documentação Oficial
- 

