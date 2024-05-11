//
//  CategoriesView.swift
//  recycle
//
//  Created by Alghalya Alhees on 13/04/2024.
//

import SwiftUI



struct CategoriesView: View {
    
    
    // MARK: - Properties
    @EnvironmentObject var RequestPickUpSystemVM : RequestPickUpManager
    @State var addApdeptdColumn = [GridItem(.adaptive(minimum: 170 ))]
   @State  var chosenCategory : String = ""
    @State var goToTimePicker: Bool = false
    @State private var showingButtonsheet = false

    //MARK: Body
    
    var body: some View {
        VStack{ //Start: VCtack
            Text("Choose items type")
                .bold()
            
                //MARK: - CUSTOM SLIDER
            CustomSlider(index: 0)

            ScrollView(.vertical){
                LazyVGrid(columns: addApdeptdColumn, spacing: 20){
                    ForEach(categories){ category in
                        
                        
                            
                            Button{
//                                category.isPressed = true
                                self.chosenCategory = category.name
                                showingButtonsheet.toggle()
                            }label: {
                                VStack{
                                // image
                                Image(category.image)
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .scaledToFit()
                                
                                //type
                                Text(category.name)
                                    .bold()
                                    .font(.system(size: 24))
                                    .foregroundStyle(Color.black)
                                
                                
                            }//End: Vstack
                            .frame(height: 170)
                            .padding()
                            .background(category.isPressed ? Color.blue.opacity(0.5) : Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            
                            
                        }//End: label
                        
                        
                        
                    }//End: for each
                    .padding()
                    
                
                }//End: lazy
                } //End: scroll
            
            Button {
                // go to time picker view
                goToTimePicker.toggle()
                
              
            } label: {
                
                
                Text(next)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                
                
                
            } //End:Button
            .padding(.vertical)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.green)
            .cornerRadius(12)
            .padding()
            
        } //End: Vstack
            .fullScreenCover(isPresented: $goToTimePicker, content: {
                TimePickerView().environmentObject(RequestPickUpSystemVM)
                
            })
        
            .sheet(isPresented: $showingButtonsheet) {
                if #available(iOS 16.0, *) {
                    BottomSheet(chosenCategory: $chosenCategory)
                        .environmentObject(RequestPickUpSystemVM)
                        .presentationDetents([.fraction(0.8),.medium])
                } else {
               
                    
                }
            }
            
       
    }
}

#Preview {
    CategoriesView()
}
