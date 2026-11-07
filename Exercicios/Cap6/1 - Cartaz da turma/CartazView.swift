import SwiftUI

// Complete o cartaz. O enunciado esta em "00 - Capitulo 6".
struct CartazView: View {
    @State private var nome = ""
    @State private var recado = ""
    @State private var mensagemNome = ""
    @State private var mensagemRecado = ""
    @State private var publicado = false
    
    @State private var publicacoes = 0
    @State private var fechamentos = 0
    
    
    private var nomeValido: Bool {
        let limpo = nome.trimmingCharacters(in: .whitespaces)
        let palavras = limpo.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
        let contemNumeros = limpo.contains { $0.isNumber }
        return palavras.count >= 2 && !contemNumeros
    }
    
    private var recadoValido: Bool {
        let total = recado.count
        return total >= 5 && total <= 80
    }
    
    private var nomeVazio: Bool {
        nome.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private var recadoVazio: Bool {
        recado.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private var corBordaNome: Color {
        if nomeVazio { return .gray }
        return nomeValido ? .green : .red
    }
    
    private var corBordaRecado: Color {
        if recadoVazio { return .gray }
        return recadoValido ? .green : .red
    }

    private var mensagemGeral: String {
        if nomeValido && recadoValido {
            return "Pronto para publicar."
        } else if !mensagemNome.isEmpty {
            return mensagemNome
        } else if !mensagemRecado.isEmpty {
            return mensagemRecado
        } else {
            return "Preencha os campos corretamente."
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Contadores (sempre visíveis no topo)
                HStack(spacing: 40) {
                    Text("Publicações: \(publicacoes)")
                    Text("Fechamentos: \(fechamentos)")
                }
                .font(.headline)
                .padding()
                
                if publicado {
                    VStack(spacing: 10) {

                        FigurinhaView()
                        
                        Text(nome)
                            .font(.title)
                            .bold()
                        
                        Text(recado)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                        

                        
                        Button("Fechar") {
                            publicado = false
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(radius: 5)
                    .padding()
                    .onAppear { publicacoes += 1 }
                    .onDisappear { fechamentos += 1 }
                    
                } else {

                    ScrollView {
                        VStack(spacing: 20) {
                            SeloView()
                                .padding(.bottom)
                            
                            // Campo Nome
                            VStack(alignment: .leading) {
                                TextField("Seu nome", text: $nome)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(corBordaNome, lineWidth: 2)
                                    )
                                if !mensagemNome.isEmpty {
                                    Text(mensagemNome).foregroundColor(.red).font(.caption)
                                }
                            }
                            

                            VStack(alignment: .leading) {
                                TextField("Recado", text: $recado)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(corBordaRecado, lineWidth: 2)
                                    )
                                if !mensagemRecado.isEmpty {
                                    Text(mensagemRecado).foregroundColor(.red).font(.caption)
                                }
                            }
                            

                            Text(mensagemGeral)
                                .font(.subheadline)
                                .foregroundColor(nomeValido && recadoValido ? .green : .secondary)
                                .padding()
                            
                            Button("Publicar") {
                                publicado = true
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(!nomeValido || !recadoValido)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Cartaz")
            .onChange(of: nome) { _, novo in
                if novo.trimmingCharacters(in: .whitespaces).isEmpty {
                    mensagemNome = ""
                } else if !nomeValido {
                    mensagemNome = "Use nome e sobrenome, sem números."
                } else {
                    mensagemNome = ""
                }
            }
            .onChange(of: recado) { _, novo in
                if novo.trimmingCharacters(in: .whitespaces).isEmpty {
                    mensagemRecado = ""
                } else if novo.count < 5 {
                    mensagemRecado = "Recado curto demais."
                } else if novo.count > 80 {
                    mensagemRecado = "Recado longo demais."
                } else {
                    mensagemRecado = ""
                }
            }
        }
    }
}

#Preview {
    CartazView()
}

