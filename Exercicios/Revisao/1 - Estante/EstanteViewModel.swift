import SwiftUI
import Combine

// Complete a classe da estante. O enunciado esta em "00 - Revisao".
class EstanteViewModel: ObservableObject {
    @Published var livros: [Livro] = [
        Livro(titulo: "Dom Casmurro", autor: "Machado de Assis", paginas: 256, lido: true),
        Livro(titulo: "O Pequeno Príncipe", autor: "Antoine de Saint-Exupéry", paginas: 96, lido: false),
        Livro(titulo: "Capitães da Areia", autor: "Jorge Amado", paginas: 280, lido: false),
        Livro(titulo: "A Hora da Estrela", autor: "Clarice Lispector", paginas: 87, lido: true)
    ]

    var quantidadeLidos: Int {
        livros.filter(\.lido).count
    }

    var paginasLidas: Int {
        livros.filter(\.lido).reduce(0) { $0 + $1.paginas }
    }

    func adicionar(titulo: String, autor: String, paginas: Int) {
        livros.append(
            Livro(
                titulo: titulo,
                autor: autor,
                paginas: paginas,
                lido: false
            )
        )
    }

    func apagar(id: UUID) {
        livros.removeAll { $0.id == id }
    }

    func definirLido(id: UUID, lido: Bool) {
        if let indice = livros.firstIndex(where: { $0.id == id }) {
            livros[indice].lido = lido
        }
    }

    func livro(id: UUID) -> Livro? {
        livros.first { $0.id == id }
    }
}
