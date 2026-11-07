import SwiftUI

// tarefas e um @State. O append muda o array, o SwiftUI redesenha a lista.
struct ListaTarefasTexto: View {
    @State private var tarefas = ["Estudar SwiftUI", "Fazer exercícios", "Ler livro"]
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
                ForEach(tarefas, id: \.self) { tarefa in
                    HStack {
                        Image(systemName: "circle")
                            .foregroundStyle(.blue)
                        Text(tarefa)
                    }
                }
            }
            .listStyle(.plain)
        }
    }

    private func adicionarTarefa() {
        let texto = novaTarefa.trimmingCharacters(in: .whitespaces)
        guard !texto.isEmpty else { return }
        tarefas.append(texto)
        novaTarefa = ""
    }
}

#Preview {
    ListaTarefasTexto()
}
