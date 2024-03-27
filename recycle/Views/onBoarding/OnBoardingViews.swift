//
//  OnBorards.swift
//  recycle
//
//  Created by Alghalya Alhees on 23/03/2024.
//

import SwiftUI

struct OnBoardingViews: View {
    // MARK: - Properties
//    let title1: LocalizedStringKey =  "oboardText1"
//    let title2: LocalizedStringKey =  "onboardText2"
//    let title3: LocalizedStringKey =  "onboardText3"
//    let Descrption1: LocalizedStringKey =  "onboardDescription1"
//    let Descrption2: LocalizedStringKey =  "onboardDescription2"
//    let Descrption3: LocalizedStringKey =  "onboardDescription3"
    @Binding var shouldDisplayOnBoarding : Bool
    
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
