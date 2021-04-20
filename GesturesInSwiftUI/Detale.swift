//
//  Detale.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 18.04.2021.
//

import SwiftUI

struct Detale: View {
    var namespace: Namespace.ID
    var appear: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    if appear {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.orange)
                            .padding()
                    }
                }.frame(height: 70)
                Image("10")
                    .resizable()
                    .matchedGeometryEffect(id: "image", in: namespace)
                    .frame(width: 200, height: 200)
                    .padding(.top)
                Text("SwiftUI")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding(.horizontal, 20)
                    .matchedGeometryEffect(id: "text", in: namespace)
                if appear {
                    Text("Создание проекта и первый взгляд. Создание пользовательских представлений.")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 15) {
                        Button(action:{} ) {
                            Text("Купить блок")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .background(Color.orange)
                                .clipShape(Capsule())
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "suit.heart.fill")
                                .font(.title)
                                .foregroundColor(Color.red)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        }
                    }
                    .padding(.top, 25)
                    .padding(.bottom)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.black
                .cornerRadius(25)
                .matchedGeometryEffect(id: "rectangle", in: namespace)
        )
    }
}

//struct Detale_Previews: PreviewProvider {
//    static var previews: some View {
//        Detale()
//    }
//}
