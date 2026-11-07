import SwiftUI

// Complete o guia. O enunciado esta em "00 - Capitulo 8".
struct GuiaEscolaView: View {
    private let locais = [
        LocalEscola(nome: "Biblioteca", horario: "8h às 18h", piso: "1º andar"),
        LocalEscola(nome: "Laboratório de Ciências", horario: "7h às 17h", piso: "2º andar"),
        LocalEscola(nome: "Quadra", horario: "7h às 19h", piso: "Térreo"),
        LocalEscola(nome: "Cantina", horario: "10h às 14h", piso: "Térreo"),
        LocalEscola(nome: "Secretaria", horario: "8h às 17h", piso: "1º andar")
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(locais) { local in
                    NavigationLink {
                        LocalDetalheView(local: local)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(local.nome)
                            Text(local.horario)
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Guia")
        }
    }
}

#Preview {
    GuiaEscolaView()
}
