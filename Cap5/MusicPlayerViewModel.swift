import SwiftUI
import Combine

// Tudo que as duas telas do player precisam ver fica aqui.
// A view nao sabe como o Timer funciona. Ela so chama playPause().
class MusicPlayerViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var duration: Double = 240
    @Published var progress: Double = 0

    var timer: Timer?

    func playPause() {
        isPlaying.toggle()

        if isPlaying {
            startTimer()
        } else {
            stopTimer()
        }
    }

    func startTimer() {
        // weak self pra o timer nao segurar a classe pra sempre
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self else { return }

            if self.progress < self.duration {
                self.progress += 1
            } else {
                self.stopTimer()
                self.isPlaying = false
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    // o slider ja escreve direto em progress. este metodo fica aqui se precisar pular o tempo no codigo
    func seek(to value: Double) {
        progress = value
    }
}
