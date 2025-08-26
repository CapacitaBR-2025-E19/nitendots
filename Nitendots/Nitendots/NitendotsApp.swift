//
//  NitendotsApp.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 16/07/25.
//

import SwiftUI
import SwiftData

@main
struct NitendotsApp: App {
    var container: ModelContainer = {
            let schema = Schema([CharacterModel.self])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: modelConfiguration)
            } catch {
                fatalError("Nao consegui criar o container de persistencia")
            }
        }()
    
    var body: some Scene {
        WindowGroup {
            TelaPrincipal()
        }
        .modelContainer(container)
    }
}
