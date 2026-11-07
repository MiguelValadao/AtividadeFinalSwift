import SwiftUI

// Cada campo tem o proprio @State. O controle escreve nele pelo $.
// Form e Section so organizam. Quem manda na tela continua sendo o estado.
struct FormularioRegistroView: View {
    @State private var nome = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var receberNotificacoes = false
    @State private var registroConcluido = false

    var body: some View {
        Form {
            Section(header: Text("Informações Pessoais")) {
                TextField("Nome completo", text: $nome)
                TextField("E-mail", text: $email)
                    .keyboardType(.emailAddress)
                SecureField("Senha", text: $senha)
            }

            Section(header: Text("Preferências")) {
                Toggle("Receber notificações", isOn: $receberNotificacoes)
            }

            Section {
                Button("Registrar") {
                    registrarUsuario()
                }
                // campo vazio deixa o botao morto. a condicao e lida de novo a cada letra
                .disabled(nome.isEmpty || email.isEmpty || senha.isEmpty)
            }
        }
        // o alerta aparece quando registroConcluido vira true.
        // o OK devolve o Bool pra false, por isso o binding
        .alert(isPresented: $registroConcluido) {
            Alert(
                title: Text("Sucesso!"),
                message: Text("Registro concluído com sucesso."),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    func registrarUsuario() {
        // aqui entraria a validacao de verdade. por enquanto so abre o alerta
        registroConcluido = true
    }
}

#Preview {
    FormularioRegistroView()
}
