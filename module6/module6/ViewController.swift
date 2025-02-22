//
//  ViewController.swift
//  module6
//
//  Created by Brandon Robb on 2/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var currencyOneSwitch: UISwitch!
    @IBOutlet weak var currencyTwoSwitch: UISwitch!
    @IBOutlet weak var currencyThreeSwitch: UISwitch!
    @IBOutlet weak var currencyFourSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showResultsSegue" {
            guard let input = usdTextField.text, let _ = Int(input) else {
                errorLabel.text = "Please enter a valid integer"
                errorLabel.isHidden = false
                return false
            }
            errorLabel.isHidden = true
            return true
        }
        return super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultsSegue" {
            if let destinationVC = segue.destination as? ResultViewController,
               let usdValue = Int(usdTextField.text!) {
                destinationVC.usdAmount = usdValue
                destinationVC.isCurrencyOneSelected = currencyOneSwitch.isOn
                destinationVC.isCurrencyTwoSelected = currencyTwoSwitch.isOn
                destinationVC.isCurrencyThreeSelected = currencyThreeSwitch.isOn
                destinationVC.isCurrencyFourSelected = currencyFourSwitch.isOn

                
            }
                
            
        }
    }
    }


