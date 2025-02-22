//
//  ResultsViewController.swift
//  module6
//
//  Created by Brandon Robb on 2/21/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var currencyOneLabel: UILabel!
    @IBOutlet weak var currencyTwoLabel: UILabel!
    @IBOutlet weak var currencyThreeLabel: UILabel!
    @IBOutlet weak var currencyFourLabel: UILabel!

    @IBOutlet weak var currencyOneStackView: UIStackView!
    @IBOutlet weak var currencyTwoStackView: UIStackView!
    @IBOutlet weak var currencyThreeStackView: UIStackView!
    @IBOutlet weak var currencyFourStackView: UIStackView!
    
    var usdAmount: Int = 0
    var isCurrencyOneSelected: Bool = false
    var isCurrencyTwoSelected: Bool = false
    var isCurrencyThreeSelected: Bool = false
    var isCurrencyFourSelected: Bool = false
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usdLabel.text = "USD: \(usdAmount)"
        
        let converter = CurrencyConverter()
        
        if isCurrencyOneSelected {
            let convertedValue = converter.convert(usd: usdAmount, to: .euro)
            currencyOneStackView.isHidden = false
            currencyOneLabel.text = "\(convertedValue)"
        } else {
            currencyOneStackView.isHidden = true
        }
        
        if isCurrencyTwoSelected {
            let convertedValue = converter.convert(usd: usdAmount, to: .mexican_peso)
            currencyTwoStackView.isHidden = false
            currencyTwoLabel.text = "\(convertedValue)"
        } else {
            currencyTwoStackView.isHidden = true
        }
        
        if isCurrencyThreeSelected {
            let convertedValue = converter.convert(usd: usdAmount, to: .cad)
            currencyThreeStackView.isHidden = false
            currencyThreeLabel.text = "\(convertedValue)"
        } else {
            currencyThreeStackView.isHidden = true
        }
        
        if isCurrencyFourSelected {
            let convertedValue = converter.convert(usd: usdAmount, to: .yen)
            currencyFourLabel.text = "\(convertedValue)"
            currencyFourStackView.isHidden = false
        } else {
            currencyFourStackView.isHidden = true
        }
    }
}
