//
//  Mapa.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 29/08/25.
//

import SwiftUI
import Zoomable

struct Mapa: View {
    @ObservedObject var themeManager = ThemeManager.shared
    
    @State var settingsShown:Bool = false
    @State var showGrid:Bool = false
    
    var body: some View {
        ZStack {
            themeManager.ActiveTheme.primary.ignoresSafeArea(edges: .all)
            
            VStack(spacing: 0) {

                ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                        
                        Image("Map")
                            .resizable()
                            .scaledToFit()
                            .overlay {
                                Image("Grid")
                                    .resizable(resizingMode: .stretch)
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .opacity(showGrid ? 0.5 : 0)
                            }
                    }
                }
                
                Rectangle()
                    .ignoresSafeArea(edges: .all)
                    .frame(height: 200)
                    .foregroundStyle(themeManager.ActiveTheme.primary)
            }
        }
        
        // TOOLBAR
        
        .toolbar {
            ToolbarItem() {
                Button(
                    action: {
                        settingsShown.toggle()
                    },
                    label: {
                        Text("Ajustes")
                    }
                )
            }
        }
        
        // SHEET
        
        .sheet(isPresented: $settingsShown) {
            VStack {
                // Botão e Titulo
                ZStack() {
                    Text("Ajustes de Mapa")
                        .font(.headline)
                        .foregroundStyle(themeManager.ActiveTheme.text)
                    
                    HStack {
                        Spacer()
                        
                        CloserButton(size: 1)
                    }
                }
                
                List{
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Divisórias")
                                .font(.headline)
                            
                            Text("Coloca um grid enumerado sob o mapa!")
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Toggle(isOn: $showGrid, label: {})
                    }
                    
                    Button(
                        action: {
                            // VIEW DOS MAPAS
                        },
                        label: {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 80)
                                .foregroundStyle(themeManager.ActiveTheme.accent)
                                .overlay {
                                    HStack {
                                        Image(systemName: "checklist")
                                            .font(.system(size: 40, weight: .medium))
                                            .foregroundStyle(themeManager.ActiveTheme.primary)
                                        
                                        Spacer()
                                        
                                        Text("Alterar Mapa")
                                            .foregroundStyle(themeManager.ActiveTheme.primary)
                                            .font(.system(size: 30, weight: .black, design: .default))
                                    }
                                    .padding(.horizontal, 50)
                                }
                        }
                    )
                    .buttonStyle(.borderless)
                }
                .listStyle(.plain)
                    .presentationDetents([.height(250)])
                    .presentationDragIndicator(.visible)
                    .presentationBackground(themeManager.ActiveTheme.primary)
            }
        }
    }
}

#Preview {
    Mapa()
}
