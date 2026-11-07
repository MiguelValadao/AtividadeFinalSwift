import SwiftUI

// O stack sozinho nao desenha botao. Ele guarda a pilha de telas.
// Nesta aqui so tem um texto, entao ainda nao da pra ir a lugar nenhum.
struct NavigationStackBasico: View {
    var body: some View {
        NavigationStack {
            Text("Bem-vindo ao Meu Primeiro App usando NavigationStack!")
                .font(.title)
                .foregroundStyle(.blue)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    NavigationStackBasico()
}
