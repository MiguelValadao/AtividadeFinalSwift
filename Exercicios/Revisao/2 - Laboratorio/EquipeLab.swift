import Foundation

// Complete o modelo da equipe. O enunciado esta em "00 - Revisao".
struct EquipeLab: Identifiable {
    let id = UUID()
    var nome: String
    var tema: String
    var integrantes: Int
}
