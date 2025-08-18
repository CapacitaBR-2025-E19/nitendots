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
                    VStack (alignment: .center, spacing: 0) {
                        Spacer()
                        
                        LazyVGrid(columns: [.init(), .init()], spacing: 32) {
                            ForEach(diceManager.latestRoll.dropLast(diceManager.latestRoll.count % 2)) { diceModel in
                                Dice(size: 0.8, diceModel: diceModel)
                            }
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: CGFloat(50 * diceManager.latestRoll.dropLast(diceManager.latestRoll.count % 2).count)) // que codigo lindo e legível
                        
                        LazyHStack {
                            ForEach(diceManager.latestRoll.dropFirst(diceManager.latestRoll.count - (diceManager.latestRoll.count % 2))) { diceModel in
                                Dice(size: 0.8, diceModel: diceModel)
                            }
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: CGFloat(50 * diceManager.latestRoll.dropFirst(diceManager.latestRoll.count - (diceManager.latestRoll.count % 2)).count))
                        
                        Spacer()
                    }
                }
                
                // Tab Bar
                HStack(spacing: 15) {
                    // Botão de rolagem
                    Button(
                        action: {
                            diceManager.roll(diceType: diceManager.currentType, count: Int(diceManager.currentCount))
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
        .navigationTitle(Text("🎲 Dados 🎲"))
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
