import SwiftUI
import Combine

// Complete a classe do laboratorio. O enunciado esta em "00 - Revisao".
class LaboratorioViewModel: ObservableObject {
    @Published var equipes: [EquipeLab] = [
        EquipeLab(nome: "Grupo A", tema: "Foguetes de garrafa", integrantes: 4),
        EquipeLab(nome: "Grupo B", tema: "Horta na escola", integrantes: 3),
        EquipeLab(nome: "Grupo C", tema: "App da cantina", integrantes: 5),
        EquipeLab(nome: "Grupo D", tema: "Reciclagem", integrantes: 4)
    ]

    @Published var aviso = ""

    var totalIntegrantes: Int {
        equipes.reduce(0) { $0 + $1.integrantes }
    }

    func apagar(id: UUID) {
        equipes.removeAll { $0.id == id }
    }

    func definirIntegrantes(id: UUID, valor: Int) {
        if let indice = equipes.firstIndex(where: { $0.id == id }) {
            equipes[indice].integrantes = valor
        }
    }

    func publicarAviso(_ texto: String) {
        aviso = texto.trimmingCharacters(in: .whitespaces)
    }

    func equipe(id: UUID) -> EquipeLab? {
        equipes.first { $0.id == id }
    }
}
