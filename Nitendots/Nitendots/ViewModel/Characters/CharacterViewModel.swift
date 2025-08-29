//
//  ChracterViewModel.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 25/08/25.
//

import Foundation
import SwiftUI
import SwiftData

@Observable
class CharacterViewModel {
    var characters:[CharacterModel]
    
    var currentCreatedCharacter:CharacterModel = CharacterModel(
        name: "",
        shortDescription: "",
        regularDescription: "",
        level: 0,
        classification: .cleric,
        species: "",
        health: 0,
        healthMax: 0,
        defense: 0,
        defenseMax: 0
    )
    
    func resetCharacter() {
        currentCreatedCharacter = CharacterModel(
            name: "",
            shortDescription: "",
            regularDescription: "",
            level: 0,
            classification: .cleric,
            species: "",
            health: 0,
            healthMax: 0,
            defense: 0,
            defenseMax: 0
        )
    }
    
    func saveCharacter(_ character:CharacterModel, context:ModelContext, isEditing:Bool) {
        if !isEditing {
            characters.append(character)
            
            context.insert(character)
        }
        else {
            for storedCharacter in characters {
                if storedCharacter.id == character.id {
                    storedCharacter.name = character.name
                    storedCharacter.shortDescription = character.shortDescription
                    storedCharacter.regularDescription = character.regularDescription
                    storedCharacter.level = character.level
                    storedCharacter.classification = character.classification
                    storedCharacter.species = character.species
                    storedCharacter.health = character.health
                    storedCharacter.healthMax = character.healthMax
                    storedCharacter.defense = character.defense
                    storedCharacter.defenseMax = character.defenseMax
                    
                    
                    context.processPendingChanges()
                }
            }
        }

        do {
            try context.save()
        } catch {
            print("Context save error (ih): \(error)")
        }
    }
    
    func removeCharacter(_ character:CharacterModel, context:ModelContext) {
        characters.removeAll(where: {$0.id == character.id})
        
        context.delete(character)
        do {
            try context.save()
        } catch {
            print("Context delete error (waow): \(error)")
        }
    }
    
    init() {
        let guy = CharacterModel(
            name: "La Creatura",
            shortDescription: "Lorem ipsum dolor sit amet consectur adispicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            regularDescription: "Lorem ipsum dolor sit amet consectur adispicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
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
