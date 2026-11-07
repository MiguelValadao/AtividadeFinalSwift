import SwiftUI

// Complete a sheet do aviso. O enunciado esta em "00 - Revisao".
struct AvisoLabFormView: View {
    @ObservedObject var laboratorio: LaboratorioViewModel

    @Environment(\.dismiss) private var dismiss
    @State private var rascunho = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Aviso", text: $rascunho)
                    .textFieldStyle(.roundedBorder)

                Button("Publicar") {
                    laboratorio.publicarAviso(rascunho)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .disabled(rascunho.trimmingCharacters(in: .whitespaces).isEmpty)

                Spacer()
            }
            .padding()
            .navigationTitle("Novo aviso")
        }
    }
}

#Preview {
    AvisoLabFormView(laboratorio: LaboratorioViewModel())
}
