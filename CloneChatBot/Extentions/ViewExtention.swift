//
//  ViewExtention.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 06/03/2023.
//

import Foundation
import SwiftUI


struct BubbleButton: ViewModifier {
    var customColor: UIColor
    var customFont: CGFloat
    
    // Needs confirm some view
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .font(.system(size: 19))
            .background(Color(uiColor: customColor)) // Bubble style related
            .cornerRadius(10) // needs to be under background
            .font(.system(size: customFont))

    }
}

extension View {
    func bubbleStyle(customColor: UIColor, customFont: CGFloat) -> some View {
        modifier(BubbleButton(customColor: customColor, customFont: customFont))
    }
}
