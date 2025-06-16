//
//  ViewController.swift
//  Assignment4
//
//  Created by Auburn University Student on 6/15/25.
//

import UIKit

class ViewController: UIViewController {

    // MARK: – Outlets
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var savedEntryLabel: UILabel!

    // MARK: – Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize live label and clear saved entry
        moodLabel.text = moodDescription(for: Int(moodSlider.value))
        savedEntryLabel.text = ""
    }

    // MARK: – Actions

    /// Called when the slider moves — updates the live mood label
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        print("🔔 sliderValueChanged fired, value =", value)
        moodLabel.text = moodDescription(for: value)
    }

    /// Called when "Save Mood" is tapped — formats & displays the saved entry
    @IBAction func saveMoodTapped(_ sender: UIButton) {
        let dateString = DateFormatter.longDate.string(from: datePicker.date)
        // Extract the emoji from the description text
        let emoji = moodDescription(for: Int(moodSlider.value))
                        .components(separatedBy: " ").last ?? ""
        savedEntryLabel.text = "On \(dateString), you felt \(emoji)"
    }
}

// MARK: – Helpers

/// Maps a slider value (0–100) to description + emoji
func moodDescription(for value: Int) -> String {
    switch value {
    case 0...20:   return "Very Sad 😢"
    case 21...40:  return "Sad 🙁"
    case 41...60:  return "Neutral 😐"
    case 61...80:  return "Happy 🙂"
    case 81...100: return "Very Happy 😄"
    default:       return ""
    }
}

extension DateFormatter {
    /// Long‐style date (e.g. “June 16, 2025”)
    static let longDate: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .long
        return df
    }()
}
