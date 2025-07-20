import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case network(Error)
    case badResponse
    case decoding(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:     return "Invalid URL."
        case .network(let e): return e.localizedDescription
        case .badResponse:    return "Bad server response."
        case .decoding(let e):return "Decoding error: \(e.localizedDescription)"
        }
    }
}

protocol APIServiceProtocol {
    func fetchCharacters() async throws -> [Character]
}

struct APIService: APIServiceProtocol {
    func fetchCharacters() async throws -> [Character] {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            throw APIError.invalidURL
        }
        do {
            let (data, resp) = try await URLSession.shared.data(from: url)
            guard (resp as? HTTPURLResponse)?.statusCode == 200 else {
                throw APIError.badResponse
            }
            do {
                let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
                return decoded.results
            } catch {
                throw APIError.decoding(error)
            }
        } catch {
            throw APIError.network(error)
        }
    }
}
