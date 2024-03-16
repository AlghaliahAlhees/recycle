//
//  logInScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

struct logInScreen: View {
    
    // MARK: - Properties
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var wrongUsername: Int = 0
    @State private var wrongPassword: Int = 0
    @State private var wrongEmail:Int = 0
    @State private var showingLoginScreen: String = ""
    
    //MARK: Body
    
    
    // Shaikah - working copy - things to do
    //1) no need for ( username / wrongUsername / wrongPassword ) in this
    //2) add button for Sign up
    //3) add button for dont have an account
    
    


    var body: some View {
        
        ZStack { //Start: ZStack
            
            VStack { //Start: VStack
                
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.09))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.09))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongEmail))
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.09))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPassword))
                
                Button("forget password?"){ //Start: Button
                } //End: Button
            }
        }
    }
}






#Preview {
    logInScreen()
}
