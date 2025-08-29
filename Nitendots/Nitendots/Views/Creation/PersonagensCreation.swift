//
//  PersonagensCreation.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 23/08/25.
//

import SwiftUI
import PhotosUI

struct PersonagensCreation: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject private var themeManager:ThemeManager = .shared
    
    @Binding var characterInfo:CharacterModel
    @Binding var characterViewModel:CharacterViewModel
    
    @State var photo:PhotosPickerItem? = nil
    
    @State var imageData:Data? = nil
    
    var isEditing:Bool
    
    func getImageData() async {
        if let data = try? await photo?.loadTransferable(type: Data.self) {
            imageData = data
            characterInfo.image = data
        }
    }
    
    func getImageFromPickerItem() -> Image {
        if imageData == nil {
            if let image = characterInfo.image, let uiImage = UIImage(data: image) { // Sem foto escolhida no picker, foto existente no model
                return Image(uiImage: uiImage)
            }
        }
        else {
            if let imageData = imageData, let uiImage = UIImage(data: imageData) { // Imagem escolhida no picker
                return Image(uiImage: uiImage)
            }
        }
        
        return Image("ButtonDice") // Não tem nada, imagem padrão
    }
    
    var body: some View {
        ZStack {
            themeManager.ActiveTheme.secondary
                .ignoresSafeArea(edges: .all)
            
            ScrollView {
                VStack(spacing: 0) {
                    Spacer()
                        .frame(height: 20)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(themeManager.ActiveTheme.primary)
                        .frame(width: 250, height: 250)
                        .overlay {
                            getImageFromPickerItem()
                                .resizable()
                                .frame(width: 230, height: 230)
                                .scaledToFill()
                                .aspectRatio(contentMode: .fill)
                                .background(Color.black)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(7.5)
                        }
                        .shadow(radius: 10)
                    
                    
                    PhotosPicker(
                        selection: $photo,
                        matching: .images,
                        label: {
                            Text("Selecionar Foto")
                                .font(.system(size: 17, weight: .semibold))
                        }
                    )
                    .padding(30)
                    .onChange(of: photo) {
                        Task {
                            await getImageData()
                        }
                    }
                    
                    List {
                        E19TextField(text: $characterInfo.name, label: "Nome:")
                            .listRowBackground(Color.clear)
                        
                        E19TextField(text: $characterInfo.regularDescription, label: "Descrição:")
                            .listRowBackground(Color.clear)
                        
                        E19TextField(text: $characterInfo.shortDescription, label: "Descrição Curta:")
                            .listRowBackground(Color.clear)
                        
                        E19TextField(text: $characterInfo.species, label: "Raça:")
                            .listRowBackground(Color.clear)
                        
                        HStack {
                            Text("Classe:")
                                .font(.system(size: 17, weight: .semibold))
                            
                            Spacer()
                            
                            Picker("", selection: $characterInfo.classification) {
                                ForEach(CharacterClass.allCases) { classType in
                                    Text(classType.rawValue)
                                        .tag(classType)
                                }
                            }
                            .frame(width: 205, alignment: .trailing)
                            .labelsHidden()
                        }
                        .listRowBackground(Color.clear)
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Nível:")
                                .font(.system(size: 17, weight: .semibold))
                            Image(systemName: "chart.bar.xaxis")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(.orange)
                            
                            Spacer()
                            
                            Text("\(characterInfo.level)")
                                .foregroundStyle(.orange)
                            Stepper("", value: $characterInfo.level)
                        }
                        .listRowBackground(Color.clear)
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Defesa:")
                                .font(.system(size: 17, weight: .semibold))
                            Image(systemName: "shield.lefthalf.fill")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(.blue)
                            
                            Spacer()
                            
                            Text("\(characterInfo.defenseMax)")
                                .foregroundStyle(.blue)
                            Stepper("", value: $characterInfo.defenseMax)
                        }
                        .listRowBackground(Color.clear)
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Vida:")
                                .font(.system(size: 17, weight: .semibold))
                            Image(systemName: "asterisk")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(.red)
                            
                            Spacer()
                            
                            Text("\(characterInfo.healthMax)")
                                .foregroundStyle(.red)
                            Stepper("", value: $characterInfo.healthMax)
                        }
                        .listRowBackground(Color.clear)
                        .padding(.horizontal)
                    }
                    .listStyle(.plain)
                    .frame(height: 90*6)
                    .scrollDisabled(true)
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(
                    action: {
                        characterInfo.health = characterInfo.healthMax
                        characterInfo.defense = characterInfo.defenseMax
                        
                        characterViewModel.saveCharacter(characterInfo, context: context, isEditing: isEditing)
                        
                        characterViewModel.resetCharacter()
                        
                        dismiss()
                    },
                    label: {
                        Text("Salvar")
                    }
                )
            }
        }
        .navigationTitle(isEditing ? "Editar" : "Criar")
        .toolbarBackground(themeManager.ActiveTheme.primary, for: .navigationBar)
        .toolbarBackgroundVisibility(.visible)
    }
}

#Preview {
    @State @Previewable var guy = CharacterModel(
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
    
    @State @Previewable var characterVM: CharacterViewModel = CharacterViewModel()
    
    PersonagensCreation(characterInfo: $guy, characterViewModel: $characterVM, isEditing: false)
}
