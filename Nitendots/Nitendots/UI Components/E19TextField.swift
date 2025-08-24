//
//  E19TextField.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 24/08/25.
//

import SwiftUI

struct E19TextField: View, Identifiable {
    @Binding var text:String
    
    @State var size:CGSize = .zero
    
    let id:UUID = UUID()
    
    let label:String
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text(label)
                        .padding(.horizontal)
                        .font(.system(size: 17, weight: .medium))
                    
                    Spacer()
                    
                    TextField("Escreva aqui!", text: $text, axis: .vertical)
                        .textFieldStyle(.plain)
                        .padding(.horizontal)
                        .frame(width: 225)
                        .frame(maxHeight: 90)
                }
            }
        }
    }
}

#Preview {
    @State @Previewable var texto:String = "Lorem ipsum dolor sit amet consec tetur adipiscing elit aenean euismod bibendum laoreet. Nullam ut viverra enim. Aenean auctor gravida semper."
    
    E19TextField(text: $texto, label: "Descrição:")
}
