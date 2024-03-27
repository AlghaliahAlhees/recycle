//
//  RewardScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

struct RewardScreen: View {
    
    // MARK: - Properties

   
    
    //MARK: Body

    
    var body: some View {
        VStack{
            
            
//            //MARK: - navigation bar
            HStack(alignment: .center){ //Start: Hstack
                 CustomNavigationBar(customTitle: "reward", EnableDissmiss: true)
                
                HStack{ //Start: Hstack
                    
                    
                    Image("token")
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack(alignment: .center){
                        Text("1000")
                            .bold()
                        Text("point")
                        
                    }
                    .font(.caption)
                    
                } //End: HStack
            } //End: HStack
            .padding()
            
            //MARK: - rewards view
             RewardsView()
            
        } //End: VStack
        
    }
}

#Preview {
    RewardScreen()
}
