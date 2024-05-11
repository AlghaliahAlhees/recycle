//
//  BottomSheet.swift
//  recycle
//
//  Created by Alghalya Alhees on 29/04/2024.
//

import SwiftUI
import AlertKit
struct BottomSheet: View {
    // MARK: - Properties

    @Binding var chosenCategory: String
    @EnvironmentObject var RequestPickUpSystemVM : RequestPickUpManager
    @State private var quantity: String = ""
    let alertView = AlertAppleMusic17View(title: "item has been added", subtitle: nil , icon: .done)
    @State private var itemAdded: Bool = false
    @State private var itemNotAdded: Bool = false

    let errorAlertView = AlertAppleMusic17View(title: "invalid quantity", subtitle: nil, icon: .error)

    // MARK: - FUNCTIONS
    var body: some View {
        VStack{
            
            HStack{
                
                Text("item type : ")
            Text("\(chosenCategory)")
                .bold()
            
        }
            .padding()
            HStack{
                
                Text("quantity: ")
                TextField("quantity", text: $quantity)
                
            }
            .padding()
            
            Button{
                
                //add
                if quantity != ""{
                    if Int(quantity) != nil {
                        RequestPickUpSystemVM.items.append(itemsType(item: chosenCategory, quantity: Int(quantity)!))
                        itemAdded.toggle()
                    }else{
                        itemNotAdded.toggle()
                    }
                }else{
                    itemNotAdded.toggle()

                }
            }label: {
                Text("add")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            } //End:Button
            .padding(.vertical)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.green)
            .cornerRadius(12)
            .padding()
            
        }
        .alert(isPresent: $itemAdded, view: alertView)
        .alert(isPresent: $itemNotAdded, view: errorAlertView)

    }
}

#Preview {
    BottomSheet(chosenCategory: .constant("glass"))
}
