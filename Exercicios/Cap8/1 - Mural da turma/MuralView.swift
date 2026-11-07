import SwiftUI

// Complete as tres abas. O enunciado esta em "00 - Capitulo 8".
struct MuralView: View {
    @State private var nomeUsuario = "Aluno"
    @State private var modoEscuro = false

    var body: some View {
        TabView {
            TurmaView(nomeUsuario: nomeUsuario)
                .tabItem {
                    Label("Turma", systemImage: "person.2")
                }

            RecadoView()
                .tabItem {
                    Label("Recado", systemImage: "text.bubble")
                }

            AjustesView(
                nomeUsuario: $nomeUsuario,
                modoEscuro: $modoEscuro
            )
            .tabItem {
                Label("Ajustes", systemImage: "gearshape")
            }
        }
        .preferredColorScheme(modoEscuro ? .dark : .light)
    }
}

#Preview {
    MuralView()
}
