# Rick and Morty App

## Desafio RR FullStack - Challenger

Este projeto é um aplicativo móvel desenvolvido com Flutter, seguindo os princípios da Clean Architecture. A aplicação consome a [API do Rick and Morty](https://rickandmortyapi.com) e é projetada para oferecer uma arquitetura robusta com separação clara de responsabilidades.

### Estrutura do Projeto: Clean Architecture
A aplicação é organizada em três principais camadas, garantindo a independência e a responsabilidade única conforme descrito em Clean Architecture:

- **Data Layer**: Responsável pela gestão de dados, incluindo a comunicação com APIs externas e o gerenciamento de cache.
- **Domain Layer**: Contém a lógica de negócio e os modelos de dados, agindo como o núcleo da aplicação. Esta camada é independente das camadas de apresentação e dados.
- **Presentation Layer**: Foca na lógica de apresentação, utilizando ViewModels para mediar a comunicação entre a UI (Views) e a lógica de negócio (Domain).

### Funcionalidades Implementadas

- **Listagem de Personagens**: Implementação dinâmica com scroll infinito.
- **Paginação Infinita**: Os personagens são carregados à medida que o usuário rola a tela.
- **Suporte a Rotação de Tela**: Adaptabilidade completa entre orientações portrait e landscape.
- **Injeção de Dependência**: Utilização do Flutter Modular para gerenciamento de dependências e roteamento.
- **Detalhes do Personagem**: Tela detalhada para mais informações sobre cada personagem.
- **Suporte Offline**: Capacidade de funcionar sem conexão à internet, utilizando caching de dados.
- **Padrões de Estado**: Uso de MobX para gerenciamento de estado eficiente na UI.

### Tecnologias e Pacotes Utilizados

- **Flutter**: Framework de desenvolvimento.
- **Flutter Modular**: Gerenciamento de dependências e roteamento.
- **Flutter MobX**: Gerenciamento de estado.
- **HTTP**: Comunicação com API.
- **Lottie**: Animações em formato JSON.
- **Google Fonts e Flutter SVG**: Fontes e gráficos vetoriais.
- **Flutter Cache Manager e Cached Network Image**: Gerenciamento de cache.
- **Json Serializable e Json Annotation**: Serialização de dados.
- **Flutter Lints**: Práticas de codificação.
- **Build Runner e MobX Codegen**: Geração de código.

### Como Executar

Siga estes passos para executar o projeto:

1. Clone o repositório.
2. Abra o diretório do projeto no terminal.
3. Execute `flutter pub get` para instalar as dependências.
4. Execute `flutter run` para iniciar o aplicativo em um dispositivo ou emulador.

### Contribuições

Contribuições são bem-vindas! Por favor, contribua com melhorias e correções para melhorar ainda mais o projeto.
