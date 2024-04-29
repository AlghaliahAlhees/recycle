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
    @ObservedObject var usermanagerVM = UserAccountManager()
    @State var username: String = "no user "
    
    
    //MARK: Body
    
    var body: some View {
        VStack{
            
            Text("Hello \(username)")
                .padding() // padding with the primary color (black)
                .foregroundColor(.black) // font color to black
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/) // font type
                .padding(.vertical)
            
            // point total
            Button(action: {
                // perform
                print("point tapped!")
            }) {
                // button
                HStack {
                    Text("point total")
                        .fontWeight(.light)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
            .buttonStyle(GradientBackgroundStryle())
            .padding(.vertical)
            
            //edit account
            Button(action: {
                // perform
                print("Edit tapped!")
            }) {
                // button
                HStack {
                    Image(systemName: "square.and.pencil")
                        .font(.title3)
                    Text("Edit account")
                        .fontWeight(.light)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
            .buttonStyle(GradientBackgroundStryle())
            
            // about us
            Button(action: {
                // perform
                print("about us tapped")
            }) {
                // button
                HStack {
                    Image(systemName: "")
                        .font(.title3)
                    Text("about us")
                        .fontWeight(.light)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
            .buttonStyle(GradientBackgroundStryle())
            .padding(.vertical)
            .buttonStyle(GradientBackgroundStryle())
            .padding(.bottom)
            
            
            VStack{
                Button{
                    // log out
                    handleSignOut()
                    
                }label: {
                    
                    
                    Text("Log out")
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                } // button
            } //vstack
            
            Button(action: {
                // perform
                print("delete tapped")
            }) {
                // button
                HStack {
                    Image(systemName: "trash")
                        .font(.title3)
                        .foregroundColor(.red)
                    Text("Delete account")
                        .foregroundColor(.red)
                }
            }// delete button
            
        }//V Stack
        
        .onAppear(){
            fetchCurrentUser()
        }
        
    }
    
    
    
    
    // MARK: - FUNCTIONS
    
    
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
