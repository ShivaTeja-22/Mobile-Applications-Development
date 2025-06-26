import Foundation

/// A single choice in the adventure.
struct AdventureChoice {
  let text: String
  let nextNode: AdventureNode
}

/// A node in the adventure tree.
class AdventureNode {
  let prompt: String
  let backgroundAsset: String
  let choices: [AdventureChoice]

  init(prompt: String,
       backgroundAsset: String,
       choices: [AdventureChoice]) {
    self.prompt = prompt
    self.backgroundAsset = backgroundAsset
    self.choices = choices
  }
}

