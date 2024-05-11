//
//  OnBoardingView.swift
//  recycle
//
//  Created by Alghalya Alhees on 23/03/2024.
//

import SwiftUI

struct OnBoardingCardView: View {
    
    // MARK: - Properties
    let image: String
    let title: LocalizedStringKey
    let description: LocalizedStringKey
    let showDismissButton: Bool
    let index : Int
    @Binding var shouldDisplayOnBoarding : Bool
    @State var goToSignUp : Bool = false
    
    //MARK: Body
    
    var body: some View {
        VStack{ //Start: VSatck
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 350)

            VStack{ //Start: VStack
                
                HStack{ //Start: HStack
                    Text(title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 32))
                        .bold()
                    Spacer()
                    
                }//End: HStack
             
                HStack{ //Start: HStack
                    Text(description)
                        .font(.callout)
                        .font(.system(size: 22))

                    Spacer()
                } //End: HStack
                .padding(.top, 10)
            }//End: VStack
            .padding()
            
            Spacer()
            
            
            if showDismissButton{
                
                Button{
//                    shouldDisplayOnBoarding.toggle()

                    // go to sign up
                    goToSignUp.toggle()
                    
                }label: {
                    Text(next)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 320,height: 24)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
             Spacer()
            
            
            HStack{
                ForEach (0..<3, id: \.self){ i in
                    HStack{ //Start: HStack
                        if i == index {
                            ZStack { //Start: Zstack
                                Color.green
                                
                            } //End: ZStack
                            }else{
                            ZStack { //Start: Zstack
                                Color.gray
                                
                            }//End: ZStack
                        }//End: else
                        
                    }//End: HStack
                    .frame(width: 60,height: 15)
                    
                } //End: forEach
            }//End: HStack
            .padding()
          
            
        } //End: VStack
        .fullScreenCover(isPresented: $goToSignUp, content: {
            SignUpScreen( shouldDisplayOnBoarding: $shouldDisplayOnBoarding, didCompleteLogInProcess: {})
        })
   
    }
}

#Preview {
    OnBoardingCardView(image: "gift", title: "earn points", description: "here you can earn rewards for recycling ", showDismissButton: true, index: 0, shouldDisplayOnBoarding: .constant(true))
}
