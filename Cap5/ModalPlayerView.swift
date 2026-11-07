import SwiftUI

// Esta tela nem sabe se esta aberta. So usa os dados e o playPause da view model.
// @ObservedObject porque o objeto ja foi criado na MainView da apostila.
struct ModalPlayerView: View {
    @ObservedObject var viewModel: MusicPlayerViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Detalhes da Música")
                .font(.headline)

            Text("Tempo total: \(Int(viewModel.duration))s")
            Text("Progresso: \(Int(viewModel.progress))s")

            Button(action: { viewModel.playPause() }) {
                Text(viewModel.isPlaying ? "Pausar" : "Tocar")
            }

            Slider(value: $viewModel.progress, in: 0...viewModel.duration)
        }
        .padding()
    }
}

#Preview {
    ModalPlayerView(viewModel: MusicPlayerViewModel())
}
