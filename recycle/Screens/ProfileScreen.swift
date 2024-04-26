//
//  ProfileScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase


// Mark: Crop Config
enum Crop: Equatable{ // the crop image view's shape type and size are definded
case circle
case rectangle
case square
case custom(CGSize)
 

    func name()->String{ // to display the buttom on the action sheet
    switch self {
    case .circle:
    return "Circle"
    case .rectangle:
    return "Rectangle"
    case .square:
    return "Square"
    case let .custom(cGSize):
    return "Custom \(Int(cGSize.width))x\(Int(cGSize.height))"
           }
       }
       // define custom sizes for cirle, rectangle, and sqare
    func size()->CGSize{
    switch self {
    case .circle:
    return .init(width: 300, height: 300)
    case .rectangle:
    return .init(width: 300, height: 500)
    case .square:
    return .init(width: 300, height: 300)
    case .custom(let cGSize):
    return cGSize
           }
       }
    }
    
    
    
    
    
struct ProfileScreen: View {
    @Binding var shouldDisplayOnBoarding : Bool
    @ObservedObject var usermanagerVM = UserAccountManager()
    @State var username: String = "no user "
 

    
    
    var body: some View {
        VStack{
            
    
            Text(username)
            Text("profile view ")
            Spacer()
            Button("sign out"){
                
                handleSignOut()
            }
            .onAppear(){
                fetchCurrentUser()
            }
            
        }
        
        
        
        
    }
    
    /// this function to sign out
    func handleSignOut(){
        do{
            try? Firebase.Auth.auth().signOut()
            usermanagerVM.isUserCurrentlyLoggedOut.toggle()
            shouldDisplayOnBoarding.toggle()
        }   
    }
    
    
    
    /// this function to fetch the currenet user
    func fetchCurrentUser()
    {
        guard let uid  = Firebase.Auth.auth().currentUser?.uid  else { return }
        Firebase.Firestore.firestore().collection(FirebaseConstants.users).document(uid).getDocument { snapshot , err in
            if let error = err {
                print("Faild To Fetch Current User \(error)")
                username = "Faild To Fetch Current User"
                return
            }
            print("uid \(uid)")
            guard let data = snapshot?.data() else {
                return
            }
            //MARK: DECODE A DATA
            username = data["username"] as! String
        }
        print("username")
    }
    
    
    
}

#Preview {
    ProfileScreen(shouldDisplayOnBoarding: .constant(false))
}
