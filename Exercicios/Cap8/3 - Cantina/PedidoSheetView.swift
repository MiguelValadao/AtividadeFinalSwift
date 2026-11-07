import SwiftUI

// Complete a sheet do pedido. O enunciado esta em "00 - Capitulo 8".
struct PedidoSheetView: View {
    let lanches: [Lanche]
    @Binding var pedido: String

    @Environment(\.dismiss) private var dismiss
    @State private var lancheEscolhido: UUID? = nil
    @State private var observacao = ""

    var body: some View {
        NavigationStack {
            Form {
                Picker("Lanche", selection: $lancheEscolhido) {
                    Text("Escolha").tag(UUID?.none)

                    ForEach(lanches) { lanche in
                        Text(lanche.nome)
                            .tag(Optional(lanche.id))
                    }
                }

                TextField("Observação", text: $observacao)

                Button("Confirmar") {
                    confirmar()
                }
                .disabled(lancheEscolhido == nil)
            }
            .navigationTitle("Novo pedido")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func confirmar() {
        guard let id = lancheEscolhido,
              let lanche = lanches.first(where: { $0.id == id }) else {
            return
        }

        let texto = observacao.trimmingCharacters(in: .whitespaces)

        if texto.isEmpty {
            pedido = lanche.nome
        } else {
            pedido = "\(lanche.nome) — \(texto)"
        }

        dismiss()
    }
}

#Preview {
    PedidoSheetView(
        lanches: [Lanche(nome: "Pão de queijo", preco: 8.00)],
        pedido: .constant("")
    )
}
