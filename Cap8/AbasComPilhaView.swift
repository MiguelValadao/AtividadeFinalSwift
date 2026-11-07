import SwiftUI

// Cada aba tem um NavigationStack proprio.
// Avancar no vermelho e ir pro azul nao mexe na pilha do vermelho. Quando voltar, continua de onde parou.
struct AbasComPilhaView: View {
    var body: some View {
        TabView {
            NavigationStack {
                CorOpacidadeView(baseColor: .red, opacityLevel: 1.0)
            }
            .tabItem {
                Image(systemName: "circle.fill")
                Text("Vermelho")
            }

            NavigationStack {
                CorOpacidadeView(baseColor: .blue, opacityLevel: 1.0)
            }
            .tabItem {
                Image(systemName: "circle.fill")
                Text("Azul")
            }

            NavigationStack {
                CorOpacidadeView(baseColor: .green, opacityLevel: 1.0)
            }
            .tabItem {
                Image(systemName: "circle.fill")
                Text("Verde")
            }

            NavigationStack {
                CorOpacidadeView(baseColor: .purple, opacityLevel: 1.0)
            }
            .tabItem {
                Image(systemName: "circle.fill")
                Text("Roxo")
            }
        }
        .tint(.white)
    }
}

struct CorOpacidadeView: View {
    let baseColor: Color
    let opacityLevel: Double

    private var currentColor: Color {
        baseColor.opacity(opacityLevel)
    }

    var body: some View {
        currentColor
            .ignoresSafeArea()
            .overlay(
                NavigationLink {
                    // cada salto fica com metade da opacidade da tela atual
                    CorOpacidadeView(baseColor: baseColor, opacityLevel: opacityLevel * 0.5)
                } label: {
                    Text("Navegar para \(Int(opacityLevel * 50))% de opacidade")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                }
            )
            .navigationTitle("Opacidade \(Int(opacityLevel * 100))%")
    }
}

#Preview {
    AbasComPilhaView()
}
