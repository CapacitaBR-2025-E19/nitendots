//
//  ContentView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 16/07/25.
//

import SwiftUI

struct RolagemDados: View {
    @ObservedObject var themeManager = ThemeManager.shared
    @ObservedObject var diceManager = DiceManager.shared
    @ObservedObject var diceSelectorController = DiceSelectorController.shared
    
    @State var showSettings:Bool = false
    
    var body: some View {
        ZStack (alignment: .bottom) { // ZStack Principal
            // Stack Vertical (principal)
            VStack {
                ZStack(alignment: .center) {
                    // Cor de fundo do Meio
                    
                    Rectangle()
                        .foregroundStyle(
                            themeManager.ActiveTheme.secondary
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
                    // Botão de rolagem
                    Button(
                        action: {
                            print("rolar dados")
                        },
                        label: {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(themeManager.ActiveTheme.accent)
                                .overlay {
                                    HStack {
                                        Spacer()
                                        
                                        Image("ButtonDice")
                                            .renderingMode(.template)
                                            .foregroundStyle(themeManager.ActiveTheme.primary)
                                        
                                        Spacer()
                                        
                                        Text("Rolar Dados")
                                            .foregroundStyle(themeManager.ActiveTheme.primary)
                                            .font(.system(size: 30, weight: .black, design: .default))
                                        
                                        Spacer()
                                    }
                                }
                        }
                    )
                    
                } .frame(height: 100)
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                    .background {
                        themeManager.ActiveTheme.primary
                            //.shadow(radius: 10)
                            .ignoresSafeArea(.all)
                    }
            }
        }
        
        // Toolbar
        .navigationTitle(Text("🎲 Dados 🎲").foregroundStyle(themeManager.ActiveTheme.text))
        .toolbarBackground(themeManager.ActiveTheme.primary, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: {
                            showSettings.toggle()
                        },
                        label: {
                            Text("Ajustes")
                        }
                    )
                }
            }
        // FIM DA TOOLBAR
        
        // Sheets
            .sheet(isPresented: $showSettings) {
                VStack {
                    // Titulo e Closer
                    ZStack() {
                        Text("Configurações de Dado")
                            .font(.headline)
                            .foregroundStyle(themeManager.ActiveTheme.text)
                        
                        HStack {
                            Spacer()
                            
                            CloserButton(size: 1)
                        }
                    }
                    // Fim do Titulo e Closer
                    
                    // Slider da Quantia de Dados
                    HStack{
                        Text("Quantia de Dados:")
                            .foregroundStyle(themeManager.ActiveTheme.text)
                        
                        Text("(\(Int(diceManager.currentCount)))")
                            .foregroundStyle(themeManager.ActiveTheme.accent)
                        
                        Spacer()
                    } .padding(.horizontal, 10)
                    
                    Slider(value: $diceManager.currentCount, in: 1...10, step: 1) {
                    } minimumValueLabel: {
                        Text("1")
                            .foregroundStyle(themeManager.ActiveTheme.text)
                    } maximumValueLabel: {
                        Text("10")
                            .foregroundStyle(themeManager.ActiveTheme.text)
                    }
                    .padding(.horizontal)
                    .tint(themeManager.ActiveTheme.accent)
                    // Fim do Slider
                    
                    // Seletor do Tipo de Dados
                    HStack {
                        Text("Tipo de Dados:")
                            .foregroundStyle(themeManager.ActiveTheme.text)
                        
                        Spacer()
                    } .padding(.horizontal, 10)
                        .padding(.top, 10)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach($diceSelectorController.allSelectors) { selector in
                                Button(
                                    action: {
                                        diceSelectorController.toggleSelector(diceType: selector.wrappedValue.diceType)
                                    },
                                    label: {
                                        selector.wrappedValue
                                    }
                                )
                            }
                        } .padding(.horizontal, 10)
                    }
                    // Fim do Seletor do Tipo de Dados
                    
                    Spacer()
                }
                    .presentationDetents([.height(330)])
                    .presentationDragIndicator(.visible)
                    .presentationBackground(themeManager.ActiveTheme.primary)
            }
        // FIM DAS SHEETS
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
