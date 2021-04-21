//
//  ArrowButton.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 18.04.2021.
//

import SwiftUI

struct ArrowButton: View {
    @Binding var offset: CGSize
    
    var body: some View {
        Button(action: {resetViews()}){
            Image(systemName: "arrow.left")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
                .padding()
                .background(Color(#colorLiteral(red: 0.09018116444, green: 0.09020464867, blue: 0.09017967433, alpha: 1)))
                .clipShape(Circle())
                .shadow(radius: 8)
        }
    }
    func resetViews() {
        withAnimation {
            offset = .zero
        }
    }
}

struct ArrowButton_Previews: PreviewProvider {
    static var previews: some View {
        ArrowButton(offset: .constant(CGSize.zero))
    }
}
