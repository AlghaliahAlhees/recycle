//
//  CategoriesView.swift
//  recycle
//
//  Created by Alghalya Alhees on 13/04/2024.
//

import SwiftUI



struct CategoriesView: View {
    
    
    // MARK: - Properties
    
    @State var addApdeptdColumn = [GridItem(.adaptive(minimum: 170 ))]
// var
//    @State private var isPressed = false

     

   @State  var chosenCategory : CategoreyModel = CategoreyModel( name: "", image: "", isPressed: false)
    //MARK: Body
    
    var body: some View {
        VStack{ //Start: VCtack
            Text("Choose items type")
                .bold()
            
            
            
                //MARK: - CUSTOM SLIDER
            CustomSlider(index: 0)
            
            Text(chosenCategory.name)
            ScrollView(.vertical){
                LazyVGrid(columns: addApdeptdColumn, spacing: 20){
                    ForEach(categories){ category in
                        
                        
                            
                            Button{
//                                category.isPressed = true
                                self.chosenCategory = category
                                
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
                
      
            
            
            
            
            
            
        } //End: Vstack
    }
}

#Preview {
    CategoriesView()
}
