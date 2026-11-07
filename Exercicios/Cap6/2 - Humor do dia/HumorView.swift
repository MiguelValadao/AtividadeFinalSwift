import SwiftUI

// Complete o humor do dia. O enunciado esta em "00 - Capitulo 6".

struct HumorView: View {
    @State private var humor = "Neutro"
    @State private var observacao = ""
    @State private var textoDeApoio = "Como foi o dia?"
    @State private var aviso = ""
    
    private var corBorda: Color {
        let limpo = observacao.trimmingCharacters(in: .whitespaces)
        if limpo.isEmpty { return .gray }
        return limpo.count >= 8 ? .green : .red
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // Seletor de Humor
                Picker("Humor", selection: $humor) {
                    Text("Feliz").tag("Feliz")
                    Text("Triste").tag("Triste")
                    Text("Neutro").tag("Neutro")
                    Text("Animado").tag("Animado")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                // Campo de Texto de Observação
                VStack(alignment: .leading, spacing: 8) {
                    TextField(textoDeApoio, text: $observacao, axis: .vertical)
                        .lineLimit(4, reservesSpace: true)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(corBorda, lineWidth: 2)
                        )
                    
                    if !aviso.isEmpty {
                        Text(aviso)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                .padding(.horizontal)
                

                Button("Guardar") {

                }
                .buttonStyle(.borderedProminent)
                .disabled(observacao.trimmingCharacters(in: .whitespaces).count < 8)
                .padding()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle("Humor")
            .onChange(of: humor) { _, novo in
                if novo == "Triste" {
                    textoDeApoio = "Quer conversar sobre isso?"
                } else if novo == "Feliz" {
                    textoDeApoio = "Que bom! Conte mais..."
                } else if novo == "Animado" {
                    textoDeApoio = "O que te animou?"
                } else {
                    textoDeApoio = "Como foi o dia?"
                }
            }
            .onChange(of: observacao) { _, novo in
                let limpo = novo.trimmingCharacters(in: .whitespaces)
                if limpo.isEmpty {
                    aviso = ""
                } else if limpo.count < 8 {
                    aviso = "Escreva um pouco mais sobre o seu dia."
                } else {
                    aviso = ""
                }
            }
        }
    }
}

#Preview {
    HumorView()
}
