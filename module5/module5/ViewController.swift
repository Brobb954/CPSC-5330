//
//  ViewController.swift
//  module5
//
//  Created by Brandon Robb on 2/16/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    
    @IBAction func optionSelected(_ sender: UIButton) {
        // If currentChoice has options, use them; otherwise, restart.
        if let choice = currentChoice, let options = choice.options {
            if sender == optionButton1 {
                currentChoice = options[0].nextChoice
            } else if sender == optionButton2, options.count > 1 {
                currentChoice = options[1].nextChoice
            }
        } else {
            // No options: show Restart
            currentChoice = model.startChoice
        }
        updateUI()
    }
    
    let model = SpaceAdventureModel()
    var currentChoice: SpaceAdventureChoice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentChoice = model.startChoice
        updateUI()
    }
    
    


    func updateUI() {
        guard let choice = currentChoice else {
            return
        }
        
        titleLabel.text = choice.title
        descriptionLabel.text = choice.description
        
        if let options = choice.options {
            // There are options: show them
            optionButton1.isHidden = false
            optionButton1.setTitle(options[0].title, for: .normal)
            
            if options.count > 1 {
                optionButton2.isHidden = false
                optionButton2.setTitle(options[1].title, for: .normal)
            } else {
                optionButton2.isHidden = true
            }
        } else {
            optionButton1.isHidden = false
            optionButton1.setTitle("Restart", for: .normal)
            optionButton2.isHidden = true
        }
    }
}
