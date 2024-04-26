//
//  ForgetPasswordScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 05/04/2024.
//

import SwiftUI
import Firebase

struct ForgetPasswordScreen: View {

    // MARK: - Properties
    @State private var email: String  = ""
//    @State private var goToLogin: Bool  = false
    @State var errorMessage = ""

    //MARK: Body

    var body: some View {
        VStack{ //Start: VStack
            
            // nav bar
            CustomNavigationBar(customTitle: resetUserPassword, EnableDissmiss: true)
            
            
              Image(systemName: "lock.circle")
                .resizable()
                .frame(width: 170, height: 170)
                .foregroundStyle(Color.black.opacity(0.7))
                .padding()
            Text(resetPassswordtTitle)
                .bold()
                .font(.title)
            Text(resetPassswordtDetail)
                .font(.caption )
                .padding()
            VStack { //Start: VStack
                
                HStack { //Start: HStack
                    Text(email)
                        .bold()
                    Spacer()
                } //End: Hstack
                .padding(.horizontal,8)

                TextField(email, text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.09))
                    .cornerRadius(12)
                    .padding(.horizontal)
            } //End: Vstack
            
            
            
            Text(errorMessage)
                .foregroundStyle(.red)
                .padding(3)
            
            Button {
                //action
                if self.email != "" {
                    // send reset link
                }
            } label: {
                Text(resetUserPassword)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            } //End:Button
            .padding(.vertical)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.green)
            .cornerRadius(12)
            .padding()
            
            
        } //End: Vstack
    }
    
    // MARK: - FUNCTIONS
    
    
    /// Fuction to reset users password
    /// - Parameter email: user email
    func resetPassword(email: String){
        Firebase.Auth.auth().sendPasswordReset(withEmail: email){ error in
            if error != nil {
                print("error")
                errorMessage = "something wrong happened please try again"
                return
            }
            print("success")
            errorMessage = "please check your email"
            
        }
    }
    
}

#Preview {
    ForgetPasswordScreen()
}
