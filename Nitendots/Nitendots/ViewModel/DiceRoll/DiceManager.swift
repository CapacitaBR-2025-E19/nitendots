//
//  DiceRoll.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 17/08/25.
//

import Foundation

class DiceManager {
    // VARIAVEIS GLOBAIS
    @Published var latestRoll:[DiceModel] = []
    
    @Published var shared:DiceManager = .init()
    
    // FUNÇÕES
    func roll(diceType:DiceType, count:Int) {
        var localRoll:[DiceModel] = []
        
        for _ in 0..<count {
            var rollValue = Int.random(in: 1...diceType.maxValue)
            
            // Caso especial do dado d00 que é multiplos de 10
            if diceType == .d00 {
                var localDice = DiceModel(type: diceType, rolledValue: rollValue*10)
                
                localRoll.append(localDice)
            }
            else {
                var localDice = DiceModel(type: diceType, rolledValue: rollValue)
                
                localRoll.append(localDice)
            }
        }
        
        self.latestRoll = localRoll
    }
    
    // INICIALIZADOR
    init() {}
}
