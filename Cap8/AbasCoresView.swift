import SwiftUI

// Aba nao empilha. Troca de secao, e cada uma guarda o que estava mostrando.
// Na apostila a tela principal deste exemplo se chama MainAppView.
struct AbasCoresView: View {
    var body: some View {
        TabView {
            CorTelaView(cor: .red)
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("Vermelho")
                }
            CorTelaView(cor: .blue)
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("Azul")
                }
            CorTelaView(cor: .green)
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("Verde")
                }
            CorTelaView(cor: .purple)
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("Roxo")
                }
        }
        .tint(.white)
    }
}

struct CorTelaView: View {
    let cor: Color

    var body: some View {
        cor.ignoresSafeArea()
    }
}

#Preview {
    AbasCoresView()
}
