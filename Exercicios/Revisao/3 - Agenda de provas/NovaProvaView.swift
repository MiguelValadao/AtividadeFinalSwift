import SwiftUI

// Complete a sheet de prova nova. O enunciado esta em "00 - Revisao".
struct NovaProvaView: View {
    @ObservedObject var agenda: AgendaProvasViewModel

    @Environment(\.dismiss) private var dismiss
    @State private var materia = ""
    @State private var sala = ""
    @State private var dia = Date()

    private var podeSalvar: Bool {
        !materia.trimmingCharacters(in: .whitespaces).isEmpty &&
        !sala.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Matéria", text: $materia)
                TextField("Sala", text: $sala)

                DatePicker(
                    "Dia",
                    selection: $dia,
                    displayedComponents: .date
                )
            }
            .navigationTitle("Nova prova")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        agenda.adicionar(
                            materia: materia.trimmingCharacters(in: .whitespaces),
                            sala: sala.trimmingCharacters(in: .whitespaces),
                            dia: dia
                        )
                        dismiss()
                    }
                    .disabled(!podeSalvar)
                }
            }
        }
    }
}

#Preview {
    NovaProvaView(agenda: AgendaProvasViewModel())
}
