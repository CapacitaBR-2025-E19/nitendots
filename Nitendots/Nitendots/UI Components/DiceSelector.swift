//
//  SwiftUIView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 16/07/25.
//

import SwiftUI



struct DiceSelector: View, Identifiable {
    @ObservedObject private var themeManager = ThemeManager.shared
    
    let diceType:DiceType
    let id:UUID
    
    var toggled:Bool
    
    // Corpo do Seletor
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 120, height: 120)
                .foregroundColor(toggled ? themeManager.ActiveTheme.accent.opacity(0.15) : themeManager.ActiveTheme.accent)
                .cornerRadius(25)
                .overlay (alignment: .top) {
                    VStack (alignment: .center, spacing: 0) {
                        // Symbol
                        diceType.shape
                            .foregroundStyle(toggled ? themeManager.ActiveTheme.accent  : themeManager.ActiveTheme.primary)
                            .frame(width: 45, height: 45) // frame constante, tamanho não
                            .padding(.top, 10)
                        // Number
                        Text(diceType.rawValue)
                            .font(.system(size: 50, weight: .semibold))
                            .foregroundStyle(toggled ? themeManager.ActiveTheme.accent : themeManager.ActiveTheme.primary)
                    }
                }
        }
    }
}

#Preview {
    // Deu uma preguiça de fazer uma LazyVGrid ó, tentei
    VStack{
        HStack {
            VStack {
                DiceSelector(diceType: .d4, id: .init(), toggled: true)
                DiceSelector(diceType: .d6, id: .init(), toggled: false)
                DiceSelector(diceType: .d8, id: .init(), toggled: false)
            }
            VStack {
                DiceSelector(diceType: .d10, id: .init(), toggled: false)
                DiceSelector(diceType: .d12, id: .init(), toggled: false)
                DiceSelector(diceType: .d20, id: .init(), toggled: false)
            }
        }
        
        DiceSelector(diceType: .d00, id: .init(), toggled: false)
    }
}
