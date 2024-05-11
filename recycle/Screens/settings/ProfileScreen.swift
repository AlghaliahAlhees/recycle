//
//  ProfileScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase


struct ProfileScreen: View {
    
    // MARK: - Properties
    
    @Binding var shouldDisplayOnBoarding : Bool
    @EnvironmentObject var userManagerVM : UserAccountManager
    
    
    //MARK: Body
    var body: some View {
        NavigationView{
                  VStack{
                      
                      // user name
                      Text("Hello, \(userManagerVM.username)")
                             .padding() // padding with the primary color (black)
                                 .foregroundColor(.black) // font color to black
                                 .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/) // font type
                                 .padding(.vertical)
                  
                      
                      // go to edit profile view
                      NavigationLink(destination: EditProfileScreen().environmentObject(userManagerVM)){
                          Text("Edit account").frame(width: 300, height: 50, alignment: .center)
                              .background(Color.green)
                              .foregroundColor(.white)
                              .cornerRadius(12)
                      }
                      
                      
                      // go to about us
                      NavigationLink(destination: AboutUsScreen()){
                          Text("about Us").frame(width: 300, height: 50, alignment: .center)
                              .background(Color.green)
                              .foregroundColor(.white)
                              .cornerRadius(12)
                      }
                      
                      
                      
                      // log out button
                      Button{
                          // log out
                          handleSignOut()
                          
                      }label: {
                          
                      
                          Text("log out").frame(width: 300, height: 50, alignment: .center)
                              .background(Color.green)
                              .foregroundColor(.white)
                              .cornerRadius(12)
                      }
                      
                      
                      // go to delete account 
                      NavigationLink(destination: DeleteAccountScreen().environmentObject(userManagerVM)){
                          Text("delete account")
                              .foregroundColor(.red)
                      }
                  }
              }
                 
       
 
        
    }
    
    
    
    
    // MARK: - FUNCTIONS
    
//    
    /// this function to sign out
    func handleSignOut(){
        do{
            try? Firebase.Auth.auth().signOut()
            userManagerVM.isUserCurrentlyLoggedOut.toggle()
            shouldDisplayOnBoarding.toggle()
        }
    }
  
    
}

#Preview {
    ProfileScreen(shouldDisplayOnBoarding: .constant(false))
}
