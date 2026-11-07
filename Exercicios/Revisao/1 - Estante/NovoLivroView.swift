import SwiftUI

// Complete a sheet de livro novo. O enunciado esta em "00 - Revisao".
struct NovoLivroView: View {
    @ObservedObject var estante: EstanteViewModel

    @Environment(\.dismiss) private var dismiss
    @State private var titulo = ""
    @State private var autor = ""
    @State private var paginas = 100

    private var podeSalvar: Bool {
        !titulo.trimmingCharacters(in: .whitespaces).isEmpty &&
        !autor.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Título", text: $titulo)
                TextField("Autor", text: $autor)

                Stepper(
                    "Páginas: \(paginas)",
                    value: $paginas,
                    in: 1...2000
                )
            }
            .navigationTitle("Novo livro")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        estante.adicionar(
                            titulo: titulo.trimmingCharacters(in: .whitespaces),
                            autor: autor.trimmingCharacters(in: .whitespaces),
                            paginas: paginas
                        )
                        dismiss()
                    }
                    .disabled(!podeSalvar)
                }
            }
        }
    }
}

#Preview {
    NovoLivroView(estante: EstanteViewModel())
}
