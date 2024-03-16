//
//  ContentView.swift
//  recycle
//
//  Created by Alghalya Alhees on 16/03/2024.
//

import SwiftUI

struct ContentView: View {
    // an example of how to localize a text 
    let text1: LocalizedStringKey =  "oboardText1"
    
    
    var body: some View {
        VStack {
          
            Text(text1)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
