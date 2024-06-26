//
//  OnBorards.swift
//  recycle
//
//  Created by Alghalya Alhees on 23/03/2024.
//

import SwiftUI

struct OnBoardingViews: View {
    // MARK: - Properties

    @Binding var shouldDisplayOnBoarding : Bool
    @State var gotoContentView = false
    @ObservedObject var userVm = UserAccountManager()
    //MARK: Body
    var body: some View {
        VStack{
          
                TabView{
                    
                    OnBoardingCardView(image: "trash", title: title1 , description: Descrption1, showDismissButton: false, index: 0, shouldDisplayOnBoarding: $shouldDisplayOnBoarding)
                    
                    OnBoardingCardView(image: "gift", title: title2 , description: Descrption2, showDismissButton: false, index: 1, shouldDisplayOnBoarding: $shouldDisplayOnBoarding)
                    
                    OnBoardingCardView(image: "car", title: title3 , description: Descrption3, showDismissButton: true, index: 2, shouldDisplayOnBoarding: $shouldDisplayOnBoarding)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
    
        
            
            
            
        
    }
}

#Preview {
    OnBoardingViews(shouldDisplayOnBoarding: .constant(true))
}
