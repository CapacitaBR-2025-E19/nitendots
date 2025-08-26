//
//  CharacterModal.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 22/08/25.
//

import SwiftUI

struct CharacterModal: View {
    @ObservedObject private var themeManager:ThemeManager = .shared
    
    var size:CGFloat
    
    var character:CharacterModel
    
    func getImageFromPickerItem() -> Image {
        if let imageData = character.image,
            let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        } else {
            return Image("ButtonDice")
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            UnevenRoundedRectangle(cornerRadii:
                    .init(topLeading: 60*size, bottomLeading: 40*size, bottomTrailing: 40*size, topTrailing: 40*size)
            )
            .frame(width: 350*size, height: 300*size)
            .foregroundStyle(themeManager.ActiveTheme.primary)
            .overlay {
                VStack(spacing: 0) {
                    Spacer()
                        .frame(height: 130*size)
                    
                    Text("Descrição:")
                        .font(.system(size: 18*size, weight: .bold))
                        .foregroundStyle(themeManager.ActiveTheme.text)
                    
                    Text(character.shortDescription)
                        .padding(.horizontal)
                        .lineLimit(3, reservesSpace: true)
                        .foregroundStyle(themeManager.ActiveTheme.text)
                        .font(.system(size: 16*size, weight: .regular))
                    
                    Spacer()
                    
                    HStack(spacing: -20*size) {
                        RoundedRectangle(cornerRadius: 30*size)
                            .frame(width: 100*size, height: 55*size)
                            .padding(.horizontal)
                            .foregroundStyle(themeManager.ActiveTheme.tertiary)
                            .overlay {
                                Image(systemName: "gearshape.fill")
                                    .font(.system(size: 30*size))
                                    .foregroundStyle(themeManager.ActiveTheme.primary)
                            }
                        
                        RoundedRectangle(cornerRadius: 30*size)
                            .frame(height: 55*size)
                            .padding(.horizontal)
                            .foregroundStyle(themeManager.ActiveTheme.tertiary)
                            .overlay{
                                Image(systemName: "gamecontroller.fill")
                                    .font(.system(size: 30*size))
                                    .foregroundStyle(themeManager.ActiveTheme.primary)
                            }
                    }
                    
                    Spacer()
                }
            }
            .shadow(radius: 10*size)
            
            UnevenRoundedRectangle(cornerRadii:
                    .init(topLeading: 60*size, bottomLeading: 60*size, bottomTrailing: 40*size, topTrailing: 40*size)
            )
            .frame(width: 350*size, height: 120*size)
            .foregroundStyle(themeManager.ActiveTheme.primary)
            .overlay {
                HStack {
                    Circle()
                        .foregroundStyle(themeManager.ActiveTheme.primary)
                        .overlay {
                            getImageFromPickerItem()
                                .resizable()
                                .scaledToFill()
                                .background(Color.black)
                                .clipped()
                                .clipShape(Circle())
                                .padding(7.5*size)
                        }
                    
                    VStack(alignment: .leading, spacing: 5*size) {
                        Text(character.name)
                            .font(.system(size: 18*size, weight: .bold))
                            .foregroundStyle(themeManager.ActiveTheme.text)
                        
                        HStack(spacing: 5*size) {
                            Text("Classe:")
                                .foregroundStyle(themeManager.ActiveTheme.text)
                                .font(.system(size: 16*size, weight: .regular))
                            
                            Text(character.classification!.rawValue)
                                .foregroundStyle(themeManager.ActiveTheme.accent)
                                .font(.system(size: 16*size, weight: .regular))
                        }
                        
                        HStack(spacing: 5*size) {
                            Text("Raça:")
                                .foregroundStyle(themeManager.ActiveTheme.text)
                                .font(.system(size: 16*size, weight: .regular))
                            
                            Text(character.species)
                                .foregroundStyle(themeManager.ActiveTheme.accent)
                                .font(.system(size: 16*size, weight: .regular))
                        }
                        
                        HStack(spacing: 5*size) {
                            Image(systemName: "asterisk")
                                .font(.system(size: 15*size,weight: .black))
                                .foregroundStyle(.red)
                            
                            Text("\(character.health)/\(character.healthMax)")
                                .foregroundStyle(.red)
                                .font(.system(size: 16*size,weight: .bold))
                            
                            Image(systemName: "shield.lefthalf.filled")
                                .font(.system(size: 15*size,weight: .black))
                                .foregroundStyle(.blue)
                            
                            Text("\(character.defense)/\(character.defenseMax)")
                                .foregroundStyle(.blue)
                                .font(.system(size: 16*size,weight: .bold))
                        }
                    }
                    
                    Spacer()
                }
            }
            .shadow(radius: 10*size)
        }
    }
}

#Preview {
    let guy = CharacterModel(
        name: "La Creatura",
        shortDescription: "Lorem ipsum dolor sit amet consectur adispicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        regularDescription: "Lorem ipsum dolor sit amet consectur adispicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        level: 0,
        classification: .cleric,
        species: "Gatito",
        health: 100,
        healthMax: 100,
        defense: 100,
        defenseMax: 100
    )
    
    ZStack {
        Color.orange.edgesIgnoringSafeArea(.all).opacity(0.2)
        
        CharacterModal(size: 1, character: guy)
    }
}
