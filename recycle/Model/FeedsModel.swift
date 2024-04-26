//
//  FeedsModel.swift
//  recycle
//
//  Created by Alghalya Alhees on 29/03/2024.
//

import Foundation
import SwiftUI
import Firebase



struct feedsModel: Identifiable{
    var id : String { documentId }
    let documentId : String
    let feed : String
    let timestamp: Timestamp

    init(documentId: String,data: [String: Any]) {
        self.documentId = documentId
        self.feed = data[FirebaseConstants.feed] as? String ?? ""
        self.timestamp = data[FirebaseConstants.timestamp] as? Timestamp ?? Timestamp()

    }
}


