import SwiftUI

// Complete a figurinha. O enunciado esta em "00 - Capitulo 6".
struct FigurinhaView: View {
    @State private var posicao: CGSize = .zero
    @State private var escala: CGFloat = 1.0
    @State private var angulo: Angle = .zero
    
    var body: some View {
        Circle()
            .fill(Color.yellow)
            .frame(width: 100, height: 100)
            .overlay(
                Image(systemName: "star.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            )
            .scaleEffect(escala)
            .rotationEffect(angulo)
            .offset(posicao)
            .gesture(
                DragGesture()
                    .onChanged { valor in
                        posicao = valor.translation
                    }
                    .onEnded { _ in
                        withAnimation {
                            posicao = .zero
                        }
                    }
            )
            .simultaneousGesture(
                MagnificationGesture()
                    .onChanged { valor in
                        escala = min(max(valor, 0.5), 2.5)
                    }
            )
            .simultaneousGesture(
                RotationGesture()
                    .onChanged { valor in
                        angulo = valor
                    }
            )
    }
}
