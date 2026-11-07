import SwiftUI

// Capitulo 5. O numero mora nesta tela.
// View e struct, entao um atributo comum nao pode ser alterado.
// O @State libera a mudanca e avisa o SwiftUI pra redesenhar.
struct LikeCounterView: View {
    @State private var likeCount: Int = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("Curtidas: \(likeCount)")
                .font(.title)

            // o que esta entre chaves roda de novo a cada toque
            Button("Curtir") {
                likeCount += 1
            }
            .padding()
        }
    }
}

#Preview {
    LikeCounterView()
}
