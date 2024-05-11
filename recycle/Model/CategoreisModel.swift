//
//  CategoreisModel.swift
//  recycle
//
//  Created by Alghalya Alhees on 13/04/2024.
//

import Foundation
import SwiftUI


struct CategoreyModel: Identifiable{
    let id = UUID()
    var name: String
    var image: String
    var isPressed : Bool

}


var categories: [CategoreyModel] = [
    .init(name: "glass", image: "glass", isPressed: false),
    .init(name: "plastic", image: "plastic", isPressed: false),
    .init(name: "electronics", image: "elec", isPressed: false),
    .init(name: "paper", image: "paper", isPressed: false)
]
