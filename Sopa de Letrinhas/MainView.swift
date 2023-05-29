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
                
                ZStack {
                    Rectangle().foregroundColor(Color("Cortica100"))
                    
                    Image("CorticaBackground")
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: geo.size.width,height: geo.size.height)
                
                HStack{
                    ZStack{
                        Rectangle().foregroundColor(.white)
                            .cornerRadius(16)
                        Rectangle().foregroundColor(Color("Papel80"))
                            .cornerRadius(16)
                        BoardView()
                    }
                    .frame(width: geo.size.width/1.38)
                    VStack{
                        ZStack{
                            Image("postitRasgado")
                                .resizable()
                            CalendarioView()
                                .padding(.bottom, 15)
                        }.frame(height: geo.size.height/5)
                            .padding(.bottom,geo.size.height/30)
                        ZStack{
                            Image("postitInteiro")
                                .resizable()
                            StatusView(status: "tô triste")
                        }.padding(.vertical,geo.size.height/30)
                        ZStack{
                            Image("postitDobrado")
                                .resizable()
                            LembretesView()
                        }
                        .padding(.top,geo.size.height/30)
                    }.padding(.leading,geo.size.width/30)
                }.padding(geo.size.height/22.5)
                    .sheet(isPresented: $shouldShow, content: {OnboardingView()})
                
            }.onAppear(){
                if !didOnboardingHappend {
                    shouldShow.toggle()
                }
            }
        }.frame(minWidth: 900,minHeight: 562.5)
            .overlay {
                overlayView()
            }
    }
}

struct overlayView: View {
    
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                
                Spacer()
                .frame(width: geo.size.width,height: geo.size.height)
                
                HStack{
                    Spacer()
                    .frame(width: geo.size.width/1.38)
                    VStack{
                        Spacer()
                            .frame(height: geo.size.height/5)
                            .padding(.bottom,geo.size.height/30)
                        Spacer().padding(.vertical,geo.size.height/30)
                        Spacer()
                        .padding(.top,geo.size.height/30)
                    }.padding(.leading,geo.size.width/30)
                }.padding(geo.size.height/22.5)
            }
        }
    }
}

