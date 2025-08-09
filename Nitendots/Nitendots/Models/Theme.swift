//
//  Theme.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 09/08/25.
//

import Foundation
import SwiftUI

// STRUCT DE BASE
struct Theme {
    var accent:Color
    var closeButton:Color
    var primary:Color
    var secondary:Color
    var tertiary:Color
}

// ARMAZENAMENTO GLOBAL DOS TEMAS
let themes:[Theme] = [
    Theme(accent: .accent0, closeButton: .closeButton0, primary: .primary0, secondary: .secondary0, tertiary: .tertiary0),
    Theme(accent: .accent1, closeButton: .closeButton1, primary: .primary1, secondary: .secondary1, tertiary: .tertiary1),
    Theme(accent: .accent2, closeButton: .closeButton2, primary: .primary2, secondary: .secondary2, tertiary: .tertiary2),
    Theme(accent: .accent3, closeButton: .closeButton3, primary: .primary3, secondary: .secondary3, tertiary: .tertiary3),
    Theme(accent: .accent4, closeButton: .closeButton4, primary: .primary4, secondary: .secondary4, tertiary: .tertiary4)
]
