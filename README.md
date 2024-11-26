# Teste BeTalent

Este projeto é um desafio técnico para a BeTalent baseado no [Figma](https://www.figma.com/design/Lpdera6rS8SztMUAwzkpN0/Teste-T%C3%A9cnico-Mobile-BeTalent?node-id=1-3&node-type=canvas&t=1l8cB8RbeiRebscA-0), focado no desenvolvimento de uma aplicação Flutter para exibir uma lista de funcionários consumindo uma API REST.

## ⚙️ Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Flutter](https://docs.flutter.dev/get-started/install) 
- Um emulador Android
- [JSON Rest Server](https://pub.dev/packages/json_rest_server) para simular a API REST

---

## 🚀 Configuração do ambiente

### Passo 1: Clonar o repositório e configurar o JSON Server

1. Clone o [repositório da beTalent](https://github.com/BeMobile/desafio-mobile/tree/main) e rode o JSON Rest Server.

2. Após o Server estiver rodando clone este projeto e instale globalmente o Rest Server
   
3. Certifique-se de que o servidor está rodando e acessível no endereço `http://localhost:<porta>`.

---

### Passo 2: Atualizar o arquivo `EmployeeService`

1. No arquivo `constant.dart`, localize a variável `baseUrl` e configure o IP e a porta onde o JSON Server está rodando:

   #### No emulador:
   `final String baseUrl = 'http://10.0.2.2:<porta>/employees';` 

---

### Passo 3: Rodar o projeto Flutter

1. Instale as dependências do Flutter com flutter pub get.

2. Execute a aplicação, certificando-se de que o JSON Server está em execução e acessível na URL configurada.

Com essas instruções, o projeto estará configurado e pronto para ser executado. 🚀

## 📸 Capturas de Tela

<p align="center">
  <img src="https://github.com/user-attachments/assets/392327eb-78db-4e6b-9043-cd87653f0bac" alt="screenshot" width="200">
  <img src="https://github.com/user-attachments/assets/261228fc-2594-4493-ba53-0df025daa665" alt="screenshot" width="200">
  <img src="https://github.com/user-attachments/assets/5fecc923-e030-4891-9def-4a9d0c125c90" alt="screenshot" width="200">
  <img src="https://github.com/user-attachments/assets/0106fea9-1a2f-4ec2-bf05-0ba0b284d6b4" alt="screenshot" width="200">
</p>


## Observação
No Android 12, a splash screen pode ficar desregulada devido à nova abordagem do sistema para lidar com telas de inicialização. Isso ocorre porque o Android 12 introduziu uma API própria para splash screens, que pode causar conflitos ou diferenças visuais dependendo da configuração utilizada.



