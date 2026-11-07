import SwiftUI

// Toque e um instante. Arrastar, pinça e giro vao entregando o movimento o tempo todo.
// onChanged acompanha o dedo. onEnded e quando solta.
struct GestosComplexos: View {
    @State private var offset = CGSize.zero
    @State private var escala: CGFloat = 1.0
    @State private var angulo = Angle.zero

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 150)
                .foregroundStyle(.green)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { valor in
                            offset = valor.translation
                        }
                        .onEnded { _ in
                            withAnimation {
                                offset = .zero
                            }
                        }
                )
                .scaleEffect(escala)
                .gesture(
                    MagnificationGesture()
                        .onChanged { valor in
                            escala = valor
                        }
                )
                .rotationEffect(angulo)
                .gesture(
                    RotationGesture()
                        .onChanged { valor in
                            angulo = valor
                        }
                )
        }
    }
}

#Preview {
    GestosComplexos()
}
