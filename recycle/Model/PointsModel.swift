//
//  PointsModel.swift
//  recycle
//
//  Created by Alghalya Alhees on 27/03/2024.
//

import Foundation
import SwiftUI

struct pointsModel: Identifiable{
    var id : String { documentId }
    let documentId : String
    let uid, points : String

    init(documentId: String,data: [String: Any]) {
        self.documentId = documentId
        self.uid = data[FirebaseConstants.uid] as? String ?? ""
        self.points = data[FirebaseConstants.points] as? String ?? ""
    }
}
