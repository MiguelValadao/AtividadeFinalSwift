import SwiftUI

// Barra de baixo. Recebe a view model que a tela principal criou.
// O modal aberto ou fechado e so desta barra, entao fica em @State.
struct MiniPlayerView: View {
    @ObservedObject var viewModel: MusicPlayerViewModel
    @State private var showModal = false

    var body: some View {
        VStack {
            HStack {
                Text(viewModel.isPlaying ? "Tocando" : "Pausado")
                Spacer()
                Button(action: { viewModel.playPause() }) {
                    Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                }
                Button(action: { showModal = true }) {
                    Image(systemName: "chevron.up")
                }
            }

            Slider(value: $viewModel.progress, in: 0...viewModel.duration)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        // sheet tambem pede binding. true abre, arrastar pra baixo devolve false
        .sheet(isPresented: $showModal) {
            ModalPlayerView(viewModel: viewModel)
        }
    }
}

#Preview {
    MiniPlayerView(viewModel: MusicPlayerViewModel())
}
