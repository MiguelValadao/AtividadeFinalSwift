import SwiftUI

// Complete a aba do pedido. O enunciado esta em "00 - Capitulo 8".
struct PedidoCantinaView: View {
    let lanches: [Lanche]
    @Binding var pedido: String
    @State private var mostrarSheet = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text(pedido.isEmpty ? "Nenhum pedido" : pedido)
                    .multilineTextAlignment(.center)
                    .padding()

                Button("Novo pedido") {
                    mostrarSheet = true
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Pedido")
            .sheet(isPresented: $mostrarSheet) {
                PedidoSheetView(lanches: lanches, pedido: $pedido)
            }
        }
    }
}

#Preview {
    PedidoCantinaView(
        lanches: [Lanche(nome: "Pão de queijo", preco: 8.00)],
        pedido: .constant("")
    )
}
