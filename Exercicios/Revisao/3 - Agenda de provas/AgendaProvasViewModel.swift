import SwiftUI
import Combine

// Complete a classe da agenda. O enunciado esta em "00 - Revisao".
class AgendaProvasViewModel: ObservableObject {
    @Published var provas: [ItemProva] = [
        ItemProva(materia: "Matemática", sala: "12", dia: AgendaProvasViewModel.dia(2), revisada: false),
        ItemProva(materia: "História", sala: "8", dia: AgendaProvasViewModel.dia(5), revisada: true),
        ItemProva(materia: "Biologia", sala: "3", dia: AgendaProvasViewModel.dia(1), revisada: false),
        ItemProva(materia: "Física", sala: "15", dia: AgendaProvasViewModel.dia(9), revisada: false)
    ]

    @Published var soPendentes = false

    var visiveis: [ItemProva] {
        let lista = soPendentes
            ? provas.filter { !$0.revisada }
            : provas

        return lista.sorted { $0.dia < $1.dia }
    }

    var pendentes: Int {
        provas.filter { !$0.revisada }.count
    }

    func adicionar(materia: String, sala: String, dia: Date) {
        provas.append(
            ItemProva(
                materia: materia,
                sala: sala,
                dia: dia,
                revisada: false
            )
        )
    }

    func apagar(id: UUID) {
        provas.removeAll { $0.id == id }
    }

    func definirRevisada(id: UUID, revisada: Bool) {
        if let indice = provas.firstIndex(where: { $0.id == id }) {
            provas[indice].revisada = revisada
        }
    }

    func prova(id: UUID) -> ItemProva? {
        provas.first { $0.id == id }
    }

    static func dia(_ offset: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: offset, to: Date()) ?? Date()
    }
}
