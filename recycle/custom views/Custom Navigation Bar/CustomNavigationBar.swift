//
//  CustomNavigationBar.swift
//  recycle
//
//  Created by Alghalya Alhees on 27/03/2024.
//

import SwiftUI

struct CustomNavigationBar: View {
    var customTitle:LocalizedStringKey
    var EnableDissmiss: Bool
    @Environment(\.presentationMode) var presentationMode
    

    var body: some View {
        //MARK: - navigation bar
        HStack{ //Start: Hstack
            //MARK: BUTTON
            if EnableDissmiss{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(Font.body.bold())
                        .foregroundColor(.black)
                }//label
//
            }//if enable
            
            
            Spacer()
            Text(customTitle)
                .bold()
                .font(.system(size: 24))
            Spacer()
            
        } //End: HStack
        .padding(.bottom, 10)
        .padding()
        
        
    }
}

#Preview {
    CustomNavigationBar(customTitle: "points", EnableDissmiss: true)
}
