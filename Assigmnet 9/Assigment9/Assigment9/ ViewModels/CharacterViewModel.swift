import Foundation

@MainActor
class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let api: APIServiceProtocol
    
    init(api: APIServiceProtocol = APIService()) {
        self.api = api
    }
    
    func fetchCharacters() async {
        isLoading = true
        errorMessage = nil
        do {
            let chars = try await api.fetchCharacters()
            characters = chars
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
