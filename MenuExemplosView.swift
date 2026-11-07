import SwiftUI

// Cada pasta numerada e um exercicio. O enunciado esta no .md da pasta. O app abre o esqueleto.
struct MenuExemplosView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Prova — Capítulo 5") {
                    link("Ficha de foco", FocoView())
                    link("Mixer de cor", MixerCorView())
                    link("Reserva da sala", ReservaSalaView())
                }

                Section("Prova — Capítulo 6") {
                    link("Cartaz da turma", CartazView())
                    link("Humor do dia", HumorView())
                    link("Peças soltas", PecasView())
                }

                Section("Prova — Capítulo 7") {
                    link("Coleção de filmes", ListaFilmesView(), escondeBarra: true)
                    link("Chamada", ChamadaView())
                    link("Ranking", RankingView())
                }

                Section("Prova — Capítulo 8") {
                    link("Mural da turma", MuralView(), escondeBarra: true)
                    link("Guia da escola", GuiaEscolaView(), escondeBarra: true)
                    link("Cantina", CantinaView(), escondeBarra: true)
                }

                Section("Revisão — listas, ViewModel e telas") {
                    link("Estante", EstanteView(), escondeBarra: true)
                    link("Laboratório", LaboratorioView(), escondeBarra: true)
                    link("Agenda de provas", AgendaProvasView(), escondeBarra: true)
                }

                Section("Capítulo 5 — Estados") {
                    link("Curtidas com @State", LikeCounterView())
                    link("Curtidas com @Binding", LikeCounterView2())
                    link("Formulário com @State", FormularioRegistroView())
                    link("Formulário com ViewModel", FormularioRegistroComStateObjectView())
                    link("Player compartilhado", PlayerMainView())
                }

                Section("Capítulo 6 — Eventos") {
                    link("Toque e pressão longa", GestosBasicos())
                    link("Os mesmos gestos, animados", GestosAnimados())
                    link("onChange no nome", Observador())
                    link("Arrastar, pinça e rotação", GestosComplexos())
                    link("E-mail enquanto digita", ValidacaoCampo())
                    link("Aparecer e sumir", CicloDeVidaSimples())
                }

                Section("Capítulo 7 — Listas") {
                    link("Lista escrita na mão", ListaSimples())
                    link("Lista a partir de um array", ListaDinamica())
                    link("A mesma lista com ForEach", ListaDinamicaForEach())
                    link("ForEach de círculos", ForEachIntervalo())
                    link("Rolagem na horizontal", ForEachScrollView())
                    link("Acrescentar tarefa", ListaTarefasTexto())
                    link("Tarefa com data, concluir e apagar", ListaTarefasStruct())
                    link("Filtro, firstIndex e apagar certo", ListaTarefasFiltro())
                    link("map, filter e reduce", FuncoesAltaOrdem())
                }

                Section("Capítulo 8 — Várias telas") {
                    link("NavigationStack sozinho", NavigationStackBasico(), escondeBarra: true)
                    link("NavigationStack com título", NavigationStackComTitulo(), escondeBarra: true)
                    link("NavigationLink", NavigationLinkExample(), escondeBarra: true)
                    link("Link com cara de botão", NavigationLinkPersonalizedExample(), escondeBarra: true)
                    link("Contatos, da lista pro detalhe", ContactListView(), escondeBarra: true)
                    link("Abas de cor", AbasCoresView(), escondeBarra: true)
                    link("Cada aba com a própria pilha", AbasComPilhaView(), escondeBarra: true)
                    link("Sheet por cima da tela", SheetExample())
                    link("Fechar a sheet com dismiss", SheetComDismiss())
                }
            }
            .navigationTitle("Exemplos")
        }
    }

    // Exemplos que ja tem o proprio NavigationStack ou TabView.
    // Se a barra de cima deste menu continuar visivel, fica uma barra em cima da outra.
    private func link<Destino: View>(_ titulo: String, _ destino: Destino, escondeBarra: Bool = false) -> some View {
        NavigationLink(titulo) {
            destino
                .toolbar(escondeBarra ? .hidden : .automatic, for: .navigationBar)
        }
    }
}

#Preview {
    MenuExemplosView()
}
