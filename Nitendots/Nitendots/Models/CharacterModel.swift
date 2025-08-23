//
//  CharacterModel.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 22/08/25.
//

import Foundation

enum CharacterClass:String, CaseIterable {
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
}

struct CharaterModel {
    var name:String
    var shortDescription:String
    var description:String
    
    var level:Int
    var experience:Int
    
    var classification:CharacterClass
    var species:String // eu quero muito fazer um seletor disso, mas QUE PREGUIÇA de colocar TROÇENTAS RAÇAS e ainda não conseguir colocar todas
    
    var health:Int
    var healthMax:Int
    
    var defense:Int
    var defenseMax:Int
    
    // FUNÇÕES
    
    func damage() {
        // implementar calculo de dano amanhã (TO-DO 23/08)
    }
    
    func heal() {
        // mesma coisa aqui
    }
}
