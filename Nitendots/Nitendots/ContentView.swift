//
//  ContentView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 16/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack (alignment: .bottom) { // stack (topo um em cima outro)
            // Cor de fundo
            Color.gray.opacity(0.3).ignoresSafeArea(edges: .all) // waow
            
            // Stack Vertical (principal)
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
                            .overlay() {
                                Text("8")
                                    .font(.system(size: 50, weight: .bold, design: .monospaced))
                                    .foregroundStyle(.gray)
                            }
                            .shadow(radius: 5)
                    }
                }
                
                Spacer()
                
                // Tab Bar
                HStack {
                    // Botão de config
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 60))
                        .padding(.horizontal, 32)
                        .padding(15)
                        .background {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(Color.gray)
                        }
                        .foregroundStyle(.white)
                    // Botão de rolagem
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(Color.blue)
                        .overlay {
                            Image("ButtonDice")
                        }
                        // pois então tá de boa
                    
                } .frame(height: 100)
                    .padding()
                    .padding(.top, 30)
                    .background {
                        Color.white
                            .shadow(radius: 10)
                            .ignoresSafeArea(.all)
                    }
            }
        } .navigationTitle(Text("🎲 Dados 🎲"))
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible)
    }
}

#Preview {
    NavigationStack {
        NavigationLink {
            ContentView()
        } label: {
            Text("waow (clique aqui ó)")
        }
    }
}
