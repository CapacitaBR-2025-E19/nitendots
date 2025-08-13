//
//  CloserButton.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 13/08/25.
//

import SwiftUI

struct CloserButton: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var themeManager: ThemeManager = .shared
    
    /// Size Multiplier (e.g: 1 = 1x)
    var size:CGFloat
    
    var body: some View {
        Button(
            action: {
                dismiss()
            },
            label: {
                Circle()
                    .frame(width: size*32, height: size*32)
                    .padding()
                    .overlay {
                        Image(systemName: "xmark")
                            .font(.system(size: size*16, weight: .bold))
                            .foregroundStyle(themeManager.ActiveTheme.tertiary)
                    }
                    .foregroundStyle(themeManager.ActiveTheme.closeButton)
            }
        )
    }
}

#Preview {
    CloserButton(size: 1)
}
