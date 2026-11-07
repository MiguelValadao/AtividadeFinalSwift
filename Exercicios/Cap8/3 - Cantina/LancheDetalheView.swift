import SwiftUI

// Complete o detalhe do lanche. O enunciado esta em "00 - Capitulo 8".
struct LancheDetalheView: View {
    let lanche: Lanche

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(lanche.preco, format: .currency(code: "BRL"))
            Spacer()
        }
        .padding()
        .navigationTitle(lanche.nome)
    }
}

#Preview {
    NavigationStack {
        LancheDetalheView(
            lanche: Lanche(nome: "Pão de queijo", preco: 8.00)
        )
    }
}
