//
//  TabBarButton.swift
//  recycle
//
//  Created by Alghalya Alhees on 19/03/2024.
//

import SwiftUI

struct TabBarButton: View {
    var buttonText: String
    var imageName: String
    var isActive: Bool
    var body: some View {
        GeometryReader { geo in
            
            if isActive{
                Rectangle()
                    .foregroundStyle(Color.green)
                    .frame(width: geo.size.width / 2 , height: 4)
                    .padding(.leading, geo.size.width/4)
            }
            VStack(alignment: .center, spacing: 4) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text(buttonText)
                    .font(Font.caption)
            }.padding(3)
            .frame(width: geo.size.width, height: geo.size.height)
        }

    }
}

#Preview {
    TabBarButton(buttonText: "profile", imageName: "profile", isActive: true)
}
