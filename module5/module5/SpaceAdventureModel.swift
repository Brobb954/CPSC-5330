//
//  SpaceAdventureModel.swift
//  module5
//
//  Created by Brandon Robb on 2/16/25.
//
import Foundation

struct SpaceAdventureChoice {
    let title: String
    let description: String
    /// Array of options leading to next step(s). If `nil`, it means this is an ending.
    let options: [SpaceAdventureOption]?
}

struct SpaceAdventureOption {
    let title: String
    let nextChoice: SpaceAdventureChoice?
}

struct SpaceAdventureModel {
    let startChoice: SpaceAdventureChoice
    
    init() {
        // Endings (no further options)
        let crashLanding = SpaceAdventureChoice(
            title: "Crash Landing!",
            description: "Your ship loses control and crashes. The adventure ends here.",
            options: nil
        )
        
        let treasureDiscovery = SpaceAdventureChoice(
            title: "Alien Treasure!",
            description: "You discover an ancient alien treasure. Congratulations, you succeeded!",
            options: nil
        )
        
        // Third Layer
        let exploreAlienBase = SpaceAdventureChoice(
            title: "Explore the Alien Base",
            description: "You discover advanced alien technology... and a hidden treasure!",
            options: [
                SpaceAdventureOption(title: "Claim the Treasure", nextChoice: treasureDiscovery),
                SpaceAdventureOption(title: "Trigger an Alarm", nextChoice: crashLanding)
            ]
        )
        
        let wanderPlanet = SpaceAdventureChoice(
            title: "Wander the Planet",
            description: "A sudden sandstorm leaves you stranded. You cannot escape.",
            options: [
                SpaceAdventureOption(title: "Send a Distress Signal", nextChoice: crashLanding)
            ]
        )
        
        // Second Layer
        let landOnPlanet = SpaceAdventureChoice(
            title: "Land on Planet X",
            description: "You land on the surface. A mysterious alien structure is in the distance.",
            options: [
                SpaceAdventureOption(title: "Investigate the Alien Base", nextChoice: exploreAlienBase),
                SpaceAdventureOption(title: "Wander Aimlessly", nextChoice: wanderPlanet)
            ]
        )
        
        let keepTraveling = SpaceAdventureChoice(
            title: "Stay in Orbit",
            description: "You stay in orbit, but an asteroid field approaches!",
            options: [
                SpaceAdventureOption(title: "Navigate the Asteroids", nextChoice: crashLanding),
                SpaceAdventureOption(title: "Attempt to Outrun Them", nextChoice: crashLanding)
            ]
        )
        
        // Start (First Layer)
        startChoice = SpaceAdventureChoice(
            title: "Space Adventure",
            description: "You’re orbiting Planet X. Will you land or keep traveling?",
            options: [
                SpaceAdventureOption(title: "Land on Planet X", nextChoice: landOnPlanet),
                SpaceAdventureOption(title: "Keep Traveling", nextChoice: keepTraveling)
            ]
        )
    }
}

