//
//  ContentView.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    // MARK: - Properties
    
    @State var selectedTabs : Tabs = .profile
    @AppStorage("shouldDisplayOnBoarding")  var shouldDisplayOnBoarding : Bool = true
    //MARK: Body

    var body: some View {
        
        VStack {
           
                //MARK: Custom tabView
                if selectedTabs == .profile{
                    ProfileScreen(shouldDisplayOnBoarding: $shouldDisplayOnBoarding)
                        .environmentObject(UserAccountManager())
                }
                if selectedTabs == .feeds{
                    FeedScreen()
                }
                
                if selectedTabs == .reward{
                    RewardScreen()
                        .environmentObject(RewardSystemManager())
                }
                if selectedTabs == .leaderboard{
                    RecycleInfoView()
                }
                
                Spacer()
                
                CustomTabBar(selectedTabs:  $selectedTabs)
                
            }
                .padding()
                .fullScreenCover(isPresented: $shouldDisplayOnBoarding, content: {
                    OnBoardingViews(shouldDisplayOnBoarding: $shouldDisplayOnBoarding)
                })
        }
    
    
    
    
    
    
}

#Preview {
    ContentView()
}
