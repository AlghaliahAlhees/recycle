//
//  CustomSlider.swift
//  recycle
//
//  Created by Alghalya Alhees on 13/04/2024.
//

import SwiftUI

struct CustomSlider: View {
    let index : Int
    
    var body: some View {
        HStack{
            ForEach (0..<3, id: \.self){ i in
                HStack{ //Start: HStack
                    if i == index {
                        ZStack { //Start: Zstack
                            Color.green
                        } //End: ZStack
                        }else{
                        ZStack { //Start: Zstack
                            Color.gray
                            
                        }//End: ZStack
                    }//End: else
                    
                }//End: HStack
                .frame(width: 60,height: 15)
                
            } //End: forEach
        }//End: HStack
        .padding()
        
    }
}

#Preview {
    CustomSlider(index: 0)
}
