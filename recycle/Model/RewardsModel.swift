//
//  RewardsModel.swift
//  recycle
//
//  Created by Alghalya Alhees on 27/03/2024.
//

import Foundation

import SwiftUI


struct rewardModel : Identifiable{
    var id : String { documentId }
    let documentId : String
    let Image : String
    let points : Int
//    let timestamp: Timestamp
    init(documentId: String,data: [String: Any]) {
        self.documentId = documentId
        self.Image = data["Image"] as? String ?? ""
        self.points = ["points"] as? Int ?? 0
//        self.timestamp = data[FirebaseConstants.timestamp] as? Timestamp ?? Timestamp()

    }
    
}



struct reward : Identifiable{
    var id = UUID()
    let Image : String
    let name : String
    let points : Int
//    let timestamp: Timestamp
}


var rewards: [reward] = [.init(Image: "puff", name: "puff", points: 1000),
                         .init(Image: "puff2", name: "puff", points: 5000),
                         .init(Image: "card", name: "talabat", points: 10000),
                         .init(Image: "fruit", name: "fruit basket", points: 7000),
                         .init(Image: "tree", name: "planning tree", points: 25000),
                         .init(Image: "solar", name: "solar charging", points: 35000)

]
