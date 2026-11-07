import SwiftUI

// Os tres modos possiveis. Enum evita string solta tipo "todas" escrita errada.
enum FiltroTarefa {
    case todas
    case concluidas
    case pendentes
}

struct BotaoFiltro: View {
    let titulo: String
    @Binding var filtroSelecionado: FiltroTarefa
    let filtro: FiltroTarefa

    var body: some View {
        Button {
            filtroSelecionado = filtro
        } label: {
            Text(titulo)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(filtroSelecionado == filtro ? Color.blue : Color.gray.opacity(0.2))
                .foregroundStyle(filtroSelecionado == filtro ? .white : .primary)
                .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}

// Versao seguinte da lista de tarefas.
// O ForEach volta a andar na tarefa, nao no indice.
// firstIndex acha a posicao real pra poder alterar concluida.
struct ListaTarefasFiltro: View {
    @State private var tarefas = [
        Tarefa(titulo: "Estudar SwiftUI", data: Date()),
        Tarefa(titulo: "Fazer exercícios", data: Date()),
        Tarefa(titulo: "Ler livro", data: Date())
    ]
    @State private var novaTarefa = ""
    @State private var filtroSelecionado: FiltroTarefa = .todas

    // nao e outro array guardado. e a lista original, peneirada, lida de novo quando o filtro muda
    var tarefasFiltradas: [Tarefa] {
        switch filtroSelecionado {
        case .todas:
            return tarefas
        case .concluidas:
            return tarefas.filter { $0.concluida }
        case .pendentes:
            return tarefas.filter { !$0.concluida }
        }
    }

    var body: some View {
        VStack {
            HStack {
                BotaoFiltro(titulo: "Todos", filtroSelecionado: $filtroSelecionado, filtro: .todas)
                BotaoFiltro(titulo: "Concluído", filtroSelecionado: $filtroSelecionado, filtro: .concluidas)
                BotaoFiltro(titulo: "Pendente", filtroSelecionado: $filtroSelecionado, filtro: .pendentes)
            }
            .padding(.vertical)

            HStack {
                TextField("Adicionar nova tarefa...", text: $novaTarefa)
                Button(action: adicionarTarefa) {
                    Image(systemName: novaTarefa.isEmpty ? "circle" : "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.blue)
                }
                .disabled(novaTarefa.trimmingCharacters(in: .whitespaces).isEmpty)
            }

            List {
                ForEach(tarefasFiltradas) { tarefa in
                    HStack {
                        Button {
                            // firstIndex devolve Optional. pode ser que nao ache.
                            // o if let abre e, dentro daqui, index e um Int comum
                            if let index = tarefas.firstIndex(where: { $0.id == tarefa.id }) {
                                tarefas[index].concluida.toggle()
                            }
                        } label: {
                            Image(systemName: tarefa.concluida ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(tarefa.concluida ? .green : .blue)
                        }
                        .buttonStyle(.plain)

                        Text(tarefa.titulo)
                        Spacer()
                        Text(tarefa.data.formatted(date: .numeric, time: .shortened))
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                .onDelete { indexSet in
                    // o indice que chega e da lista filtrada, nao do array original.
                    // se apagar direto, sai a tarefa errada. o id acha a posicao certa
                    for index in indexSet {
                        let tarefaDeletada = tarefasFiltradas[index]
                        if let indiceOriginal = tarefas.firstIndex(where: { $0.id == tarefaDeletada.id }) {
                            tarefas.remove(at: indiceOriginal)
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding(.horizontal)
    }

    private func adicionarTarefa() {
        let texto = novaTarefa.trimmingCharacters(in: .whitespaces)
        guard !texto.isEmpty else { return }
        tarefas.append(Tarefa(titulo: texto, data: Date()))
        novaTarefa = ""
    }
}

#Preview {
    ListaTarefasFiltro()
}
