import SwiftUI

// Complete o formulario do recado. O enunciado esta em "00 - Capitulo 8".
struct RecadoFormView: View {
    @Binding var recadoPublicado: String
    @Environment(\.dismiss) private var dismiss
    @State private var rascunho = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Recado", text: $rascunho)
                    .textFieldStyle(.roundedBorder)

                Button("Publicar") {
                    recadoPublicado = rascunho.trimmingCharacters(in: .whitespaces)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .disabled(rascunho.trimmingCharacters(in: .whitespaces).isEmpty)

                Spacer()
            }
            .padding()
            .navigationTitle("Novo recado")
        }
    }
}

#Preview {
    RecadoFormView(recadoPublicado: .constant(""))
}
