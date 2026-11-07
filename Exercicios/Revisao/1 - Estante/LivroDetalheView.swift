import SwiftUI

// Complete o detalhe do livro. O enunciado esta em "00 - Revisao".
struct LivroDetalheView: View {
    @ObservedObject var estante: EstanteViewModel
    let livroId: UUID

    private var livro: Livro? {
        estante.livro(id: livroId)
    }

    var body: some View {
        Form {
            if let livro {
                LabeledContent("Autor", value: livro.autor)
                LabeledContent("Páginas", value: "\(livro.paginas)")

                Toggle(
                    "Lido",
                    isOn: Binding(
                        get: {
                            estante.livro(id: livroId)?.lido ?? false
                        },
                        set: { novoValor in
                            estante.definirLido(id: livroId, lido: novoValor)
                        }
                    )
                )
            } else {
                Text("Livro não encontrado")
            }
        }
        .navigationTitle(livro?.titulo ?? "Livro")
    }
}

#Preview {
    let estante = EstanteViewModel()

    NavigationStack {
        LivroDetalheView(
            estante: estante,
            livroId: estante.livros[0].id
        )
    }
}
