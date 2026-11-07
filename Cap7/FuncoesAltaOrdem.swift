import SwiftUI

// map, filter e reduce recebem uma funcao e devolvem outra colecao, ou um valor so.
// $0 e o item. no reduce, $0 e o acumulador e $1 e o item.
// Na apostila isso aparece com print. Aqui o resultado fica na tela pra ver sem abrir o console.
struct FuncoesAltaOrdem: View {
    private let numeros = [1, 2, 3, 4, 5, 6]
    private let nomes = ["Ana", "Bruno", "Carlos"]
    private let idades = [12, 18, 25, 16, 30]
    private let precos = [19.99, 29.99, 39.99]
    private let frutas = ["maçã", "manga", "laranja"]

    var body: some View {
        List {
            Section("map — transforma cada item") {
                Text("\(lista(numeros)) virou \(lista(numeros.map { $0 * 2 }))")
                Text(nomes.map { "Olá, \($0)!" }.joined(separator: "  "))
            }

            Section("filter — fica quem passa no teste") {
                Text("pares: \(lista(numeros.filter { $0 % 2 == 0 }))")
                Text("maiores de idade: \(lista(idades.filter { $0 >= 18 }))")
            }

            Section("reduce — junta tudo num valor") {
                Text("soma de 1 a 5: \([1, 2, 3, 4, 5].reduce(0) { $0 + $1 })")
                Text(String(format: "total dos preços: %.2f", precos.reduce(0, +)))
            }

            Section("forEach — faz uma coisa com cada um, nao monta lista nova") {
                // o resultado abaixo foi montado so pra aparecer na tela.
                // frutas.forEach { print(...) } escreveria a mesma frase no console
                ForEach(frutas, id: \.self) { fruta in
                    Text("Eu gosto de \(fruta)")
                }
            }
        }
    }

    private func lista(_ valores: [Int]) -> String {
        valores.map(String.init).joined(separator: ", ")
    }
}

#Preview {
    FuncoesAltaOrdem()
}
