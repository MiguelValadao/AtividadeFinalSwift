import Foundation

// Complete o modelo do livro. O enunciado esta em "00 - Revisao".
struct Livro: Identifiable {
    let id = UUID()
    var titulo: String
    var autor: String
    var paginas: Int
    var lido: Bool
}
