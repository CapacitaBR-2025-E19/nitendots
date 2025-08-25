//
//  ChracterViewModel.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 25/08/25.
//

import Foundation
import SwiftUI

@Observable
class CharacterViewModel {
    var characters:[CharacterModel]
    
    var currentCreatedCharacter:CharacterModel = CharacterModel(
        name: "",
        shortDescription: "",
        description: "",
        level: 0,
        classification: .cleric,
        species: "",
        health: 0,
        healthMax: 0,
        defense: 0,
        defenseMax: 0
    )
    
    func createCharacter(_ character:CharacterModel) {
        characters.append(character)
    }
    
    init() {
        let guy = CharacterModel(
            name: "La Creatura",
            shortDescription: "Lorem ipsum dolor sit amet consectur adispicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            description: "Lorem ipsum dolor sit amet consectur adispicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            level: 0,
            classification: .cleric,
            species: "Gatito",
            health: 100,
            healthMax: 100,
            defense: 100,
            defenseMax: 100
        )
        
        characters = [guy]
    }
}
