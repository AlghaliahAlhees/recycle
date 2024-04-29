//
//  logInScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase

import AlertKit
enum FocusedField {
    case email
    case password
    case username
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
    @State private var shouldgoToSgignUp: Bool = false
    @State private var shouldgoToResetPassword: Bool = false
    @FocusState var isFocused : Bool // 1
    @State private var errorMessage: String  = ""
    let alertView = AlertAppleMusic17View(title: "loading", subtitle: "", icon: .spinnerLarge)
    @State private var isLoading: Bool = false

    
    
    //MARK: Body
    
    var body: some View {
        VStack{
            VStack {
                Text("Login to your account")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.bottom)
                    .padding(.top, 200)
//                Spacer()
                
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .padding(3)
                
                
                
                
                VStack{ //Start: Vstack
                    HStack {
                        Text("email")
                            .bold()
                        Spacer()
                    }
                    .padding(.horizontal,8)

                    TextField("Email", text: $email)
                        .focused($focusedField, equals: .email)
                        .focused($isFocused) // 2

                        .padding()
                        .background(Color.green.opacity(0.09))
                        .cornerRadius(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(focusedField == .email ? Color(.black): .gray, lineWidth: 3))
                        .padding(.horizontal)
                    
                }//End: Vstack
                .padding(.bottom)
                VStack{ //Start: Vstack
                    HStack {
                        Text("passwrod")
                            .bold()
                        Spacer()
                    } //End: Hstack
                    .padding(.horizontal,8)

                    SecureField("Password", text: $password)
                        .focused($focusedField, equals: .password)
                        .focused($isFocused) // 2

                        .padding()
                        .background(Color.green.opacity(0.09))
                        .cornerRadius(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(focusedField == .password ? Color(.black): .gray, lineWidth: 3))
                        .padding(.horizontal)
                }//End: Vstack
                
                
            } //End: Hstack
            HStack{
                Spacer()
                Button {
                    //action
                    shouldgoToResetPassword.toggle()
                } label: {
                    Text("Forgot your passowrd?")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.system( size: 14, weight: .semibold))
                } //End: Button
                .padding(.trailing)
            } //End:Hstack
            Button {
                //action
                isLoading = true
                if self.email != "" &&  self.password != "" {
                    self.loginUser( email: email, password: password)

                }
                isLoading = false

            } label: {
                Text("log in")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            } //End:Button
            .padding(.vertical)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.green)
            .cornerRadius(12)
            .padding()
            
            .alert(isPresent: $isLoading, view: alertView)

            
            Spacer()
            
            
            Button("create a new account"){
                shouldgoToSgignUp.toggle()
            }
            
        }// vstack
        .fullScreenCover(isPresented: $shouldgoToSgignUp, content: {
            SignUpScreen(shouldDisplayOnBoarding: $shouldDisplayOnBoarding, didCompleteLogInProcess: {})
        })

        .fullScreenCover(isPresented: $shouldgoToResetPassword, content: {
        ForgetPasswordScreen()
        })
        .onTapGesture {
            isFocused = false
        }
        
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
                self.errorMessage = "Failed to login user, try again"
                isLoading = false

                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")

            shouldDisplayOnBoarding.toggle()
            
        }
    }
    
    
    
    
}




#Preview {
    logInScreen(didCompleteLogInProcess: {}, shouldDisplayOnBoarding: .constant(false))
}
