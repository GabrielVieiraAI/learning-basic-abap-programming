# 📖 Glossário SAP & ABAP

> Glossário central de termos do ecossistema SAP para acompanhar o curso
> **Basic ABAP Programming**. Termos técnicos com definições curtas e
> analogias ao ecossistema .NET/Azure quando aplicável.

---

**Índice rápido:** [A](#a) · [C](#c) · [E](#e) · [G](#g) · [I](#i) · [J](#j) · [O](#o) · [P](#p) · [R](#r) · [S](#s) · [T](#t)

---

## A

### ABAP (_Advanced Business Application Programming_)

Linguagem de programação nativa dos sistemas SAP. É com ela que se constroem
relatórios, transações, interfaces e aplicações que rodam dentro do ecossistema
SAP (como o S/4HANA).

> 💡 **Analogia .NET:** ABAP está para SAP assim como C# está para o
> ecossistema Microsoft/.NET.

### ABAP AI SDK

Kit de desenvolvimento que permite chamar modelos de linguagem de grande
porte ([LLMs](https://en.wikipedia.org/wiki/Large_language_model)) diretamente
de código [ABAP](#abap-advanced-business-application-programming). Com ele,
você pode adicionar funcionalidades de IA generativa — como geração de texto
e completamento de prompts — às suas aplicações de negócio. Inclui APIs de
_Completion_, _Prompt Library_ e _Tracing_.

> 💡 **Analogia .NET:** Equivalente ao **Azure OpenAI SDK** ou ao **Semantic
> Kernel** — uma biblioteca para consumir IA generativa dentro do seu código
> de aplicação. A diferença é que roda nativamente no ambiente ABAP.

### ABAP Application Console

Console interativo integrado ao [Eclipse](#eclipse-ide) com
[ADT](#adt-abap-development-tools) que permite escrever e executar código
[ABAP](#abap-advanced-business-application-programming) de forma ad hoc, sem
precisar criar uma [classe](#classe-abap-abap-class) ou programa completo.
Similar a um REPL (_Read-Eval-Print Loop_) ou ao _C# Interactive_ do Visual
Studio.

> 💡 **Analogia .NET:** C# Interactive Window no Visual Studio ou `dotnet
> repl`. Permite testar trechos de código rapidamente, sem criar um projeto
> completo.

### ABAP Cloud Project

Tipo de projeto no [Eclipse](#eclipse-ide) que conecta o ambiente de
desenvolvimento local a um sistema [ABAP](#abap-advanced-business-application-programming)
na nuvem ([SAP BTP](#sap-btp-business-technology-platform) ou S/4HANA Public
Cloud). É o tipo de projeto usado neste curso.

> 💡 **Analogia .NET:** Conectar o VS Code a um App Service no
> [Azure](https://azure.microsoft.com/).

### ABAP Instance

A instância do sistema [ABAP](#abap-advanced-business-application-programming)
que roda dentro de um [Space](#space) no [Cloud Foundry](#cloud-foundry) da
[SAP BTP](#sap-btp-business-technology-platform). É onde seu código ABAP
realmente executa.

> 💡 **Analogia .NET:** Um App Service ou Container App no Azure.

### ABAP Project

Tipo de projeto no [Eclipse](#eclipse-ide) que conecta a sistemas
[ABAP](#abap-advanced-business-application-programming) on-premise (servidores
locais da empresa). **Não** é o tipo usado neste curso — usamos o
[ABAP Cloud Project](#abap-cloud-project).

### ADT (_ABAP Development Tools_)

Plugin que se instala no [Eclipse](#eclipse-ide) para transformá-lo em uma IDE
completa para desenvolvimento [ABAP](#abap-advanced-business-application-programming).
Adiciona suporte a syntax highlighting, navegação de código, debug e conexão
com sistemas SAP.

> 💡 **Analogia .NET:** Extensão C# Dev Kit no VS Code.

### Ativação (_Activation_)

Processo que compila e registra um
[objeto de desenvolvimento](#objeto-de-desenvolvimento-development-object--repository-object)
no [Repositório ABAP](#repositorio-abap-abap-repository), tornando-o executável.
No Eclipse com [ADT](#adt-abap-development-tools), é executada com
**Ctrl + F3**. Se houver erros de sintaxe, a ativação falha e os erros
aparecem no painel **Problems**.

> 💡 **Analogia .NET:** Equivalente ao `dotnet build` — compila o código e
> gera o assembly executável. A diferença é que no ABAP o resultado fica
> armazenado dentro do próprio sistema SAP.

---

## C

### Classe ABAP (_ABAP Class_)

Estrutura fundamental da orientação a objetos em
[ABAP](#abap-advanced-business-application-programming). Uma classe ABAP
encapsula dados (atributos) e comportamentos (métodos), seguindo os mesmos
princípios de OO de qualquer linguagem moderna. Classes podem implementar
interfaces e participar de hierarquias de herança.

> 💡 **Analogia .NET:** Uma classe ABAP é conceitualmente idêntica a uma
> classe C# — define atributos (campos/propriedades) e métodos.

### Cloud Foundry

Plataforma de código aberto (_open source_) para deploy e gerenciamento de
aplicações na nuvem. Na [SAP BTP](#sap-btp-business-technology-platform), é um
dos runtimes que podem ser implantados dentro de uma
[Subaccount](#subaccount) para hospedar a [ABAP Instance](#abap-instance).

> 💡 **Analogia .NET:** Similar ao Azure App Service Environment — uma camada
> de runtime que gerencia a execução das suas aplicações.

### CDS (_Core Data Services_)

Framework de modelagem de dados semântica da SAP, otimizado para o banco de
dados SAP HANA. Permite definir _views_ (visões) de dados com anotações
semânticas que enriquecem o modelo com metadados de negócio. É a camada de
acesso a dados recomendada no [ABAP](#abap-advanced-business-application-programming)
moderno ([RAP](#rap-restful-application-programming-model)) e base para
serviços OData e Fiori Elements.

> 💡 **Analogia .NET:** Similar ao **Entity Framework Core** com _code-first_
> — você define modelos de dados com anotações e o framework gera consultas
> otimizadas. A diferença é que CDS é otimizado para o SAP HANA e integra
> semântica de negócio diretamente na camada de dados.

### Convenção de Nomenclatura Húngara ABAP

Sistema de prefixos usado em [ABAP](#abap-advanced-business-application-programming)
para identificar o tipo e a função de cada variável pelo seu nome. Prefixos
comuns: `lv_` (_local variable_), `lo_` (_local object_), `rv_` (_returning
value_), `iv_` (_importing value_), `ev_` (_exporting value_). Não é
obrigatório, mas é fortemente recomendado e usado em todo código SAP padrão.

> 💡 **Analogia .NET:** Similar à notação húngara usada em código C++/C#
> legado (ex: `strName`, `iCount`). No .NET moderno, essa prática caiu em
> desuso, mas no ecossistema ABAP continua sendo o padrão.

---

## E

### Eclipse IDE

IDE (_Integrated Development Environment_) de código aberto usada como base
para o desenvolvimento [ABAP](#abap-advanced-business-application-programming)
com o plugin [ADT](#adt-abap-development-tools). Não é um editor leve — requer
pelo menos 8 GB de RAM.

> 💡 **Analogia .NET:** Visual Studio (não o VS Code — o Eclipse é mais pesado
> e completo, similar ao Visual Studio tradicional).

---

## G

### Global Account

O nível mais alto da hierarquia de contas na [SAP BTP](#sap-btp-business-technology-platform).
Representa a conta principal de uma organização. Dentro dela, existem uma ou
mais [Subaccounts](#subaccount).

> 💡 **Analogia .NET:** Assinatura Azure (_Azure Subscription_).

---

## I

### IF_OO_ADT_CLASSRUN

Interface padrão do [ADT](#adt-abap-development-tools) que fornece o ponto de
entrada `main` para executar uma [classe ABAP](#classe-abap-abap-class)
diretamente via **F9** no Eclipse. O método `main` recebe um parâmetro `out`
do tipo `IF_OO_ADT_CLASSRUN~OUT` com o método `write(...)` para saída no
console. Sem esta interface, o ADT não sabe "por onde começar" a execução.

> 💡 **Analogia .NET:** Equivalente ao `static void Main(string[] args)` no
> .NET — é o contrato que transforma uma classe comum em um executável.

---

## J

### Joule

Assistente de IA generativa da SAP integrado ao [Eclipse](#eclipse-ide) com
[ADT](#adt-abap-development-tools). Auxilia desenvolvedores
[ABAP](#abap-advanced-business-application-programming) com chat em linguagem
natural, sugestão de código inline (_ghost text_ / _predictive code
completion_), explicação de código (_Explain_) e geração de testes unitários.
É o copiloto oficial da SAP para desenvolvimento ABAP.

> 💡 **Analogia .NET:** GitHub Copilot no VS Code — assistente de IA que
> sugere código, explica trechos e responde perguntas. A diferença é que o
> Joule entende profundamente o ecossistema SAP ([CDS](#cds-core-data-services),
> [RAP](#rap-restful-application-programming-model), transportes, pacotes).

---

## O

### Objeto de Desenvolvimento (_Development Object / Repository Object_)

Qualquer item de código armazenado no
[Repositório ABAP](#repositorio-abap-abap-repository). Inclui
[classes](#classe-abap), programas, tabelas, interfaces,
[pacotes](#pacote-package), e muitos outros tipos. Todo objeto de
desenvolvimento pertence a um [pacote](#pacote-package) e é transportado
entre ambientes via [Transport Request](#transport-request).

> 💡 **Analogia .NET:** Equivalente a qualquer item em um projeto .NET — uma
> classe `.cs`, uma interface, um arquivo de configuração. A diferença é que
> no SAP esses objetos vivem dentro do próprio sistema, não no sistema de
> arquivos.

---

## P

### Pacote (_Package_)

Container que agrupa [objetos de desenvolvimento](#objeto-de-desenvolvimento-development-object--repository-object)
[ABAP](#abap-advanced-business-application-programming) que logicamente
pertencem ao mesmo contexto. Todo objeto de desenvolvimento (classe, programa,
tabela) deve ser atribuído a um pacote. Pacotes também são atribuídos a um
[Software Component](#software-component).

> 💡 **Analogia .NET:** Similar a um _namespace_ + _project folder_ no .NET.
> É a unidade de organização e transporte do código.

### Perspectiva (_Perspective_)

Conjunto pré-configurado de painéis, views e ferramentas no
[Eclipse](#eclipse-ide) otimizado para um tipo específico de trabalho. A
perspectiva ABAP mostra o [Project Explorer](#project-explorer), editor de código ABAP, console e
outras ferramentas relevantes para desenvolvimento SAP.

> 💡 **Analogia .NET:** "Layout" no VS Code. Um conjunto de painéis salvos
> para um tipo de tarefa.

### Prefixo Z (_Z Prefix_)

Convenção de nomenclatura SAP: todo
[objeto de desenvolvimento](#objeto-de-desenvolvimento-development-object--repository-object)
criado por cliente **deve** começar com `Z` ou `Y`. Isso garante que objetos
customizados nunca entrem em conflito com objetos padrão da SAP (que usam
outros prefixos como `SAP`, `/DMO/`, `CL_`).

> 💡 **Analogia .NET:** Similar à convenção de usar namespaces como
> `MyCompany.` ou `Contoso.` para código proprietário, reservando `System.` e
> `Microsoft.` para o framework.

### Project Explorer

Painel de navegação hierárquica no [Eclipse](#eclipse-ide) com
[ADT](#adt-abap-development-tools). Exibe todos os
[objetos de desenvolvimento](#objeto-de-desenvolvimento-development-object--repository-object)
do sistema ABAP organizados em [pacotes](#pacote-package). Permite adicionar
pacotes aos **Favorite Packages** (atalhos personalizados) e sincronizar a
visualização com o editor via **Link with Editor**.

> 💡 **Analogia .NET:** Solution Explorer no Visual Studio. Os Favorite
> Packages são equivalentes a pastas "pinadas" no Quick Access.

---

## R

### RAP (_RESTful Application Programming Model_)

Modelo de programação moderno do [ABAP](#abap-advanced-business-application-programming)
Cloud para construir aplicações e serviços RESTful no SAP S/4HANA e SAP BTP.
Baseia-se em [CDS](#cds-core-data-services) para modelagem de dados, _behavior
definitions_ para lógica de negócio (determinations, validations) e _service
definitions_ para expor APIs OData. É o modelo recomendado para todo novo
desenvolvimento ABAP.

> 💡 **Analogia .NET:** Similar ao **ASP.NET Core Web API** — um framework
> completo para construir APIs RESTful com modelagem de dados (CDS ~ Entity
> Framework), lógica de negócio (behavior ~ controllers/services) e exposição
> OData (service ~ minimal APIs com OpenAPI).

### Repositório ABAP (_ABAP Repository_)

O conjunto completo de todos os
[objetos de desenvolvimento](#objeto-de-desenvolvimento-development-object--repository-object)
existentes em um sistema [ABAP](#abap-advanced-business-application-programming).
É um banco de dados central que armazena e versiona todo o código-fonte,
estruturas de dados e configurações do sistema.

> 💡 **Analogia .NET:** Similar ao conceito de _Source Control_ (Git) combinado
> com o _file system_ do projeto — mas integrado diretamente no runtime SAP.

---

## S

### S/4HANA

A suíte de gestão empresarial (_ERP_) de última geração da SAP, que roda no
banco de dados SAP HANA. É o principal sistema onde aplicações
[ABAP](#abap-advanced-business-application-programming) modernas são executadas.

### SAP BTP (_Business Technology Platform_)

Plataforma de nuvem (_PaaS_) da SAP. É onde ficam hospedados os ambientes
[ABAP](#abap-advanced-business-application-programming) na nuvem usados neste
curso, além de serviços de integração, IA, analytics e extensibilidade.

> 💡 **Analogia .NET:** Azure (plataforma de nuvem da Microsoft).

### SAP Learning Hub

Plataforma oficial de treinamento da SAP. Oferece cursos hands-on, sistemas de
prática e certificações. O curso Basic ABAP Programming está hospedado aqui.

### Service Instance URL

Endereço (URL) do sistema [ABAP](#abap-advanced-business-application-programming)
na nuvem. É a "porta de entrada" para conectar o
[Eclipse](#eclipse-ide) ao [ABAP Cloud Project](#abap-cloud-project). Você
recebe essa URL ao reservar o ambiente de prática no
[SAP Learning Hub](#sap-learning-hub).

### Service Key

Arquivo JSON com as credenciais de acesso a uma instância de serviço na
[SAP BTP](#sap-btp-business-technology-platform). Pode ser usado como
alternativa à [Service Instance URL](#service-instance-url) para criar um
[ABAP Cloud Project](#abap-cloud-project).

> 💡 **Analogia .NET:** Connection string ou arquivo de publish profile no
> Azure.

### Software Component

Componente de software que agrupa [Pacotes](#pacote-package) para fins de
transporte e versionamento. Cada pacote pertence a um software component.

> 💡 **Analogia .NET:** Similar a uma _Solution_ (.sln) no .NET — agrupa
> múltiplos projetos (pacotes) em uma unidade lógica.

### Space

Subdivisão dentro de uma [Subaccount](#subaccount) no ambiente
[Cloud Foundry](#cloud-foundry). É onde a
[ABAP Instance](#abap-instance) é implantada. Normalmente há um Space para
desenvolvimento, um para teste e um para produção.

> 💡 **Analogia .NET:** Similar a um _Deployment Slot_ no Azure App Service.

### Subaccount

Nível hierárquico dentro de uma [Global Account](#global-account) na
[SAP BTP](#sap-btp-business-technology-platform). Cada Subaccount pode ser
configurada com serviços, cotas e usuários diferentes — tipicamente separa-se
Desenvolvimento, Teste e Produção em Subaccounts distintas.

> 💡 **Analogia .NET:** Resource Group no Azure.

### Superpackage (_Pacote Estrutural_)

Tipo de [pacote](#pacote-package) que contém outros pacotes (subpacotes), mas
**não** pode conter [objetos de desenvolvimento](#objeto-de-desenvolvimento-development-object--repository-object)
diretamente. Serve apenas para organização hierárquica do código.

> 💡 **Analogia .NET:** Similar a uma _Solution Folder_ no Visual Studio —
> agrupa projetos, mas não contém código diretamente.

---

## T

### Transport Request

Mecanismo que garante que [objetos de desenvolvimento](#objeto-de-desenvolvimento-development-object--repository-object) que logicamente pertencem
ao mesmo contexto sejam transportados juntos entre ambientes (ex: de
desenvolvimento → teste → produção). Cada transport request tem um owner e
permite trabalho em equipe. Enquanto um objeto está em um transport request,
ele fica bloqueado para edição por outros.

> 💡 **Analogia .NET:** Similar a um _Pull Request_ + _CI/CD pipeline_ —
> empacota mudanças relacionadas e controla o fluxo entre ambientes.
