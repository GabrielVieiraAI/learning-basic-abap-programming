# 📖 Glossário SAP & ABAP

> Glossário central de termos do ecossistema SAP para acompanhar o curso
> **Basic ABAP Programming**. Termos técnicos com definições curtas e
> analogias ao ecossistema .NET/Azure quando aplicável.

---

**Índice rápido:** [A](#a) · [C](#c) · [D](#d) · [E](#e) · [G](#g) · [I](#i) · [J](#j) · [L](#l) · [M](#m) · [O](#o) · [P](#p) · [R](#r) · [S](#s) · [T](#t) · [U](#u) · [V](#v)

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

### ABAP Cloud

Paradigma completo de desenvolvimento cloud-ready da SAP. Seu núcleo
combina [ABAP for Cloud Development](#abap-for-cloud-development) (linguagem),
[ADT](#adt-abap-development-tools) para Eclipse (IDE),
[CDS](#cds-core-data-services) (modelo de dados),
[RAP](#rap-restful-application-programming-model) (apps e serviços) e APIs
públicas SAP para extensibilidade. É obrigatório no
[SAP BTP](#sap-btp-business-technology-platform) e
[S/4HANA Cloud](#s4hana) (public edition) e fortemente recomendado nos demais
ambientes.

> 💡 **Analogia .NET:** Stack completa .NET + Azure + ASP.NET Core para
> desenvolvimento cloud-native — não é só a linguagem, é o ecossistema
> inteiro de ferramentas, frameworks e práticas.

### ABAP for Cloud Development

Versão restrita e cloud-optimized da linguagem
[ABAP](#abap-advanced-business-application-programming), obrigatória no
[SAP BTP ABAP Environment](#sap-btp-business-technology-platform) e no
[S/4HANA Cloud ABAP Environment](#s4hana). Apenas um subconjunto dos elementos
da linguagem está disponível e o acesso a
[objetos de repositório](#objeto-de-desenvolvimento-development-object--repository-object)
é restrito. Segue as regras do [Standard ABAP](#standard-abap), mas com
escopo limitado.

> 💡 **Analogia .NET:** .NET para Azure com restrições de APIs e padrões
> cloud-native obrigatórios (_managed identity_, variáveis de ambiente,
> _health checks_).

### ABAP for Key Users

Versão restrita do [ABAP](#abap-advanced-business-application-programming)
projetada para _key users_ (usuários-chave de negócio) implementarem extensões
seguras dentro dos limites definidos pela SAP. Suporta apenas um subconjunto
muito limitado de elementos da linguagem e acesso restrito a
[objetos de repositório](#objeto-de-desenvolvimento-development-object--repository-object).

> 💡 **Analogia .NET:** Power Apps / Power Automate — ferramentas para
> usuários de negócio criarem personalizações sem acesso completo ao código.

### ABAP Cloud Project

Tipo de projeto no [Eclipse](#eclipse-ide) que conecta o ambiente de
desenvolvimento local a um sistema [ABAP](#abap-advanced-business-application-programming)
na nuvem ([SAP BTP](#sap-btp-business-technology-platform) ou S/4HANA Public
Cloud). É o tipo de projeto usado neste curso.

> 💡 **Analogia .NET:** Conectar o VS Code a um App Service no
> [Azure](https://azure.microsoft.com/).

### ABAP Debugger

Depurador integrado ao [Eclipse](#eclipse-ide) com [ADT](#adt-abap-development-tools)
que permite pausar a execução de programas ABAP, inspecionar variáveis em
tempo real, executar passo a passo (F5/F6/F8) e alterar valores durante o
debug. Suporta breakpoints condicionais, watchpoints e statement breakpoints.

> 💡 **Analogia .NET:** Equivalente ao Visual Studio Debugger. Breakpoints
> na margem, F5 (Step Into), F6 (Step Over), F8 (Continue) e janelas de
> variáveis (Locals/Watch).

### ABAP Dictionary (_DDIC_)

Repositório central do sistema SAP que armazena e gerencia tipos de dados
globais, tabelas, visões (_views_), estruturas e metadados de negócio
disponíveis em todo o sistema. Tipos definidos no DDIC carregam semântica
adicional — como labels, validações e relações — que os tipos locais não têm.
É a base para telas, serviços OData e [CDS Views](#cds-core-data-services).

> 💡 **Analogia .NET:** Similar ao **Entity Framework Core** com _code-first_
> — um catálogo central que define entidades, tipos e metadados usados
> globalmente pela aplicação. A diferença é que no SAP o DDIC é parte
> integrante do runtime, não apenas da camada de dados.

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

### APPEND (_Statement_)

Instrução ABAP que adiciona uma nova linha ao **final** de uma
[tabela interna](#tabela-interna-internal-table). A linha pode conter um
valor literal, uma variável ou o resultado de uma expressão. Equivalente
ao método `Add()` de uma lista em outras linguagens.

> 💡 **Analogia .NET:** `APPEND valor TO tabela.` = `lista.Add(valor);`
> em C#.

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

### Atributo de Instância (_Instance Attribute_)

Variável declarada com [`DATA`](#data-statement) dentro da
[definição de uma classe](#definicao-de-classe-class-definition). Cada objeto
([instância](#classe-abap-abap-class)) criado a partir da classe tem sua
própria cópia do atributo — modificar o valor em um objeto não afeta os demais.

> 💡 **Analogia .NET:** Campo de instância em C# — `public string Name;`.
> Cada `new Person()` tem seu próprio `Name`.

### Atributo Estático (_Static Attribute_)

Variável declarada com [`CLASS-DATA`](#class-data) dentro da
[definição de uma classe](#definicao-de-classe-class-definition). O valor é
**compartilhado** por todas as instâncias da classe — se um objeto alterar o
valor, todos os outros veem a alteração.

> 💡 **Analogia .NET:** Campo `static` em C# — `public static int Counter;`.
> O valor pertence à classe, não a um objeto específico.

---

## C

### CASE / ENDCASE

Estrutura de desvio condicional que compara uma única variável com valores
exatos usando `WHEN`. Ideal quando a decisão depende de valores discretos
de uma só variável. `WHEN OTHERS` captura qualquer valor não listado
(equivalente ao `default` do C#).

> 💡 **Analogia .NET:** `CASE ... WHEN ... ENDCASE` = `switch/case/default`
> do C#. Qualquer `CASE` pode ser reescrito como `IF/ELSEIF`, mas `CASE`
> é mais legível para comparações de igualdade com valores discretos.

### Classe ABAP (_ABAP Class_)

Estrutura fundamental da orientação a objetos em
[ABAP](#abap-advanced-business-application-programming). Uma classe ABAP
encapsula dados (atributos) e comportamentos (métodos), seguindo os mesmos
princípios de OO de qualquer linguagem moderna. Classes podem implementar
interfaces e participar de hierarquias de herança.

> 💡 **Analogia .NET:** Uma classe ABAP é conceitualmente idêntica a uma
> classe C# — define atributos (campos/propriedades) e métodos.

### Classe Local (_Local Class_)

Classe definida **dentro** de um programa ABAP (tipicamente na aba
**Local Types** de uma [classe global](#classe-global-global-class)).
Só é visível e utilizável no programa que a define. Ideal para _helpers_,
_DTOs_ e lógica auxiliar que não precisa ser reaproveitada em outros programas.

> 💡 **Analogia .NET:** Classe privada aninhada (_nested private class_) em
> C# — vive dentro de outra classe e só é acessível por ela.

### Classe Global (_Global Class_)

[Objeto de repositório](#objeto-de-desenvolvimento-development-object--repository-object)
independente, armazenado em um [class pool](#class-pool) próprio. É visível
para qualquer programa ABAP no sistema (respeitando regras de
[pacote](#pacote-package)). Pode implementar interfaces como
[`IF_OO_ADT_CLASSRUN`](#if_oo_adt_classrun) para servir como ponto de entrada
executável (F9).

> 💡 **Analogia .NET:** Classe `public` em seu próprio arquivo `.cs` —
> acessível por qualquer outro código do projeto/solution.

### Class Pool

Tipo de [objeto de repositório](#objeto-de-desenvolvimento-development-object--repository-object)
que armazena uma [classe global](#classe-global-global-class) no
[Repositório ABAP](#repositorio-abap-abap-repository). Cada classe global
ocupa seu próprio class pool, que contém tanto a definição quanto a
implementação da classe.

> 💡 **Analogia .NET:** Arquivo `.cs` que contém a definição completa de uma
> classe. A diferença é que o class pool vive dentro do sistema SAP, não no
> sistema de arquivos.

### CLASS-DATA

Instrução ABAP que declara um [atributo estático](#atributo-estatico-static-attribute)
dentro da [definição de uma classe](#definicao-de-classe-class-definition).
A sintaxe é idêntica à do [`DATA`](#data-statement), mas o valor é
compartilhado entre **todas** as instâncias da classe.

> 💡 **Analogia .NET:** `CLASS-DATA conn_counter TYPE i.` = `public static
> int ConnCounter;` em C#.

### CLEAR (_Statement_)

Instrução ABAP que redefine uma variável para o **valor inicial do tipo**
(_type-specific initial value_). Ignora completamente qualquer `VALUE`
definido na declaração. Após `CLEAR`, um `TYPE i` sempre contém `0`, um
`TYPE string` sempre contém `''` (vazio), etc.

> 💡 **Analogia .NET:** `CLEAR lv_valor.` é equivalente a `valor = default;`
> no C# — restaura o valor padrão do tipo, não o valor inicial da declaração.

### Clean Core

Princípio fundamental do [ABAP Cloud](#abap-cloud): desenvolver extensões e
aplicações **sem modificar o núcleo do sistema SAP**. Garante que atualizações
e operações na nuvem funcionem sem interrupções — o código customizado roda
"ao lado" do SAP, não "dentro" dele. Essencial para manutenção em ambientes
cloud.

> 💡 **Analogia .NET:** No Azure, você não modifica o runtime do App Service —
> faz deploy da sua aplicação em cima de uma plataforma gerenciada. Clean Core
> aplica o mesmo princípio ao ecossistema SAP.

### Cloud Foundry

Plataforma de código aberto (_open source_) para deploy e gerenciamento de
aplicações na nuvem. Na [SAP BTP](#sap-btp-business-technology-platform), é um
dos runtimes que podem ser implantados dentro de uma
[Subaccount](#subaccount) para hospedar a [ABAP Instance](#abap-instance).

> 💡 **Analogia .NET:** Similar ao Azure App Service Environment — uma camada
> de runtime que gerencia a execução das suas aplicações.

### Concatenação de Strings (_String Concatenation_)

Operação que une duas ou mais strings usando o operador `&&` (equivalente
ao `+` do C# para strings). O operador **não insere espaços** automaticamente
— se precisar de separadores, inclua-os explicitamente como literais ou
via [templates de string](#template-de-string-string-template).

> 💡 **Analogia .NET:** `lv_part1 && lv_part2` é equivalente a `part1 + part2`
> no C# para concatenação de strings. O ABAP usa `&&` para não confundir com
> o operador aritmético `+`.

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

### CONSTANTS (_Statement_)

Instrução ABAP para declarar constantes — objetos de dados cujo valor é
fixo e não pode ser alterado durante a execução. A sintaxe é idêntica à
do [DATA](#data-statement), com a diferença de que a adição `VALUE` é
**obrigatória**. Qualquer tentativa de atribuir um novo valor gera erro
de sintaxe.

> 💡 **Analogia .NET:** `CONSTANTS lc_pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.`
> é equivalente a `const decimal PI = 3.14M;` em C#.

### Construtor (_Constructor_)

Método especial de uma [classe](#classe-abap-abap-class) com o nome reservado
`constructor`. É chamado **automaticamente** pelo runtime a cada `NEW #( )`
e executado uma única vez por instância. Só aceita parâmetros `IMPORTING`
e pode lançar exceções (`RAISING`). Garante que todo objeto nasça em estado
consistente — substitui métodos como `set_attributes`.

> 💡 **Analogia .NET:** Construtor de classe em C# — `public Person(string
> name) { }`. A diferença é que no ABAP o nome é fixo (`constructor`) e
> não pode ter `EXPORTING` ou `RETURNING`.

### Construtor Estático (_Static Constructor / Class Constructor_)

Método estático especial com o nome reservado `class_constructor`. É chamado
**uma única vez** pelo runtime, no primeiro acesso à classe (que pode ser um
`NEW`, acesso a atributo estático ou chamada de método estático). Não aceita
parâmetros nem lança exceções. Usado para inicializar atributos estáticos com
valores não-iniciais.

> 💡 **Analogia .NET:** Construtor estático C# — `static MyClass() { }`.
> Ambos executam uma única vez, sem parâmetros, antes do primeiro uso da
> classe.

### Conversão Implícita de Tipo (_Implicit Type Conversion_)

Mecanismo automático do runtime ABAP que tenta converter o tipo de um valor
para o tipo da variável de destino durante uma atribuição. Se a conversão
não for possível (ex: texto não numérico → inteiro), ocorre um **erro em
runtime**. Mesmo quando possível, pode haver perda de dados (truncamento).
A recomendação é **evitar depender** de conversões implícitas.

> 💡 **Analogia .NET:** Similar ao _implicit casting_ do C#. Atribuir uma
> `string` a um `int` sem conversão explícita compila como erro em C#;
> no ABAP, compila mas pode explodir em runtime. O princípio é o mesmo:
> declare tipos compatíveis para evitar surpresas.

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

## D

### Debug Perspective

Layout do [Eclipse](#eclipse-ide) otimizado para debugging ABAP, ativado
automaticamente quando um breakpoint é atingido. Inclui as views
**Variables** (valores de variáveis), **Breakpoints** (gerenciar breakpoints),
**ABAP Internal Table** (conteúdo de tabelas) e o editor com destaque da
linha atual (fundo verde).

> 💡 **Analogia .NET:** Equivalente ao layout de debugging do Visual Studio
> — janelas de Locals, Watch e Call Stack abertas automaticamente ao iniciar
> uma sessão de debug.

### DATA (_Statement_)

Instrução fundamental do ABAP para declarar **variáveis**. Uma declaração
`DATA` consiste no nome da variável (até 30 caracteres), o tipo após a
adição `TYPE` e, opcionalmente, um valor inicial com a adição `VALUE`.
Exemplo: `DATA lv_nome TYPE string VALUE 'Ana'.`

> 💡 **Analogia .NET:** `DATA lv_nome TYPE string VALUE 'Ana'.` é equivalente
> a `string nome = "Ana";` em C#. A ordem é invertida (nome antes do tipo)
> e a palavra `TYPE` é obrigatória.

### Declaração Inline (_Inline Declaration_)

Sintaxe moderna do ABAP (desde a versão 7.40) que permite declarar uma
variável diretamente no ponto de uso com `DATA(...)`. O tipo é inferido
pelo compilador a partir da expressão do lado direito. Exemplo:
`DATA(lv_name) = 'Ana'.` — o compilador infere `TYPE string`.

> 💡 **Analogia .NET:** `DATA(lv_name) = 'Ana'.` é equivalente a
> `var name = "Ana";` no C#. Inferência de tipo no ponto de uso.

### DO / ENDDO (_Iteration_)

Estrutura de repetição (loop) do ABAP. Pode ser controlada com `TIMES`
(número fixo de iterações) ou com `EXIT` (condição de saída). A variável
de sistema [`sy-index`](#sy-index) serve como contador de iteração,
começando em 1.

> 💡 **Analogia .NET:** `DO n TIMES. ... ENDDO.` = `for (int i = 0; i < n;
> i++) { }`. `DO. ... EXIT. ... ENDDO.` = `while (true) { ... break; }`.

### Definição de Classe (_Class Definition_)

Primeira parte da estrutura de uma [classe ABAP](#classe-abap-abap-class),
delimitada por `CLASS <nome> DEFINITION. ... ENDCLASS.`. Contém a declaração
de todos os membros da classe — tipos, constantes,
[atributos de instância](#atributo-de-instancia-instance-attribute),
[atributos estáticos](#atributo-estatico-static-attribute) e métodos —
organizados em [seções de visibilidade](#secao-de-visibilidade-visibility-section).

> 💡 **Analogia .NET:** A assinatura da classe em C# — a parte que declara
> campos, propriedades e assinaturas de métodos (sem os corpos).

---

## E

### Eclipse IDE

IDE (_Integrated Development Environment_) de código aberto usada como base
para o desenvolvimento [ABAP](#abap-advanced-business-application-programming)
com o plugin [ADT](#adt-abap-development-tools). Não é um editor leve — requer
pelo menos 8 GB de RAM.

> 💡 **Analogia .NET:** Visual Studio (não o VS Code — o Eclipse é mais pesado
> e completo, similar ao Visual Studio tradicional).

### Encapsulamento (_Encapsulation_)

Princípio fundamental da orientação a objetos: os dados internos de uma
[classe](#classe-abap-abap-class) devem ser protegidos contra acesso externo
direto. No ABAP, implementa-se movendo atributos para a `PRIVATE SECTION` ou
adicionando [`READ-ONLY`](#read-only) na `PUBLIC SECTION`. O acesso controlado
é feito via [métodos](#metodo-method) ou [construtores](#construtor-constructor).

> 💡 **Analogia .NET:** Campos `private` + propriedades públicas ou métodos
> de acesso em C#. O princípio é o mesmo: proteger o estado interno do objeto
> e garantir que ele nunca fique inconsistente.

### EXIT (_Statement_)

Instrução ABAP que interrompe imediatamente a execução de um loop
([`DO`](#do-enddo-iteration) ou [`LOOP`](#loop-endloop)). Fora de loops,
`EXIT` termina o processamento do bloco atual (ex: método). Frequentemente
usado dentro de `IF` para sair do loop quando uma condição é atingida.

> 💡 **Analogia .NET:** `EXIT` = `break` em C#.

---

## G

### Global Account

O nível mais alto da hierarquia de contas na [SAP BTP](#sap-btp-business-technology-platform).
Representa a conta principal de uma organização. Dentro dela, existem uma ou
mais [Subaccounts](#subaccount).

> 💡 **Analogia .NET:** Assinatura Azure (_Azure Subscription_).

### Garbage Collector (_Coletor de Lixo_)

Componente do runtime [ABAP](#abap-advanced-business-application-programming)
que remove automaticamente da memória objetos que não têm mais nenhuma
[variável de referência](#variavel-de-referencia-reference-variable) apontando
para eles. É executado periodicamente — o desenvolvedor não controla o momento
exato da remoção, apenas garante que objetos inacessíveis serão limpos.

> 💡 **Analogia .NET:** O Garbage Collector do .NET CLR — mesmo princípio:
> objetos sem referência são coletados automaticamente. Não existe `delete`
> manual como em C++.

---

## I

### IF / ELSE / ENDIF (_Conditional Branching_)

Estrutura de desvio condicional fundamental do ABAP. Executa blocos de
código com base em condições lógicas. Suporta múltiplos ramos com
`ELSEIF` e um ramo padrão com `ELSE`. Diferente de muitas linguagens,
cada condição — inclusive `ELSE` — termina com ponto final (`.`).

> 💡 **Analogia .NET:** `IF cond. ... ELSEIF cond. ... ELSE. ... ENDIF.`
> = `if (...) { } else if (...) { } else { }` em C#. O ABAP exige
> `ENDIF.` explícito e `.` após cada condição.

### IF_OO_ADT_CLASSRUN

Interface padrão do [ADT](#adt-abap-development-tools) que fornece o ponto de
entrada `main` para executar uma [classe ABAP](#classe-abap-abap-class)
diretamente via **F9** no Eclipse. O método `main` recebe um parâmetro `out`
do tipo `IF_OO_ADT_CLASSRUN~OUT` com o método `write(...)` para saída no
console. Sem esta interface, o ADT não sabe "por onde começar" a execução.

> 💡 **Analogia .NET:** Equivalente ao `static void Main(string[] args)` no
> .NET — é o contrato que transforma uma classe comum em um executável.

### Implementação de Classe (_Class Implementation_)

Segunda parte da estrutura de uma [classe ABAP](#classe-abap-abap-class),
delimitada por `CLASS <nome> IMPLEMENTATION. ... ENDCLASS.`. Contém o código
executável dos métodos declarados na [definição](#definicao-de-classe-class-definition).
É opcional — só se torna obrigatória quando a definição contém métodos que
precisam de implementação.

> 💡 **Analogia .NET:** O corpo dos métodos em C# — a parte que contém as
> chaves `{ }` com o código que realmente executa.

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

## L

### LOOP / ENDLOOP

Estrutura de repetição do ABAP para percorrer todas as linhas de uma
[tabela interna](#tabela-interna-internal-table). A cada iteração, uma linha
é copiada para uma _work area_ (explícita ou declarada inline com `INTO`).
A variável de sistema [`sy-tabix`](#sy-tabix) indica o índice da linha atual.

> 💡 **Analogia .NET:** `LOOP AT tabela INTO DATA(var). ... ENDLOOP.`
> = `foreach (var var in lista) { }` em C#.

---

## M

### ME (_Self-Reference_)

Variável de referência implícita do ABAP, disponível apenas dentro de
[métodos](#metodo-method) de instância. `ME` é tipada com a classe atual e
preenchida automaticamente em runtime com o endereço da instância corrente.
Seu uso é opcional — só é necessário quando um [parâmetro](#parametro-de-metodo-method-parameter)
tem o mesmo nome que um atributo, criando ambiguidade.

> 💡 **Analogia .NET:** `ME` = `this` em C#. `me->carrier_id` =
> `this.CarrierId`. Assim como em C#, você só precisa usar quando há
> conflito de nomes no escopo.

### Método (_Method_)

Bloco de código que implementa o comportamento de uma
[classe](#classe-abap-abap-class). Métodos de instância são declarados com
`METHODS` e acessam tanto atributos de instância quanto estáticos. Métodos
de classe (estáticos) são declarados com `CLASS-METHODS` e só acessam
componentes estáticos. Possuem uma [assinatura](#parametro-de-metodo-method-parameter)
com [parâmetros](#parametro-de-metodo-method-parameter) e [exceções](#try--catch--endtry-exception-handling).

> 💡 **Analogia .NET:** `METHODS` = método de instância (`public void
> DoSomething()`). `CLASS-METHODS` = método estático (`public static void
> DoSomething()`).

### Método Funcional (_Functional Method_)

[Método](#metodo-method) que possui um [parâmetro](#parametro-de-metodo-method-parameter)
`RETURNING VALUE(...)`. Sua principal vantagem é poder ser usado diretamente
em expressões ABAP — atribuições, condições lógicas (`IF`), loops (`LOOP`)
e como argumento de outros métodos — sem necessidade de variável intermediária.

> 💡 **Analogia .NET:** Qualquer método C# com retorno não-void. A diferença
> é que no ABAP você precisa declarar explicitamente `RETURNING VALUE(...)`
> — não há inferência automática como `return` no C#.

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

### Opções de Formatação (_Format Options_)

Diretivas usadas dentro de [templates de string](#template-de-string-string-template)
para controlar a exibição de valores: `DATE =` (formato de data: `ISO`,
`USER`, `ENVIRONMENT`), `NUMBER =` (separador decimal), `SIGN =` (posição
do sinal: `LEFT` ou `RIGHT`), `STYLE =` (notação: `SCIENTIFIC` ou
`ENGINEERING`).

> 💡 **Analogia .NET:** Equivalente a `ToString("format")` ou format
> specifiers no C#. `{ data DATE = ISO }` ≈ `date.ToString("yyyy-MM-dd")`.

### Operador NEW (_NEW Operator_)

Operador ABAP que cria uma nova instância de uma
[classe](#classe-abap-abap-class) em memória e retorna uma
[variável de referência](#variavel-de-referencia-reference-variable) para ela.
A sintaxe `NEW #( )` usa inferência de tipo (o `#` deduz a classe a partir do
tipo da variável à esquerda do `=`). Também é possível usar o nome explícito:
`NEW lcl_connection( )`.

> 💡 **Analogia .NET:** `NEW #( )` = `new()` (target-typed new) no C# 9+.
> `NEW lcl_connection( )` = `new lcl_connection()` tradicional.

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

### Parâmetro de Método (_Method Parameter_)

Variável declarada na assinatura de um [método](#metodo-method) que define o
fluxo de dados entre o chamador e o método. O ABAP tem quatro tipos:
`IMPORTING` (entrada, não alterável pelo método), `EXPORTING` (saída, sempre
opcional para o chamador), `CHANGING` (entrada/saída, alterável) e `RETURNING
VALUE(...)` (retorno funcional único). `IMPORTING` e `CHANGING` são
obrigatórios por padrão; podem ser tornados opcionais com `OPTIONAL` ou
`DEFAULT`.

> 💡 **Analogia .NET:** `IMPORTING` = parâmetro normal C#, `EXPORTING` =
> `out` parameter, `CHANGING` = `ref` parameter, `RETURNING` = valor de
> retorno do método. O ABAP é mais verboso, mas a direção do fluxo de dados
> fica explicitamente documentada na assinatura.

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

### READ-ONLY

Adição permitida apenas na `PUBLIC SECTION` de uma [classe](#classe-abap-abap-class).
Quando aplicada a um `DATA` ou [`CLASS-DATA`](#class-data), permite **leitura**
externa do atributo mas **bloqueia escrita** fora da classe. Ideal para expor
contadores ou informações calculadas sem risco de modificação externa.

> 💡 **Analogia .NET:** Propriedade somente leitura em C# — `public int
> Counter { get; }`. O valor pode ser lido por qualquer código, mas só a
> própria classe pode alterá-lo.

### Repositório ABAP (_ABAP Repository_)

O conjunto completo de todos os
[objetos de desenvolvimento](#objeto-de-desenvolvimento-development-object--repository-object)
existentes em um sistema [ABAP](#abap-advanced-business-application-programming).
É um banco de dados central que armazena e versiona todo o código-fonte,
estruturas de dados e configurações do sistema.

> 💡 **Analogia .NET:** Similar ao conceito de _Source Control_ (Git) combinado
> com o _file system_ do projeto — mas integrado diretamente no runtime SAP.

### Referência NULA (_NULL Reference_)

Valor inicial de toda [variável de referência](#variavel-de-referencia-reference-variable)
ABAP. Indica que a variável ainda não aponta para nenhum objeto. Tentar
acessar componentes (`->`) de uma referência nula causa erro em runtime.
Equivalente ao `null` do C#.

> 💡 **Analogia .NET:** `null` em C# — `Person p = null;`. No ABAP, o valor
> é exibido como `NULL` no debugger e não permite acesso a membros.

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

### Seção de Visibilidade (_Visibility Section_)

Cada uma das três divisões da [definição de uma classe](#definicao-de-classe-class-definition)
ABAP que controla o nível de acesso aos membros declarados. A ordem é
obrigatória: `PUBLIC SECTION` (acessível de qualquer lugar), seguida de
`PROTECTED SECTION` (acessível pela classe e subclasses), seguida de
`PRIVATE SECTION` (acessível apenas pela própria classe). Nenhuma declaração
pode aparecer fora dessas seções.

> 💡 **Analogia .NET:** Modificadores de acesso `public`, `protected` e
> `private` do C#. A diferença é que no ABAP eles organizam os membros em
> blocos explícitos com ordem fixa, em vez de serem prefixos por membro.

### Seletor de Componente (_Component Selector_)

Operadores do ABAP usados para acessar membros de uma
[classe](#classe-abap-abap-class): `->` (seletor de instância) acessa membros
de um objeto através de uma [variável de referência](#variavel-de-referencia-reference-variable),
e `=>` (seletor estático) acessa membros estáticos ([CLASS-DATA](#class-data)
ou métodos de classe) diretamente pelo nome da classe. Diferente de C#, o
ABAP usa símbolos diferentes para deixar explícito o tipo de acesso.

> 💡 **Analogia .NET:** `obj->attr` e `Classe=>attr` = `obj.Attr` e
> `Class.Attr` em C#. O ABAP sacrifica a uniformidade do `.` em troca de
> clareza visual: o `->` e `=>` revelam imediatamente se o membro é de
> instância ou estático.

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

### sy-index

Variável de sistema (_system variable_) do ABAP que funciona como contador
de iteração dentro de loops [`DO`](#do-enddo-iteration). O runtime a
incrementa em 1 a cada iteração, **começando de 1** (não de 0). Dentro
de [`LOOP`](#loop-endloop), [`sy-tabix`](#sy-tabix) cumpre papel similar.

> 💡 **Analogia .NET:** `sy-index` = `i + 1` em um `for (int i = 0; ...)`.
> Começar em 1 é uma diferença importante para quem vem de C#.

### sy-tabix

Variável de sistema (_system variable_) do ABAP que indica o **índice da
linha atual** dentro de um [`LOOP AT`](#loop-endloop). Reflete a posição
real da linha na [tabela interna](#tabela-interna-internal-table), que pode
não ser sequencial se houver filtro `WHERE`. Começa em 1.

> 💡 **Analogia .NET:** `sy-tabix` = índice 1-based da linha atual em um
> `foreach`. Similar a manter um contador manual `index++` em C#.

### Standard ABAP

Versão universal e irrestrita da linguagem
[ABAP](#abap-advanced-business-application-programming). Cobre todo o escopo
da linguagem e permite acesso a todos os
[objetos de repositório](#objeto-de-desenvolvimento-development-object--repository-object)
(exceto os bloqueados por [pacotes](#pacote-package)). A
[verificação de sintaxe](#syntax-check) é feita como
[Unicode check](#unicode-system).

> 💡 **Analogia .NET:** C# completo em um projeto .NET tradicional — acesso
> total a todas as APIs, bibliotecas e funcionalidades da linguagem.

### Syntax Check

Verificação de sintaxe que todo código
[ABAP](#abap-advanced-business-application-programming) precisa passar antes
de ser [ativado](#ativação-activation). No [Standard ABAP](#standard-abap),
é executada como [Unicode check](#unicode-system). Se houver erros, a
[ativação](#ativação-activation) falha.

> 💡 **Analogia .NET:** Compilação (`dotnet build`) — o código precisa compilar
> sem erros antes de poder ser executado.

---

## T

### Tabela Interna (_Internal Table_)

Estrutura de dados do ABAP que armazena **múltiplos valores do mesmo tipo**
organizados em linhas. O número de linhas é dinâmico (cresce com
[`APPEND`](#append-statement)). O valor inicial é uma tabela vazia (0 linhas).
Tipos de tabela podem ser locais (`TYPES`) ou globais ([ABAP Dictionary](#abap-dictionary-ddic)).

> 💡 **Analogia .NET:** `DATA tabela TYPE TABLE OF i.` = `List<int> tabela
> = new List<int>();` em C#. Similar a `List<T>` — dinâmica, indexada.

### Table Expression

Sintaxe ABAP `...[ n ]` para acessar uma linha específica de uma [tabela
interna](#tabela-interna-internal-table) por **índice 1-based**. Exige pelo
menos um espaço dentro dos colchetes. Se o índice não existir, lança a
exceção `CX_SY_ITAB_LINE_NOT_FOUND`.

> 💡 **Analogia .NET:** `tabela[ 3 ]` = `lista[2]` em C# (0-based vs
> 1-based). `line_exists( tabela[ n ] )` verifica existência como
> `n < lista.Count` em C#.

### Template de String (_String Template_)

Expressão ABAP delimitada por `|...|` que produz um resultado do tipo
`string`. Permite **interpolar** variáveis e expressões entre chaves
`{ }` (com espaços obrigatórios) e aplicar [opções de formatação](#opções-de-formatação-format-options)
como `DATE =`, `NUMBER =`, `SIGN =` e `STYLE =`.

> 💡 **Analogia .NET:** `|Nome: { lv_name }|` = `$"Nome: {nome}"`
> (_string interpolation_) no C#. A diferença é o delimitador `|` em
> vez de `$"` e a exigência de espaços dentro das chaves.

### Transport Request

Mecanismo que garante que [objetos de desenvolvimento](#objeto-de-desenvolvimento-development-object--repository-object) que logicamente pertencem
ao mesmo contexto sejam transportados juntos entre ambientes (ex: de
desenvolvimento → teste → produção). Cada transport request tem um owner e
permite trabalho em equipe. Enquanto um objeto está em um transport request,
ele fica bloqueado para edição por outros.

> 💡 **Analogia .NET:** Similar a um _Pull Request_ + _CI/CD pipeline_ —
> empacota mudanças relacionadas e controla o fluxo entre ambientes.

### TRY / CATCH / ENDTRY (_Exception Handling_)

Estrutura de tratamento de exceções do ABAP. O bloco `TRY` contém código
que pode lançar exceção; cada `CATCH` captura uma classe de exceção
específica (ex: `cx_sy_zerodivide`, `cx_sy_conversion_no_number`). Se a
exceção não for capturada, o programa aborta com _runtime error_ (dump).

> 💡 **Analogia .NET:** `TRY ... CATCH ... ENDTRY` = `try { } catch
> (ExceptionType) { }` em C#. As classes `cx_sy_*` são equivalentes às
> exceções do .NET como `DivideByZeroException`.

### TYPES (_Statement_)

Instrução ABAP para definir **tipos de dados locais** reutilizáveis dentro
do escopo atual (programa, classe ou método). `TYPES` não cria variáveis —
cria definições de tipo que podem ser usadas depois com
[DATA](#data-statement) ou [CONSTANTS](#constants-statement). Exemplo:
`TYPES: tp_preco TYPE p LENGTH 6 DECIMALS 2.`

> 💡 **Analogia .NET:** Similar a um _type alias_ (`using Preco = decimal;`)
> ou a um `record` simples em C#. Para tipos globais visíveis em todo o
> sistema, usa-se o [ABAP Dictionary](#abap-dictionary-ddic).

---

## U

### Unicode System

Sistema [ABAP](#abap-advanced-business-application-programming) que opera com
charset Unicode — o padrão moderno para todos os sistemas SAP. A
[verificação de sintaxe](#syntax-check) do [Standard ABAP](#standard-abap)
é executada como _Unicode check_, que é o requisito mínimo para um sistema
Unicode.

> 💡 **Analogia .NET:** No .NET, todas as strings são Unicode por padrão
> (`System.String` usa UTF-16). No ecossistema SAP, sistemas Unicode são o
> equivalente — suportam caracteres de qualquer idioma sem configuração
> adicional.

---

## V

### Variável de Referência (_Reference Variable_)

Variável ABAP declarada com `TYPE REF TO <classe>` que armazena o **endereço
de memória** de um objeto, não o objeto em si. É usada para criar
([`NEW`](#operador-new-new-operator)), acessar (`->`) e gerenciar instâncias
de [classes](#classe-abap-abap-class). O valor inicial é sempre uma
[referência nula](#referencia-nula-null-reference).

> 💡 **Analogia .NET:** Em C#, toda variável de tipo classe já é uma
> referência (ex: `Person p;`). O ABAP torna isso explícito com a sintaxe
> `TYPE REF TO` — você sempre sabe visualmente que está lidando com um
> ponteiro para objeto, não com um valor.

