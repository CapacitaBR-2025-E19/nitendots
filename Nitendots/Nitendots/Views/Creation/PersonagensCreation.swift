//
//  PersonagensCreation.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 23/08/25.
//

import SwiftUI

struct PersonagensCreation: View {
    @Binding var characterInfo:CharacterModel
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 250, height: 250)
                        .overlay {
                            RoundedRectangle(cornerRadius:12.5)
                                .padding(7.5)
                                .overlay(
                                    Image("ButtonDice") // cat e dog não funfa, vou testar depois com outra foto
                                        .resizable()
                                        .scaledToFill()
                                        .padding(45)
                                        .clipShape(RoundedRectangle(cornerRadius: 12.5))
                                )
                        }
                        .shadow(radius: 10)
                    
                    Button(
                        action: {
                            print("foto selecionar")
                        },
                        label: {
                            Text("Selecionar Foto")
                                .font(.system(size: 17, weight: .semibold))
                        }
                    )
                    .padding(30)
                    
                    let textFields = [
                        E19TextField(text: $characterInfo.name, label: "Nome:"),
                        
                        E19TextField(text: $characterInfo.description, label: "Descrição:"),
                        
                        E19TextField(text: $characterInfo.shortDescription, label: "Descrição Curta:"),
                        
                        E19TextField(text: $characterInfo.species, label: "Raça:")
                    ]
                    
                    List {
                        ForEach(textFields) { field in
                            field
                            .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(.plain)
                    .frame(height: 90*4)
                }
            }
        }
    }
}

#Preview {
    @State @Previewable var guy = CharacterModel(
        name: "La Creatura",
        shortDescription: "Lorem ipsum dolor sit amet consectur adispicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        description: "Lorem ipsum dolor sit amet consectur adispicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        level: 0,
        experience: 100,
        classification: .cleric,
        species: "Gatito",
        health: 100,
        healthMax: 100,
        defense: 100,
        defenseMax: 100
    )
    
    PersonagensCreation(characterInfo: $guy)
}
