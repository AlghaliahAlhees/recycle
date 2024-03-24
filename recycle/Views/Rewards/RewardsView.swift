//
//  RewardsView.swift
//  recycle
//
//  Created by Alghalya Alhees on 24/03/2024.
//

import SwiftUI

struct RewardsView: View {
    // MARK: - Properties

    @State var addApdeptdColumn = [GridItem(.adaptive(minimum: 170 ))]
    
    //MARK: Body

    var body: some View {
        //MARK: -  rewards
        ScrollView(.vertical){
            LazyVGrid(columns: addApdeptdColumn, spacing: 20){
                ForEach(0..<10, id: \.self){ reward in
                    VStack{ //Start: VStack
                        
                        // image
                        Image("puff")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        
                        
                        // title
                        Text("for 15,000 points")
                            .foregroundStyle(Color.white)
                        
                        // button
                        Button{
                            
                        }label: {
                            VStack{
                                Text("claim")
                                    .bold()
                                    .foregroundStyle(.green)
                            } //End:Vstack
                            .padding(8)
                            .frame(width: 85, height: 22)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 4)
                            
                        } //End: label
                        
                        
                    }//End: Vstack
                    .frame(width: 165, height: 175)
                    .padding(3)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    
                    
                } //End: Vstack
                .shadow(radius: 3)
            } //End: for each
        
    } //End: scroll   
}
}

#Preview {
    RewardsView()
}
