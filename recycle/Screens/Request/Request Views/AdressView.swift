//
//  AdressView.swift
//  recycle
//
//  Created by Alghalya Alhees on 13/04/2024.
//

import SwiftUI
import AlertKit


struct AdressView: View {
    // MARK: - Properties

    @EnvironmentObject var RequestPickUpSystemVM : RequestPickUpManager
    @State var complete : Bool = false
    @State var city: String = ""
    @State var address: String = ""
    @State var phoneNumber: String = ""
    @FocusState var isFocused : Bool // 1
    let alertView = AlertAppleMusic17View(title: "please enter all fileds", subtitle: nil, icon: .error)
    @State var correctAddress: Bool = false


    //MARK: Body

    var body: some View {
        VStack{
            //MARK: - CUSTOM SLIDER
            CustomSlider(index: 2)
            Spacer()
            //MARK: Address
            Text("Address")
                .font(.largeTitle)
                .bold()
                .padding()

            
            
            HStack{
                Text("City: ")
                TextField("city", text: $city)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocused) // 2

            }
            .padding()

            HStack{
                Text("address: ")
                TextField("address", text: $address)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocused) // 2

            }
            .padding()
            
            HStack{
                Text("phone number: ")
                TextField("phone number", text: $phoneNumber)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocused) // 2

            }
            .padding()
            
            Button{
                // to complete
                getAddress(city: city, address: address, phoneNumber: phoneNumber)
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
            
            
            Spacer()
        }            .alert(isPresent: $correctAddress, view: alertView)

        .onTapGesture {
            isFocused = false
        }
        
        .fullScreenCover(isPresented: $complete, content: {
            CompleteScreen()
        })
        
    }
    
    // MARK: - FUNCTIONS
    
    /// add address
    func getAddress(city: String, address:String, phoneNumber: String){
        if city != "" &&  phoneNumber != "" &&  address != "" {
            let address = "city: \(city), address \(address), phone number \(phoneNumber)"
            RequestPickUpSystemVM.address = address
            complete.toggle()
        }else{
            
            correctAddress.toggle()
        }

        
    }
    
    
}

#Preview {
    AdressView()
}
