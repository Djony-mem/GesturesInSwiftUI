//
//  DetailsView.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 18.04.2021.
//

import SwiftUI

struct DetailsView: View {
    @Binding var offset: CGSize
    @Binding var isShowing: Bool
    @Binding var buyViewIsPresented: Bool
    
    var namespace: Namespace.ID
    var appear: Bool
        
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                if appear {
                    DismissButton(isShowing: $isShowing)
                        .padding(.top, 50)
                        .padding(.leading, 20)
                    
                    Spacer()
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
                .matchedGeometryEffect(id: "text", in: namespace)
                .padding(.horizontal, 20)
            
            if appear {
                Text("Создание проекта и первый взгляд. Создание пользовательских представлений.")
                    .transition(.scale)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
                HStack(spacing: 15) {
                    Button(action: showBuyView) {
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
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    }
                }
                .transition(.scale)
                .padding(.top, 25)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.black
                .matchedGeometryEffect(id: "background", in: namespace)
        )
    }
    
    private func showBuyView() {
        offset = .zero
        buyViewIsPresented.toggle()
    }
}

//struct Detale_Previews: PreviewProvider {
//    static var previews: some View {
//        Detail(
//            offset: .constant(CGSize.zero),
//            isShowing: .constant(true),
//            showBuyView: .constant(false),
//            offsetBuy: .constant(CGSize.zero),
//            namespace: Namespace.ID,
//            appear: false
//        )
//    }
//}
