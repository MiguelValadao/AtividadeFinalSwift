import SwiftUI

// onChange fica de olho numa propriedade. Cada letra nova roda o bloco.
// O campo continua ligado no @State. Isto aqui so reage a mudanca.
struct Observador: View {
    @State private var nome = ""
    @State private var mensagem = "Digite seu nome acima."

    var body: some View {
        VStack {
            TextField("Seu nome", text: $nome)
                .textFieldStyle(.roundedBorder)
                .onChange(of: nome) { _, novoValor in
                    if !novoValor.isEmpty {
                        mensagem = "Olá, \(novoValor)! Estamos observando você digitar."
                    } else {
                        mensagem = "Digite seu nome acima."
                    }
                }

            Text(mensagem)
                .padding()
        }
        .padding()
    }
}

#Preview {
    Observador()
}
