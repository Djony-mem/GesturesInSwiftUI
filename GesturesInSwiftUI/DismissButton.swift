//
//  DismissButton.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 20.04.2021.
//

import SwiftUI

struct DismissButton: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        Button(action: dismissView) {
            Image(systemName: "chevron.left")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.orange)
                .padding(.top, 50)
                .padding(.leading, 20)
        }
        
    }
    
    private func dismissView() {
        withAnimation {
            isShowing.toggle()
        }
    }
}

struct dissmisButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton(isShowing: .constant(false))
    }
}
