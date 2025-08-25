//
//  CharacterModel.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 22/08/25.
//

import Foundation

enum CharacterClass:String, CaseIterable, Identifiable {   
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

struct CharacterModel:Identifiable {
    var name:String
    var shortDescription:String
    var description:String
    
    var level:Int
    
    var classification:CharacterClass?
    var species:String
    
    var health:Int
    var healthMax:Int
    
    var defense:Int
    var defenseMax:Int
    
    let id:UUID = UUID()
}
