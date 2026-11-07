import SwiftUI

// Complete cada quadrado. O enunciado esta em "00 - Capitulo 6".
struct QuadradoCorView: View {
    @State private var cor: Color = .blue
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(cor)
            .frame(width: 80, height: 80)
            .onTapGesture {
                withAnimation {
                    cor = Color(
                        red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1)
                    )
                }
            }
    }
}

struct QuadradoGiraView: View {
    @State private var angulo: Angle = .zero
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.orange)
            .frame(width: 80, height: 80)
            .rotationEffect(angulo)
            .onLongPressGesture {
                withAnimation {
                    angulo += .degrees(45)
                }
            }
    }
}


struct QuadradoMistoView: View {
    @State private var cor: Color = .purple
    @State private var escala: CGFloat = 1.0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(cor)
            .frame(width: 80, height: 80)
            .scaleEffect(escala)
            .onTapGesture {
                withAnimation {
                    cor = Color(
                        red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1)
                    )
                }
            }
            .onLongPressGesture {
                withAnimation {
                    escala = (escala == 1.0) ? 1.3 : 1.0
                }
            }
    }
}
