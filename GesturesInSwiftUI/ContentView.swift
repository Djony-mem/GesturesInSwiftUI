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
    @State private var isShowingDetail = false
    @State private var isShowingBuyView = false
    @State private var appearDetail = false
    @Namespace private var namespace
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    private func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offsetCard.width
        let percentage = Double(currentAmount / max)
        let maxAngle: Double = 10
        return percentage * maxAngle
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.green, .pink]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack(spacing: 40) {
                CardView(namespace: namespace, color: .black, image: "10")
                    .offset(offsetCard)
                    .rotationEffect(Angle(degrees: getRotationAmount()))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                offsetCard = value.translation
                            }
                            .onEnded { _ in
                                if offsetCard.width > width / 2 {
                                    offsetCard = CGSize(width: width, height: height)
                                } else {
                                    offsetCard = .zero
                                }
                            }
                    )
                ArrowButton(offset: $offsetCard)
            }
            
            if isShowingDetail {
                DetailsView(
                    offset: $offsetCard,
                    isShowing: $isShowingDetail,
                    showBuyView: $isShowingBuyView,
                    offsetBuy: $offsetBuy,
                    namespace: namespace,
                    appear: appearDetail
                )
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        appearDetail.toggle()
                    }
                }
                .onDisappear {
                    appearDetail.toggle()
                }
            }
            BuyView()
                .offset(offsetBuy)
                .offset(y: isShowingBuyView ? 0 : height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offsetBuy = value.translation
                        }
                        .onEnded { _ in
                            if offsetBuy.height > height / 5 {
                                isShowingBuyView = false
                            } else {
                                offsetBuy = .zero
                            }
                        }
                )
                .padding(.top, 40)
        }
        .ignoresSafeArea()
        .animation(.spring())
        .onTapGesture {
            isShowingDetail.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
