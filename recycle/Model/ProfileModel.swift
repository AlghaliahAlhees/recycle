//
//  ProfileModel.swift
//  recycle
//
//  Created by Alghalya Alhees on 29/04/2024.
//

import Foundation
import SwiftUI

// Mark: Crop Config
enum Crop: Equatable{ // the crop image view's shape type and size are definded
case circle
case rectangle
case square
case custom(CGSize)
 

    func name()->String{ // to display the buttom on the action sheet
    switch self {
    case .circle:
    return "Circle"
    case .rectangle:
    return "Rectangle"
    case .square:
    return "Square"
    case let .custom(cGSize):
    return "Custom \(Int(cGSize.width))x\(Int(cGSize.height))"
           }
       }
       // define custom sizes for cirle, rectangle, and sqare
    func size()->CGSize{
    switch self {
    case .circle:
    return .init(width: 300, height: 300)
    case .rectangle:
    return .init(width: 300, height: 500)
    case .square:
    return .init(width: 300, height: 300)
    case .custom(let cGSize):
    return cGSize
           }
       }
    }
    


struct GradientBackgroundStryle: ButtonStyle {
func makeBody(configuration: Configuration) -> some View {
   configuration.label
       .frame(maxWidth: .infinity)
       .padding()
       .foregroundColor(.white)
       .background(Color.green)
       .cornerRadius(50.0)
       .padding(.horizontal, 10)
       .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
       .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
}
}

