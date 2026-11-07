
import SwiftUI

struct FiltrosFilmeView: View {
    @Environment(\.dismiss) var dismiss

    @Binding var situacao: String
    @Binding var genero: String
    @Binding var notaMinima: Int
    @Binding var ordem: String

    var body: some View {
        NavigationStack {
            Form {
                Section("Situação") {
                    Picker("Assistido", selection: $situacao) {
                        Text("Todos").tag("Todos")
                        Text("Assistidos").tag("Assistidos")
                        Text("Não assistidos").tag("Não assistidos")
                    }
                }

                Section("Gênero") {
                    Picker("Gênero", selection: $genero) {
                        Text("Todos").tag("Todos")
                        Text("Ação").tag("Ação")
                        Text("Comédia").tag("Comédia")
                        Text("Drama").tag("Drama")
                        Text("Animação").tag("Animação")
                        Text("Documentário").tag("Documentário")
                    }
                }

                Section("Nota mínima") {
                    Stepper(
                        "Nota mínima: \(notaMinima)",
                        value: $notaMinima,
                        in: 1...5
                    )
                }

                Section("Ordenação") {
                    Picker("Ordem", selection: $ordem) {
                        Text("Título").tag("Título")
                        Text("Ano").tag("Ano")
                        Text("Avaliação").tag("Avaliação")
                    }
                }
            }
            .navigationTitle("Filtros")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Fechar") {
                        dismiss()
                    }
                }
            }
        }
    }
}
