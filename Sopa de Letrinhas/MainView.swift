//
//  CalendarioView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("onboarding") var didOnboardingHappend = false
    @State var shouldShow = false
    @State var birthDate = Date.now
    
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                
                Rectangle().foregroundColor(Color(white: 0.4))
                
                HStack{
                    ZStack{
                        Rectangle().foregroundColor(.clear)
                    }
                    .frame(width: geo.size.width/1.3)
                    VStack{
                        ZStack{
                            Rectangle().foregroundColor(Color(white: 0.3))
                        }.padding(.horizontal,10)
                            .frame(height: geo.size.height/4.15)
                            .padding(.bottom,10)
                        ZStack{
                            Rectangle().foregroundColor(Color(white: 0.3))
                        }.padding(10)
                        ZStack{
                            Rectangle().foregroundColor(Color(white: 0.3))
                        }.padding(.horizontal,10)
                            .padding(.top,10)
                            .padding(.bottom,-2)
                    }
                }.padding(.top,12)
                    .padding(.leading, 12)
                    .padding(.trailing, 5)
                    .padding(.bottom,18)
                
                HStack{
                    ZStack{
                        Rectangle().foregroundColor(.white)
                        BoardView()
                    }
                    .frame(width: geo.size.width/1.3)
                    VStack{
                        ZStack{
                            Rectangle().foregroundColor(.white)
                            StatusView(status: "tô triste")
                        }.padding(.horizontal,10)
                            .padding(.bottom,10)
                            .frame(height: geo.size.height/4)
                        ZStack{
                            Rectangle().foregroundColor(.white)
                            CalendarioView()
                        }.padding(10)
                        ZStack{
                            Rectangle().foregroundColor(.white)
                            LembretesView()
                        }.padding(.horizontal,10)
                            .padding(.top,10)
                    }
                }.padding(10)
                    .padding(.bottom,10)
                    .sheet(isPresented: $shouldShow, content: {OnboardingView()})
                
            }.onAppear(){
                if !didOnboardingHappend {
                    shouldShow.toggle()
                }
            }
        }.frame(minWidth: 900,minHeight: 500)
    }
}
