//
//  ContentView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 16/07/25.
//

import SwiftUI

struct RolagemDados: View {
    let appearance = {
        var appearanceInner = UINavigationBarAppearance()
        
        appearanceInner.configureWithOpaqueBackground()
        appearanceInner.shadowColor = .black
        appearanceInner.shadowImage = UIImage()
        
        return appearanceInner
    }
    
    var body: some View {
        ZStack (alignment: .bottom) { // ZStack Principal
            // Stack Vertical (principal)
            VStack {
                ZStack(alignment: .center) {
                    // Cor de fundo do Meio
                    
                    Rectangle()
                        .foregroundStyle(
                            Color.backgroundMain
                                .shadow(.inner(color: .black.opacity(0.4), radius: 10, x: 0, y: 0))
                        )
                        .frame(width: UIScreen.main.bounds.width + 20)
                    
                    // Stack Vertical (central)
                    VStack {
                        Spacer()
                        
                        // Grid de dados
                        LazyVGrid(columns: [.init(), .init()], spacing: 32) {
                            ForEach(1..<11) { _ in
                                Rectangle()
                                    .frame(width: 80, height: 80)
                                    .foregroundStyle(Color.white)
                                    .cornerRadius(20)
                                    .rotationEffect(.init(degrees: 45))
                                    .shadow(color: .black.opacity(0.4), radius: 5)
                                    .overlay() {
                                        Text("8")
                                            .font(.system(size: 35, weight: .bold, design: .monospaced))
                                            .foregroundStyle(.gray)
                                    }
                            }
                        } .frame(maxWidth: UIScreen.main.bounds.width)
                        
                        Spacer()
                    }
                }
                
                // Tab Bar
                HStack(spacing: 15) {
                    // Botão de config
                    Button(
                        action: {
                            print("Botão de confirmar apertado (mudar isso aí)")
                        },
                        label: {
                            Image(systemName: "gearshape.fill")
                            .font(.system(size: 50))
                            .padding(.horizontal, 10)
                            .padding(20)
                            .background {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(Color.gray)
                            }
                            .foregroundStyle(.white)
                        }
                    )
                    // Botão de rolagem
                    Button(
                        action: {
                            print("Botão de rolagem apertado (mudar isso aí)")
                        },
                        label: {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(Color.blue)
                                .overlay {
                                    Image("ButtonDice")
                                }
                        }
                    )
                    
                } .frame(height: 100)
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                    .background {
                        Color.white
                            //.shadow(radius: 10)
                            .ignoresSafeArea(.all)
                    }
            }
        }
        .navigationTitle(Text("🎲 Dados 🎲"))
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible)
    }
}

#Preview {
    RolagemDados()
    /*
    NavigationStack {
        NavigationLink {
            RolagemDados()
        } label: {
            Text("waow (clique aqui ó)")
        }
    }
    */
}
