//
//  DiceType.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 17/08/25.
//

import Foundation
import SwiftUI

enum DiceType:String {
    case d4 = "4"
    case d6 = "6"
    case d8 = "8"
    case d10 = "10"
    case d00 = "00"
    case d12 = "12"
    case d20 = "20"
    
    var shape:some View {
        switch self {
            case .d4:
                return Image(systemName: "triangle.fill")
                .rotationEffect(.degrees(0))
                .font(.system(size: 40, weight: .semibold))
            case .d6:
                return Image(systemName: "square.fill")
                .rotationEffect(.degrees(0))
                .font(.system(size: 40, weight: .semibold))
            case .d8, .d10, .d00:
                return Image(systemName: "square.fill")
                .rotationEffect(.degrees(45))
                .font(.system(size: 37.5, weight: .semibold))
            case .d12:
                return Image(systemName: "pentagon.fill")
                .rotationEffect(.degrees(0))
                .font(.system(size: 40, weight: .semibold))
            case .d20:
                return Image(systemName: "hexagon.fill")
                .rotationEffect(.degrees(0))
                .font(.system(size: 40, weight: .semibold))
        }
    }
    
    var shapeUnsized:some View {
        switch self {
            case .d4:
                return Image(systemName: "triangle.fill")
                .rotationEffect(.degrees(0))
            case .d6:
                return Image(systemName: "square.fill")
                .rotationEffect(.degrees(0))
            case .d8, .d10, .d00:
                return Image(systemName: "square.fill")
                .rotationEffect(.degrees(45))
            case .d12:
                return Image(systemName: "pentagon.fill")
                .rotationEffect(.degrees(0))
            case .d20:
                return Image(systemName: "hexagon.fill")
                .rotationEffect(.degrees(0))
        }
    }
    
    var maxValue:Int {
        switch self {
            case .d4: return 4
            case .d6: return 6
            case .d8: return 8
            case .d10, .d00: return 10
            case .d12: return 12
            case .d20: return 20
        }
    }
}
