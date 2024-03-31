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
    @ObservedObject var usermanagerVM = UserAccountManager()
    @State private var show = true

    //MARK: Body
    // working copy - things to do
    // 1) fix alert


    var body: some View {
        //MARK: -  rewards
        ScrollView(.vertical){
            LazyVGrid(columns: addApdeptdColumn, spacing: 20){
                ForEach(rewards){ reward in
                    VStack{ //Start: VStack
                        
                        // image
                        Image(reward.Image)
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        
                        
                        // title
                        Text("for \(reward.points) points")
                            .foregroundStyle(Color.white)
                        
                        // button
                        Button{
                            usermanagerVM.claimAReward(rewardPoints: reward.points, RewardTitle: reward.name)
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
            if usermanagerVM.ifAccepted{
                CustomAlertCardView(icon: "checkmark.circle", text: "reward has been claimd", detail: "congratulation you claimed your reward", gridentColor: .green, circleColor: .green, show: $show)
                
            }
        
    } //End: scroll   
}
}

#Preview {
    RewardsView()
}
