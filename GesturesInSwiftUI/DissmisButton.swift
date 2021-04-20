//
//  dissmisButton.swift
//  GesturesInSwiftUI
//
//  Created by brubru on 20.04.2021.
//

import SwiftUI

struct DissmisButton: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        Button(action: {dissmisView()}){
            Image(systemName: "chevron.left")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.orange)
                .padding(.top, 50)
                .padding(.leading, 20)
        }
        
    }
    func dissmisView() {
        withAnimation {
            isShowing = false
        }
    }
}

//struct dissmisButton_Previews: PreviewProvider {
//    static var previews: some View {
//        dissmisButton()
//    }
//}
