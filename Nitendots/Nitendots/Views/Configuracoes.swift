//
//  Configuracoes.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 09/08/25.
//

import SwiftUI

struct Configuracoes: View {
    @ObservedObject var themeManager = ThemeManager.shared
    
    @State var themeMode = ThemeManager.shared.EnumActiveMode
    
    @State var isLangSheetShown = false
    @State var isThemeSheetShown = false
    
    var body: some View {
        ZStack (alignment: .center) {
            themeManager.ActiveTheme.secondary
                .ignoresSafeArea(edges: .all)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 0) {
                    // Lista
                    List {
                        // Botão de Idioma
                        Button(
                            action: {
                                // isLangSheetShown.toggle()
                            },
                            label: {
                                HStack {
                                    Image(systemName: "translate")
                                        .font(.system(size: 25))
                                    
                                    VStack(alignment: .leading) {
                                        Text("Idioma")
                                            .font(.system(size: 20))
                                        Text("Português (pt-BR)")
                                            .font(.system(size: 15))
                                            .foregroundColor(themeManager.ActiveTheme.tertiary)
                                    }
                                }
                            }
                        )
                        .badge("Não Disponivel")
                        .listRowBackground(Color.clear)
                        .foregroundStyle(themeManager.ActiveTheme.tertiary)
                        // Fim do Botão de Idioma
                        
                        // Botão de Tema
                        Button(
                            action: {
                                isThemeSheetShown.toggle()
                            },
                            label: {
                                HStack {
                                    Image(systemName: "circle.righthalf.filled")
                                        .font(.system(size: 35))
                                    
                                    VStack(alignment: .leading) {
                                        Text("Modo do Tema")
                                            .font(.system(size: 20))
                                        Text("Claro (Padrão do Sistema)")
                                            .font(.system(size: 15))
                                            .foregroundColor(themeManager.ActiveTheme.text)
                                    }
                                }
                            }
                        )
                        .badge("Pop-Up")
                        .listRowBackground(Color.clear)
                        .foregroundStyle(themeManager.ActiveTheme.text)
                        // Fim do Botão de Tema
                        
                        // Informativo dos Temas
                        HStack {
                            Image(systemName: "paintbrush.fill")
                                .font(.system(size: 35))
                            
                            VStack(alignment: .leading) {
                                Text("Escolha de Tema")
                                    .font(.system(size: 20))
                                Text("Deslize e selecione!")
                                    .font(.system(size: 15))
                                    .foregroundColor(themeManager.ActiveTheme.text)
                            }
                        }
                        .listRowBackground(Color.clear)
                        .foregroundStyle(themeManager.ActiveTheme.text)
                        // Fim do Informativo dos Temas
                        
                        
                    }
                    .frame(height: 3*65)
                    .listStyle(PlainListStyle())
                    .foregroundStyle(themeManager.ActiveTheme.text)
                    // Fim da Lista
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(themeManager.Themes) { theme in
                                Button(
                                    action: {
                                        themeManager.setTheme(theme)
                                    },
                                    label: {
                                        ThemeSelector(size: 1, theme: theme)
                                            .shadow(
                                                color: theme.isActive ? themeManager.ActiveTheme.accent : themeManager.ActiveTheme.tertiary,
                                                    radius: 10)
                                    }
                                )
                            } .padding(.horizontal, 15)
                        } .padding(.vertical, 15)
                    } .frame(width: UIScreen.main.bounds.width)
                    
                    // Divisória
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: UIScreen.main.bounds.width-30, height: 1)
                        .padding()
                        .foregroundStyle(themeManager.ActiveTheme.text)
                    
                    HStack {
                        Image(systemName: "person.3.fill")
                            .font(.system(size: 50, weight: .bold))
                            .padding()
                            .foregroundStyle(themeManager.ActiveTheme.text)
                        
                        Text("Sobre a equipe:")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(themeManager.ActiveTheme.text)
                    }
                    
                    Text("Equipe 19 - Capacita Brasil 2025")
                        .padding()
                        .foregroundStyle(themeManager.ActiveTheme.text)
                        .font(.system(size: 17,weight: .bold))
                    
                    Text("""
                    Mentor de Design: Lais Cristine
                    Mentor de Codigo: Ian Pacini
                    
                    - Igor de Alencar Faustino
                    - Rian Lima da Silva
                    - Lucas Costa de Jesus
                    - Enzo Medeiros de Sena
                    - Francisco Lupercio Pedroso F. N.
                    
                    Agradecemos por usar nosso projeto! :)
                    """)
                    .padding()
                    .foregroundStyle(themeManager.ActiveTheme.text)
                }
            }
        }
        
        .navigationTitle("Configurações")
        .toolbarBackground(themeManager.ActiveTheme.primary, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible)
        
        // sheets
        
        .sheet(isPresented: $isThemeSheetShown) {
            VStack {
                // Botão e Titulo
                ZStack() {
                    Text("Modo do Tema")
                        .font(.headline)
                        .foregroundStyle(themeManager.ActiveTheme.text)
                    
                    HStack {
                        Spacer()
                        
                        CloserButton(size: 1)
                    }
                }
                // Fim do botão e titulo
                
                Picker("teste", selection: $themeMode) {
                    Text("Claro").tag(ThemeMode.light)
                    Text("Escuro").tag(ThemeMode.dark)
                    Text("Padrão do Sistema").tag(ThemeMode.system)
                }
                .pickerStyle(.segmented)
                .padding()
                .onChange(of: themeMode!) { oldValue, newValue in
                    themeManager.setMode(newValue)
                    
                    isThemeSheetShown = false
                }
                
                Spacer()
            }
            .presentationDetents([.height(200)])
                .presentationDragIndicator(.visible)
                .presentationBackground(themeManager.ActiveTheme.primary)
        }
    }
}

#Preview {
    Configuracoes()
    
    /*
    NavigationStack {
        NavigationLink {
            Configuracoes()
        } label: {
            Text("waow (clique aqui ó)")
        }
    }
    */
}
