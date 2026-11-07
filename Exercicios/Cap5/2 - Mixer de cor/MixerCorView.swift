import SwiftUI

struct MixerCorView: View {
    @State private var vermelho: Double = 0.0
    @State private var verde: Double = 0.0
    @State private var azul: Double = 0.0
    @State private var travado: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red: vermelho, green: verde, blue: azul))
                    .frame(height: 200)
                
                ControleCorView(vermelho: $vermelho, verde: $verde, azul: $azul, travado: travado)
                
                Toggle("Travar sliders", isOn: $travado)
                
                Button("Zerar") {
                    vermelho = 0
                    verde = 0
                    azul = 0
                }
                .disabled(travado)
            }
            .padding()
            .navigationTitle("Mixer")
        }
    }
}
#Preview {
    Group {
        MixerCorView()
    }
}
