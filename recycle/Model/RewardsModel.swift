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
