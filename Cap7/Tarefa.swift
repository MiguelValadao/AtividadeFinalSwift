import SwiftUI

// Identifiable da um id estavel. O ForEach usa esse id e a gente nao precisa passar \.self.
struct Tarefa: Identifiable {
    let id = UUID()
    var titulo: String
    var data: Date
    var concluida = false
}
