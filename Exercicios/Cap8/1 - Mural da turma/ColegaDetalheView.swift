import SwiftUI

// Complete o detalhe do colega. O enunciado esta em "00 - Capitulo 8".
struct ColegaDetalheView: View {
    let colega: Colega

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Interesse: \(colega.interesse)")
            Spacer()
        }
        .padding()
        .navigationTitle(colega.nome)
    }
}

#Preview {
    NavigationStack {
        ColegaDetalheView(
            colega: Colega(nome: "Ana", interesse: "basquete")
        )
    }
}
