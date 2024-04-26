//
//  RewardCardView.swift
//  recycle
//
//  Created by Alghalya Alhees on 01/04/2024.
//

import SwiftUI
//import Firebase
struct RewardCardView: View {
    // MARK: - Properties

    var image: String
    var name: String
    var point: Int
    @ObservedObject var usermanagerVM = UserAccountManager()
    @Binding  var show : Bool

    //MARK: Body
    // working copy - things to do
    // 1) fix alert

    var body: some View {
        VStack{ //Start: VStack
            
            // image
            Image(image)
                .resizable()
                .frame(width: 100, height: 100)
            
            
            
            // title
            Text("for \(point) points")
                .foregroundStyle(Color.white)
            
            // button
            Button{
                usermanagerVM.claimAReward(rewardPoints: point, RewardTitle: name)
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
            .shadow(radius: 3)

       
       
}
}

#Preview {
    RewardCardView(image: "puff", name: "puff", point: 200, show: .constant(true))
}
