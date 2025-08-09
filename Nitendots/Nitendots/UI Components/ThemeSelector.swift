//
//  ThemeSelector.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 09/08/25.
//

import SwiftUI

struct ThemeSelector: View {
    let size:CGFloat
    
    /// Size Multiplier (e.g: 1 = 1x)
    init(size: CGFloat) {
        self.size = size
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                
        }
        .frame(width: size*98, height: size*214)
    }
}

#Preview {
    ThemeSelector(size: 1)
}
