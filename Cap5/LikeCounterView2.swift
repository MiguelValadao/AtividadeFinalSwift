import SwiftUI

// O botao foi pra outra view. Ele nao cria o contador.
// Recebe um Binding pra ler e tambem alterar o numero da tela de cima.
struct LikeButton: View {
    @Binding var likeCount: Int

    var body: some View {
        Button("Curtir") {
            likeCount += 1
        }
        .padding()
    }
}

struct LikeCounterView2: View {
    @State private var likeCount: Int = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("Curtidas: \(likeCount)")
                .font(.title)

            // o $ entrega o estado de verdade. sem ele a filha so veria uma copia
            LikeButton(likeCount: $likeCount)
        }
    }
}

#Preview {
    LikeCounterView2()
}
