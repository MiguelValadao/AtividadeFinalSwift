import SwiftUI

// Complete a aba Aviso. O enunciado esta em "00 - Revisao".
struct AvisoLabView: View {
    @ObservedObject var laboratorio: LaboratorioViewModel
    @State private var mostrarForm = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text(laboratorio.aviso.isEmpty
                     ? "Nenhum aviso"
                     : laboratorio.aviso)
                    .multilineTextAlignment(.center)
                    .padding()

                Button("Novo aviso") {
                    mostrarForm = true
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Aviso")
            .sheet(isPresented: $mostrarForm) {
                AvisoLabFormView(laboratorio: laboratorio)
            }
        }
    }
}

#Preview {
    AvisoLabView(laboratorio: LaboratorioViewModel())
}
