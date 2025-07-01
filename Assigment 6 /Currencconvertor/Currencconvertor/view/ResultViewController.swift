//
//  ResultViewController.swift
//  Currencconvertor
//
//  Created by Auburn University Student on 7/1/25.
//
// CONTROLLER - Result ViewController

import UIKit

class ResultViewController: UIViewController {

    var selectedCurrencies: [Currency] = []
    var usdAmount: Int = 0

    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        showConverted()
    }

    func showConverted() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for currency in selectedCurrencies {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "\(currency.name): \(currency.convert(usd: usdAmount))"
            stackView.addArrangedSubview(label)
        }
    }
}

