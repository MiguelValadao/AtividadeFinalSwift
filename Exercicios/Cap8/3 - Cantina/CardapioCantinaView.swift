import SwiftUI

// Complete o cardapio. O enunciado esta em "00 - Capitulo 8".
struct CardapioCantinaView: View {
    let lanches: [Lanche]

    var body: some View {
        NavigationStack {
            List {
                ForEach(lanches) { lanche in
                    NavigationLink {
                        LancheDetalheView(lanche: lanche)
                    } label: {
                        HStack {
                            Text(lanche.nome)
                            Spacer()
                            Text(lanche.preco, format: .currency(code: "BRL"))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Cardápio")
        }
    }
}

#Preview {
    CardapioCantinaView(lanches: [
        Lanche(nome: "Pão de queijo", preco: 8.00),
        Lanche(nome: "Coxinha", preco: 7.50)
    ])
}
