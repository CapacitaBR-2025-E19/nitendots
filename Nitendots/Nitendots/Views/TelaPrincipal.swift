//
//  TelaPrincipal.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 30/07/25.
//

import SwiftUI

struct TelaPrincipal: View {
    var body: some View {
        // Navstack Principal
        NavigationStack {
            // ZStack Principal
            ZStack {
                // Cor de Fundo
                Color.gray.opacity(0.4)
                    .ignoresSafeArea(edges: .all)
                
                // VStack Principal
                VStack {
                    // NavBar Custom
                    Rectangle()
                        .frame(height: 100)
                        .foregroundStyle(Color.white)
                        .overlay{
                            VStack {
                                // Espaçador do topo
                                Spacer()
                                
                                // Linha horizontal da navbar
                                ZStack(alignment: .bottom) {
                                    // Botão de Configurações
                                    HStack {
                                        NavigationLink {
                                            // TO-DO: VIEW DE CONFIG
                                        } label: {
                                            Circle()
                                                .frame(width: 40, height: 40)
                                                .overlay {
                                                    Image(systemName: "gearshape.fill")
                                                        .font(.system(size: 25, weight: .bold, design: .default))
                                                        .foregroundStyle(Color.white)
                                                }
                                                .padding(10)
                                        }
                                        
                                        Spacer()
                                    }
                                    // Fim do Botão de Configurações
                                    
                                    // Titulo da navbar
                                    HStack {
                                        Text("NITENDOTS")
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                    }
                                    .padding(15)
                                    // Fim do titulo
                                }
                            }
                        }
                        .ignoresSafeArea(edges: .all)
                    // Fim da NavBar Custom
                    
                    Spacer()
                }
            }
        }
    }
        
}

#Preview {
    TelaPrincipal()
}
