import SwiftUI

struct ContentView: View {
  @EnvironmentObject var vm: CharacterViewModel
  
  var body: some View {
    NavigationStack {
      Group {
        if vm.isLoading {
          ProgressView("Loading…")
            .padding()
        } else if let error = vm.errorMessage {
          Text(error)
            .foregroundColor(.red)
            .padding()
        } else {
          List(vm.characters) { char in
            NavigationLink(value: char) {
              HStack(spacing: 16) {
                AsyncImage(url: URL(string: char.image)) { phase in
                  switch phase {
                  case .empty:     ProgressView()
                  case .success(let img): img.resizable().scaledToFill()
                  case .failure:   Color.gray
                  @unknown default: EmptyView()
                  }
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                
                Text(char.name)
                  .font(.headline)
              }
              .padding(.vertical, 4)
            }
          }
          .listStyle(.plain)
        }
      }
      .navigationTitle("Characters")
      .navigationBarTitleDisplayMode(.inline)
      .task { await vm.fetchCharacters() }
      .navigationDestination(for: Character.self) { char in
        CharacterDetailView(character: char)
      }
    }
  }
}

#Preview {
    ContentView()
      .environmentObject(CharacterViewModel())
}
