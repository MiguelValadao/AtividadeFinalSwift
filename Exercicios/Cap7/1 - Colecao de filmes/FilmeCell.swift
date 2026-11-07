
import SwiftUI

struct FilmeCell: View {
    var filme: Filme

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(filme.titulo)
                    .font(.headline)

                Spacer()

                Text(String(filme.ano))
                    .foregroundStyle(.secondary)
            }

            Text(filme.genero)
                .foregroundStyle(corDoGenero(filme.genero))

            HStack {
                ForEach(1...5, id: \.self) { estrela in
                    Image(systemName:
                        estrela <= filme.nota
                        ? "star.fill"
                        : "star"
                    )
                    .foregroundStyle(.yellow)
                }
            }
        }
        .padding(.vertical, 4)
    }
}
