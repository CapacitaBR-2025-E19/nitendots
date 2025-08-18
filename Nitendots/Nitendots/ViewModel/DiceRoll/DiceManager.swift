//
//  DiceRoll.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 17/08/25.
//

import Foundation
import SwiftUI

class DiceManager:ObservableObject {
    // VARIAVEIS GLOBAIS
    @Published var latestRoll:[DiceModel] = []
    
    @Published var currentType:DiceType = .d4
    @Published var currentCount:Float = 1
    
    static var shared:DiceManager = .init()
    
    // FUNÇÕES
    func roll(diceType:DiceType, count:Int) {
        var localRoll:[DiceModel] = []
        
        for _ in 0..<count {
            let rollValue = Int.random(in: 1...diceType.maxValue)
            
            // Caso especial do dado d00 que é multiplos de 10
            if diceType == .d00 {
                let localDice = DiceModel(type: diceType, rolledValue: rollValue*10)
                
                localRoll.append(localDice)
            }
            else {
                let localDice = DiceModel(type: diceType, rolledValue: rollValue)
                
                localRoll.append(localDice)
            }
        }
        
        self.latestRoll = localRoll
    }
    
    // INICIALIZADOR
    init() {}
}
