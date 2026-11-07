import SwiftUI

// ScrollView + HStack rola pro lado, no jeito dos stories.
// Com muitos itens a List aguenta melhor. Aqui o ganho e a direcao.
struct ForEachScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1...8, id: \.self) { num in
                    Circle()
                        .frame(width: CGFloat(30 * num), height: CGFloat(30 * num))
                }
            }
            .padding()
        }
    }
}

#Preview {
    ForEachScrollView()
}
