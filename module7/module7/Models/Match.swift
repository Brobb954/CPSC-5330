//
//  Match.swift
//  module7
//
//  Created by Brandon Robb on 3/1/25.
//

import Foundation

struct Match {
    let id: String
    let gameTitle: String
    let player1: String
    let player2: String
    let platform: String
    let date: Date
    let status: String
    let winner: String?
    let description: String

    static func sampleMatches() -> [Match] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'"

        return [
            Match(
                id: "M001", gameTitle: "Fortnite", player1: "Ninja",
                player2: "Tfue",
                platform: "PC", date: dateFormatter.date(from: "2025-03-15")!,
                status: "Completed", winner: "Ninja",
                description:
                    "Epic build battle with a surprising sniper finish."),

            Match(
                id: "M002", gameTitle: "League of Legends", player1: "T1",
                player2: "DWG KIA",
                platform: "PC", date: dateFormatter.date(from: "2025-04-10")!,
                status: "Completed", winner: "T1",
                description:
                    "Intense 45-minute match with multiple team fights and objective steals."
            ),

            Match(
                id: "M003", gameTitle: "Counter-Strike 2", player1: "FaZe Clan",
                player2: "Team Liquid",
                platform: "PC", date: dateFormatter.date(from: "2025-04-22")!,
                status: "Completed", winner: "FaZe Clan",
                description:
                    "Tactical showdown on Dust2 with incredible clutch plays."),

            Match(
                id: "M004", gameTitle: "Valorant", player1: "Sentinels",
                player2: "100 Thieves",
                platform: "PC", date: dateFormatter.date(from: "2025-04-30")!,
                status: "Completed", winner: "Sentinels",
                description:
                    "Fast-paced action with outstanding agent utility usage."),

            Match(
                id: "M005", gameTitle: "Apex Legends", player1: "TSM",
                player2: "NRG",
                platform: "PC", date: dateFormatter.date(from: "2025-05-08")!,
                status: "Completed", winner: "TSM",
                description:
                    "Exciting final circle with squad wipes and clever rotations."
            ),

            Match(
                id: "M006", gameTitle: "Rocket League", player1: "G2 Esports",
                player2: "Spacestation",
                platform: "Cross-platform",
                date: dateFormatter.date(from: "2025-05-15")!,
                status: "Completed", winner: "G2 Esports",
                description: "Aerial mastery in a nail-biting overtime finish."),

            Match(
                id: "M007", gameTitle: "Dota 2", player1: "Team Secret",
                player2: "OG",
                platform: "PC", date: dateFormatter.date(from: "2025-05-20")!,
                status: "Completed", winner: "OG",
                description: "Strategic masterclass with unexpected hero picks."
            ),

            Match(
                id: "M008", gameTitle: "Overwatch 2",
                player1: "Shanghai Dragons",
                player2: "Dallas Fuel",
                platform: "PC", date: dateFormatter.date(from: "2025-05-28")!,
                status: "Scheduled", winner: nil,
                description:
                    "Championship rematch between two powerhouse teams."),

            Match(
                id: "M009", gameTitle: "Street Fighter 6", player1: "Daigo",
                player2: "Tokido",
                platform: "PS5", date: dateFormatter.date(from: "2025-06-04")!,
                status: "Scheduled", winner: nil,
                description: "Legacy matchup between fighting game legends."),

            Match(
                id: "M010", gameTitle: "Call of Duty: Warzone",
                player1: "Scump",
                player2: "Dr Disrespect",
                platform: "PC", date: dateFormatter.date(from: "2025-06-10")!,
                status: "Scheduled", winner: nil,
                description: "Anticipated showdown between two fan favorites."),
            
            Match(
                id: "M011", gameTitle: "Apex Legends", player1: "Aceu",
                player2: "Shroud",
                platform: "PC", date: dateFormatter.date(from: "2025-01-22")!,
                status: "Completed", winner: "Shroud",
                description:
                    "Intense final circle with both players showing incredible movement skills."),

            Match(
                id: "M012", gameTitle: "Call of Duty: Warzone", player1: "Aydan",
                player2: "HusKerrs",
                platform: "PlayStation", date: dateFormatter.date(from: "2025-04-08")!,
                status: "Scheduled", winner: "",
                description:
                    "Highly anticipated rematch after their controversial tournament final."),

            Match(
                id: "M013", gameTitle: "Valorant", player1: "TenZ",
                player2: "ScreaM",
                platform: "PC", date: dateFormatter.date(from: "2025-02-17")!,
                status: "Completed", winner: "TenZ",
                description:
                    "Tactical showcase with impressive operator plays determining the outcome."),

            Match(
                id: "M014", gameTitle: "Rocket League", player1: "Jstn",
                player2: "Squishy",
                platform: "Xbox", date: dateFormatter.date(from: "2025-05-30")!,
                status: "Cancelled", winner: "",
                description:
                    "Exhibition match cancelled due to server maintenance issues."),

            Match(
                id: "M015", gameTitle: "Fortnite", player1: "Bugha",
                player2: "Mongraal",
                platform: "PC", date: dateFormatter.date(from: "2025-03-29")!,
                status: "Completed", winner: "Mongraal",
                description:
                    "Box fight showdown with multiple highlight-worthy edits and plays.")

        ]
    }
}
