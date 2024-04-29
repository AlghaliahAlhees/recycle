//
//  RewardSystemManager.swift
//  recycle
//
//  Created by Alghalya Alhees on 29/04/2024.
//

import Foundation
import SwiftUI
import Firebase
//import

class RewardSystemManager : ObservableObject{
    
    // MARK: - Properties

    @Published  var userPointsCount = 0
    var userPoints : Int = 0
    @Published  var ifAccepted: Bool = false
    @Published  var ifNotAccepted: Bool = false

    // MARK: - FUNCTIONS
    
    /// Function to add points for a user
    /// - Parameter points: the number of point user
    func AddUserPoints(points: Int){
        guard let uid = Firebase.Auth.auth().currentUser?.uid else { return  }
        var prevPoints : Int = 0
        // fetch how many point does a user have and then add them
        Firestore.firestore().collection(FirebaseConstants.points).whereField(FirebaseConstants.uid, isEqualTo: uid)
            .addSnapshotListener{ snapshot, error in
                if let error = error{
                    print(error)
                    return
                }
                guard let snap = snapshot else { return }
                for document in snap.documents{
                    let data = document.data()
                    // get previous user points
                    prevPoints =  data["points"] as! Int
                }
                
                // add new point for user
                let userPointsData = ["points": points]
                Firebase.Firestore.firestore().collection(FirebaseConstants.points).document(uid).setData(userPointsData){ err in
                    if let err = err {
                        print(err)
                        return
                    }
                    print("user points  has been saved")
                }
                
            }
        
    }
    
    
    
    /// function to fetch how many points do user have
    func feetcUserPointsCount() {
        guard let uid = Firebase.Auth.auth().currentUser?.uid else { return  }
        
        // fetch how many point does a user have and then add them
        Firestore.firestore().collection(FirebaseConstants.points).document(uid)
            .getDocument { snapshot , err in
                if let error = err {
                    print("Faild To Fetch Current User points \(error)")
                    return
                }
                guard let data = snapshot?.data() else {
                    return
                }
                //MARK: DECODE A DATA
                self.userPointsCount =  data["points"] as! Int
                print("user points \(self.userPointsCount)")
            }
   
        
    }
    
    
    

    /// Function for claiming a  reward
    /// - Parameter points: the number of point user
    func claimAReward(rewardPoints: Int, RewardTitle: String) {
        guard let uid = Firebase.Auth.auth().currentUser?.uid else { return   }
        // fetch how many point does a user have and then add them
        Firestore.firestore().collection(FirebaseConstants.points).document(uid).getDocument(completion: { snapshot, error in
            // it doesnt fetch user point ???? why ?
            guard let snap = snapshot else { return }
            if let error = error {
                print("Faild To Fetch points  \(error)")
                return
            }
            print("uid \(uid)")
            guard let data = snapshot?.data() else {
                return
            }
            self.userPoints = data["points"] as! Int


            print("user points = \(self.userPoints)")
      
                    // check if reward points < user points
                if rewardPoints < self.userPoints{
                    let userPointsData = ["userId": uid ,"points": rewardPoints, "rewardTitle": RewardTitle] as [String : Any]
                        Firebase.Firestore.firestore().collection(FirebaseConstants.rewards).document().setData(userPointsData){ err in
                            if let err = err {
                                print(err)
                                return
                            }
                            // update user points
                            print("user points is enough")
                            
                            let userNewPointsCount = self.userPoints - rewardPoints
                            print("new user point = \(userNewPointsCount)")
                            // add new point for user
                            let userPointsData = ["points": userNewPointsCount]
                            Firebase.Firestore.firestore().collection(FirebaseConstants.points).document(uid).setData(userPointsData){ err in
                                if let err = err {
                                    print(err)
                                    return
                                }
                                print("user new  points has been saved")
                                self.ifAccepted = true
                                self.feetcUserPointsCount()
                            }
                        }
                        
                    } else
                    {
                        // user points aren't enough
                        self.ifNotAccepted =  true
                        print(" user points aren't enough")
                    }
                    
        })
    }
    
    
}
