import SwiftUI

// Complete a aba Turma. O enunciado esta em "00 - Capitulo 8".
struct TurmaView: View {
    let nomeUsuario: String

    private let colegas = [
        Colega(nome: "Ana", interesse: "basquete"),
        Colega(nome: "Bruno", interesse: "robótica"),
        Colega(nome: "Caio", interesse: "música"),
        Colega(nome: "Duda", interesse: "fotografia")
    ]

    var body: some View {
        NavigationStack {
            List {
                Text("Olá, \(nomeUsuario)")

                Section("Colegas") {
                    ForEach(colegas) { colega in
                        NavigationLink {
                            ColegaDetalheView(colega: colega)
                        } label: {
                            HStack {
                                Text(colega.nome)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Turma")
        }
    }
}

#Preview {
    TurmaView(nomeUsuario: "Aluno")
}
