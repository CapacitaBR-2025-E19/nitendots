//
//  SwiftUIView.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 06/08/25.
//

import SwiftUI

struct MenuButton: View {
    @State var isPressed:Bool = false
    
    let icon:String
    let text:String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(isPressed ? Color.blue.opacity(0.3) : Color.blue)
            .overlay {
                HStack {
                    Image(systemName: icon)
                        .font(.system(size: 40, weight: .regular))
                        .foregroundStyle(isPressed ? Color.blue : Color.white)
                        .padding(.trailing, 15)
                    
                    Text(text)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(isPressed ? Color.blue : Color.white)
                }
                .padding(10)
            }
        /*
            .onTapGesture {
                isPressed = !isPressed
            }
        */
        
        //navlink não funfa com o on-tap acima, se não der pra descobrir uma maneira, fica assim msm
    }
}

#Preview {
    MenuButton(icon: "square.fill", text: "PERSONAGENS")
        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
}
