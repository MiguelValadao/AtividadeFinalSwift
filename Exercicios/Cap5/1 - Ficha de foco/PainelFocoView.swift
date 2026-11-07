import SwiftUI

struct PainelFocoView: View {
    @ObservedObject var foco: FocoViewModel
    
    var body: some View {
        VStack {
            Slider(value: $foco.nivelFoco, in: 0...1)
                .disabled(foco.materia.trimmingCharacters(in: .whitespaces).isEmpty)
            
            Text("\(Int(foco.nivelFoco * 100))%")
        }
    }
}
