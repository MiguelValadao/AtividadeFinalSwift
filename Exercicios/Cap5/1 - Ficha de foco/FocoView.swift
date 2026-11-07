import SwiftUI

struct FocoView: View {
    @StateObject private var foco = FocoViewModel()
    @State private var mostrarSheet = false
    @State private var mostrarAlerta = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(foco.materia.trimmingCharacters(in: .whitespaces).isEmpty ? "Sem matéria" : foco.materia)
                    .font(.title)
                    .bold()
                
                Text("\(foco.minutosAlvo) minutos")
                    .font(.headline)
                
                Text("\(Int(foco.nivelFoco * 100))%")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                PainelFocoView(foco: foco)
                
                Button("Reiniciar") {
                    foco.reiniciar()
                }
                .disabled(foco.estaNoComeco)
                
                Button("Ajustes") {
                    mostrarSheet = true
                }
            }
            .padding()
            .navigationTitle("Foco")
            .sheet(isPresented: $mostrarSheet) {
                AjustesFocoView(foco: foco, mostrarAlerta: $mostrarAlerta)
            }
            .alert("Pronto", isPresented: $mostrarAlerta) {
                Button("OK") { }
            } message: {
                Text("Sessão de \(foco.materia) pronta: \(foco.minutosAlvo) min.")
            }
        }
    }
}
#Preview {
    FocoView()
}