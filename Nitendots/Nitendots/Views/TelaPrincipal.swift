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
                    Text("NITENDOTS")
                        .font(.system(size: 30, weight: .bold, design: .default))
                    
                    Text("Escolha para onde ir:")
                        .padding(.bottom, 50)
                    
                    // Links de Navigação
                    
                    NavigationLink {
                        RolagemDados()
                    } label: {
                        MenuButton(isDisabled: false, icon: "dice.fill", text: "DADOS")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }
                    
                    // DELETAR O BOTÃO ABAIXO E HABILITAR O NAVIGATIONLINK QUANDO FEITO
                    MenuButton(isDisabled: true, icon: "map.fill", text: "MAPAS")
                        .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                    /*
                    NavigationLink {
                    } label: {
                        MenuButton(isDisabled: true, icon: "map.fill", text: "MAPAS")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    } */
                    
                    // MESMA COISA AQUI!!!!!
                    MenuButton(isDisabled: true, icon: "person.2.fill", text: "PERSONAGENS")
                        .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                    /*
                    NavigationLink {
                    } label: {
                        MenuButton(isDisabled: true, icon: "person.2.fill", text: "PERSONAGENS")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }*/
                    
                    NavigationLink {
                        Configuracoes()
                    } label: {
                        MenuButton(isDisabled: false, icon: "gearshape.fill", text: "CONFIGURAÇÕES")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 90)
                   
                    }
                    
                    // Fim dos Links de Navigação
                    
                    Text("Aplicativo em desenvolvimento, alguns itens não estão funcionais!")
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width, height: 60)
                        .background {
                            Rectangle()
                                .foregroundStyle(Color.orange)
                        }
                }
            }
        }
    }
}

#Preview {
    TelaPrincipal()
}
