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
    
    //MARK: Body
    var body: some View {
        VStack{ //Start: VStack
            
            //MARK: - navigation bar
            CustomNavigationBar(customTitle: requestPickUp , EnableDissmiss: true)
            
            //MARK: - choose categorie
            
            
            
            Spacer()
            
        }//End:Vstack
        
    }
}

#Preview {
    OrderScreen()
}
