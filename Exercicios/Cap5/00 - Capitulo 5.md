# Capítulo 5 — O que fazer

**Desenvolvimento iOS · 3º ano**

São três exercícios sobre estado e controles. Faça o seu primeiro, nos arquivos da pasta do exercício. A resolução pronta está em `Resolucoes`, na pasta do projeto, fora do app.

Em cada exercício, a parte **Componentes** diz o que usar em cada tela. Para tirar os espaços das pontas de um texto, use `trimmingCharacters(in: .whitespaces)`.

---

## 1. Ficha de foco

Pasta: `1 - Ficha de foco`

Exemplo de layout. A ordem pode mudar um pouco, desde que tudo o que o exercício pede apareça.

![Ficha de foco: tela principal e ajustes](layouts/cap5-ficha.jpg)

No começo a matéria está vazia: o slider fica desabilitado, **Reiniciar** fica cinza e **Salvar** também. A foto mostra onde cada controle fica.

Ao salvar, a sheet fecha e o alerta aparece na tela de baixo.

![Ficha de foco: alerta depois de salvar](layouts/cap5-ficha-alerta.jpg)

Monte a ficha de uma sessão de estudo. Não use `Timer`. Quem muda os valores é a pessoa, pelos controles da tela.

### A classe `FocoViewModel`

Ela guarda os dados e avisa a tela quando algo muda.

- matéria, começando vazia
- minutos, começando em 25
- nível de foco, começando em 0,5
- som, começando desligado
- data da prova, começando em hoje

`formularioValido` só é verdadeiro quando a matéria, sem espaços nas pontas, não está vazia e o nível é maior que 0.

`reiniciar()` volta matéria para vazio, minutos para 25, nível para 0,5, som para desligado e a data para hoje.

Use classe, não struct. As telas precisam olhar para o mesmo objeto.

**Componentes**

- `class FocoViewModel: ObservableObject`.
- Cada dado é `@Published`. Quando muda, a tela redesenha.
- `formularioValido` é uma variável calculada. Não guarde isso em outro `@Published`.
- `reiniciar()` apenas devolve os cinco valores ao começo.

### A tela principal `FocoView`

Ela cria a classe.

- mostra a matéria, ou o texto “Sem matéria” quando o campo está vazio
- mostra os minutos
- mostra o nível em porcentagem: `Int(nivelFoco * 100)`
- botão **Reiniciar**, que chama `reiniciar()`. Fica desabilitado se a ficha já está no começo: matéria vazia, 25 minutos, nível 0,5 e som desligado
- botão **Ajustes**, que abre uma sheet. O Bool da sheet fica só nesta tela, porque só ela precisa saber se o painel está aberto

O slider do nível não fica aqui. Ele fica na view filha.

O alerta também fica nesta tela, não dentro da sheet. A sheet só liga o Bool do alerta e fecha. Se o alerta morar na sheet, ele some junto com ela.

**Componentes**

- `@StateObject` cria a classe uma vez.
- Dois `@State` Bool: um da sheet, outro do alerta.
- `VStack` com `Text` da matéria, dos minutos e da porcentagem.
- `PainelFocoView(foco: foco)`. Passe o objeto. Não crie outra classe aqui dentro.
- `Button("Reiniciar")` com `.disabled` quando a ficha já está no começo.
- `Button("Ajustes")` liga o Bool da sheet.
- `.sheet(isPresented:)` abre `AjustesFocoView`. Entregue a classe e o `Binding` do alerta, com `$`.
- `.alert("Pronto", isPresented:)` com a mensagem “Sessão de (matéria) pronta: (minutos) min.” e um `Button("OK")`.
- `.navigationTitle("Foco")`.

### A view filha `PainelFocoView`

Recebe a classe que a tela principal já criou. Não cria outra.

- um slider de 0 a 1, ligado ao nível de foco
- o slider fica desabilitado enquanto a matéria, sem espaços nas pontas, estiver vazia
- um texto com a porcentagem

**Componentes**

- `@ObservedObject var foco: FocoViewModel`.
- `Slider(value: $foco.nivelFoco, in: 0...1)`.
- `.disabled` no slider enquanto a matéria, sem espaços, estiver vazia.
- `Text` com `Int(foco.nivelFoco * 100)`.

### A sheet `AjustesFocoView`

Um `Form` com:

- campo da matéria, com autocapitalização de palavras
- stepper dos minutos, entre 5 e 60
- toggle “Som ao terminar”
- seletor “Prova”, só a data

Botão **Salvar**:

- desabilitado quando `formularioValido` for falso
- ao tocar, fecha a sheet e mostra um alerta: “Sessão de (matéria) pronta: (minutos) min.”

**Componentes**

- `@ObservedObject` da mesma classe.
- `@Binding var mostrarAlerta: Bool`, para a tela de baixo abrir o alerta.
- `Form`.
- `TextField("Matéria", text: $foco.materia)` com `.textInputAutocapitalization(.words)`.
- `Stepper` de 5 a 60, ligado em `$foco.minutosAlvo`.
- `Toggle("Som ao terminar", isOn: $foco.somLigado)`.
- `DatePicker("Prova", selection: $foco.dataProva, displayedComponents: .date)`.
- `Button("Salvar")` com `.disabled(!foco.formularioValido)`.
- No toque: ligue `mostrarAlerta` e chame `dismiss()`.

---

## 2. Mixer de cor

Pasta: `2 - Mixer de cor`

Exemplo de layout. Os sliders vão de 0 a 1. A foto mostra a ordem dos controles.

![Mixer de cor](layouts/cap5-mixer.jpg)

Uma tela com um retângulo colorido e três sliders: vermelho, verde e azul. Cada um vai de 0 a 1.

Os três números ficam na tela principal, com `@State`. Os sliders ficam numa view filha. A filha recebe `@Binding`. Na chamada, use `$`. Sem o `$`, a filha ganha uma cópia e o retângulo não muda.

- um toggle “Travar sliders” desliga os três de uma vez
- um botão **Zerar** coloca as três cores em 0
- com os sliders travados, **Zerar** também fica desabilitado

Não precisa de view model. São só três números desta tela.

**Componentes da tela `MixerCorView`**

- Quatro `@State`: `vermelho`, `verde`, `azul` (números de 0 a 1) e `travado` (Bool, começa falso).
- `RoundedRectangle` preenchido com `Color(red: verde: blue:)`, usando os três números.
- A filha é chamada assim: `ControleCorView(vermelho: $vermelho, verde: $verde, azul: $azul, travado: travado)`. O `$` é o que liga o slider ao número daqui.
- `Toggle("Travar sliders", isOn: $travado)`.
- `Button("Zerar")` coloca os três números em 0 e tem `.disabled(travado)`.
- `.navigationTitle("Mixer")`.

**Componentes da filha `ControleCorView`**

- Três `@Binding var` para as cores. Um `let travado: Bool` chega só para ler.
- Três `Slider(value:in:)`, de 0 a 1. No `Slider`, o `value` já é o `Binding`. Não coloque outro `$` na frente.
- `.disabled(travado)` em cada slider.
- Um `Text` ao lado de cada um, com o nome da cor.

---

## 3. Reserva da sala

Pasta: `3 - Reserva da sala`

Exemplo de layout.

![Reserva da sala](layouts/cap5-reserva.jpg)

O alerta abre por cima dessa tela.

![Reserva da sala: alerta](layouts/cap5-reserva-alerta.jpg)

Um formulário de reserva. Tudo com `@State` nesta tela. Nenhuma outra view usa esses dados, então não crie classe.

Campos:

- nome
- sala, num `Picker`: Laboratório, Biblioteca e Auditório
- data, só o dia
- pessoas, num stepper de 1 a 40
- projetor, num toggle

O botão **Reservar** fica desabilitado se o nome, sem espaços nas pontas, estiver vazio.

Quando a reserva acontece, abre um alerta dizendo qual sala foi reservada, para quem, e quantas pessoas.

**Componentes**

- `Picker("Sala", selection: $sala)` com três linhas escritas na mão: `Text("Laboratório").tag("Laboratório")`, e o mesmo para Biblioteca e Auditório. A sala é um `String`. Começa em `"Laboratório"`.
- `Form` com duas `Section`: **Quem reserva** e **Quando**.
- `TextField("Nome", text:)` com `.textInputAutocapitalization(.words)`.
- Seis `@State` nesta view: nome, sala, data, pessoas, projetor e o Bool do alerta. Pessoas começa em 10. A sala é o texto `"Laboratório"`.
- `DatePicker("Data", selection:, displayedComponents: .date)`.
- `Stepper` de 1 a 40. O texto mostra o número.
- `Toggle("Projetor", isOn:)`.
- `Button("Reservar")` com `.disabled` enquanto o nome, sem espaços, estiver vazio. O toque só liga o Bool do alerta.
- `.alert("Reserva feita", isPresented:)` com `Button("OK")`. A mensagem monta a sala, o nome e a quantidade: “Biblioteca reservada para Ana, 10 pessoas.”
- `.navigationTitle("Reserva")`.
