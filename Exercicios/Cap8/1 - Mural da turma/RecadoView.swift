import SwiftUI

// Complete a aba Recado. O enunciado esta em "00 - Capitulo 8".
struct RecadoView: View {
    @State private var recadoPublicado = ""
    @State private var mostrarForm = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text(recadoPublicado.isEmpty ? "Nenhum recado" : recadoPublicado)
                    .multilineTextAlignment(.center)
                    .padding()

                Button("Novo recado") {
                    mostrarForm = true
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Recado")
            .sheet(isPresented: $mostrarForm) {
                RecadoFormView(recadoPublicado: $recadoPublicado)
            }
        }
    }
}

#Preview {
    RecadoView()
}
