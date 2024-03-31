//
//  logInScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase
enum FocusedField {
    case email
    case password
}

struct logInScreen: View {
    
    // MARK: - Properties
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isValidEmail: Bool = true
    @State private var isValidPassword: Bool = true
    @FocusState private var focusedField: FocusedField?
    let didCompleteLogInProcess: () -> ()
    @Binding var shouldDisplayOnBoarding : Bool
    
    // Galia - working copy - things to do
    //1) add alert
    

    //MARK: Body
    
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
//
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button {
                if self.email != "" &&  self.password != "" {
                    self.loginUser( email: email, password: password)
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
//                goToLogin.toggle()
                
            }.padding(3)
            Spacer()
                
            
        }
//        .fullScreenCover(isPresented: $goToprofile , content: {
//            ProfileScreen(shouldDisplayOnBoarding: <#Binding<Bool>#>)
//        })
//
        
        
        
    }
    
    
    // MARK: - FUNCTIONS
    
    ///  Function ito log in into an already existed account using email
    /// - Parameters:
    ///   - username: username of the user
    ///   - email: email of the user
    ///   - password: password of the user
//    / - Returns: return True if user logged in
    private func loginUser(email: String, password: String) {
        
        Firebase.Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
//            goToprofile.toggle()
            shouldDisplayOnBoarding.toggle()

            
        }
    }
    
    
    
    
}




#Preview {
    logInScreen(didCompleteLogInProcess: {}, shouldDisplayOnBoarding: .constant(false))
}
