//
//  TimePickerView.swift
//  recycle
//
//  Created by Alghalya Alhees on 26/04/2024.
//

import SwiftUI

struct TimePickerView: View {
    // MARK: - Properties

    @State var showTimePicker: Bool = false
    @EnvironmentObject var RequestPickUpSystemVM : RequestPickUpManager
    @State var time: Date = Date()
    @State var goToAdressView: Bool = false

    var body: some View {
        VStack{
            
            // custom slider
            CustomSlider(index: 1)
            
            
            // choose time (NOW - specific time)
            HStack{
                Button{
                    // go to address view
                    showTimePicker = false
                    
                }label: {
                    VStack{
                        Image(systemName: "box.truck")
                            .resizable()
                            .frame(width: 70, height: 70)
                        // titile
                        Text("now")
                            .bold()
                            .padding()
                        
                        
                    }
                    .foregroundStyle(.black)
                    .frame(width: 150, height: 200)
                    .cornerRadius(10)
                    .background()
                    .border(showTimePicker ?  Color.black : Color.green, width: 2)
                    
                }// label
                
                Button{
                    // show time picker
                    showTimePicker = true
                }label: {
                    VStack{
                        Image(systemName: "box.truck.badge.clock")
                            .resizable()
                            .frame(width: 70, height: 70)
                        
                        Text("choose time")
                            .bold()
                            .padding()
                        
                        
                    }// vstack
                    .foregroundStyle(.black)
                    .frame(width: 150, height: 200)
                    .cornerRadius(10)
                    .background()
                    .border(showTimePicker ?  Color.green : /*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/ , width: 2)
                    
                }// label
            }// hstack
            .padding()
            
            
            //MARK: Time picker
            if showTimePicker{
                VStack{ //Start: -  Vstack
                    // Time Picker
                    DatePicker("choose time: ", selection: $time)
                }//End: -  Vstack
                .padding()
                
            }// if
            
            
            Spacer()
            
            
            //MARK:  next button
            Button{
                
                // go to address view
                RequestPickUpSystemVM.updateChosenDate(time: time)
                goToAdressView.toggle()
                
            } label: {
                Text(next)
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 320,height: 24)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }// label
            
            Spacer()
            
            
        } // vstack
        .fullScreenCover(isPresented: $goToAdressView, content: {
            AdressView().environmentObject(RequestPickUpSystemVM)

        })
    }
}

#Preview {
    TimePickerView()
}
