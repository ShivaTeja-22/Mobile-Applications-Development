import UIKit

class MorningGymQuestViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet var choiceButtons: [UIButton]!   // Connect both choice buttons, in order
  @IBOutlet weak var progressLabel: UILabel!

  // MARK: - Adventure State
  private var rootNode: AdventureNode!
  private var currentNode: AdventureNode!
  private var station = 1

  override func viewDidLoad() {
    super.viewDidLoad()
    configureAdventureTree()
    currentNode = rootNode
    updateUI()
  }

  /// Build the 3-layer tree
  private func configureAdventureTree() {
    // Leaf outcomes
    let success = AdventureNode(
      prompt: "Success! You earned the Morning Champion badge.",
      backgroundAsset: "bgSuccess",
      choices: []
    )
    let failure = AdventureNode(
      prompt: "Game Over. Better luck tomorrow.",
      backgroundAsset: "bgFailure",
      choices: []
    )

    // Layer 3: Cool-Down
    let cooldown = AdventureNode(
      prompt: "Cool-Down: Stretch 5 min or Skip Cool-Down?",
      backgroundAsset: "bgCoolDown",
      choices: [
        AdventureChoice(text: "Stretch 5 min", nextNode: success),
        AdventureChoice(text: "Skip Cool-Down", nextNode: failure)
      ]
    )

    // Layer 2: Main Workout
    let mainWorkout = AdventureNode(
      prompt: "Main Workout: 20 Push-Ups or 60-Second Plank?",
      backgroundAsset: "bgMainWorkout",
      choices: [
        AdventureChoice(text: "20 Push-Ups", nextNode: cooldown),
        AdventureChoice(text: "60s Plank",   nextNode: cooldown)
      ]
    )

    // Layer 1: Warm-Up (root)
    rootNode = AdventureNode(
      prompt: "Warm-Up: Jog for 10 min or Skip Warm-Up?",
      backgroundAsset: "bgWarmUp",
      choices: [
        AdventureChoice(text: "Jog 10 min",   nextNode: mainWorkout),
        AdventureChoice(text: "Skip Warm-Up", nextNode: failure)
      ]
    )
  }

  /// Refreshes all UI elements for the current node
  private func updateUI() {
    // Background image
    backgroundImageView.image = UIImage(named: currentNode.backgroundAsset)

    // Prompt text
    questionLabel.text = currentNode.prompt

    // Buttons (hide extra if <2 choices)
    for (i, button) in choiceButtons.enumerated() {
      if i < currentNode.choices.count {
        button.isHidden = false
        button.setTitle(currentNode.choices[i].text, for: .normal)
      } else {
        button.isHidden = true
      }
    }

    // Progress label
    progressLabel.text = currentNode.choices.isEmpty
      ? ""
      : "Station \(station) of 3"
  }

  /// Called when any choice button is tapped
  @IBAction func choiceTapped(_ sender: UIButton) {
    guard let idx = choiceButtons.firstIndex(of: sender),
          idx < currentNode.choices.count else { return }

    // Advance and refresh
    currentNode = currentNode.choices[idx].nextNode
    station += 1
    updateUI()
  }
}
