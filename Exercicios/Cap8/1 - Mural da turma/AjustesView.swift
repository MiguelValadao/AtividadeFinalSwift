import SwiftUI

// Complete os ajustes. O enunciado esta em "00 - Capitulo 8".
struct AjustesView: View {
    @Binding var nomeUsuario: String
    @Binding var modoEscuro: Bool
    @State private var mostrarSaida = false
    @State private var status = ""

    var body: some View {
        NavigationStack {
            Form {
                Toggle("Modo escuro", isOn: $modoEscuro)

                TextField("Nome", text: $nomeUsuario)

                Button("Sair") {
                    mostrarSaida = true
                }

                if !status.isEmpty {
                    Text(status)
                }
            }
            .navigationTitle("Ajustes")
            .alert("Deseja sair do mural?", isPresented: $mostrarSaida) {
                Button("Sair", role: .destructive) {
                    status = "Sessão encerrada"
                }

                Button("Cancelar", role: .cancel) { }
            }
        }
    }
}

#Preview {
    AjustesView(
        nomeUsuario: .constant("Aluno"),
        modoEscuro: .constant(false)
    )
}
