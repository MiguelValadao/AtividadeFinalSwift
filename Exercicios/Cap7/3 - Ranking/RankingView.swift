import SwiftUI

// Ranking. O enunciado esta em "00 - Capitulo 7".
struct RankingView: View {
    @State private var jogadores: [JogadorRanking] = [
        JogadorRanking(nome: "Ana", pontos: 40),
        JogadorRanking(nome: "Bruno", pontos: 60),
        JogadorRanking(nome: "Caio", pontos: 80),
        JogadorRanking(nome: "Duda", pontos: 30)
    ]
    @State private var soAprovados = false

    private var visiveis: [JogadorRanking] {
        if soAprovados {
            return jogadores.filter { $0.pontos > 50 }
        } else {
            return jogadores
        }
    }

    private var totalPontos: Int {
        jogadores.reduce(0) { $0 + $1.pontos }
    }

    private var nomes: String {
        "Turma: " + jogadores.map(\.nome).joined(separator: ", ")
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Resumo") {
                    Text("Total de pontos: \(totalPontos)")
                    Text(nomes)

                    Toggle("Só quem passou de 50", isOn: $soAprovados)
                }

                Section("Jogadores") {
                    ForEach(visiveis) { jogador in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(jogador.nome)
                                Text("\(jogador.pontos) pontos")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            Button("+10") {
                                somarDez(id: jogador.id)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
            }
            .navigationTitle("Ranking")
        }
    }

    private func somarDez(id: UUID) {
        if let indice = jogadores.firstIndex(where: { $0.id == id }) {
            jogadores[indice].pontos += 10
        }
    }
}

#Preview {
    RankingView()
}
