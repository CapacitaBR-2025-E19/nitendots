//
//  SwiftUIView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 06/08/25.
//

import SwiftUI

struct TelaPrincipal: View {
    @ObservedObject var themeManager = ThemeManager.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                themeManager.ActiveTheme.secondary
                    .ignoresSafeArea(.all)
                
                VStack (spacing: 20) {
                    Text("NITENDOTS")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundStyle(themeManager.ActiveTheme.text)
                    
                    Text("Escolha para onde ir:")
                        .padding(.bottom, 50)
                        .foregroundStyle(themeManager.ActiveTheme.text)
                    
                    // Links de Navigação
                    
                    NavigationLink {
                        RolagemDados()
                    } label: {
                        MenuButton(isDisabled: false, icon: "dice.fill", text: "DADOS")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }
                    
                    NavigationLink {
                        Personagens()
                    } label: {
                        MenuButton(isDisabled: false, icon: "person.2.fill", text: "PERSONAGENS")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }
                    
                    NavigationLink {
                        Configuracoes()
                    } label: {
                        MenuButton(isDisabled: false, icon: "gearshape.fill", text: "CONFIGURAÇÕES")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }
                    
                    Text("1.0.0")
                }
            }
        }
        .tint(themeManager.ActiveTheme.accent)
        .preferredColorScheme(themeManager.ActiveMode)
    }
}

#Preview {
    TelaPrincipal()
}
