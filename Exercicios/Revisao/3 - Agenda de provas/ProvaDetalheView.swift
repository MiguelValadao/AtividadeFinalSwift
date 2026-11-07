import SwiftUI

// Complete o detalhe da prova. O enunciado esta em "00 - Revisao".
struct ProvaDetalheView: View {
    @ObservedObject var agenda: AgendaProvasViewModel
    let provaId: UUID

    @Environment(\.dismiss) private var dismiss
    @State private var confirmarApagar = false

    private var prova: ItemProva? {
        agenda.prova(id: provaId)
    }

    var body: some View {
        Form {
            if let prova {
                LabeledContent("Sala", value: prova.sala)

                LabeledContent("Dia") {
                    Text(
                        prova.dia,
                        format: .dateTime.day().month(.wide).year()
                    )
                }

                Toggle(
                    "Revisada",
                    isOn: Binding(
                        get: {
                            agenda.prova(id: provaId)?.revisada ?? false
                        },
                        set: { novoValor in
                            agenda.definirRevisada(
                                id: provaId,
                                revisada: novoValor
                            )
                        }
                    )
                )

                Button("Apagar", role: .destructive) {
                    confirmarApagar = true
                }
            } else {
                Text("Prova não encontrada")
            }
        }
        .navigationTitle(prova?.materia ?? "Prova")
        .alert("Apagar esta prova?", isPresented: $confirmarApagar) {
            Button("Apagar", role: .destructive) {
                agenda.apagar(id: provaId)
                dismiss()
            }

            Button("Cancelar", role: .cancel) { }
        }
    }
}

#Preview {
    let agenda = AgendaProvasViewModel()

    NavigationStack {
        ProvaDetalheView(
            agenda: agenda,
            provaId: agenda.provas[0].id
        )
    }
}
