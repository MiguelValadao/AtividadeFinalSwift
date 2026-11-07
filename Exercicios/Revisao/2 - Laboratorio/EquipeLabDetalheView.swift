import SwiftUI

// Complete o detalhe da equipe. O enunciado esta em "00 - Revisao".
struct EquipeLabDetalheView: View {
    @ObservedObject var laboratorio: LaboratorioViewModel
    let equipeId: UUID

    private var equipe: EquipeLab? {
        laboratorio.equipe(id: equipeId)
    }

    var body: some View {
        Form {
            if let equipe {
                LabeledContent("Tema", value: equipe.tema)

                Stepper(
                    "Integrantes: \(equipe.integrantes)",
                    value: Binding(
                        get: {
                            laboratorio.equipe(id: equipeId)?.integrantes ?? 1
                        },
                        set: { novoValor in
                            laboratorio.definirIntegrantes(
                                id: equipeId,
                                valor: novoValor
                            )
                        }
                    ),
                    in: 1...12
                )
            } else {
                Text("Equipe não encontrada")
            }
        }
        .navigationTitle(equipe?.nome ?? "Equipe")
    }
}

#Preview {
    let laboratorio = LaboratorioViewModel()

    NavigationStack {
        EquipeLabDetalheView(
            laboratorio: laboratorio,
            equipeId: laboratorio.equipes[0].id
        )
    }
}
