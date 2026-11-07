import SwiftUI

// navigationTitle coloca o nome na barra de cima.
// O gesto de arrastar da borda esquerda pra voltar ja vem com o stack. Aqui ainda nao tem segunda tela.
struct NavigationStackComTitulo: View {
    var body: some View {
        NavigationStack {
            Text("Conteúdo Principal")
                .navigationTitle("Minha App")
        }
    }
}

#Preview {
    NavigationStackComTitulo()
}
