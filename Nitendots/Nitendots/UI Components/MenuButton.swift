//
//  SwiftUIView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 06/08/25.
//

import SwiftUI

enum MenuButtonState {
    case normal
    case pressed
    case disabled
}

struct MenuButton: View {
    // Variável de estado
    @State private var buttonState:MenuButtonState = .normal
    
    @ObservedObject var themeManager = ThemeManager.shared
    
    // Variáveis de cor de foreground e background
    var colorFg:Color {
        switch buttonState {
            case .normal, .disabled:
                return themeManager.ActiveTheme.primary
            case .pressed:
                return themeManager.ActiveTheme.accent
        }
    }
    var colorBg:Color {
        switch buttonState {
            case .normal:
                return themeManager.ActiveTheme.accent
            case .pressed:
                return themeManager.ActiveTheme.accent.opacity(0.3)
            case .disabled:
                return themeManager.ActiveTheme.tertiary
        }
    }
    
    // Variáveis de instancia
    let icon:String
    let text:String
    
    // Inicializadores
    init(isDisabled: Bool, icon: String, text: String) {
        if isDisabled {
            self.buttonState = .disabled
        }
        else {
            self.buttonState = .normal
        }
        
        self.icon = icon
        self.text = text
    }
    
    // Corpo
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(colorBg)
            .overlay {
                HStack {
                    Image(systemName: icon)
                        .font(.system(size: 40, weight: .regular))
                        .foregroundStyle(colorFg)
                        .padding(.trailing, 15)
                    
                    Text(text)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(colorFg)
                }
                .padding(10)
            }
        /*
            .onTapGesture {
                isPressed = !isPressed
            }
        */
        
        //navlink não funfa com o on-tap acima, se não der pra descobrir uma maneira, fica assim msm
    }
}

#Preview {
    MenuButton(isDisabled: false, icon: "square.fill", text: "PERSONAGENS")
        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
}
