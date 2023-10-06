## Tutoriais de nível iniciante - Bibliotecas de Cliente

Obs. 1: Os tutoriais foram traduzidos do inglês para o português usando o Google Tradutor. A tradução não foi revisada e pode conter erros.

Obs. 2: Se você estiver iniciando algum tutorial e o diretório já conter uma pasta chamada 'ros2_ws', provavelmente significa que o tutorial já foi executado e o espaço de trabalho já foi criado. Nesse caso, você pode excluir a pasta 'ros2_ws' e executar o script .sh para criar um novo espaço de trabalho. 


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
Crie um novo pacote usando CMake ou Python e execute seu executável.

Um pacote é uma unidade organizacional para seu código ROS 2. Se você quiser ser capaz de instalar seu código ou compartilhá-lo com outras pessoas, então você precisará dele organizado em um pacote. Com pacotes, você pode liberar seu trabalho ROS 2 e permitir que outros o criem e usem facilmente.

A criação de pacotes no ROS 2 usa ament como seu sistema de compilação e colcon como sua ferramenta de compilação. Você pode criar um pacote usando CMake ou Python, que são oficialmente suportados, embora existam outros tipos de compilação.


### Comando de execução:
    $ cd tutorial_3 && ./run_ros_container.sh

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-Client-Libraries/Creating-Your-First-ROS2-Package.html


---------------------------------------------------------------------------------------------------
### Tutorial 4 - Escrevendo um editor e assinante simples (C++)

### Resumo
Crie e execute um nó de editor e assinante usando C++.

Os nós são processos executáveis que se comunicam através do gráfico ROS. Neste tutorial, os nós passarão informações na forma de mensagens de cadeia de caracteres uns para os outros sobre um tópico. O exemplo usado aqui é um sistema simples de "falante" e "ouvinte"; um nó publica dados e o outro assina o tópico para que possa receber esses dados.

O código usado nesses exemplos pode ser encontrado em: https://github.com/ros2/examples/tree/iron/rclcpp/topics

### Comando de execução:
    $ ./

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-Client-Libraries/Writing-A-Simple-Cpp-Publisher-And-Subscriber.html


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

