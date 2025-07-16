//
//  SwiftUIView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 16/07/25.
//

import SwiftUI

struct Blue: View {
    var number:UInt8 //ahaha
    
    var body: some View {
        ZStack(content:{
            Rectangle()
                .frame(width: 120, height: 120)
                .foregroundColor(.blue)
                .cornerRadius(25)
            //background (plano de fundo)
            //foreground  (plano de frente)
            
        })
    }
}

#Preview {
    // SwiftUIView()
}
