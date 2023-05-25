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
    
    var body: some View {
        GeometryReader{ geo in
            HStack{
                ZStack{
                    Rectangle()
                }
                .frame(width: geo.size.width/1.3)
                VStack{
                    ZStack{
                        Rectangle()
                        StatusView(status: "tô triste")
                    }.padding(10)
                        .frame(height: geo.size.height/4)
                    ZStack{
                        Rectangle()
                        CalendarioView()
                    }.padding(10)
                    ZStack{
                        Rectangle()
                        LembretesView()
                    }.padding(10)
                }
            }.padding()
                .sheet(isPresented: $shouldShow, content: {OnboardingView()})
        }.onAppear(){
//            if !didOnboardingHappend {
                shouldShow.toggle()
//            }
        }
    }
}
