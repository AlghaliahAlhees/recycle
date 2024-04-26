//
//  RewardScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase
struct RewardScreen: View {
    
    // MARK: - Properties

    @ObservedObject var usermanagerVM = UserAccountManager()
@State var points = 0
    
    //MARK: Body

    
    var body: some View {
        VStack{
            
            
//            //MARK: - navigation bar
            HStack(alignment: .center){ //Start: Hstack
                 CustomNavigationBar(customTitle: "reward", EnableDissmiss: false)
//                
//                Button("add points"){
//                    usermanagerVM.AddUserPoints(points: 5000000)
//                }
                HStack{ //Start: Hstack
                     
                    
                    Image("token")
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack(alignment: .center){
                        Text("\(usermanagerVM.userPointsCount)")
                            .bold()
                        Text("points")
                        
                    }
                    .font(.caption)
                    
                } //End: HStack
            } //End: HStack
            .padding()
            
            //MARK: - rewards view
             RewardsView()
            
        } //End: VStack
        .onAppear(){
            
            usermanagerVM.feetcUserPointsCount()
        }
        
        
    }

    
    
    
    
}

#Preview {
    RewardScreen()
}
