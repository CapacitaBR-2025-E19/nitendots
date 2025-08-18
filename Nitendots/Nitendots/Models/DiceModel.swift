//
//  DiceModel.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 17/08/25.
//

import Foundation

struct DiceModel: Identifiable {
    let id:UUID = .init()
    
    var type:DiceType
    
    var rolledValue:Int
}
