import Foundation

struct Character: Identifiable, Codable ,Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
