import SwiftUI

// Mesma tela da anterior. A diferenca e o withAnimation em volta da mudanca.
// A cor atravessa o meio do caminho em vez de pular, e o circulo cresce aos poucos.
struct GestosAnimados: View {
    @State private var corAtiva = false
    @State private var escala: CGFloat = 1.0

    var body: some View {
        Circle()
            .fill(corAtiva ? .blue : .red)
            .frame(width: 100 * escala, height: 100 * escala)
            .onTapGesture {
                withAnimation {
                    corAtiva.toggle()
                }
            }
            .onTapGesture(count: 2) {
                withAnimation {
                    escala += 0.5
                }
            }
            .onLongPressGesture(minimumDuration: 2) {
                withAnimation {
                    escala = 1
                }
            }
    }
}

#Preview {
    GestosAnimados()
}
