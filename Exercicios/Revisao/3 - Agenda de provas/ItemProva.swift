import Foundation

// Complete o modelo da prova. O enunciado esta em "00 - Revisao".
struct ItemProva: Identifiable {
    let id = UUID()
    var materia: String
    var sala: String
    var dia: Date
    var revisada: Bool
}
