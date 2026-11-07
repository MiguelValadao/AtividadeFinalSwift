
import SwiftUI

struct Filme: Identifiable {
    var id = UUID()
    var titulo: String
    var ano: Int
    var genero: String
    var nota: Int
    var assistido: Bool
}

func corDoGenero(_ nome: String) -> Color {
    if nome == "Ação" {
        return .red
    } else if nome == "Comédia" {
        return .orange
    } else if nome == "Drama" {
        return .blue
    } else if nome == "Animação" {
        return .purple
    } else if nome == "Documentário" {
        return .green
    } else {
        return .gray
    }
}
