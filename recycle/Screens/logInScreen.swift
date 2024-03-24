//
//  logInScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

enum FocusedField {
    case email
    case password
}

struct logInScreen: View {
    
    // MARK: - Properties
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var isValidEmail: Bool = true
    @State private var isValidPassword: Bool = true
    @FocusState private var focusedField: FocusedField?
     
    
    //MARK: Body
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Login to your account")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom)
                TextField("Email", text: $emailText)
                    .focused($focusedField, equals: .email)
                    .padding()
                    .background(Color.green.opacity(0.09))
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(focusedField == .email ? Color(.black): .gray, lineWidth: 3))
                    .padding(.horizontal)
                TextField("Password", text: $passwordText)
                    .focused($focusedField, equals: .password)
                    .padding()
                    .background(Color.green.opacity(0.09))
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(focusedField == .password ? Color(.black): .gray, lineWidth: 3))
                    .padding(.horizontal)
                    .onChange(of: emailText) { newValue in
                        //                          isValidEmail = Validator.validateEmail(newValue)
                    }
            }
            HStack{
                Spacer()
                Button {
                    //action
                } label: {
                    Text("Forgot your passowrd?")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.system( size: 14, weight: .semibold))
                }
                .padding(.trailing)
            }
            Button {
                //action
            } label: {
                Text("Sign in")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            .padding(.vertical)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.green)
            .cornerRadius(12)
            .padding(.horizontal)
            //                  .opacity(canProceed ? 1.0 : 0.5)
            //                  .disabled(!canProceed)
        }
    }
}




#Preview {
    logInScreen()
}
