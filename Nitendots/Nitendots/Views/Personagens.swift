//
//  Personagens.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 22/08/25.
//

import SwiftUI

struct Personagens: View {
    @State var characterViewModel = CharacterViewModel()
    
    @ObservedObject private var themeManager:ThemeManager = .shared
    
    var body: some View {
        ZStack {
            themeManager.ActiveTheme.secondary
                .ignoresSafeArea(edges: .all)
            
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 20)
                    
                    ForEach(characterViewModel.characters) { character in
                        @State var charLocal = character
                        CharacterModal(size: 1, character: $charLocal, characterViewModel: $characterViewModel)
                            .padding(.horizontal)
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink{
                        PersonagensCreation(characterInfo: $characterViewModel.currentCreatedCharacter, characterViewModel: $characterViewModel, isEditing: false)
                    } label: {
                        Text("Adicionar")
                    }
                }
            }
            .navigationTitle("Personagens")
            .toolbarBackground(themeManager.ActiveTheme.primary, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible)
        }
    }
}

#Preview {
    Personagens()
}
