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
            HStack{ //Start: Hstack
                
                Button{
                    // go back
                    goBack.toggle()
                }label: {
                    
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color.black)
                }
                Spacer()
                Text("request pickup")
                    .bold()
                Spacer()
            } //End: HStack
            .padding()
            
            
            //MARK: - choose categorie
            
            
            
            Spacer()
            
        }//End:Vstack
        .fullScreenCover(isPresented: $goBack, content: {
            ContentView()
        })
    }
}

#Preview {
    OrderScreen()
}
