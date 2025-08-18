//
//  DiceSelectorController.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 17/08/25.
//

import Foundation
import SwiftUI

class DiceSelectorController: ObservableObject {
    @Published var allSelectors:[DiceSelector] = [
        .init(diceType: .d4, id: .init(), toggled: true), // atual valor padrão
        .init(diceType: .d6, id: .init(), toggled: false),
        .init(diceType: .d8, id: .init(), toggled: false),
        .init(diceType: .d10, id: .init(), toggled: false),
        .init(diceType: .d12, id: .init(), toggled: false),
        .init(diceType: .d20, id: .init(), toggled: false),
        .init(diceType: .d00, id: .init(), toggled: false),
    ]
    
    func toggleSelector(diceType: DiceType) {
        var i = 0
        for selector in allSelectors {
            if selector.diceType.rawValue == diceType.rawValue {
                allSelectors[i].toggled = true
            }
            else {
                allSelectors[i].toggled = false
            }
            i += 1
        }
        
        DiceManager.shared.currentType = diceType
    }
    
    static let shared:DiceSelectorController = .init()
}
