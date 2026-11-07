import SwiftUI

// onAppear roda quando a view entra na tela. onDisappear, quando sai.
// O if tira o circulo da hierarquia. Por isso os dois disparam de novo quando ele volta.
struct CicloDeVidaSimples: View {
    @State private var mostrarElemento = false
    @State private var vezesApareceu = 0
    @State private var vezesDesapareceu = 0

    var body: some View {
        VStack(spacing: 30) {
            Text("Ciclo de Vida")
                .font(.title2)
                .fontWeight(.bold)

            HStack(spacing: 40) {
                VStack {
                    Text("\(vezesApareceu)")
                        .font(.largeTitle)
                        .foregroundStyle(.green)
                    Text("Apareceu")
                        .font(.caption)
                }
                VStack {
                    Text("\(vezesDesapareceu)")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                    Text("Desapareceu")
                        .font(.caption)
                }
            }
            .padding()

            if mostrarElemento {
                Circle()
                    .fill(.blue)
                    .frame(width: 120, height: 120)
                    .onAppear { vezesApareceu += 1 }
                    .onDisappear { vezesDesapareceu += 1 }
            }

            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    mostrarElemento.toggle()
                }
            } label: {
                Text(mostrarElemento ? "Ocultar Circulo" : "Mostrar Circulo")
                    .foregroundStyle(.white)
                    .padding()
                    .background(mostrarElemento ? Color.red : Color.green)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    CicloDeVidaSimples()
}
