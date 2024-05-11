//
//  EditProfileScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase
import AlertKit
struct EditProfileScreen: View {
    // MARK: - Properties
    @State private var username = ""
    @State private var email = ""
    @EnvironmentObject var userManagerVM : UserAccountManager
  

    let alertView = AlertAppleMusic17View(title: "user account has been updated", subtitle: nil, icon: .done)
    let alertView2 = AlertAppleMusic17View(title: "something wrong happened", subtitle: "try again" , icon: .error)
    //MARK: Body
    var body: some View {
        VStack {
            NavigationStack{
                VStack {
                    
                    Text("Edit Profile")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Username", text: $userManagerVM.username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.09))
                        .cornerRadius(10)
                    
                    TextField("Email", text: $userManagerVM.email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.09))
                        .cornerRadius(10)
                    
                
                    HStack{
                        Button{
                            //save data
                            userManagerVM.updateUserInformation()
                            
                        }label: {
                            Text("Save")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                        } // button
                        .frame(width: 160, height: 60)
                        .background(.green)
                        .cornerRadius(12)
                        .padding()
                        
                        
                    
                    } // hstack
                }// vstack 
                Spacer()

            } // navifation
        }// vstack
        .alert(isPresent: $userManagerVM.updatedUserInfo, view: alertView)
        .alert(isPresent: $userManagerVM.NotupdatedUserInfo, view: alertView2)
        
        
    }
    
    
    
 
    
        }



#Preview {
    EditProfileScreen()
}
