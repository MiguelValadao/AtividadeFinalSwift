
import SwiftUI

struct NovoFilmeView: View {
    @Environment(\.dismiss) var dismiss

    var anoLimite: Int
    var aoSalvar: (Filme) -> Void

    @State private var titulo = ""
    @State private var anoTexto = ""
    @State private var genero = "Ação"
    @State private var nota = 3

    let generos = [
        "Ação",
        "Comédia",
        "Drama",
        "Animação",
        "Documentário"
    ]

    var anoValido: Bool {
        guard let ano = Int(anoTexto) else {
            return false
        }

        return ano >= 1900 && ano <= anoLimite
    }

    var tituloValido: Bool {
        !titulo.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Informações do filme") {
                    TextField("Título", text: $titulo)

                    TextField("Ano", text: $anoTexto)
                        .keyboardType(.numberPad)

                    Picker("Gênero", selection: $genero) {
                        Text("Ação").tag("Ação")
                        Text("Comédia").tag("Comédia")
                        Text("Drama").tag("Drama")
                        Text("Animação").tag("Animação")
                        Text("Documentário").tag("Documentário")
                    }

                    Stepper(
                        "Nota: \(nota)",
                        value: $nota,
                        in: 1...5
                    )
                }
            }
            .navigationTitle("Novo filme")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        let novoFilme = Filme(
                            titulo: titulo.trimmingCharacters(
                                in: .whitespaces
                            ),
                            ano: Int(anoTexto)!,
                            genero: genero,
                            nota: nota,
                            assistido: false
                        )

                        aoSalvar(novoFilme)
                        dismiss()
                    }
                    .disabled(!tituloValido || !anoValido)
                }
            }
        }
    }
}
