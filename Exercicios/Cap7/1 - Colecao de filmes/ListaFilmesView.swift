
import SwiftUI

struct ListaFilmesView: View {
    @State private var filmes = [
        Filme(titulo: "Interestelar", ano: 2014,
              genero: "Drama", nota: 5, assistido: true),

        Filme(titulo: "Toy Story", ano: 1995,
              genero: "Animação", nota: 4, assistido: true),

        Filme(titulo: "Vingadores", ano: 2012,
              genero: "Ação", nota: 5, assistido: false),

        Filme(titulo: "As Branquelas", ano: 2004,
              genero: "Comédia", nota: 4, assistido: true),

        Filme(titulo: "Oceano", ano: 2020,
              genero: "Documentário", nota: 3, assistido: false)
    ]

    @State private var mostrarNovoFilme = false
    @State private var mostrarFiltros = false

    @State private var situacao = "Todos"
    @State private var genero = "Todos"
    @State private var notaMinima = 1
    @State private var ordem = "Título"

    var assistidos: Int {
        filmes.filter(\.assistido).count
    }

    var porcentagem: Int {
        if filmes.isEmpty {
            return 0
        }

        return assistidos * 100 / filmes.count
    }

    var mediaNotas: Double {
        if filmes.isEmpty {
            return 0
        }

        let soma = filmes.reduce(0) {
            $0 + $1.nota
        }

        return Double(soma) / Double(filmes.count)
    }

    var visiveis: [Filme] {
        var resultado = filmes.filter { filme in
            let situacaoValida =
                situacao == "Todos" ||
                (situacao == "Assistidos" && filme.assistido) ||
                (situacao == "Não assistidos" && !filme.assistido)

            let generoValido =
                genero == "Todos" || filme.genero == genero

            let notaValida =
                filme.nota >= notaMinima

            return situacaoValida && generoValido && notaValida
        }

        if ordem == "Ano" {
            resultado.sort { $0.ano < $1.ano }
        } else if ordem == "Avaliação" {
            resultado.sort { $0.nota > $1.nota }
        } else {
            resultado.sort { $0.titulo < $1.titulo }
        }

        return resultado
    }

    func alternarAssistido(id: UUID) {
        if let indice = filmes.firstIndex(where: {
            $0.id == id
        }) {
            filmes[indice].assistido.toggle()
        }
    }

    func apagarFilme(id: UUID) {
        filmes.removeAll {
            $0.id == id
        }
    }

    func contar(_ genero: String) -> Int {
        filmes.filter { $0.genero == genero }.count
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Resumo") {
                    Text("Total de filmes: \(filmes.count)")

                    Text("Assistidos: \(assistidos)")

                    Text("Porcentagem: \(porcentagem)%")

                    Text(
                        String(
                            format: "Média das notas: %.1f",
                            mediaNotas
                        )
                    )

                    Text("Ação: \(contar("Ação"))")
                    .foregroundStyle(corDoGenero("Ação"))

                    Text("Comédia: \(contar("Comédia"))")
                    .foregroundStyle(corDoGenero("Comédia"))

                    Text("Drama: \(contar("Drama"))")
                    .foregroundStyle(corDoGenero("Drama"))

                    Text("Animação: \(contar("Animação"))")
                    .foregroundStyle(corDoGenero("Animação"))

                    Text("Documentário: \(contar("Documentário"))")
                    .foregroundStyle(corDoGenero("Documentário"))
                }

                Section("Filmes") {
                    ForEach(visiveis) { filme in
                        HStack {
                            FilmeCell(filme: filme)

                            Spacer()

                            Button {
                                alternarAssistido(id: filme.id)
                            } label: {
                                Image(
                                    systemName: filme.assistido
                                    ? "checkmark.circle.fill"
                                    : "circle"
                                )
                            }
                            .buttonStyle(.plain)

                            Button {
                                apagarFilme(id: filme.id)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundStyle(.red)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .onDelete { indices in
                        let ids = indices.map {
                            visiveis[$0].id
                        }

                        for id in ids {
                            apagarFilme(id: id)
                        }
                    }
                }
            }
            .navigationTitle("Filmes")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        mostrarFiltros = true
                    } label: {
                        Image(
                            systemName:
                            "line.3.horizontal.decrease.circle"
                        )
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        mostrarNovoFilme = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $mostrarNovoFilme) {
                NovoFilmeView(
                    anoLimite: Calendar.current.component(
                        .year,
                        from: Date()
                    )
                ) { novoFilme in
                    filmes.append(novoFilme)
                }
            }
            .sheet(isPresented: $mostrarFiltros) {
                FiltrosFilmeView(
                    situacao: $situacao,
                    genero: $genero,
                    notaMinima: $notaMinima,
                    ordem: $ordem
                )
            }
        }
    }
}

#Preview {
    ListaFilmesView()
}
