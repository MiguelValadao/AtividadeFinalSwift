import SwiftUI

// Uma variavel guarda o que foi digitado. Outra guarda o aviso.
// Nao espera o botao de enviar: cada tecla passa pela validacao.
struct ValidacaoCampo: View {
    @State private var email = ""
    @State private var mensagemErro = ""

    // vazio ainda nao e erro. so reclama se ja tem texto e falta @ ou ponto
    private func validarEmail(_ texto: String) {
        if texto.isEmpty || (texto.contains("@") && texto.contains(".")) {
            mensagemErro = ""
        } else {
            mensagemErro = "Por favor, digite um e-mail válido."
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            TextField("E-mail", text: $email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .onChange(of: email) { _, novoValor in
                    validarEmail(novoValor)
                }

            if !mensagemErro.isEmpty {
                Text(mensagemErro)
                    .font(.caption)
                    .foregroundStyle(.red)
            }
        }
        .padding()
    }
}

#Preview {
    ValidacaoCampo()
}
