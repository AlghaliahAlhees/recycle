//
//  SignUpScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase
struct SignUpScreen: View {
    // MARK: - Properties
    
    @State private var email: String = ""
    @State private var password: String  = ""
    @State private var username: String  = ""
    @State private var goToLogin: Bool  = false

    
    @ObservedObject var usermanagerVM = UserAccountManager()
    @Binding var shouldDisplayOnBoarding : Bool
    @State private var show = true
    let didCompleteLogInProcess: () -> ()

    //MARK: Body
    // Galia - working copy - things to do
    //1) fix alert 
    

    
    var body: some View {
        VStack{
            HStack{
                Text("Sign up")
                    .font(.system(size: 40))
                    .font(.title)
                    .bold()
            Spacer()
            }
            .padding(.top, 100)
            .padding(.horizontal)
//            Spacer()
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button {
                if self.email != "" &&  self.password != "" && self.username != "" {
                    self.createNewAccount(username: username, email: email, password: password)
                }
            }label: {
                Text("sign up")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 320,height: 24)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)

            }
            
            Button("already have an account?"){
                goToLogin.toggle()
                
            }.padding(3)
            Spacer()
            if usermanagerVM.errorAlert {
                CustomAlertCardView(icon: "xmark", text: "could not create user", detail: "please try again ", gridentColor: .red, circleColor: .red, show: $show)
            }
                
            
        }
        .fullScreenCover(isPresented: $goToLogin, content: {
            logInScreen(didCompleteLogInProcess: {}, shouldDisplayOnBoarding: $shouldDisplayOnBoarding)
        })
      
        
        
    }
    // MARK: - FUNCTIONS
    
    
    
    ///  Fuction for creating new user account using email
    /// - Parameters:
    ///   - username: username of the user
    ///   - email: email of the user
    ///   - password: password of the user
     func createNewAccount(username: String, email: String, password: String ) {
        
        Firebase.Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
//                self.errorAlert = true
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

                return
            }
            print("user information has been saved")
            Auth.auth().currentUser?.sendEmailVerification()
            shouldDisplayOnBoarding.toggle()
        }
//        return true
    }//store
    
    
    
}

#Preview {
    SignUpScreen( shouldDisplayOnBoarding: .constant(true), didCompleteLogInProcess: {})
}
