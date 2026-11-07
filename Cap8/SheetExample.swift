import SwiftUI

// A sheet nao entra na pilha. Sobe por cima e desce quando fecha.
// showingSheet true abre. O botao Fechar, ou o arraste pra baixo, devolve false.
struct SheetExample: View {
    @State private var showingSheet = false

    var body: some View {
        Button {
            showingSheet = true
        } label: {
            Text("Mostrar Detalhes")
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
                .cornerRadius(8)
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $showingSheet) {
            VStack {
                Text("Estes são os detalhes!")
                    .font(.title)
                Text("Esta sheet aparece por cima da tela principal.")
                    .padding()
                Button("Fechar") {
                    showingSheet = false
                }
                .padding()
            }
        }
    }
}

#Preview {
    SheetExample()
}
