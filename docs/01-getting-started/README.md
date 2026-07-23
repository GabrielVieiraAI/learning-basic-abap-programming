# Unit 01: Getting Started

## 🎯 Learning Objectives

After completing this unit, you will be able to:

| #   | Lesson                                             | Objective                                                                                                            |
| --- | -------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| 1   | **Preparing the Development Environment**          | Create an ABAP Cloud project                                                                                         |
| 2   | **Taking a First Look at ABAP**                    | Work with a development object                                                                                       |
| 3   | **Understanding Software Structure and Logistics** | Create an ABAP package                                                                                               |
| 4   | **Developing Your First ABAP Application**         | Create a 'Hello World' application                                                                                   |
| 5   | **Amplifying ABAP Development with AI**            | Explain how ABAP AI Capabilities assist developers and how the ABAP AI SDK adds AI features to business applications |

## Lessons

- [01 - Preparing the Development Environment](01-preparing-the-development-environment/)
- [02 - Taking a First Look at ABAP](02-taking-a-first-look-at-abap/)
- [03 - Understanding Software Structure and Logistics](03-understanding-software-structure-and-logistics/)
- [04 - Developing Your First ABAP Application](04-developing-your-first-abap-application/)
- [05 - Amplifying ABAP Development with AI](05-amplifying-abap-development-with-ai/)

## Key Concepts

| Conceito | Aula | Significado |
|---|---|---|
| **Eclipse IDE + ADT** | 01 | Ambiente de desenvolvimento ABAP (análogo ao Visual Studio + C# Dev Kit) |
| **ABAP Cloud Project** | 01 | Conexão do Eclipse com o sistema ABAP na nuvem (SAP BTP) |
| **SAP BTP** | 01 | Plataforma de nuvem da SAP — hierarquia: Global Account → Subaccount → Space → ABAP Instance |
| **ABAP Repository** | 02 | Banco central que armazena todos os objetos de desenvolvimento do sistema |
| **Development Object** | 02 | Qualquer item de código no repositório: classe, programa, tabela, interface |
| **Project Explorer** | 02 | Navegador hierárquico dos objetos ABAP (análogo ao Solution Explorer) |
| **Ctrl + Shift + A** | 02 | Atalho universal para abrir qualquer objeto de desenvolvimento pelo nome |
| **F1 / F2 / F3** | 02 | Ajuda da linguagem / info do elemento / navegar para definição |
| **Pacote (Package)** | 03 | Container que agrupa objetos ABAP — unidade de organização e transporte |
| **Transport Request** | 03 | Mecanismo que empacota mudanças para movê-las entre ambientes (DEV → TEST → PROD) |
| **Prefixo Z** | 03 | Convenção SAP: todo objeto criado por cliente deve começar com `Z` ou `Y` |
| **Classe ABAP** | 04 | Unidade fundamental de código: `DEFINITION` (contrato) + `IMPLEMENTATION` (código) |
| **IF_OO_ADT_CLASSRUN** | 04 | Interface que fornece o ponto de entrada `main` para executar a classe via F9 |
| **Ativação** | 04 | Compilar e registrar um objeto no repositório (`Ctrl + F3` = `dotnet build`) |
| **Joule for Developers** | 05 | Assistente de IA generativa da SAP integrado ao Eclipse/ADT |
| **ABAP AI SDK** | 05 | Biblioteca para adicionar chamadas a LLMs dentro de aplicações ABAP |
| **CDS** | 05 | Framework de modelagem de dados semântica otimizado para SAP HANA |
| **RAP** | 05 | Modelo de programação RESTful moderno do ABAP Cloud |

## What I Learned

Neste módulo, saí do zero e montei um ambiente de desenvolvimento ABAP completo
— do download do Eclipse até a execução da minha primeira classe. Os principais
aprendizados:

- **ABAP não é um bicho de sete cabeças.** A estrutura de classes, métodos e
  interfaces é familiar para quem vem do C# — o que muda é a sintaxe e as
  ferramentas (Eclipse em vez de VS Code, `METHOD/ENDMETHOD` em vez de `{ }`).
- **Tudo no ABAP vive dentro do sistema.** Não existem arquivos `.abap` soltos
  no sistema de arquivos — o código é armazenado no ABAP Repository e
  organizado em pacotes, com transporte controlado por Transport Requests.
- **O ciclo de desenvolvimento tem um passo extra: a ativação.** Escrever
  código não basta — é preciso ativar (`Ctrl + F3`) para compilar e registrar
  o objeto no repositório.
- **A SAP tem seu próprio Copilot.** O Joule for Developers é o equivalente
  SAP ao GitHub Copilot, mas é específico para o ecossistema ABAP/CDS/RAP e
  nem sempre está disponível em ambientes de prática.
- **A analogia com .NET funcionou.** Pensar em termos de "isso é como um
  namespace", "aquilo é como um `dotnet build`", "essa interface é como
  `static void Main()`" tornou o aprendizado muito mais rápido.

## Open Questions

- O Transport Request trafega código entre ambientes automaticamente ou precisa
  de aprovação manual? Quem aprova?
- Classes ABAP podem ter herança e polimorfismo como em C#? O `FINAL` que
  marcamos na classe bloqueia isso?
- O que significam exatamente os números no Project Explorer — ex:
  `Favorite Packages (94.864)`?
- Como seria um "projeto real" em ABAP Cloud comparado ao que fizemos? Quantas
  classes, pacotes e camadas?
- Existe algum pacote NuGet-like para ABAP? Como compartilhar código entre
  projetos?

## Code Examples

Os exemplos de código ficam junto de cada aula:

- [Aula 04 — zcl_hello_world.abap](04-developing-your-first-abap-application/zcl_hello_world.abap)
- [Aula 04 — solution.abap](04-developing-your-first-abap-application/solution.abap)

As demais aulas (01, 02, 03, 05) são conceituais e não possuem código.

## Exercises

- [Aula 04 — Exercício (solution.abap)](04-developing-your-first-abap-application/solution.abap)
