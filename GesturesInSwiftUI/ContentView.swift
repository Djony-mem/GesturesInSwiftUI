//
//  ContentView.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 18.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var offsetCardView = CGSize.zero
    @State private var offsetBuyView = CGSize.zero
    @State private var isShowingDetails = false
    @State private var isShowingBuyView = false
    @State private var appearDetails = false
    @Namespace private var namespace
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    private func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offsetCardView.width
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
                if !isShowingDetails {
                    CardView(namespace: namespace, color: .black, image: "10")
                        .offset(offsetCardView)
                        .rotationEffect(Angle(degrees: getRotationAmount()))
                        .onTapGesture {
                            isShowingDetails.toggle()
                        }
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    offsetCardView = value.translation
                                }
                                .onEnded { _ in
                                    if offsetCardView.width > width / 2 {
                                        offsetCardView = CGSize(width: width, height: height)
                                    } else {
                                        offsetCardView = .zero
                                    }
                                }
                    )
                }
                ArrowButton(offset: $offsetCardView)
            }
            
            if isShowingDetails {
                DetailsView(
                    offset: $offsetCardView,
                    isShowing: $isShowingDetails,
                    showBuyView: $isShowingBuyView,
                    namespace: namespace,
                    appear: appearDetails
                )
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        appearDetails.toggle()
                    }
                }
                .onDisappear {
                    appearDetails.toggle()
                }
            }
            
            BuyView()
                .offset(offsetBuyView)
                .offset(y: isShowingBuyView ? 0 : height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offsetBuyView = value.translation
                        }
                        .onEnded { _ in
                            if offsetBuyView.height > height / 5 {
                                isShowingBuyView = false
                            } else {
                                offsetBuyView = .zero
                            }
                        }
                )
                .padding(.top, 40)
        }
        .ignoresSafeArea()
        .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
