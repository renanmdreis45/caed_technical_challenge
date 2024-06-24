# Caed Technical Challenge

Repositório referente ao desafio de mobile da CAED.

  Foram escolhidas as tecnologias Flutter e Dart.


# Decisões arquiteturais
  
  Optei por uma arquitetura Clean Code para a aplicação, pois estar mais habituado com esse tipo de arquitetura e considero essencial para tornar o código mais legível, mais fácil de ser mantido e mais compreensível, além de facilitar a implementação de testes em cada funcionalidade do sistema pelo fato de isolar a aplicação em diferentes camadas.

  Há basicamente quatro camadas:

  Data Layer: Camada responsável pelo recebimento de dados de várias fontes, sejam elas remotas, como uma API remota, ou locais, como um banco de dados local. Nessa camada, é inserida a implementação do repositório e de serviços que se comunicam com as fontes de dados.

  Domain Layer: Camada responsável pela lógica de negócios da aplicação. Em suma, essa camada abstrai as implementações do repositório, dos casos de uso em diferentes interfaces que apenas definem o comportamento das implementações concretas, onde cada uma possui uma única atribuição. Essa ideia segue os princípios da responsabilidade única e da inversão de dependências do S.O.L.I.D. Além diso, nessa camada, é inserido as Entities, que são entidades responsáveis por encapsular todas as regras de negócio da aplicação. Por isso, não é recomendável mudanças nelas, pois haverá dessa forma impactos em várias partes da aplicação que as utilizam.

  Presentation Layer: Camada responsável pela exibição das diferentes páginas, widgets e lógica de estados que compõe a interface de usuário e as interações com a tela. 

# Conceitos e premissas

  Em relação à arquitetura MVVM, cada uma das telas (Login, Home e Details) possuem uma view que exibirá a interface de usuário e um view-model que mediará a comunicação entre a lógica de estados da view e os casos de uso do model, que são os diferentes fluxo de dados de uma entidade.

  Para a lógica de estados, foi utilizado o gerenciamento de estados com Bloc, para isso, um MultiBlocProvider foi inserido no arquivo main, permitindo assim que os widgets acessem as instâncias do Bloc, além disso, métodos como BlocBuilder e BlocListener foram utilizados para renderizar diferentes widgets e executar diferentes lógica de acordo com o estado do bloc. Há basicamente dois blocs, um para a tela de Login, que vai ser apenas responsável pela validação dos campos e caso sejam validados corretamente, o usuário tem a permissão para logar e acessar a página de Home. Esse Bloc teria mais utilidade em um contexto de mecanismo de autenticação, o que não foi exigido pelo desafio, uma vez que a ideia principal era o consumo de dados de uma api com informações dos pacotes. Para a validação ser feita corretamente, no campo de email, deve ser digitado pelo usuário um email no formato válido, ex: teste@gmail.com, e uma senha com no mínimo 8 caracteres, após isso, basta clicar no botão de Entrar para acessar a página de Home.
  
  Grande parte dos elementos que compõem a interface de usuário foram separados em diferentes componentes ou widgets, para que sejam reutilizados no sistema, o que também facilita os testes e a manutenção da aplicação.
  
  A API foi gerada e mockada através do site [beeceptor](https://beeceptor.com/mock-api/), como seria feita apenas uma requisição GET para retornar os dados da caixa e dos pacotes e não um CRUD completo, não vi necessidade de criar uma API mais robusta do zero. A única requisição principal enviada para URL junto com o path '/packages' retorna informações de uma caixa com informações principais como código, escola, municipio, componente, etapa, dados das datas de recebimento, abertura, leitura e retorno, além da lista de pacotes, que possuem como parâmetros, o id (esse foi utilizado na aplicação como o código do pacote), data de recebimento se houver e data de retorno. Para lidar melhor com as APIs REST, utilizei o retrofit que já suporta alguns métodos HTTP, como o GET e se comunica diretamente com o pacote Dio. Há assim duas classes para os serviços que fazem requisições para a API, uma abstrata que define o comportamento da REST API Client e a outra classe com sua implementação concreta e que vai ser chamada posteriormente pela implementação do repositório.

  Se tratando da navegação, utilizei apenas o Navigator para administrar a pilha de widgets e para navegar entre as telas internas (Login, Home e Details). Dentro da listagem de pacotes, ao clicar em cada pacote, o usuário é redirecionado para a tela de detalhes com o status daquele pacote. Nesse caso, foram utilizados componentes separados apenas para renderizar os dados dos pacotes repassados entre essas duas telas por meio de Stateless Widgets. Já em algumas telas com gerenciamento de estados com Bloc e de controllers (controller dos input e controller das tabs) foram implementados Stateful Widgets, para renderizar a árvore de widgets de acordo com o comportamento dos estados e refletindo na interface de usuário as alterações deles.
  
 # Como rodar a aplicação
  
  - É necessário instalar o [Dart SDK](https://dart.dev/get-dart)e  o [Flutter SDK](https://docs.flutter.dev/get-started/install)
  - Utilizei a seguinte versão do Flutter e do Dart:
        
        Dart SDK version: 2.19.2 
        Flutter 3.7.3 

  - É preciso instalar o [Android Studio](https://developer.android.com/studio) também, nesse a versão do Flutter deve suporta a versão do Java e do Gradle no sistema.
  - Após instalação dos SDKs e ajuste das configurações de build para que as versões estejam competíveis, basta executar o seguinte comando para instalar todas as dependências e bibliotecas utilizadas.

```
flutter pub get
```

- Rodar a aplicação: 

```
flutter run
```

- Acessar a aplicação

```
Utilizei um emulador do Android Studio para buildar e exibir a aplicação
```

# Rodando a aplicação






# Melhorias futuras
  
  Pretendo implementar testes unitários para cobrir as funções da requisição de retorno dos pacotes, pois foquei mais em correções e ajustes finais importantes no final do prazo.

# Considerações finais

  Por fim, foi um desafio que trouxe bastante aprendizado, seja pela aplicação e aprofundamento em conceitos aos quais eu estava habituado e o conhecimento adquirido para implementar funcionalidades novas para mim, como a lib de timeline que implementa os status dos pacotes e da caixa, além da resolução e correção de novos bugs e problemas que surgiram ao longo do desenvolvimento.