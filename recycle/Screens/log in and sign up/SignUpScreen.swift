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
    @State private var errorMessage: String  = ""
    @FocusState var isFocused : Bool // 1

    @ObservedObject var usermanagerVM = UserAccountManager()
    @Binding var shouldDisplayOnBoarding : Bool
    @State private var show = true
    let didCompleteLogInProcess: () -> ()
    @FocusState private var focusedField: FocusedField?
    
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
            
            Text(errorMessage)
                .foregroundStyle(.red)
                .padding(3)
            
            VStack {
                
                HStack {
                    Text("username")
                        .bold()
                    Spacer()
                }
                
                .padding(.horizontal,8)
                TextField("Username", text: $username)
                    .focused($focusedField, equals: .username)
                    .focused($isFocused) // 2

                    .padding()
                    .background(Color.green.opacity(0.09))
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(focusedField == .email ? Color(.black): .gray, lineWidth: 3))
                    .padding(.horizontal)
            }
            
            
            VStack {
                
                HStack {
                    Text("email")
                        .bold()
                    Spacer()
                }
                .padding(.horizontal,8)

                TextField("Email", text: $email)
                    .focused($isFocused) // 2

                    .focused($focusedField, equals: .email)
                    .padding()
                    .background(Color.green.opacity(0.09))
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(focusedField == .email ? Color(.black): .gray, lineWidth: 3))
                    .padding(.horizontal)
            }
            
            VStack {
                
                HStack {
                    Text("password")
                        .bold()
                    Spacer()
                }
                .padding(.horizontal,8)

                
                SecureField("Password", text: $password)
                    .focused($focusedField, equals: .password)
                    .focused($isFocused) // 2

                    .padding()
                    .background(Color.green.opacity(0.09))
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(focusedField == .email ? Color(.black): .gray, lineWidth: 3))
                    .padding(.horizontal)
            }
            
            Button {
                if self.email != "" &&  self.password != "" && self.username != "" {
                    self.createNewAccount(username: username, email: email, password: password)
                }
                else{
                    errorMessage = "please make sure to enter all filds"
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
            .padding()
            
            Button("already have an account?"){
                goToLogin.toggle()
                
            }.padding(3)
            Spacer()
       
            
            
        }
        .fullScreenCover(isPresented: $goToLogin, content: {
            logInScreen(didCompleteLogInProcess: {}, shouldDisplayOnBoarding: $shouldDisplayOnBoarding)
        })
        .onTapGesture {
            isFocused = false
        }
        
        
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
                self.errorMessage = "failed to create useer "
                return
            }
            print("Successfully created user: \(result?.user.uid ?? "")")
            
            self.storeUserInformation(username: username, email: email, password: password)
        }
    }
    
    /// Function fto store the user account informations
    ///  - Parameters:
    ///  - username: username of the user
    ///  - email:  email of the user
    ///  - password: password of the user
    private func storeUserInformation(username: String, email: String, password: String )  {
        guard let uid = Firebase.Auth.auth().currentUser?.uid else { return  }
        let userData = ["email": email, "uid": uid, "username": username]
        Firebase.Firestore.firestore().collection("users").document(uid).setData(userData){ err in
            if let err = err {
                // could not save user information
                print(err)
                
                return
            }
            // user information has been saved
            print("user information has been saved")
            Auth.auth().currentUser?.sendEmailVerification()
            shouldDisplayOnBoarding.toggle()
        }
    }//store
    
    
    
}

#Preview {
    SignUpScreen( shouldDisplayOnBoarding: .constant(true), didCompleteLogInProcess: {})
}
