import SwiftUI

// Agora a linha tem titulo, data e um botao de concluir.
// O item que o ForEach entrega e uma copia. toggle nessa copia nao mexe na lista.
// Por isso o laco vai nos indices: tarefas[index] e o item de verdade.
struct ListaTarefasStruct: View {
    @State private var tarefas = [
        Tarefa(titulo: "Estudar SwiftUI", data: Date()),
        Tarefa(titulo: "Fazer exercícios", data: Date()),
        Tarefa(titulo: "Ler livro", data: Date())
    ]
    @State private var novaTarefa = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Adicionar nova tarefa...", text: $novaTarefa)
                Button(action: adicionarTarefa) {
                    Image(systemName: novaTarefa.isEmpty ? "circle" : "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.blue)
                }
                .disabled(novaTarefa.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding(.horizontal)

            List {
                ForEach(tarefas.indices, id: \.self) { index in
                    HStack {
                        Button {
                            tarefas[index].concluida.toggle()
                        } label: {
                            Image(systemName: tarefas[index].concluida ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(tarefas[index].concluida ? .green : .blue)
                        }
                        .buttonStyle(.plain)

                        Text(tarefas[index].titulo)
                        Spacer()
                        Text(tarefas[index].data.formatted(date: .numeric, time: .shortened))
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                // arrastar a linha pra esquerda. indexSet sao as posicoes que saem
                .onDelete { indexSet in
                    tarefas.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
        }
    }

    private func adicionarTarefa() {
        let texto = novaTarefa.trimmingCharacters(in: .whitespaces)
        guard !texto.isEmpty else { return }
        tarefas.append(Tarefa(titulo: texto, data: Date()))
        novaTarefa = ""
    }
}

#Preview {
    ListaTarefasStruct()
}
