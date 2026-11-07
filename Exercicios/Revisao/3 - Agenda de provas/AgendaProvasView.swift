import SwiftUI

// Complete a lista de provas. O enunciado esta em "00 - Revisao".
struct AgendaProvasView: View {
    @StateObject private var agenda = AgendaProvasViewModel()
    @State private var mostrarNova = false

    var body: some View {
        NavigationStack {
            List {
                Section("Resumo") {
                    Text("Total de provas: \(agenda.provas.count)")
                    Text("Pendentes: \(agenda.pendentes)")

                    Toggle("Só as pendentes", isOn: $agenda.soPendentes)
                }

                Section("Provas") {
                    ForEach(agenda.visiveis) { prova in
                        NavigationLink {
                            ProvaDetalheView(
                                agenda: agenda,
                                provaId: prova.id
                            )
                        } label: {
                            VStack(alignment: .leading) {
                                Text(prova.materia)
                                Text("\(prova.sala) — \(prova.revisada ? "Revisada" : "Pendente")")
                                    .font(.caption)
                            }
                        }
                    }
                    .onDelete { indices in
                        let ids = indices.map { agenda.visiveis[$0].id }

                        for id in ids {
                            agenda.apagar(id: id)
                        }
                    }
                }
            }
            .navigationTitle("Provas")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        mostrarNova = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $mostrarNova) {
                NovaProvaView(agenda: agenda)
            }
        }
    }
}

#Preview {
    AgendaProvasView()
}
