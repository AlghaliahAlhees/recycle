//
//  FeedCardView.swift
//  recycle
//
//  Created by Alghalya Alhees on 01/04/2024.
//

import SwiftUI
import Firebase

struct FeedCardView: View {
    let feed: feedsModel
    
    var body: some View {
        VStack{
            // company name
            HStack {
                Spacer()
                Text("Company name")
                    .bold()
                    .padding()
            }
            
            // feed
            Text(feed.feed)
                .font(.headline)
                .padding()
            
            HStack{
                Text(feed.timestamp.dateValue().formatted())
                Text("1 week ago")
                    .font(.caption)
                    .padding()
                Spacer()
                
            }// hstack
        }// vstack
        .frame(height: 200)
        .cornerRadius(10)
        .background(Color.green.opacity(0.1))
        .padding(3)
    }
    
    
    
}

//#Preview {
//    FeedCardView(feed: feedsModel(documentId: "", data: [feed:"feed", timesstamp: ]))
//}
