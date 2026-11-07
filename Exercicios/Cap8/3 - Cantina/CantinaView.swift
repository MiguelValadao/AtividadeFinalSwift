import SwiftUI

// Complete as duas abas. O enunciado esta em "00 - Capitulo 8".
struct CantinaView: View {
    @State private var pedido = ""

    private let lanches = [
        Lanche(nome: "Pão de queijo", preco: 8.00),
        Lanche(nome: "Coxinha", preco: 7.50),
        Lanche(nome: "Bolo de cenoura", preco: 6.00),
        Lanche(nome: "Suco de laranja", preco: 5.00),
        Lanche(nome: "Sanduíche natural", preco: 9.00)
    ]

    var body: some View {
        TabView {
            CardapioCantinaView(lanches: lanches)
                .tabItem {
                    Label("Cardápio", systemImage: "fork.knife")
                }

            PedidoCantinaView(lanches: lanches, pedido: $pedido)
                .tabItem {
                    Label("Pedido", systemImage: "bag")
                }
        }
    }
}

#Preview {
    CantinaView()
}
