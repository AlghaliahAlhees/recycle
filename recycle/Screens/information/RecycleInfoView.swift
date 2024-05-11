//
//  RecycleInfoView.swift
//  recycle
//
//  Created by Alghalya Alhees on 27/03/2024.
//

import SwiftUI

struct RecycleInfoView: View {
    var body: some View {
        VStack{
            HStack{
                Text("learn more about recycling")
                    .bold()
                    .font(.title2)
                    .padding()
//                Spacer()
            }
            
            RecycleInfoCardView()
            
        }
        
    }
}

#Preview {
    RecycleInfoView()
}
