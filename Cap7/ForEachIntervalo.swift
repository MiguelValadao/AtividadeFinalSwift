import SwiftUI

// ForEach tambem vive fora da List. 1...5 vira cinco circulos, cada um maior que o anterior.
struct ForEachIntervalo: View {
    var body: some View {
        VStack {
            ForEach(1...5, id: \.self) { num in
                Circle()
                    .frame(width: CGFloat(20 * num), height: CGFloat(20 * num))
            }
        }
    }
}

#Preview {
    ForEachIntervalo()
}
