//
//  ThemeSelector.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 09/08/25.
//

import SwiftUI

struct ThemeSelector: View {
    let size:CGFloat
    private let theme:Theme
    
    /// Size Multiplier (e.g: 1 = 1x)
    init(size: CGFloat, theme:Theme) {
        self.size = size
        self.theme = theme
    }
    
    var body: some View {
        ZStack {
            // Plano de Fundo do Formato
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundStyle(theme.primary)
                    .frame(height: size*30)
                Rectangle()
                    .foregroundStyle(theme.secondary)
                Rectangle()
                    .foregroundStyle(theme.primary)
                    .frame(height: size*97)
            }
            
            // Elementos Acima
            VStack(spacing: 0) {
                // Imitação da status bar
                HStack {
                    RoundedRectangle(cornerRadius: size*3)
                        .frame(width: size*8, height: size*3)
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: size*5)
                        .frame(width: size*24, height: size*9)
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: size*3)
                        .frame(width: size*8, height: size*3)
                } .padding(.horizontal, size*12)
                    .padding(.top, size*5)
                // Fim da status bar
                
                Spacer()
                    .frame(height: size*9)
                
                // Imitação da navbar
                ZStack {
                    HStack {
                        RoundedRectangle(cornerRadius: size*3)
                            .frame(width: size*18, height: size*3)
                            .foregroundStyle(theme.accent)
                        
                        RoundedRectangle(cornerRadius: size*3)
                            .frame(width: size*24, height: size*3)
                        
                        RoundedRectangle(cornerRadius: size*3)
                            .frame(width: size*18, height: size*3)
                            .foregroundStyle(theme.accent)
                    }
                    .padding(.horizontal, size*10)
                }
                // Fim da navbar
                
                Spacer()
                    .frame(height: size*87)
                
                // Imitação do closer da sheet
                HStack {
                    Spacer()
                    
                    Circle()
                        .frame(width: size*8, height: size*8)
                        .foregroundStyle(theme.closeButton)
                        .padding(.horizontal, size*5)
                } .padding(.top, size*9)
                // Fim do botão de closer
                
                // Imitação do slider da sheet
                ZStack {
                    RoundedRectangle(cornerRadius: size*3)
                        .frame(width: size*78, height: size*1)
                        .foregroundStyle(theme.accent)
                    
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: size*8, height: size*8)
                            .foregroundStyle(theme.closeButton)
                            .padding(.horizontal, size*10)
                    } .padding(.vertical, size*9)
                }
                // Fim do slider
                
                // Imitação do seletor de dados
                HStack (spacing: size*3) {
                    RoundedRectangle(cornerRadius: size*5)
                        .frame(width: size*25, height: size*25)
                        .foregroundStyle(theme.accent)
                    
                    RoundedRectangle(cornerRadius: size*5)
                        .frame(width: size*25, height: size*25)
                        .foregroundStyle(theme.accent)
                    
                    RoundedRectangle(cornerRadius: size*5)
                        .frame(width: size*25, height: size*25)
                        .foregroundStyle(theme.accent.opacity(0.3))
                    
                    RoundedRectangle(cornerRadius: size*5)
                        .frame(width: size*25, height: size*25)
                        .foregroundStyle(theme.accent)
                }
                // Fim dos seletores de dados
                
                RoundedRectangle(cornerRadius: size*5)
                    .frame(width: size*78, height: size*21)
                    .foregroundStyle(theme.accent)
                    .padding(.top, size*4)
                
                Spacer()
            } .frame(width: size*98, height: size*214) // mesmo que o stack superior seja limitado, esse muda de tamanho se os elementos de dentro fujirem do tamanho limite, por favor não tirar esse frame
        }
        .frame(width: size*98, height: size*214)
        .cornerRadius(15)
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.8)
            .ignoresSafeArea(edges: .all)
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 25) {
                ForEach(themes) { theme in
                    ThemeSelector(size: 1, theme: theme)
                }
            }
            .padding(.vertical)
        }
    }
}
