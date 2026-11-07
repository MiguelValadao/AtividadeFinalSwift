import SwiftUI

// Na apostila esta view se chama MainView.
// Ela cria a view model. As filhas so recebem.
struct PlayerMainView: View {
    @StateObject private var musicPlayer = MusicPlayerViewModel()

    var body: some View {
        VStack {
            Spacer()
            MiniPlayerView(viewModel: musicPlayer)
        }
        .frame(minHeight: 200)
    }
}

#Preview {
    PlayerMainView()
}
