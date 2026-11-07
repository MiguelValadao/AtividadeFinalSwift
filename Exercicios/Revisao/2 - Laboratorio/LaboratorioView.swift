import SwiftUI

// Complete as duas abas. O enunciado esta em "00 - Revisao".
struct LaboratorioView: View {
    @StateObject private var laboratorio = LaboratorioViewModel()

    var body: some View {
        TabView {
            EquipesLabView(laboratorio: laboratorio)
                .tabItem {
                    Label("Equipes", systemImage: "person.3")
                }

            AvisoLabView(laboratorio: laboratorio)
                .tabItem {
                    Label("Aviso", systemImage: "megaphone")
                }
        }
    }
}

#Preview {
    LaboratorioView()
}
