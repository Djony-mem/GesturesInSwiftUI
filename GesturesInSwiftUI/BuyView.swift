//
//  BuyView.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 20.04.2021.
//

import SwiftUI

struct BuyView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Поздравляем!")
                .font(.largeTitle)
            Text("Курс успешно оплачен 🎉")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(25)
        .animation(.spring())
        .foregroundColor(.orange)
        .multilineTextAlignment(.center)
    }
}

struct BuyView_Previews: PreviewProvider {
    static var previews: some View {
        BuyView()
    }
}
