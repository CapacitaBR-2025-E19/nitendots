//
//  Theme.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 09/08/25.
//

import Foundation
import SwiftUI

// STRUCT DE BASE
struct Theme : Identifiable{
    var id:UUID = UUID()
    
    var isActive:Bool = false
    
    var accent:Color
    var closeButton:Color
    var primary:Color
    var secondary:Color
    var tertiary:Color
    var text:Color
}
