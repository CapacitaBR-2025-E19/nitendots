//
//  SwiftUIView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 06/08/25.
//

import SwiftUI

struct TelaPrincipal: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.3)
                    .ignoresSafeArea(.all)
                
                VStack (spacing: 20) {
                    Text("NINTEDOTS")
                        .font(.system(size: 30, weight: .bold, design: .default))
                    
                    Text("Escolha para onde ir:")
                        .padding(.bottom, 50)
                    
                    // Links de Navigação
                    
                    NavigationLink {
                        RolagemDados()
                    } label: {
                        MenuButton(icon: "dice.fill", text: "DADOS")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }
                    
                    NavigationLink {
                    } label: {
                        MenuButton(icon: "map.fill", text: "MAPAS")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }
                    
                    NavigationLink {
                    } label: {
                        MenuButton(icon: "person.2.fill", text: "PERSONAGENS")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }
                    
                    NavigationLink {
                    } label: {
                        MenuButton(icon: "gearshape.fill", text: "CONFIGURAÇÕES")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }
                }
            }
        }
    }
}

#Preview {
    TelaPrincipal()
}
