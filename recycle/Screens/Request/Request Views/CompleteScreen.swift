//
//  CompleteScreen.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

struct CompleteScreen: View {
    
    // MARK: - Properties
    @EnvironmentObject var RequestPickUpSystemVM : RequestPickUpManager
    @State var finished : Bool = false
    //MARK: Body

    var body: some View {
        VStack{
            
            Image("happy")
                .resizable()
                .frame(width: 200, height: 200)
            
            
            
            Text("congratulation ")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.green)
            
            Text("you have earned some new points.We'll notify you of the specific amount once we've received the items.")
                .font(.callout)
                .foregroundStyle(.black.opacity(0.6))
                .padding(7)
            
            
            
            
            
            Button{
                // submit
                RequestPickUpSystemVM.sendRequest()
                //go to home view
                finished.toggle()
            }label: {
                Text("request pick up")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            } //End:Button
            .padding(.vertical)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.green)
            .cornerRadius(12)
            .padding()
            
            
            
            
            
            
            
            
            
            
        }
        .fullScreenCover(isPresented: $finished, content: {
            ContentView()
        })
    }
}

#Preview {
    CompleteScreen()
}
