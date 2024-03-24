//
//  ContentView.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

struct ContentView: View {
    // an example of how to localize a text 
    let text1: LocalizedStringKey =  "oboardText1"
    @State var selectedTabs : Tabs = .profile
    @AppStorage("shouldDisplayOnBoarding")  var shouldDisplayOnBoarding : Bool = true
    var body: some View {
        
        VStack {
            
//OnBorards()
            //MARK: Custom tabView
//            
            if selectedTabs == .profile{
                logInScreen()
            }
            if selectedTabs == .feeds{
                FeedScreen()
            }
            
            if selectedTabs == .reward{
                RewardScreen()
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
