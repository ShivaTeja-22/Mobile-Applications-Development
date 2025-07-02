//
//  ViewController.swift
//  Currencconvertor
//
//  Created by Auburn University Student on 7/1/25.
//

// CONTROLLER - Main ViewController
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdTextField: UITextField!
    //@IBOutlet weak var errorLabel: UILabel!

    @IBOutlet weak var inrSwitch: UISwitch!
    @IBOutlet weak var nrsSwitch: UISwitch!
    @IBOutlet weak var eurSwitch: UISwitch!
    @IBOutlet weak var audSwitch: UISwitch!

    var selectedCurrencies: [Currency] = []
    var usdAmount: Int = 0

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            guard let resultVC = segue.destination as? ResultViewController else { return }
            resultVC.selectedCurrencies = selectedCurrencies
            resultVC.usdAmount = usdAmount
        }
    }

    @IBAction func convertTapped(_ sender: UIButton) {
        guard let text = usdTextField.text, let value = Int(text) else {
            //errorLabel.text = "Please enter a valid USD amount (integers only)"
            return
        }
        //errorLabel.text = ""
        usdAmount = value

        selectedCurrencies = []
        let allCurrencies = CurrencyData.all

        if inrSwitch.isOn { selectedCurrencies.append(allCurrencies[0]) }
        if nrsSwitch.isOn { selectedCurrencies.append(allCurrencies[1]) }
        if eurSwitch.isOn { selectedCurrencies.append(allCurrencies[2]) }
        if audSwitch.isOn { selectedCurrencies.append(allCurrencies[3]) }

        performSegue(withIdentifier: "toResultVC", sender: self)
    }
}
