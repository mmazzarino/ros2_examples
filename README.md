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
### Exemplo 1 - Noções básicas sobre Nós

### Resumo
Cada nó no ROS deve ser responsável por uma única finalidade modular, por exemplo, controlar os motores das rodas ou publicar os dados do sensor a partir de um telêmetro a laser. Cada nó pode enviar e receber dados de outros nós por meio de tópicos, serviços, ações ou parâmetros.

Um sistema robótico completo é composto por muitos nós trabalhando em conjunto. No ROS 2, um único executável (programa C++, programa Python, etc.) pode conter um ou mais nós.

### Comando de execução:
    $ ./scripts/ex1_nocao_basica_nos/ex1_run_ros_container.sh

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Nodes/Understanding-ROS2-Nodes.html


---------------------------------------------------------------------------------------------------
### Exemplo 2 - Entendendo Tópicos

### Resumo
Um sistema robótico completo é composto por muitos nós trabalhando em conjunto. No ROS 2, um único executável (programa C++, programa Python, etc.) pode conter um ou mais nós.

Um nó pode publicar dados para qualquer número de tópicos e, simultaneamente, ter assinaturas para qualquer número de tópicos.

Os tópicos são uma das principais maneiras pelas quais os dados são movidos entre nós e, portanto, entre diferentes partes do sistema.

### Comando de execução:
    $ ./scripts/ex2_entendendo_topicos/ex2_run_ros_container.sh

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Topics/Understanding-ROS2-Topics.html


---------------------------------------------------------------------------------------------------
### Exemplo 3 - Noções básicas sobre Serviços

### Resumo
Serviços são outro método de comunicação para nós no gráfico ROS. Os serviços são baseados em um modelo de chamada e resposta versus o modelo de tópicos editor-assinante. Enquanto os tópicos permitem que os nós assinem fluxos de dados e obtenham atualizações contínuas, os serviços só fornecem dados quando são chamados especificamente por um cliente.

### Comando de execução:
    $ ./scripts/ex3_nocao_basica_servicos/ex3_run_ros_container.sh

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Services/Understanding-ROS2-Services.html


---------------------------------------------------------------------------------------------------
### Exemplo 4 - Entendendo Parâmetros

### Resumo
Um parâmetro é um valor de configuração de um nó. Você pode pensar em parâmetros como configurações de nó. Um nó pode armazenar parâmetros como inteiros, flutuadores, booleanos, cadeias de caracteres e listas. No ROS 2, cada nó mantém seus próprios parâmetros. Para obter mais informações sobre parâmetros, consulte o documento de conceito.

### Comando de execução:
    $ ./scripts/ex4_entendendo_parametros/ex4_run_ros_container.sh

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Parameters/Understanding-ROS2-Parameters.html


---------------------------------------------------------------------------------------------------
### Exemplo 5 - Entendendo Ações

### Resumo
As ações são um dos tipos de comunicação no ROS 2 e destinam-se a tarefas de longa duração. Eles consistem em três partes: um objetivo, feedback e um resultado.

As ações são construídas com base em temas e serviços. Sua funcionalidade é semelhante aos serviços, exceto que as ações podem ser canceladas. Eles também fornecem feedback constante, em oposição aos serviços que retornam uma única resposta.

As ações usam um modelo cliente-servidor, semelhante ao modelo editor-assinante (descrito no tutorial de tópicos). Um nó "cliente de ação" envia uma meta para um nó de "servidor de ação" que reconhece a meta e retorna um fluxo de feedback e um resultado.

### Comando de execução:
    $ ./scripts/ex_5_entendendo_acoes/ex5_run_ros_container.sh

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Actions/Understanding-ROS2-Actions.html


---------------------------------------------------------------------------------------------------
### Exemplo 6 - 

### Resumo
rqt_console é uma ferramenta GUI usada para introspecção de mensagens de log no ROS 2. Normalmente, as mensagens de log aparecem no seu terminal. Com o rqt_console, você pode coletar essas mensagens ao longo do tempo, visualizá-las de perto e de forma mais organizada, filtrá-las, salvá-las e até mesmo recarregar os arquivos salvos para introspecção em um momento diferente.

Os nós usam logs para gerar mensagens relativas a eventos e status de várias maneiras. Seu conteúdo geralmente é informativo, para o bem do usuário.

### Comando de execução:
    $ ./scripts/ex_6_instrospeccao_de_msgs_de_log/ex6_run_ros_container.sh

### Documentação Oficial
- https://docs.ros.org/en/iron/Tutorials/Beginner-CLI-Tools/Using-Rqt-Console/Using-Rqt-Console.html