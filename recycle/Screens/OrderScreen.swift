//
//  OrderScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

struct OrderScreen: View {
    
    // MARK: - Properties
    @State var goBack: Bool = false
//    let index : Int = 0

    //MARK: Body
    var body: some View {
        VStack{ //Start: VStack
                
            //MARK: - navigation bar
            CustomNavigationBar(customTitle: requestPickUp , EnableDissmiss: true)
            
           
            TabView{

                
                
                //MARK: - choose categorie
                
                CategoriesView()
                
                TimePickerView()
                
                
                AdressView()
                
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
//            Spacer()
            
        }//End:Vstack
        
    }
}

#Preview {
    OrderScreen()
}
