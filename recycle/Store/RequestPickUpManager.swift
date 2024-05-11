//
//  RequestPickUpManager.swift
//  recycle
//
//  Created by Alghalya Alhees on 29/04/2024.

import SwiftUI
import Firebase

struct  itemsType: Identifiable {
    var id = UUID()
    let item: String
    let quantity: Int
}


class RequestPickUpManager : ObservableObject{
    
    // MARK: - Properties
    
    @Published var items : [ itemsType ] = []
     @Published var address : String = ""
    @Published var chosenDate: String?
    @Published var points : String = ""

    
    // MARK: - FUNCTIONS

    /// format date
    func updateChosenDate(time: Date) {
        self.chosenDate = time.formatted(date: .complete, time: .complete)
    }
    
    /// function to send request
    func sendRequest() {
        let requestRef = Firestore.firestore().collection(FirebaseConstants.pickUpRequest).document()
        var requestData: [String: Any] = [:]
        // Add items to requestData
           var itemsData: [[String: Any]] = []
           for item in items {
               let itemData: [String: Any] = [
                   "name": item.item,
                   "quantity": item.quantity
               ]
               itemsData.append(itemData)
           }
           requestData["items"] = itemsData
           
           // Add address to requestData
        if address != nil {
            requestData["address"] = address
        }
           // Add chosenDate to requestData
           if let chosenDate = chosenDate {
               requestData["chosenDate"] = chosenDate
           }
           
           // Set data in Firestore document
           requestRef.setData(requestData)
    }
    
    
}
