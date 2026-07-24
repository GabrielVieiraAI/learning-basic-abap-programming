# Exercícios — Aula 06: Debugging de um Programa ABAP

## Instruções

Estes exercícios são práticos e devem ser executados **no Eclipse com ADT**. Use o arquivo [`debugging_demo.abap`](./debugging_demo.abap) como base para praticar. Ative a classe com **Ctrl + F3** antes de começar.

---

## Exercício 1: Primeiro breakpoint

1. Abra a classe [`debugging_demo.abap`](./debugging_demo.abap) no Eclipse.
2. Ative com **Ctrl + F3**.
3. Coloque um **breakpoint** na linha onde está o comentário `">>> SET BREAKPOINT ON THE NEXT LINE <<<"`.
4. Execute com **F9**.
5. Quando o debugger pausar, observe na **Variables View**:
   - O valor de `lv_total` (deve ser `5000.00`)
   - O valor de `lv_remaining` (deve ser `0.00` — ainda não foi atribuído!)
6. Pressione **F5** (Step Into) para executar `lv_remaining = lv_total.`
7. Observe que `lv_remaining` agora é `5000.00`.

**Pergunta:** Por que `lv_remaining` era `0.00` antes da execução da linha?

---

## Exercício 2: Navegação passo a passo

Continuando do exercício anterior:

1. Use **F5** (Step Into) para avançar linha por linha até entrar no `DO ... ENDDO`.
2. Dentro do loop, observe `lv_month` aumentar a cada iteração.
3. Use **F6** (Step Over) em vez de F5 e note a diferença: F6 não entra dentro de métodos.
4. Após algumas iterações, pressione **F8** (Resume) para ir até o fim.

**Pergunta:** Qual a diferença prática entre F5 e F6 quando há chamadas de método na linha atual?

---

## Exercício 3: Watchpoint

1. Remova todos os breakpoints anteriores (duplo clique na margem).
2. Execute a classe com **F9** (sem breakpoints, executa normalmente).
3. Agora, na **Variables View**, clique com botão direito em `lv_remaining` → **Set Watchpoint**.
4. Execute novamente com **F9**.
5. Observe que o debugger pausa **várias vezes** — toda vez que `lv_remaining` muda.
6. Conte quantas vezes o debugger pausa. Isso corresponde ao número de meses do empréstimo?

**Pergunta:** Por que um watchpoint em `lv_remaining` pausa mais vezes do que um breakpoint fixo dentro do loop?

---

## Exercício 4: Breakpoint condicional

1. Defina um breakpoint dentro do loop (na linha `lv_month = lv_month + 1.`).
2. Na **Breakpoints View**, selecione esse breakpoint.
3. No campo **Condition**, digite: `lv_month > 8`
4. Execute com **F9**. O debugger só deve pausar quando `lv_month` for maior que 8.

**Pergunta:** Em que situação um breakpoint condicional é mais útil que um breakpoint comum?

---

## Exercício 5: Change Value

1. Defina um breakpoint na primeira linha dentro do loop.
2. Execute com **F9** e espere pausar.
3. Na **Variables View**, clique com botão direito em `lv_repayment` → **Change Value...**.
4. Mude o valor de `500.00` para `1000.00`.
5. Pressione **F8** (Resume) e veja como o plano de pagamento muda (menos meses).
6. Repita o teste, mas mude `lv_repayment` para `100.00` e veja o empréstimo durar mais meses.

**Pergunta:** Em que cenário real alterar valores durante o debug seria útil?

---

## Exercício 6: Statement Breakpoint

1. Na **Breakpoints View**, abra o dropdown da toolbar → **Add Statement Breakpoint**.
2. Digite `EXIT` e confirme.
3. Execute com **F9**.
4. O debugger pausa quando o `EXIT` dentro do loop é atingido.
5. Desative o statement breakpoint (desmarque na Breakpoints View) e pressione F8.

**Pergunta:** Qual a diferença entre um statement breakpoint e um breakpoint de linha?

---

## Exercício 7: Inspeção de tabela interna

1. Defina um breakpoint na linha `ENDDO.` (final do loop).
2. Execute com **F9**.
3. Quando pausar, vá para a **ABAP Internal Table (Debugger)** view.
4. Expanda `repayment_plan` e observe as linhas já adicionadas.
5. Use **F8** (Resume) algumas vezes e veja a tabela crescer.
6. Na Internal Table view, clique com botão direito → **Change Value...** para editar uma linha existente.

---

## Perguntas de Reflexão

1. Por que não é possível definir breakpoints em linhas de declaração (`DATA`, `TYPES`, `CONSTANTS`)?
2. Em que situação você usaria **Run to Line (Shift+F8)** em vez de definir um breakpoint manualmente?
3. Qual o risco de usar **Jump to Line (Shift+F12)**? Dê um exemplo concreto de quando isso causaria confusão.
4. Como o ABAP Debugger se compara ao debugger do Visual Studio que você já conhece? Quais semelhanças e diferenças você notou?
