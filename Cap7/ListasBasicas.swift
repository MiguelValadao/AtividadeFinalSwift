import SwiftUI

// Tres jeitos de chegar na mesma lista. O primeiro escreve cada linha na mao.
struct ListaSimples: View {
    var body: some View {
        List {
            Text("Capoeira")
            Text("Maracatu")
            Text("Teatro")
            Text("Dança")
        }
    }
}

// O array e a fonte. id: \.self usa a propria string pra distinguir a linha.
// Serve aqui porque nenhum nome repete.
struct ListaDinamica: View {
    let atividades = ["Capoeira", "Maracatu", "Teatro", "Dança"]

    var body: some View {
        List(atividades, id: \.self) { atividade in
            Text(atividade)
        }
    }
}

// ForEach desenha uma view por item. for-in comum so executaria codigo, tipo um print,
// e nada disso apareceria na tela.
struct ListaDinamicaForEach: View {
    let atividades = ["Capoeira", "Maracatu", "Teatro", "Dança"]

    var body: some View {
        List {
            ForEach(atividades, id: \.self) { atividade in
                Text(atividade)
            }
        }
    }
}

#Preview("Fixa") {
    ListaSimples()
}

#Preview("Array") {
    ListaDinamica()
}

#Preview("ForEach") {
    ListaDinamicaForEach()
}
