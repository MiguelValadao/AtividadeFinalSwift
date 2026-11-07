import SwiftUI

// Toque troca a cor. Toque duplo cresce. Segurar dois segundos volta ao normal.
// A gente nao fica perguntando "ja tocou?". Declara o que fazer quando tocar.
struct GestosBasicos: View {
    @State private var corAtiva = false
    @State private var escala: CGFloat = 1.0

    var body: some View {
        Circle()
            .fill(corAtiva ? .blue : .red)
            .frame(width: 100 * escala, height: 100 * escala)
            // toque simples e toque duplo estao empilhados, como na apostila.
            // no simulador o duplo as vezes dispara o simples junto
            .onTapGesture {
                corAtiva.toggle()
            }
            .onTapGesture(count: 2) {
                escala += 0.5
            }
            .onLongPressGesture(minimumDuration: 2) {
                escala = 1
            }
    }
}

#Preview {
    GestosBasicos()
}
