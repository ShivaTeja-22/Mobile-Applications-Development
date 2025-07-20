import SwiftUI

struct CharacterDetailView: View {
  let character: Character
  
  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        AsyncImage(url: URL(string: character.image)) { phase in
          switch phase {
          case .empty:     ProgressView()
          case .success(let img): img.resizable().scaledToFit()
          case .failure:   Color.gray
          @unknown default: EmptyView()
          }
        }
        .frame(maxWidth: 200, maxHeight: 200)
        .clipShape(Circle())
        
        Text(character.name)
          .font(.title)
          .bold()
        
        HStack(spacing: 20) {
          Label(character.status, systemImage: "heart.fill")
          Label(character.species, systemImage: "leaf.fill")
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        
        Text("Gender: \(character.gender)")
          .font(.body)
        
        Spacer()
      }
      .padding()
    }
    .navigationTitle(character.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}
