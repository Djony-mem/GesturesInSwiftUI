//
//  CardView.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 18.04.2021.
//

import SwiftUI

struct CardView: View {
    var namespace: Namespace.ID
    var color: Color
    var image: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .matchedGeometryEffect(id: "background", in: namespace)
                .frame(width: 300, height: 400)
                .shadow(color: .black, radius: 20, x: 10, y: 10)
                .foregroundColor(color)
            HStack(spacing: 10) {
                Image(image)
                    .resizable()
                    .matchedGeometryEffect(id: "image", in: namespace)
                    .frame(width: 100, height: 100)
                Text("SwiftUI")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .matchedGeometryEffect(id: "text", in: namespace)
                
            }
        }
        .animation(.spring())
    }
}

//struct Card_Previews: PreviewProvider {
//    static var previews: some View {
//        Card(color: .black, image: "10")
//    }
//}
