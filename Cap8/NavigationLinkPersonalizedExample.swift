import SwiftUI

// O label do link pode ser qualquer view. Texto, icone, card.
struct NavigationLinkPersonalizedExample: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Menu Principal")
                    .font(.largeTitle)

                NavigationLink {
                    Text("Tela de Perfil")
                        .font(.title)
                } label: {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.title)
                        Text("Ver Perfil")
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                }

                NavigationLink {
                    Text("Tela de Configurações")
                        .font(.title)
                } label: {
                    HStack {
                        Image(systemName: "gearshape.fill")
                        Text("Configurações")
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationLinkPersonalizedExample()
}
