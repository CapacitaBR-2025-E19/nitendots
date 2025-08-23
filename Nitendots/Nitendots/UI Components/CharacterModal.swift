//
//  CharacterModal.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 22/08/25.
//

import SwiftUI

struct CharacterModal: View {
    @ObservedObject private var themeManager: ThemeManager = .shared
    
    var body: some View {
        ZStack(alignment: .top) {
            UnevenRoundedRectangle(cornerRadii:
                    .init(topLeading: 60, bottomLeading: 40, bottomTrailing: 40, topTrailing: 40)
            )
            .frame(width: 350, height: 300)
            .foregroundStyle(themeManager.ActiveTheme.primary)
            .overlay {
                VStack(spacing: 0) {
                    Spacer()
                        .frame(height: 130)
                    
                    Text("Descrição:")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(themeManager.ActiveTheme.text)
                    
                    Text("Lorem ipsum dolor sit amet consectur adispicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                        .padding(.horizontal)
                        .lineLimit(3)
                        .foregroundStyle(themeManager.ActiveTheme.text)
                    
                    Spacer()
                    
                    HStack(spacing: -20) {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 100, height: 55)
                            .padding(.horizontal)
                            .foregroundStyle(themeManager.ActiveTheme.tertiary)
                            .overlay {
                                Image(systemName: "gearshape.fill")
                                    .font(.system(size: 30))
                                    .foregroundStyle(themeManager.ActiveTheme.primary)
                            }
                        
                        RoundedRectangle(cornerRadius: 30)
                            .frame(height: 55)
                            .padding(.horizontal)
                            .foregroundStyle(themeManager.ActiveTheme.tertiary)
                            .overlay{
                                Image(systemName: "gamecontroller.fill")
                                    .font(.system(size: 30))
                                    .foregroundStyle(themeManager.ActiveTheme.primary)
                            }
                    }
                    
                    Spacer()
                }
            }
            .shadow(radius: 10)
            
            UnevenRoundedRectangle(cornerRadii:
                    .init(topLeading: 60, bottomLeading: 60, bottomTrailing: 40, topTrailing: 40)
            )
            .frame(width: 350, height: 120)
            .foregroundStyle(themeManager.ActiveTheme.primary)
            .overlay {
                HStack {
                    Circle()
                        .foregroundStyle(themeManager.ActiveTheme.primary)
                        .overlay {
                            Circle()
                                .padding(7.5)
                                .foregroundStyle(.blue) // imagem
                        }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("La Creatura")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(themeManager.ActiveTheme.text)
                        
                        HStack(spacing: 5) {
                            Text("Classe:")
                                .foregroundStyle(themeManager.ActiveTheme.text)
                            
                            Text("Clero")
                                .foregroundStyle(themeManager.ActiveTheme.accent)
                        }
                        
                        HStack(spacing: 5) {
                            Text("Raça:")
                                .foregroundStyle(themeManager.ActiveTheme.text)
                            
                            Text("Gatito")
                                .foregroundStyle(themeManager.ActiveTheme.accent)
                        }
                        
                        HStack(spacing: 5) {
                            Image(systemName: "asterisk")
                                .font(.system(size: 15,weight: .black))
                                .foregroundStyle(.red)
                            
                            Text("100/100")
                                .foregroundStyle(.red)
                                .font(.system(size: 16,weight: .bold))
                            
                            Image(systemName: "shield.lefthalf.filled")
                                .font(.system(size: 15,weight: .black))
                                .foregroundStyle(.blue)
                            
                            Text("100/100")
                                .foregroundStyle(.blue)
                                .font(.system(size: 16,weight: .bold))
                        }
                    }
                    
                    Spacer()
                }
            }
            .shadow(radius: 10)
        }
    }
}

#Preview {
    ZStack {
        Color.orange.edgesIgnoringSafeArea(.all).opacity(0.2)
        
        CharacterModal()
    }
}
