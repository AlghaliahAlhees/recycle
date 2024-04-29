//
//  RewardScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase
import AlertKit
struct RewardScreen: View {
    
    // MARK: - Properties

    @EnvironmentObject var rewardSystemVM : RewardSystemManager
    @State var points = 0
    let alertView = AlertAppleMusic17View(title: "reward has been claimd", subtitle: "congratulation you claimed your reward", icon: .done)
    let alertView2 = AlertAppleMusic17View(title: "sorry you cant claim this reward", subtitle: nil , icon: .error)

    //MARK: Body

    var body: some View {
        VStack{
            
          //MARK: - navigation bar
            HStack(alignment: .center){ //Start: Hstack
                
                 CustomNavigationBar(customTitle: "reward", EnableDissmiss: false)
                
                HStack{ //Start: Hstack
                     
                    Image("token")
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack(alignment: .center){
                        Text("\(rewardSystemVM.userPointsCount)")
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
            .alert(isPresent: $rewardSystemVM.ifAccepted, view: alertView)
            .alert(isPresent: $rewardSystemVM.ifNotAccepted, view: alertView2)

        .onAppear(){
            rewardSystemVM.feetcUserPointsCount()
        }
    }
    
}

#Preview {
    RewardScreen()
}
