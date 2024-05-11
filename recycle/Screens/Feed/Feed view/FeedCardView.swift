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
                Text("Recycle")
                    .bold()
                    .padding()
                Spacer()
            }
            
            // feed
            Text(feed.feed)
                .font(.callout)
                .lineLimit(5)
                .padding()
            
            HStack{
                Text(feed.timestamp.dateValue().formatted())
                    .font(.caption)
                    .padding()
                Spacer()
                
            }// hstack
        }// vstack
        .cornerRadius(10)
        .frame(height: 200)
        .background(Color.green.opacity(0.1))
        .padding(3)
    }
    
    
    
}

//#Preview {
//    FeedCardView(feed: feedsModel(documentId: "", data: [feed:"feed", timesstamp: ]))
//}
