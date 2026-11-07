import SwiftUI

struct ReservaSalaView: View {
    @State private var nome: String = ""
    @State private var sala: String = "Laboratório"
    @State private var data: Date = Date()
    @State private var pessoas: Int = 10
    @State private var projetor: Bool = false
    @State private var mostrarAlerta: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Quem reserva") {
                    TextField("Nome", text: $nome)
                        .textInputAutocapitalization(.words)
                    
                    Picker("Sala", selection: $sala) {
                        Text("Laboratório").tag("Laboratório")
                        Text("Biblioteca").tag("Biblioteca")
                        Text("Auditório").tag("Auditório")
                    }
                }
                
                Section("Quando") {
                    DatePicker("Data", selection: $data, displayedComponents: .date)
                    
                    Stepper("Pessoas: \(pessoas)", value: $pessoas, in: 1...40)
                    
                    Toggle("Projetor", isOn: $projetor)
                }
                
                Button("Reservar") {
                    mostrarAlerta = true
                }
                .disabled(nome.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .navigationTitle("Reserva")
            .alert("Reserva feita", isPresented: $mostrarAlerta) {
                Button("OK") { }
            } message: {
                Text("\(sala) reservada para \(nome), \(pessoas) pessoas.")
            }
        }
    }
}

#Preview {
    ReservaSalaView()
}
