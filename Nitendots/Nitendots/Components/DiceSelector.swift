//
//  SwiftUIView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 16/07/25.
//

import SwiftUI

struct DiceSelector: View {
    var number:UInt8 = 0
    
    var body: some View {
        ZStack(content:{
            Rectangle()
                .frame(width: 120, height: 120)
                .foregroundColor(.blue)
                .cornerRadius(25)
        })
    }
}

#Preview {
    DiceSelector()
}
