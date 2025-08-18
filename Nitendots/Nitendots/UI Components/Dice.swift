//
//  SwiftUIView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 26/07/25.
//

import SwiftUI

struct Dice: View {
    @ObservedObject var themeManager = ThemeManager.shared
    
    let size:CGFloat
    let diceType:DiceType
    let diceValue:Int
    
    var body: some View {
        diceType.shapeUnsized
            .font(.system(size: size*100))
            .frame(width: size*100, height: size*100)
            .overlay{
                Text("\(diceValue)")
                    .font(.system(size: size*40, weight: .bold))
                    .foregroundStyle(themeManager.ActiveTheme.text)
            }
            .foregroundStyle(themeManager.ActiveTheme.primary)
            .shadow(radius: size*10)
    }
    
    init(size: CGFloat, diceType: DiceType, diceValue: Int) {
        self.size = size
        self.diceType = diceType
        self.diceValue = diceValue
    }
    init(size: CGFloat, diceModel: DiceModel) {
        self.size = size
        self.diceType = diceModel.type
        self.diceValue = diceModel.rolledValue
    }
}

#Preview {
    ZStack {
        ThemeManager.shared.ActiveTheme.secondary
        
        Dice(size: 1, diceType: .d00, diceValue: 40)
    }
}
