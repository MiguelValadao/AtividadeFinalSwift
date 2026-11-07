import SwiftUI

// O link tem destino e o que aparece na tela.
// Ele precisa estar dentro de um NavigationStack. Fora dele, o toque nao faz nada.
struct NavigationLinkExample: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Tela Inicial")
                    .font(.largeTitle)

                NavigationLink("Ir para os Detalhes") {
                    Text("Esta é a tela de detalhes!")
                        .font(.title2)
                        .foregroundStyle(.green)
                        .padding()
                }
            }
            .navigationTitle("Tela Inicial")
        }
    }
}

#Preview {
    NavigationLinkExample()
}
