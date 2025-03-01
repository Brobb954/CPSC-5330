//
//  MatchListViewController.swift
//  module7
//
//  Created by Brandon Robb on 3/1/25.
//

import UIKit

class MatchListViewController: UIViewController, UITableViewDelegate,
    UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!

    private let matches = Match.sampleMatches()

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Match Tracker"

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMatchDetail",
            let destinationVC = segue.destination as? MatchDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow
        {
            destinationVC.match = matches[indexPath.row]
        }

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return matches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "MatchCell", for: indexPath)
        let match = matches[indexPath.row]

        var content = cell.defaultContentConfiguration()

        content.text = "\(match.player1) vs \(match.player2)"
        content.secondaryText =
            "\(match.gameTitle) - \(dateFormatter.string(from: match.date))"
        cell.contentConfiguration = content

        return cell

    }

    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
        performSegue(withIdentifier: "ShowMatchDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
