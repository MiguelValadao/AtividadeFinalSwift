# Capítulo 7 — O que fazer

**Desenvolvimento iOS · 3º ano**

São três exercícios sobre listas. Faça o seu primeiro, nos arquivos da pasta do exercício. A resolução pronta está em `Resolucoes`, na pasta do projeto, fora do app.

A linha do `ForEach` é uma cópia. Para mudar ou apagar um item de verdade, ache ele pelo `id` na lista original.

Em cada exercício, a parte **Componentes** diz o que usar. Para tirar os espaços das pontas de um texto, use `trimmingCharacters(in: .whitespaces)`.

---

## 1. Coleção de filmes

Pasta: `1 - Colecao de filmes`

Exemplo de layout da lista. O **+** e o filtro ficam na barra de cima.

![Coleção de filmes: lista e formulário de novo filme](layouts/cap7-filmes.jpg)

A sheet de filtros abre pelo botão da esquerda.

![Coleção de filmes: sheet de filtros](layouts/cap7-filmes-filtros.jpg)

### O filme

Uma struct com:

- um `id` único
- título
- ano
- gênero
- nota de 1 a 5
- se já foi assistido ou não

A struct precisa funcionar dentro de uma `List`. Crie pelo menos cinco filmes de exemplo.

O gênero é um texto: `"Ação"`, `"Comédia"`, `"Drama"`, `"Animação"` ou `"Documentário"`. A cor de cada um sai de uma função com `if`.

**Componentes**

- `struct Filme: Identifiable`. O `id` é `UUID()`. O gênero é `String`.
- `func corDoGenero(_ nome: String) -> Color`. Um `if` para cada nome, devolvendo uma `Color`. Se não achar, devolva `.gray`.

### A lista

Mostre, em cada linha, o título, o ano, o gênero e as estrelas da nota. Dê um título de navegação para a tela.

- um toque marca ou desmarca “assistido”
- um botão na linha apaga o filme
- arrastar a linha também apaga

**Componentes**

- `@State` da lista de filmes, mais um Bool da sheet nova, um Bool da sheet de filtros, e um `@State` de texto para cada filtro. Situação começa em `"Todos"`, gênero em `"Todos"` e ordem em `"Título"`.
- `NavigationStack` e `List`.
- `Section` **Resumo** e `Section` **Filmes**.
- `ForEach` dos filmes visíveis, não do array inteiro.
- A linha pode ser uma view `FilmeCell`: título, ano, gênero na cor de `corDoGenero`, e as estrelas.
- As estrelas são um `ForEach(1...5, id: \.self)` de `Image(systemName:)`. Estrela pintada até a nota, estrela vazia depois.
- Um `Button` na linha alterna assistido. Outro `Button` apaga. Os dois chamam funções que procuram o `id`.
- `.onDelete` também apaga pelo `id` do filme visível naquela linha. Guarde os ids antes de remover, porque a lista encolhe no meio do laço.
- `firstIndex(where: { $0.id == filme.id })` acha o filme de verdade para marcar assistido.
- `removeAll { $0.id == filme.id }` apaga.
- `.navigationTitle("Filmes")`.
- `toolbar` com dois `Button`: o da esquerda usa `Image(systemName: "line.3.horizontal.decrease.circle")` e abre os filtros. O da direita usa `Image(systemName: "plus")` e abre o filme novo.
- Duas `.sheet(isPresented:)`.

### Incluir

Um botão **+** na barra abre uma sheet.

O formulário tem título, ano, gênero e nota. O gênero sai de um `Picker` com os cinco nomes escritos na mão. A nota pode ser um stepper de 1 a 5.

**Salvar** fica desabilitado se o título, sem espaços nas pontas, estiver vazio, ou se o ano for futuro.

**Componentes da sheet `NovoFilmeView`**

- Ela recebe o ano limite e uma closure `aoSalvar: (Filme) -> Void`. Quem acrescenta o filme na lista é a tela de baixo.

- `@State` do título, do ano em texto, do gênero e da nota.
- `NavigationStack` com título **Novo filme**.
- `Form` com `TextField` do título, `TextField` do ano (`.keyboardType(.numberPad)`), `Picker` do gênero e `Stepper` de 1 a 5.
- O `Picker` do gênero tem uma linha para cada nome: `Text("Drama").tag("Drama")`, e o mesmo para os outros quatro. O gênero escolhido é um `String`.
- `toolbar`: **Cancelar** em `.cancellationAction` e **Salvar** em `.confirmationAction`.
- `.disabled` no **Salvar** se o título, sem espaços, estiver vazio, se o ano não for número, ou se o ano for menor que 1900 ou maior que o ano atual.
- No **Salvar**, chame a closure com um `Filme` novo e depois `dismiss()`.

### Filtros e ordem

Um botão na barra abre os filtros:

- todos, só assistidos ou só não assistidos
- gênero, com uma opção “todos”
- nota mínima
- ordem por título, por ano ou por nota

Se a lista estiver filtrada, apagar pelo índice da tela remove o filme errado. Apague pelo `id` na lista original.

**Componentes da sheet `FiltrosFilmeView`**

- Quatro `@Binding`: situação, gênero, nota mínima e ordem. Os três primeiros textos começam em `"Todos"`, `"Todos"` e a ordem em `"Título"`. `"Todos"` significa que aquele filtro não corta a lista.
- `@Environment(\.dismiss)`.
- `NavigationStack` com título **Filtros** e um `Button("Fechar")` que chama `dismiss()`.
- `Form` com três `Picker` e um `Stepper` de 1 a 5, no texto `Nota mínima: \(notaMinima)`.
- Cada `Picker` escreve as opções na mão, com `Text("Drama").tag("Drama")` e as outras do mesmo jeito.
- A lista visível é um `filter`. Se a ordem for `"Ano"`, ordene pelo ano. Se for `"Avaliação"`, pela nota. No resto, pelo título.

### Resumo

No topo da lista:

- total de filmes
- quantos foram assistidos
- a porcentagem
- a média das notas
- quantos filmes existem em cada gênero

A média usa `reduce`. A contagem de cada gênero usa `filter`.

**Componentes**

- Assistidos: `filmes.filter(\.assistido).count`.
- Porcentagem: se a lista estiver vazia, mostre 0. Senão, `assistidos * 100 / filmes.count`.
- Média: `reduce` soma as notas, e você divide pelo total. Lista vazia devolve 0.
- Cada gênero é um `Text` com `filter`. Por exemplo: `filmes.filter { $0.genero == "Ação" }.count`. A cor vem de `corDoGenero("Ação")`. Repita para os outros quatro nomes.

---

## 2. Chamada

Pasta: `2 - Chamada`

Exemplo de layout.

![Chamada](layouts/cap7-chamada.jpg)

Uma lista de alunos. Cada um tem nome e se está presente.

- toque na linha alterna presente e ausente
- um campo adiciona aluno. Nome vazio, ou só com espaços, não entra
- arrastar apaga

Três filtros: todos, presentes e ausentes.

Com um filtro ligado, o índice que o arraste entrega é o da lista da tela, não o da lista original. Apague pelo `id`.

Embaixo, o tempo todo, o texto “X de Y presentes”.

**Componentes**

- `struct AlunoChamada: Identifiable`, com `id`, nome e presente.
- `@State` da lista, do nome novo e do filtro. O filtro é um texto e começa em `"Todos"`.
- `Picker` com três linhas: `Text("Todos").tag("Todos")`, e o mesmo para Presentes e Ausentes. Depois, `.pickerStyle(.segmented)`.
- `TextField("Novo aluno", text:)` e um `Button` com `Image(systemName: "plus")`. O botão só dá `append` se o nome, sem espaços, não estiver vazio. O aluno novo começa ausente. Depois, limpe o campo.
- Uma lista calculada, `visiveis`. Se o filtro for `"Presentes"`, use `filter` de quem está presente. Se for `"Ausentes"`, o contrário. `"Todos"` devolve a lista inteira.
- `ForEach(visiveis)`. A linha é um `Button`. O toque acha o `id` com `firstIndex(where:)` e inverte `presente`.
- Um `Image(systemName:)` mostra `checkmark.circle.fill` se estiver presente e `circle` se estiver ausente.
- `.onDelete` lê o `id` em `visiveis` e usa `removeAll`.
- O texto de baixo conta presentes na lista inteira, não só na lista filtrada: “3 de 5 presentes”.
- `.navigationTitle("Chamada")`.

---

## 3. Ranking

Pasta: `3 - Ranking`

Exemplo de layout. Com o toggle ligado, some quem tem menos de 50. A frase e o total continuam com a turma inteira.

![Ranking](layouts/cap7-ranking.jpg)

Uma lista de jogadores. Cada um tem nome e pontos.

- um botão **+10** soma naquele jogador. Ache pelo `id` antes de somar
- um toggle “Só quem passou de 50” esconde o resto, com `filter`

Em cima da lista, usando a lista inteira, não só quem está aparecendo:

- a soma de todos os pontos, com `reduce`
- os nomes numa frase só, montada com `map`

**Componentes**

- `struct JogadorRanking: Identifiable`, com nome e pontos.
- `@State` da lista e do Bool do toggle.
- `visiveis`: se o toggle estiver ligado, `filter` de quem tem mais de 50. Senão, a lista inteira.
- `reduce` soma os pontos da lista inteira.
- `map` tira só os nomes, e `joined(separator: ", ")` junta numa frase. O texto fica “Turma: Ana, Bruno, Caio, Duda”.
- `Toggle("Só quem passou de 50", isOn:)`.
- `ForEach(visiveis)` com o nome, os pontos e `Button("+10")`.
- O botão usa `firstIndex(where:)` na lista original e soma 10. Somar na cópia do `ForEach` não muda a tela.
- `.navigationTitle("Ranking")`.
