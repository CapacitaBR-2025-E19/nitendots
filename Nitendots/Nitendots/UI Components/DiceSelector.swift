//
//  SwiftUIView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 16/07/25.
//

import SwiftUI

// O enum de tipo de dado

enum DiceType:String {
    case d4 = "4"
    case d6 = "6"
    case d8 = "8"
    case d10 = "10"
    case d00 = "00"
    case d12 = "12"
    case d20 = "20"
    
    var shape:some View {
        switch self {
            case .d4:
                return Image(systemName: "triangle.fill")
                .rotationEffect(.degrees(0))
                .font(.system(size: 40, weight: .semibold))
            case .d6:
                return Image(systemName: "square.fill")
                .rotationEffect(.degrees(0))
                .font(.system(size: 40, weight: .semibold))
            case .d8, .d10, .d00:
                return Image(systemName: "square.fill")
                .rotationEffect(.degrees(45))
                .font(.system(size: 37.5, weight: .semibold))
            case .d12:
                return Image(systemName: "pentagon.fill")
                .rotationEffect(.degrees(0))
                .font(.system(size: 40, weight: .semibold))
            case .d20:
                return Image(systemName: "hexagon.fill")
                .rotationEffect(.degrees(0))
                .font(.system(size: 40, weight: .semibold))
        }
    }
}

// Parte Principal

struct DiceSelector: View {
    let diceType:DiceType
    
    @State var toggled:Bool
    
    // Corpo do Seletor
    var body: some View {
        ZStack(content:{
            Button(
                action: {
                    toggled = !toggled
                },
                label: {
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .foregroundColor(toggled ? .blue.opacity(0.15) : .blue)
                        .cornerRadius(25)
                        .overlay (alignment: .top) {
                            VStack (alignment: .center, spacing: 0) {
                                // Symbol
                                diceType.shape
                                    .foregroundStyle(toggled ? Color.blue  : Color.white)
                                    .frame(width: 45, height: 45) // frame constante, tamanho não
                                    .padding(.top, 10)
                                // Number
                                Text(diceType.rawValue)
                                    .font(.system(size: 50, weight: .semibold))
                                    .foregroundStyle(toggled ? Color.blue : Color.white)
                            }
                        }
                }
            )

                /*
                .onTapGesture {
                    toggled = !toggled
                    
                    // implementar isso aqui depois: https://www.youtube.com/watch?v=JdUs3GD2zzI
                }
                */
        })
    }
}

#Preview {
    // Deu uma preguiça de fazer uma LazyVGrid ó, tentei
    VStack{
        HStack {
            VStack {
                DiceSelector(diceType: .d4, toggled: false)
                DiceSelector(diceType: .d6, toggled: false)
                DiceSelector(diceType: .d8, toggled: false)
            }
            VStack {
                DiceSelector(diceType: .d10, toggled: false)
                DiceSelector(diceType: .d12, toggled: false)
                DiceSelector(diceType: .d20, toggled: false)
            }
        }
        
        DiceSelector(diceType: .d00, toggled: false)
    }
}
