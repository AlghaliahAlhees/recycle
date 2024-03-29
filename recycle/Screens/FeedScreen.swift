//
//  FeedScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

struct FeedScreen: View {
        @ObservedObject var usermanagerVM = UserAccountManager()

    var body: some View {
        VStack {
            if !usermanagerVM.feeds.isEmpty{
                Text(usermanagerVM.feeds[0].feed)
            }
            Button{
                usermanagerVM.sendFeed()
                
            }label: {
                Text("press me")
            }.onAppear{
                
                usermanagerVM.fetchFeeds()
        }
        }
    }
}

#Preview {
    FeedScreen()
}
