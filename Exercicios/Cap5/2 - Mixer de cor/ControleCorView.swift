import SwiftUI

struct ControleCorView: View {
    @Binding var vermelho: Double
    @Binding var verde: Double
    @Binding var azul: Double
    let travado: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Vermelho")
                Slider(value: $vermelho, in: 0...1)
                    .disabled(travado)
            }
            HStack {
                Text("Verde")
                Slider(value: $verde, in: 0...1)
                    .disabled(travado)
            }
            HStack {
                Text("Azul")
                Slider(value: $azul, in: 0...1)
                    .disabled(travado)
            }
        }
    }
}

