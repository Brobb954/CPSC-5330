//
//  MatchDetailViewController.swift
//  module7
//
//  Created by Brandon Robb on 3/1/25.
//


import UIKit

class MatchDetailViewController: UIViewController {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var playersLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var match: Match?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Match Details"
        configureView()
    }
    private func configureView() {
        guard let match = match else { return }
        
        gameLabel.text = "Game: \(match.gameTitle)"
        playersLabel.text = "\(match.player1) vs \(match.player2)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateLabel.text = "Date: \(dateFormatter.string(from: match.date))"
        
        platformLabel.text = "Platform: \(match.platform)"
        statusLabel.text = "Status: \(match.status)"
        
        if let winner = match.winner {
            winnerLabel.text = "Winner: \(winner)"
        } else {
            winnerLabel.text = "Winner: TBD"
        }
        
        descriptionTextView.text = match.description
    }
    


}

