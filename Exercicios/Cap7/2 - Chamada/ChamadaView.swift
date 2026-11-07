import SwiftUI

// Chamada. O enunciado esta em "00 - Capitulo 7".
struct ChamadaView: View {
    @State private var alunos: [AlunoChamada] = [
        AlunoChamada(nome: "Ana", presente: true),
        AlunoChamada(nome: "Bruno", presente: false),
        AlunoChamada(nome: "Caio", presente: true),
        AlunoChamada(nome: "Duda", presente: false),
        AlunoChamada(nome: "Eva", presente: true)
    ]
    @State private var novoNome = ""
    @State private var filtro = "Todos"

    private var visiveis: [AlunoChamada] {
        if filtro == "Presentes" {
            return alunos.filter(\.presente)
        } else if filtro == "Ausentes" {
            return alunos.filter { !$0.presente }
        } else {
            return alunos
        }
    }

    private var presentes: Int {
        alunos.filter(\.presente).count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Picker("Filtro", selection: $filtro) {
                    Text("Todos").tag("Todos")
                    Text("Presentes").tag("Presentes")
                    Text("Ausentes").tag("Ausentes")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                HStack {
                    TextField("Novo aluno", text: $novoNome)

                    Button {
                        adicionarAluno()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .disabled(novoNome.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(.horizontal)

                List {
                    ForEach(visiveis) { aluno in
                        Button {
                            alternarPresenca(id: aluno.id)
                        } label: {
                            HStack {
                                Text(aluno.nome)

                                Spacer()

                                Image(systemName: aluno.presente
                                      ? "checkmark.circle.fill"
                                      : "circle")
                                    .foregroundStyle(aluno.presente ? .green : .secondary)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                    .onDelete { indices in
                        let ids = indices.map { visiveis[$0].id }
                        alunos.removeAll { ids.contains($0.id) }
                    }
                }

                Text("\(presentes) de \(alunos.count) presentes")
                    .font(.headline)
                    .padding(.bottom)
            }
            .navigationTitle("Chamada")
        }
    }

    private func adicionarAluno() {
        let nome = novoNome.trimmingCharacters(in: .whitespaces)
        guard !nome.isEmpty else { return }

        alunos.append(AlunoChamada(nome: nome, presente: false))
        novoNome = ""
    }

    private func alternarPresenca(id: UUID) {
        if let indice = alunos.firstIndex(where: { $0.id == id }) {
            alunos[indice].presente.toggle()
        }
    }
}

#Preview {
    ChamadaView()
}
