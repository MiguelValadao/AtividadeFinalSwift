import SwiftUI

// A tela so mostra e manda comando. A regra ficou na ViewModel.
// @StateObject cria o objeto e segura ele enquanto esta view existir.
struct FormularioRegistroComStateObjectView: View {
    @StateObject private var viewModel = RegistroViewModel()

    var body: some View {
        Form {
            Section(header: Text("Informações Pessoais")) {
                TextField("Nome completo", text: $viewModel.nome)
                TextField("E-mail", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                SecureField("Senha", text: $viewModel.senha)
            }

            Section(header: Text("Preferências")) {
                Toggle("Receber notificações", isOn: $viewModel.receberNotificacoes)
            }

            Section {
                Button("Registrar") {
                    viewModel.registrarUsuario()
                }
                .disabled(viewModel.nome.isEmpty || viewModel.email.isEmpty || viewModel.senha.isEmpty)
            }
        }
        .alert(isPresented: $viewModel.registroConcluido) {
            Alert(
                title: Text("Sucesso!"),
                message: Text("Registro concluído com sucesso."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    FormularioRegistroComStateObjectView()
}
