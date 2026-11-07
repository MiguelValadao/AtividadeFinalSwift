import SwiftUI
import Combine

// Os estados do formulario sairam da View e vieram pra ca.
// Classe, nao struct: a tela e qualquer filha olham o mesmo objeto.
// Struct seria copiada, e a mudanca numa copia nao apareceria na outra.
class RegistroViewModel: ObservableObject {
    // @Published avisa quem esta observando. a tela redesenha sozinha
    @Published var nome = ""
    @Published var email = ""
    @Published var senha = ""
    @Published var receberNotificacoes = false
    @Published var registroConcluido = false

    func registrarUsuario() {
        registroConcluido = true
    }
}
