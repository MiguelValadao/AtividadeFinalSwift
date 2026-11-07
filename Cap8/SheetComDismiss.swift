import SwiftUI

// Mesma sheet, mas o miolo virou outra view.
// No Xcode isso sai do Extract Subview, que cria uma struct chamada ExtractedView.
// Renomeei pra DetalheSheetView pra ficar claro o que ela e.
struct SheetComDismiss: View {
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
            DetalheSheetView()
                // da pra limitar a altura: .presentationDetents([.medium, .large])
        }
    }
}

struct DetalheSheetView: View {
    // o sistema entrega o dismiss. a sheet fecha sem precisar receber o Bool da tela de baixo
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Text("Estes são os detalhes!")
                .font(.title)
            Text("Esta sheet aparece por cima da tela principal.")
                .padding()
            Button("Fechar") {
                dismiss()
            }
            .padding()
        }
    }
}

#Preview {
    SheetComDismiss()
}
