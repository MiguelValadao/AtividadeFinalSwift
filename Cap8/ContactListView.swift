import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let phone: String
    let email: String
}

// Lista na base da pilha. O toque empurra o detalhe e leva aquele contato junto.
struct ContactListView: View {
    let contacts = [
        Contact(name: "Ana Silva", phone: "(11) 9999-8888", email: "ana.silva@email.com"),
        Contact(name: "Carlos Santos", phone: "(11) 9777-6666", email: "carlos.santos@email.com"),
        Contact(name: "Marina Oliveira", phone: "(11) 9555-4444", email: "marina.oliveira@email.com"),
        Contact(name: "Pedro Costa", phone: "(11) 9333-2222", email: "pedro.costa@email.com")
    ]

    var body: some View {
        NavigationStack {
            List(contacts) { contact in
                NavigationLink {
                    ContactDetailView(contact: contact)
                } label: {
                    VStack(alignment: .leading) {
                        Text(contact.name)
                            .font(.headline)
                        Text(contact.phone)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Contatos")
        }
    }
}

struct ContactDetailView: View {
    let contact: Contact

    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(Color.blue)
                .frame(width: 80, height: 80)
                .overlay(
                    Text(contact.name.prefix(1))
                        .font(.title)
                        .foregroundStyle(.white)
                )

            Text(contact.name)
                .font(.title2)
                .fontWeight(.semibold)

            VStack(spacing: 15) {
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundStyle(.blue)
                    Text(contact.phone)
                    Spacer()
                }
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundStyle(.blue)
                    Text(contact.email)
                    Spacer()
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)

            Spacer()
        }
        .padding()
        .navigationTitle("Detalhes")
    }
}

#Preview {
    ContactListView()
}
