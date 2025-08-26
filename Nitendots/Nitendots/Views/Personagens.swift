//
//  Personagens.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 22/08/25.
//

import SwiftUI

struct Personagens: View {
    @State var characterViewModel = CharacterViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(characterViewModel.characters) { charater in
                    CharacterModal(size: 1, character: charater)
                        .padding(.horizontal)
                }
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink{
                    PersonagensCreation(characterInfo: $characterViewModel.currentCreatedCharacter, characterViewModel: $characterViewModel)
                } label: {
                    Text("Adicionar")
                }
            }
        }
        .navigationTitle("Personagens")
    }
}

#Preview {
    Personagens()
}
