//
//  AboutUsScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

struct AboutUsScreen: View {
    var body: some View {
        VStack {
            
            Text("about us")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("Recycle is an online app designed to simplify recycling for environmentally-conscious individuals by offering personalized pickup services and ensuring that every item gets properly recycled.As the sole provider of recycling services in your area, Recycle is dedicated to making recycling convenient and effective for all users.")
                .padding()
            
            
            Spacer()
            
        }// vstack
    }
}

#Preview {
    AboutUsScreen()
}
