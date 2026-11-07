import SwiftUI

// Complete a aba Equipes. O enunciado esta em "00 - Revisao".
struct EquipesLabView: View {
    @ObservedObject var laboratorio: LaboratorioViewModel

    var body: some View {
        NavigationStack {
            List {
                Text("Integrantes: \(laboratorio.totalIntegrantes)")

                ForEach(laboratorio.equipes) { equipe in
                    NavigationLink {
                        EquipeLabDetalheView(
                            laboratorio: laboratorio,
                            equipeId: equipe.id
                        )
                    } label: {
                        VStack(alignment: .leading) {
                            Text(equipe.nome)
                            Text(equipe.tema)
                                .font(.caption)
                        }
                    }
                }
                .onDelete { indices in
                    let ids = indices.map { laboratorio.equipes[$0].id }

                    for id in ids {
                        laboratorio.apagar(id: id)
                    }
                }
            }
            .navigationTitle("Equipes")
        }
    }
}

#Preview {
    EquipesLabView(laboratorio: LaboratorioViewModel())
}
