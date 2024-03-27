//
//  RecycleInfoCardView.swift
//  recycle
//
//  Created by Alghalya Alhees on 27/03/2024.
//

import SwiftUI

struct RecycleInfoCardView: View {
   
    // MARK: - Properties

    @State var CardHeight = UIScreen.main.bounds.size.height - 300

//    static let screenHeight = UIScreen.main.bounds.size.height

    //MARK: Body

    var body: some View {
        VStack{
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(recycleInfo){ info in
                            ZStack{
                                Image(info.image)
                                    .resizable()
                                    .cornerRadius(15)
                                    .frame(width: 300, height: CardHeight)
                                    .scaledToFit()
                                Color.black.opacity(0.6)
                                    .cornerRadius(10)
                                    .shadow(radius: 10, y: 3)
                                
                                VStack{
                                    Text(info.title)
                                        .foregroundStyle(Color.white)
                                        .bold()
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .padding()
                                    Text(info.description)
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 14))
                                        .font(Font.caption)
                                        .lineLimit(4, reservesSpace: true)
                                        .padding()
                                    
                                    Link(destination: URL(string: info.link)!, label: {
                                        Label(
                                        
                                            title: { Text("read more")
                                                    .bold()
                                            },
                                            icon: { Image(systemName: "magnifyingglass") }

                                        )
                                        .frame(width: 180, height: 40)
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                        .foregroundStyle(Color.white)
                                    })
                                    
                                }
                                .frame(width: 300 ,height: CardHeight)

                            }//zstack
                            .padding()



                        }
                            
                        }// for each
                        
                    }//scroll
                .frame(height: CardHeight )
                
       
                
            }// vstack
        }


    
}

#Preview {
    RecycleInfoCardView()
}
