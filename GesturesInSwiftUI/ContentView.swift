//
//  ContentView.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 18.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var offsetCard = CGSize.zero
    @State private var offsetBuy = CGSize.zero
    @State private var isShowingDetale = false
    @State private var showBuyView = false
    @State private var appearDetale = false
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.green, .pink]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack(spacing: 40) {
                ZStack {
                    Card(color: .black, image: "10")
                        .animation(.spring())
                        .offset(offsetCard)
//                        .scaleEffect(getScaleAmount())
                        .rotationEffect(Angle(degrees: getRotationAmount()))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                        offsetCard = value.translation
                                }
                                .onEnded { value in
                                    if value.translation.width > width / 2 {
                                            offsetCard = CGSize(width: 1000, height: 1000)
                                    } else {
                                            offsetCard = .zero
                                    }
                                }
                        )
                }
                ArrowButton(offset: $offsetCard)
                
            }
            if isShowingDetale {
                Detale(
                    offset: $offsetCard,
                    isShowing: $isShowingDetale,
                    showBuyView: $showBuyView,
                    offsetBuy: $offsetBuy,
                    appear: appearDetale
                )
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                appearDetale = true
                        }
                    }
                    .onDisappear() {
                            appearDetale = false
                    }
            }
                BuyView()
                    .background(Color.white)
                    .cornerRadius(25)
                    .offset(y: showBuyView ? 0 : 1000)
                    .offset(offsetBuy)
                    .animation(.spring())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                offsetBuy = value.translation
                            }
                            .onEnded { value in
                                if offsetBuy.height > 200 {
                                    offsetBuy = CGSize(width: 0, height: 1000)
                                    showBuyView = false
                                } else {
                                    offsetBuy = .zero
                                }
                            }
                    )
                    .padding(.top, 40)
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.spring())
        .onTapGesture {
            isShowingDetale = true
        }
    }
    
//    func getScaleAmount() -> CGFloat {
//        let max = UIScreen.main.bounds.width / 2
//        let currentAmount = abs(offset.width)
//        let percentage = currentAmount / max
//        return 1.0 - min(percentage, 0.5) * 0.5
//    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offsetCard.width
        let percentage = Double(currentAmount / max)
        let maxAngle: Double = 10
        return percentage * maxAngle
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
