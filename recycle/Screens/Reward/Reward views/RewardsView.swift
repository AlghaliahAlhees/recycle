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
    @EnvironmentObject var rewardSystemVM : RewardSystemManager
    @State private var show = true

    //MARK: Body
    // working copy - things to do
    // 1) fix alert


    var body: some View {
        //MARK: -  rewards
        ScrollView(.vertical){
            LazyVGrid(columns: addApdeptdColumn, spacing: 20){
                ForEach(rewards){ reward in
                    RewardCardView(image: reward.Image, name: reward.name, point: reward.points, show: $show)
                    
                }//End: for each
            } //End: scroll

        
    } //End: scroll   
}
}

#Preview {
    RewardsView()
}
