import SwiftUI
import Combine

class FocoViewModel: ObservableObject {
    @Published var materia: String = ""
    @Published var minutosAlvo: Int = 25
    @Published var nivelFoco: Double = 0.5
    @Published var somLigado: Bool = false
    @Published var dataProva: Date = Date()
    
    var formularioValido: Bool {
        let materiaTratada = materia.trimmingCharacters(in: .whitespaces)
        return !materiaTratada.isEmpty && nivelFoco > 0
    }
    
    func reiniciar() {
        materia = ""
        minutosAlvo = 25
        nivelFoco = 0.5
        somLigado = false
        dataProva = Date()
    }
    
    var estaNoComeco: Bool {
        materia.trimmingCharacters(in: .whitespaces).isEmpty &&
        minutosAlvo == 25 &&
        nivelFoco == 0.5 &&
        !somLigado
    }
}
