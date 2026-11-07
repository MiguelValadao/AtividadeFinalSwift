import SwiftUI

// Complete a lista da estante. O enunciado esta em "00 - Revisao".
struct EstanteView: View {
    @StateObject private var estante = EstanteViewModel()
    @State private var mostrarNovo = false

    var body: some View {
        NavigationStack {
            List {
                Section("Resumo") {
                    Text("Livros: \(estante.livros.count)")
                    Text("Lidos: \(estante.quantidadeLidos)")
                    Text("Páginas lidas: \(estante.paginasLidas)")
                }

                Section("Estante") {
                    ForEach(estante.livros) { livro in
                        NavigationLink {
                            LivroDetalheView(
                                estante: estante,
                                livroId: livro.id
                            )
                        } label: {
                            VStack(alignment: .leading) {
                                Text(livro.titulo)
                                Text(livro.autor)
                                    .font(.caption)
                            }
                        }
                    }
                    .onDelete { indices in
                        let ids = indices.map { estante.livros[$0].id }

                        for id in ids {
                            estante.apagar(id: id)
                        }
                    }
                }
            }
            .navigationTitle("Estante")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        mostrarNovo = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $mostrarNovo) {
                NovoLivroView(estante: estante)
            }
        }
    }
}

#Preview {
    EstanteView()
}
