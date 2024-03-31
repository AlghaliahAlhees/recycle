//
//  CustomAlertCardView.swift
//  recycle
//
//  Created by Alghalya Alhees on 27/03/2024.
//

import SwiftUI

struct CustomAlertCardView: View {
    // MARK: - Properties
    var icon : String
    var text: String
    var detail: String
    var gridentColor: Color
    var circleColor: Color
    @Binding var show: Bool
    @State var animateCircle: Bool = false
    //MARK: Body
    
    var body: some View {
        VStack{ //Start: VStack
            Spacer()
            ZStack{ //Start: ZStack
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 300)
                    .foregroundStyle(LinearGradient(gradient:Gradient(colors: [.clear, .clear, gridentColor]), startPoint: .top, endPoint: .bottom))
                    .opacity(0.4)
                
                ZStack{ //Start: ZStack
                    RoundedRectangle(cornerRadius: 30).foregroundStyle(.white)
                        .frame(height: 280)
                        .shadow(color: .black.opacity(0.01), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.1), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0)
                    VStack(spacing: 20){//Start: VStack
                        ZStack { //Start: ZStack
                            Circle().stroke(lineWidth: 2).foregroundStyle(circleColor)
                                .frame(width: 105, height: 105)
                                .scaleEffect(animateCircle ? 1.3 : 0.90)
                                .opacity(animateCircle ? 0 : 1)
                                .animation(.easeInOut(duration: 2).delay(1).repeatForever(autoreverses: false), value: animateCircle)
                                .onAppear(){
                                    
                                    animateCircle.toggle()
                                }
                            
                            
                            Image(systemName: icon)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color.red)
                        }//End: ZStack
                        
                        Text(text)
                            .bold().font(.system(size: 30))
                        
                        Text(detail)
                            .opacity(0.5)
                    } //End: VStack
                    
                } //End:Zstack
                .padding(.horizontal,10)
                .offset(y: show ? -30 : 300 )
            } //End: VStack
            
            .onChange(of: show) { newValue in
                if newValue {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { withAnimation {
                        show = false
                    }
                    }
                }
            }// on change
        } //End: Vstack
        .ignoresSafeArea()
        
    }
}

#Preview {
    CustomAlertCardView(icon: "xmark", text: "Error", detail: "Something wromg happend", gridentColor: .red, circleColor: .red, show: .constant(true))
}
