//
//  CharacterModel.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 22/08/25.
//

import Foundation
import SwiftData

enum CharacterClass:String, CaseIterable, Identifiable, Codable {   
    case barbarian = "Barbaro"
    case druid = "Druida"
    case paladin = "Paladino"
    case sorcerer = "Feiticeiro"
    case artificer = "Artifice"
    case bard = "Bardo"
    case fighter = "Guerreiro"
    case ranger = "Guardião"
    case warlock = "Bruxo"
    case rogue = "Ladino"
    case cleric = "Clerigo"
    case monk = "Monge"
    case wizard = "Mago"
    
    var id:String {self.rawValue}
}

@Model
class CharacterModel:Identifiable {
    var image:Data?
    
    var name:String
    var shortDescription:String
    var regularDescription:String
    
    var level:Int
    
    var classification:CharacterClass?
    var species:String
    
    var health:Int
    var healthMax:Int
    
    var defense:Int
    var defenseMax:Int
    
    var id:UUID = UUID()
    
    init(image: Data? = nil, name:String, shortDescription:String, regularDescription:String, level:Int, classification:CharacterClass?, species:String, health:Int, healthMax:Int, defense:Int, defenseMax:Int) {
        self.image = image
        
        self.name = name
        self.shortDescription = shortDescription
        self.regularDescription = regularDescription
        
        self.level = level
        
        self.classification = classification
        self.species = species
        
        self.health = health
        self.healthMax = healthMax
        
        self.defense = defense
        self.defenseMax = defenseMax
    }
}
