import SwiftUI

// Complete as tres pecas. O enunciado esta em "00 - Capitulo 6".
struct PecasView: View {
    @State private var aberturas = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
             
                Text("Apareceu: \(aberturas) \(aberturas == 1 ? "vez" : "vezes")")
                    .font(.title3)
                    .fontWeight(.medium)
                

                HStack(spacing: 24) {
                    QuadradoCorView()
                    QuadradoGiraView()
                    QuadradoMistoView()
                }
                .frame(height: 120)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Peças")
            .onAppear {
                aberturas += 1
            }
        }
    }
}


#Preview {
    PecasView()
}
