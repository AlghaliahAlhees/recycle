//
//  FeedScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

struct FeedScreen: View {
    // MARK: - Properties
    
    @ObservedObject var usermanagerVM = UserAccountManager()
    
    //MARK: Body
    
    var body: some View {
        VStack {
            //MARK: custom nav bar
            CustomNavigationBar(customTitle: "Feed", EnableDissmiss: false)
            ForEach (usermanagerVM.feeds){ feed in
                FeedCardView(feed: feed)
            }// for each
            
        }// vstack
        .onAppear{
            
            usermanagerVM.fetchFeeds()
        }
    }
    
    
    
}

#Preview {
    FeedScreen()
}
