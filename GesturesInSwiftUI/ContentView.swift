//
//  ContentView.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 18.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var viewState = CGSize.zero
    @State private var isShowing = false
    @State private var appear = false
    @Namespace var namespace
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.pink]), startPoint: .top, endPoint: .bottom)
            
            VStack(spacing: 40) {
                ZStack {
                    Card(color: .black, image: "10", namespace: namespace)
                        .offset(offset)
                        //                        .scaleEffect(getScaleAmount())
                        .rotationEffect(Angle(degrees: getRotationAmount()))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    withAnimation(.spring()) {
                                        offset = value.translation
                                    }
                                    
                                }
                                .onEnded { value in
                                    if value.translation.width > width / 2 {
                                        withAnimation(.spring()) {
                                            offset = CGSize(width: 1000, height: 1000)
                                        }
                                    } else {
                                        withAnimation(.spring()) {
                                            offset = .zero
                                        }
                                    }
                                }
                        )
                }
                ArrowButton(offset: $offset)
                
            }
            if isShowing {
                Detale(namespace: namespace, appear: appear)
                    .offset(y: viewState.height)
                    .padding(.top, 50)
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            appear = true
                        }
                    }
                    .onDisappear() {
                        appear = false
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.spring())
        .onTapGesture {
            isShowing = true
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
        let currentAmount = offset.width
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
