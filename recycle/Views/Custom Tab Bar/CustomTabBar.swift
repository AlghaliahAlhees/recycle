//
//  CustomTabBar.swift
//  recycle
//
//  Created by Alghalya Alhees on 19/03/2024.
//

import SwiftUI

struct CustomTabBar: View {
    
    // MARK: - Properties
    @Binding var selectedTabs : Tabs
    @State var goToORderScreen: Bool = false
    
    //MARK: Body
    
    var body: some View {
        
        HStack(alignment: .center){ //Start:HStack
            
            
            //MARK: Profile Tab
            HStack(alignment: .center){//Start:HStack
                
                Button {  //Start: Button
                    // go to profile
                    selectedTabs = .profile
                } label: {
                    TabBarButton(buttonText: "profile", imageName: "house", isActive: selectedTabs == .profile )
                }
                .tint(Color.gray)
            } //End: HStack
            
            //MARK: leaderboard Tab
            HStack(alignment: .center){ //Start:HStack
                Button {  //Start: Button
                    // go to  leaderboard
                    selectedTabs = .leaderboard
                    
                } label: {
                    
                    TabBarButton(buttonText: "info", imageName: "info", isActive: selectedTabs == .leaderboard)
                }
                .tint(Color.gray)
            } //End: HStack
            
            
            
            
            //MARK: request Tab Button
            Button {  //Start: Button
                // go to  order screen
                goToORderScreen.toggle()
            }   //END: Button
        label: { //Start: Label
                    
            VStack(alignment: .center, spacing: 4) { //Start: VStack
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.green)
                    .frame(width: 50, height: 50)
                
            } //End:VStack
            
        }//END: LABEL
             //MARK:  Feeds Tab
            
            HStack(alignment: .center){ //Start:HStack
                Button {  //Start: Button
                    // go to  feeds
                    selectedTabs = .feeds
    
                }  //END: Button
            label: { //Start: LABEL
                
                TabBarButton(buttonText: "feed", imageName: "captions.bubble", isActive: selectedTabs == .feeds)
            }  //END: LABEL
            .tint(Color.gray)
            }//End: HStack
            
            
            //MARK: Reward Tabs
            HStack(alignment: .center){ //Start:HStack
                
                Button { //Start: Button
                    // go to  reward
                    selectedTabs = .reward
                }   //END: Button
            label: {  //Start: label
                TabBarButton(buttonText: "reward", imageName: "gift", isActive: selectedTabs == .reward)
            } //End: Label
            .tint(Color.gray)
            } //End: HStack
            
        }//End: HStack
        .frame( height: 62)
        .fullScreenCover(isPresented: $goToORderScreen, content: {
            OrderScreen()
        }) //End: full screen
    }
}

#Preview {
    CustomTabBar(selectedTabs: .constant(.profile))
}
