import SwiftUI

struct AjustesFocoView: View {
    @ObservedObject var foco: FocoViewModel
    @Binding var mostrarAlerta: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Matéria", text: $foco.materia)
                .textInputAutocapitalization(.words)
            
            Stepper("Minutos: \(foco.minutosAlvo)", value: $foco.minutosAlvo, in: 5...60)
            
            Toggle("Som ao terminar", isOn: $foco.somLigado)
            
            DatePicker("Prova", selection: $foco.dataProva, displayedComponents: .date)
            
            Button("Salvar") {
                mostrarAlerta = true
                dismiss()
            }
            .disabled(!foco.formularioValido)
        }
    }
}

#Preview {
    AjustesFocoView(
        foco: FocoViewModel(),
        mostrarAlerta: .constant(false)
    )
}
