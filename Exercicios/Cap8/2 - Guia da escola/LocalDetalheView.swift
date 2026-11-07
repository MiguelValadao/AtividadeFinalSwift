import SwiftUI

// Complete o detalhe do lugar. O enunciado esta em "00 - Capitulo 8".
struct LocalDetalheView: View {
    let local: LocalEscola

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Horário: \(local.horario)")
            Text("Piso: \(local.piso)")
            Spacer()
        }
        .padding()
        .navigationTitle(local.nome)
    }
}

#Preview {
    NavigationStack {
        LocalDetalheView(
            local: LocalEscola(
                nome: "Biblioteca",
                horario: "8h às 18h",
                piso: "1º andar"
            )
        )
    }
}
