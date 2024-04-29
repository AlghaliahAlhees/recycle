//
//  UserAccountManager.swift
//  recycle
//
//  Created by Alghalya Alhees on 27/03/2024.
//

import Foundation
import SwiftUI
import Firebase

class UserAccountManager: ObservableObject {
    
    static let  shared = UserAccountManager()
    @Published var isUserCurrentlyLoggedOut = false
    @Published var feeds : [feedsModel] = []
    @Published var errorAlert : Bool = false
    @Published  var ifAccepted: Bool = false

    @Published  var userPointsCount = 0

    init() {

        self.isUserCurrentlyLoggedOut = Firebase.Auth.auth().currentUser?.uid   == nil
        fetchFeeds()
    }
    
    
    
    
    // MARK: - FUNCTIONS
    

    
    
    // send feed
    
     func sendFeed() {
        let FeedData = [FirebaseConstants.feed: "Hello everyone, thanks for using our app", FirebaseConstants.timestamp: Timestamp()] as [String : Any]
        Firebase.Firestore.firestore().collection(FirebaseConstants.feeds).document().setData(FeedData){ err in
            if let err = err {
                print(err)
                return
            }
            print("feed has been sent")
        }
    }
    
    /// Fuction to fetch Feeds from firebase
    func fetchFeeds() {
        Firestore.firestore().collection(FirebaseConstants.feeds)
            .getDocuments{snapshot, error in
                if let error = error{
                    print(error)
                    return
                }
                guard let snap = snapshot else { return }
                self.feeds.removeAll()
                for document in snap.documents{
                    let data = document.data()
                    let newFeed = feedsModel(documentId: document.documentID, data: data)
                    self.feeds.append(newFeed)
                    print(self.feeds)
                    print(newFeed)
                }
            }   }

    
    
    
    
    /// Function to fetch  currenet user
    func fetchCurrentUser()
    {
        guard let uid  = Firebase.Auth.auth().currentUser?.uid  else { return }
        
        Firebase.Firestore.firestore().collection(FirebaseConstants.users).document(uid).getDocument { snapshot , err in
            if let error = err {
                print("Faild To Fetch Current User \(error)")
                return
            }
            print("uid \(uid)")
            guard let data = snapshot?.data() else {
                return
            }
            //MARK: DECODE A DATA
            // found user
            
            
        }
    }
    
    ///  Function ito log in into an already existed account using email
    /// - Parameters:
    ///   - username: username of the user
    ///   - email: email of the user
    ///   - password: password of the user
    /// - Returns: return True if user logged in
    private func loginUser(email: String, password: String)  -> Bool {
        
        Firebase.Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
        }
        return true
    }
    
    
    
    /// this function to sign out
    func handleSignOut(){
        isUserCurrentlyLoggedOut.toggle()
        try? Firebase.Auth.auth().signOut()
    }
    
    
    
    
    ///  Fuction for creating new user account using email
    /// - Parameters:
    ///   - username: username of the user
    ///   - email: email of the user
    ///   - password: password of the user
     func createNewAccount(username: String, email: String, password: String ) {
        
        Firebase.Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.errorAlert = true
                return
            }
            print("Successfully created user: \(result?.user.uid ?? "")")
            
            self.storeUserInformation(username: username, email: email, password: password)
        }
    }
    
    /// Function fto store the user account informations
    ///  - Parameters:
    ///  - username: username of the user
    ///  - email: email of the user
    ///  - password: password of the user
    /// - Returns: return True if user information has been saved
    private func storeUserInformation(username: String, email: String, password: String )  {
        guard let uid = Firebase.Auth.auth().currentUser?.uid else { return  }
        let userData = ["email": email, "uid": uid, "username": username]
        Firebase.Firestore.firestore().collection("users").document(uid).setData(userData){ err in
            if let err = err {
                print(err)
                self.errorAlert = true

                return
            }
            print("user information has been saved")
            Auth.auth().currentUser?.sendEmailVerification()
        }
//        return true
    }//store
    
    /// Function to send verification via email
    func emailVerification (){
        Auth.auth().currentUser?.sendEmailVerification()
    }
    
    
    
    
    
}


