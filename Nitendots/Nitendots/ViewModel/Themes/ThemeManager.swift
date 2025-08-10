//
//  ThemeManager.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 09/08/25.
//

import Foundation
import SwiftUI

class ThemeManager:ObservableObject {
    // ARMAZENAMENTO GLOBAL DOS TEMAS
    @Published var Themes:[Theme] = [
        Theme(accent: .accent0, closeButton: .closeButton0, primary: .primary0, secondary: .secondary0, tertiary: .tertiary0, text: .text0),
        Theme(accent: .accent1, closeButton: .closeButton1, primary: .primary1, secondary: .secondary1, tertiary: .tertiary1, text: .text1),
        Theme(accent: .accent2, closeButton: .closeButton2, primary: .primary2, secondary: .secondary2, tertiary: .tertiary2, text: .text2),
        Theme(accent: .accent3, closeButton: .closeButton3, primary: .primary3, secondary: .secondary3, tertiary: .tertiary3, text: .text3),
        Theme(accent: .accent4, closeButton: .closeButton4, primary: .primary4, secondary: .secondary4, tertiary: .tertiary4, text: .text4)
    ]

    // VARIAVEIS GLOBAIS
    fileprivate var ActiveThemeIndex:Int {
        get {return UserDefaults.standard.integer(forKey: "theme")}
        set {return UserDefaults.standard.set(newValue, forKey: "theme")}
    } // não precisa de uma verificação nil pois o próprio metodo já faz e padroniza ao 0, tema padrão do aplicativo :)
    
    @Published var ActiveTheme:Theme! = nil
    
    // FUNÇÕES
    func setTheme(_ theme:Theme) {
        let activeThemeLocal:Theme = self.ActiveTheme! // caso não armazenar um local do mesmo, corre o risco de ser mudado e não desabilitar o outro
        
        for i in 0...Themes.count-1 { // não tirar o -1 se não fica fora de indicie
            
            if Themes[i].id == activeThemeLocal.id {
                Themes[i].isActive = false
            } // procura o tema antigo pra desligar
            
            if Themes[i].id == theme.id {
                Themes[i].isActive = true
                ActiveTheme = Themes[i]
            } // procura o tema novo pra ligar e setar o tema ativo
            
            // tá feio mas creio que isso funciona então ¯\_(ツ)_/¯
        }
    }
    
    init() {
        ActiveTheme = Themes[ActiveThemeIndex]
        
        Themes[ActiveThemeIndex].isActive = true
    }
    
    static var shared:ThemeManager = .init()
}
