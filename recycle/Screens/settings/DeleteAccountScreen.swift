//
//  DeleteAccountScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI
import Firebase

struct DeleteAccountScreen: View {
    
    // MARK: - Properties
    @State private var optional = ""
    @EnvironmentObject var userManagerVM : UserAccountManager
    @State private var  showingDeletUserAlert : Bool = false

    //MARK: Body
    
    var body: some View {
        
        VStack {
            
            Text("Delete your account")
                .font(.title2)
                .bold()
                .padding()
            Spacer()

            VStack{
                Image("sad")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 20)
                    .frame(height: 50)
                    .padding()
                Spacer()
                Text("We hate goodbyes")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                Text("Sorry to see you go, hope to see you back again")
                    .foregroundColor(.gray)
                Spacer()
                Text("Tell us Why you")
                    .foregroundColor(.black)
                    .bold()
                TextField("optional... ", text: $optional)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.09))
                    .cornerRadius(10)
                Spacer()
                HStack{
                    Button{
                        //action
                        // send report
                        sendReport(report: optional)
                        
                        
                        // delete account
                        showingDeletUserAlert.toggle()
                        
                    }label: {
                        Text("Delete my account")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(width: 160, height: 60)
                    .background(.green)
                    .cornerRadius(12)
                    .alert(isPresented: $showingDeletUserAlert) {
                        Alert(
                            title: Text("Are you sure you want to delete your account?"),
                            primaryButton:.destructive(Text("delete"))
                            {
                                userManagerVM.handlDeleteAccount()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    
                    
                }// hstack
                Spacer()

            }// vstack
            .padding()
        }// vstack
        
        
    }
    
    // MARK: - FUNCTIONS
    
    /// funtion to delete  account
    func sendReport(report: String){
        if report != "" {
            guard let uid = Firebase.Auth.auth().currentUser?.uid else { return }
            let document = Firebase.Firestore.firestore().collection(FirebaseConstants.reports).document()
            let data = [FirebaseConstants.timestamp: Timestamp(),
                        FirebaseConstants.uid: uid,
                        FirebaseConstants.report: report
            ] as [String : Any]
            document.setData(data){error in
                if let error = error {
                    // didnt send
                    print("Failed to Send ")
                    return
                }else{
                    print("SuccessFully saved report")
                }
            }
        }
        
   
        
        
    }// end send reprot
    
    
    
}

#Preview {
    DeleteAccountScreen()
}
